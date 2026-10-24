#!/usr/bin/env node
import { execFileSync } from "node:child_process";
import { readFile } from "node:fs/promises";
import { pathToFileURL } from "node:url";
import { ConfigError, loadConfig, type SanitizeConfig } from "./config.js";
import { formatFinding, isAllowedPath, isBinary, scanText, type Finding } from "./scan.js";

const USAGE = `usage: sanitize-check [--config <file>] [--files <path>... | --stdin [--name <path>]]
  default: scan staged files (git index)
exit codes: 0 clean, 1 findings, 2 usage or config error`;

interface Args { mode: "staged" | "files" | "stdin"; files: string[]; config: string; name: string; }

class UsageError extends Error {}

export function parseArgs(argv: string[]): Args {
  const a: Args = { mode: "staged", files: [], config: "sanitize.config.json", name: "<stdin>" };
  for (let i = 0; i < argv.length; i++) {
    const v = argv[i];
    if (v === "--stdin") a.mode = "stdin";
    else if (v === "--config" || v === "--name") {
      const next = argv[++i];
      if (next === undefined) throw new UsageError(`${v} needs a value`);
      if (v === "--config") a.config = next; else a.name = next;
    } else if (v === "--files") {
      a.mode = "files";
      while (i + 1 < argv.length && !argv[i + 1]!.startsWith("--")) a.files.push(argv[++i]!);
      if (a.files.length === 0) throw new UsageError("--files needs at least one path");
    } else if (v === "--help" || v === "-h") throw new UsageError("");
    else throw new UsageError(`unknown argument: ${v}`);
  }
  return a;
}

async function readStdin(): Promise<Buffer> {
  const chunks: Buffer[] = [];
  for await (const c of process.stdin) chunks.push(c as Buffer);
  return Buffer.concat(chunks);
}

function scanBuffer(path: string, buf: Buffer, cfg: SanitizeConfig): Finding[] {
  if (isAllowedPath(path, cfg.allowedPaths) || isBinary(buf)) return [];
  return scanText(buf.toString("utf8"), cfg, path);
}

export async function run(argv: string[]): Promise<number> {
  let args: Args;
  try {
    args = parseArgs(argv);
  } catch (e) {
    if (e instanceof UsageError) { if (e.message) console.error(e.message); console.error(USAGE); return 2; }
    throw e;
  }
  let cfg: SanitizeConfig;
  try {
    cfg = await loadConfig(args.config);
  } catch (e) {
    if (e instanceof ConfigError) { console.error(`config error: ${e.message}`); return 2; }
    throw e;
  }
  const findings: Finding[] = [];
  if (args.mode === "stdin") {
    findings.push(...scanBuffer(args.name, await readStdin(), cfg));
  } else if (args.mode === "files") {
    for (const f of args.files) {
      let buf: Buffer;
      try { buf = await readFile(f); } catch { console.error(`cannot read file: ${f}`); return 2; }
      findings.push(...scanBuffer(f, buf, cfg));
    }
  } else {
    let list: string;
    try {
      list = execFileSync("git", ["diff", "--cached", "--name-only", "--diff-filter=ACM", "-z"], { encoding: "utf8" });
    } catch { console.error("git diff failed (not a git repository?)"); return 2; }
    for (const f of list.split("\0").filter(Boolean)) {
      const buf = execFileSync("git", ["show", `:${f}`], { maxBuffer: 64 * 1024 * 1024 });
      findings.push(...scanBuffer(f, buf, cfg));
    }
  }
  for (const f of findings) console.log(formatFinding(f));
  if (findings.length > 0) { console.error(`sanitize-check: ${findings.length} finding(s)`); return 1; }
  return 0;
}

if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
  run(process.argv.slice(2)).then(
    (code) => { process.exitCode = code; },
    (err: unknown) => { console.error(err instanceof Error ? err.message : String(err)); process.exitCode = 2; },
  );
}
