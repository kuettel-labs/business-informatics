import { test } from "node:test";
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { mkdtempSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const cli = join(dirname(fileURLToPath(import.meta.url)), "..", "src", "cli.js");
const dir = mkdtempSync(join(tmpdir(), "sanitize-"));
const good = join(dir, "good.json");
writeFileSync(good, JSON.stringify({ blockedTerms: ["ExampleAgentName"], blockedEmails: ["someone@example.invalid"] }));
const bad = join(dir, "bad.json");
writeFileSync(bad, "{ not json");

function run(args: string[], input = "") {
  return spawnSync(process.execPath, [cli, ...args], { input, encoding: "utf8" });
}

test("--stdin clean exits 0", () => {
  assert.equal(run(["--stdin", "--config", good], "nothing here").status, 0);
});

test("--stdin with finding exits 1 and masks", () => {
  const r = run(["--stdin", "--config", good], "ask ExampleAgentName or someone@example.invalid");
  assert.equal(r.status, 1);
  assert.match(r.stdout, /<stdin>:1:5  term  term#1\n/);
  assert.match(r.stdout, /email  email#1\n/);
  assert.ok(!r.stdout.includes("ExampleAgentName") && !r.stdout.includes("someone@"));
  assert.ok(!/\b[Es]\*/.test(r.stdout), "no leading character is exposed");
});

test("--stdin --name x.md enables dash check", () => {
  assert.equal(run(["--stdin", "--name", "x.md", "--config", good], "a \u2014 b").status, 1);
});

test("config and usage errors exit 2", () => {
  assert.equal(run(["--stdin", "--config", bad], "x").status, 2);
  assert.equal(run(["--stdin", "--config", join(dir, "missing.json")], "x").status, 2);
  assert.equal(run(["--bogus"]).status, 2);
  assert.equal(run(["--files", "--config", good]).status, 2);
});

test("--files skips binary files", () => {
  const bin = join(dir, "blob.bin");
  writeFileSync(bin, Buffer.concat([Buffer.from("ExampleAgentName"), Buffer.from([0])]));
  assert.equal(run(["--files", bin, "--config", good]).status, 0);
});
