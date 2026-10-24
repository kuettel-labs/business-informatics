import { test } from "node:test";
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { mkdtempSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const cli = join(dirname(fileURLToPath(import.meta.url)), "..", "src", "cli.js");
const hasGit = spawnSync("git", ["--version"]).status === 0;

function git(cwd: string, ...args: string[]) {
  const r = spawnSync("git", args, { cwd, encoding: "utf8" });
  assert.equal(r.status, 0, r.stderr);
}

test("default staged mode: placeholder term exits 1, clean exits 0", { skip: hasGit ? false : "git not available" }, (t) => {
  const repo = mkdtempSync(join(tmpdir(), "sanitize-staged-"));
  t.after(() => rmSync(repo, { recursive: true, force: true }));
  const config = join(tmpdir(), `sanitize-staged-${process.pid}.json`);
  t.after(() => rmSync(config, { force: true }));
  writeFileSync(config, JSON.stringify({ blockedTerms: ["ExampleAgentName"], blockedEmails: ["someone@example.invalid"] }));
  git(repo, "init", "-q");
  const runCli = () => spawnSync(process.execPath, [cli, "--config", config], { cwd: repo, encoding: "utf8" });

  writeFileSync(join(repo, "bad.md"), "ping ExampleAgentName\n");
  git(repo, "add", "bad.md");
  const bad = runCli();
  assert.equal(bad.status, 1, bad.stderr);
  assert.match(bad.stdout, /bad\.md:1:6  term  term#1/);
  assert.ok(!bad.stdout.includes("ExampleAgentName"));

  git(repo, "rm", "-q", "--cached", "bad.md");
  writeFileSync(join(repo, "clean.md"), "nothing to see\n");
  git(repo, "add", "clean.md");
  const clean = runCli();
  assert.equal(clean.status, 0, clean.stdout + clean.stderr);
});
