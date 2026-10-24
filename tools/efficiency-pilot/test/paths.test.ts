import { test } from "node:test";
import assert from "node:assert/strict";
import { join } from "node:path";
import { normalizeScanPath, toPosix } from "../src/paths.js";
import { isAllowedPath } from "../src/scan.js";
import { parseConfig } from "../src/config.js";
import { readFileSync } from "node:fs";
import { dirname } from "node:path";
import { fileURLToPath } from "node:url";

const root = join("/", "repo");
const pkg = join(root, "tools", "efficiency-pilot");

test("toPosix strips ./ and converts backslashes", () => {
  assert.equal(toPosix("./a/b.md"), "a/b.md");
  assert.equal(toPosix("a\\b\\c.md"), "a/b/c.md");
});

test("normalizeScanPath makes paths repo-root-relative from a subfolder", () => {
  assert.equal(normalizeScanPath("dist/src/cli.js", pkg, root), "tools/efficiency-pilot/dist/src/cli.js");
  assert.equal(normalizeScanPath("./README.md", pkg, root), "tools/efficiency-pilot/README.md");
  assert.equal(normalizeScanPath("../../docs/x.md", pkg, root), "docs/x.md");
  assert.equal(normalizeScanPath(join(pkg, "test", "a.ts"), "/elsewhere", root), "tools/efficiency-pilot/test/a.ts");
});

test("normalizeScanPath falls back to cwd-relative outside git", () => {
  assert.equal(normalizeScanPath("./src/a.ts", pkg, null), "src/a.ts");
});

test("example config allowedPaths match from the package subfolder", () => {
  const here = dirname(fileURLToPath(import.meta.url));
  const example = join(here, "..", "..", "sanitize.config.example.json");
  const cfg = parseConfig(JSON.parse(readFileSync(example, "utf8")));
  const p = (f: string) => normalizeScanPath(f, pkg, root);
  assert.ok(isAllowedPath(p("dist/src/cli.js"), cfg.allowedPaths));
  assert.ok(isAllowedPath(p("test/cli.test.ts"), cfg.allowedPaths));
  assert.ok(isAllowedPath(p("package-lock.json"), cfg.allowedPaths));
  assert.ok(isAllowedPath(p("sanitize.config.example.json"), cfg.allowedPaths));
  assert.ok(!isAllowedPath(p("README.md"), cfg.allowedPaths));
  assert.ok(!isAllowedPath(p("src/cli.ts"), cfg.allowedPaths));
  assert.ok(!isAllowedPath("dist/other.js", cfg.allowedPaths), "root-level dist is not allowed");
});
