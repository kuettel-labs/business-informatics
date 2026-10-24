import { test } from "node:test";
import assert from "node:assert/strict";
import { parseConfig, ConfigError, loadConfig } from "../src/config.js";
import { scanText, mask, isBinary, isAllowedPath, formatFinding } from "../src/scan.js";

const cfg = parseConfig({ blockedTerms: ["ExampleAgentName", "C++Bot"], blockedEmails: ["someone@example.invalid"] });

test("whole-word term matching", () => {
  assert.equal(scanText("hi ExampleAgentName.", cfg).length, 1);
  assert.equal(scanText("ExampleAgentNames XExampleAgentName ExampleAgentName_x", cfg).length, 0);
  assert.equal(scanText("use C++Bot now", cfg).length, 1, "regex chars are escaped");
});

test("case-insensitive by default, sensitive when configured", () => {
  assert.equal(scanText("exampleagentname", cfg).length, 1);
  const cs = parseConfig({ blockedTerms: ["ExampleAgentName"], blockedEmails: [], caseInsensitive: false });
  assert.equal(scanText("exampleagentname", cs).length, 0);
  assert.equal(scanText("ExampleAgentName", cs).length, 1);
});

test("email match is literal and case-insensitive, with position", () => {
  const f = scanText("line1\nmail: SomeOne@Example.Invalid", cfg);
  assert.equal(f.length, 1);
  assert.deepEqual([f[0]!.type, f[0]!.line, f[0]!.col], ["email", 2, 7]);
  assert.equal(scanText("someoneXexample.invalid", cfg).length, 0, "dot is not a wildcard");
});

test("masking never prints full value", () => {
  assert.equal(mask("ExampleAgentName"), "E***");
  const line = formatFinding({ path: "a.md", line: 1, col: 1, type: "term", match: "ExampleAgentName" });
  assert.equal(line, "a.md:1:1  term  E***");
  assert.ok(!line.includes("ExampleAgentName"));
});

test("dash detection in .md only, and can be turned off", () => {
  const text = "a \u2014 b \u2013 c";
  assert.deepEqual(scanText(text, cfg, "doc.md").map((f) => f.type), ["dash", "dash"]);
  assert.equal(scanText(text, cfg, "code.ts").length, 0);
  const off = parseConfig({ blockedTerms: [], blockedEmails: [], checkDashes: false });
  assert.equal(scanText(text, off, "doc.md").length, 0);
});

test("binary heuristic and allowedPaths", () => {
  assert.ok(isBinary(new Uint8Array([65, 0, 66])));
  assert.ok(!isBinary(Buffer.from("plain text")));
  assert.ok(isAllowedPath("dist/src/cli.js", ["dist/"]));
  assert.ok(isAllowedPath("./vendor/x.md", ["vendor/**"]));
  assert.ok(!isAllowedPath("src/dist.ts", ["dist/"]));
});

test("config validation errors", async () => {
  assert.throws(() => parseConfig(null), ConfigError);
  assert.throws(() => parseConfig([]), ConfigError);
  assert.throws(() => parseConfig({ blockedEmails: [] }), /blockedTerms/);
  assert.throws(() => parseConfig({ blockedTerms: [""], blockedEmails: [] }), /blockedTerms/);
  assert.throws(() => parseConfig({ blockedTerms: [], blockedEmails: [1] }), /blockedEmails/);
  assert.throws(() => parseConfig({ blockedTerms: [], blockedEmails: [], caseInsensitive: "yes" }), /caseInsensitive/);
  assert.throws(() => parseConfig({ blockedTerms: [], blockedEmails: [], allowedPaths: "dist" }), /allowedPaths/);
  await assert.rejects(loadConfig("/nonexistent/sanitize.config.json"), /not found/);
});
