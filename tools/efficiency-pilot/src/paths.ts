import { execFileSync } from "node:child_process";
import { isAbsolute, relative, resolve, sep } from "node:path";

/** Converts a path to POSIX separators and strips a leading "./". */
export function toPosix(p: string): string {
  return p.split(sep).join("/").replace(/\\/g, "/").replace(/^(\.\/)+/, "");
}

/**
 * Makes a path repo-root-relative in POSIX form.
 * `file` is resolved against `cwd`; if `root` is null (not in a git repo) the result is cwd-relative.
 */
export function normalizeScanPath(file: string, cwd: string, root: string | null): string {
  const abs = isAbsolute(file) ? file : resolve(cwd, file);
  return toPosix(relative(root ?? cwd, abs));
}

/** Returns the git top-level directory for `cwd`, or null when not inside a git repo. */
export function gitRoot(cwd: string): string | null {
  try {
    const out = execFileSync("git", ["rev-parse", "--show-toplevel"], { cwd, encoding: "utf8", stdio: ["ignore", "pipe", "ignore"] });
    const r = out.trim();
    return r.length > 0 ? r : null;
  } catch {
    return null;
  }
}
