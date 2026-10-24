import type { SanitizeConfig } from "./config.js";

export type FindingType = "term" | "email" | "dash";

export interface Finding {
  path: string;
  line: number;
  col: number;
  type: FindingType;
  match: string;
  /** 1-based position of the matching entry in its config list (0 for dashes). */
  index: number;
}

const DASHES = /[\u2013\u2014]/gu;

export function escapeRegExp(s: string): string {
  return s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

/** Rule type plus 1-based config index, e.g. term#3. No character of the match is ever shown. */
export function mask(type: FindingType, index: number): string {
  return `${type}#${index}`;
}

export function isBinary(buf: Uint8Array): boolean {
  const n = Math.min(buf.length, 8000);
  for (let i = 0; i < n; i++) if (buf[i] === 0) return true;
  return false;
}

/** Glob-lite: a trailing "*" or "**" is ignored, then prefix match. */
export function isAllowedPath(path: string, allowed: readonly string[]): boolean {
  const p = path.replace(/\\/g, "/").replace(/^\.\//, "");
  return allowed.some((a) => {
    const prefix = a.replace(/\\/g, "/").replace(/^\.\//, "").replace(/\*+$/, "");
    return prefix.length > 0 && p.startsWith(prefix);
  });
}

function pushMatches(re: RegExp, type: FindingType, index: number, path: string, lines: string[], out: Finding[]): void {
  lines.forEach((text, i) => {
    re.lastIndex = 0;
    for (let m = re.exec(text); m !== null; m = re.exec(text)) {
      out.push({ path, line: i + 1, col: m.index + 1, type, match: m[0], index });
      if (m[0].length === 0) re.lastIndex++;
    }
  });
}

/** Pure: scans text and returns findings. Dashes are only checked for .md paths. */
export function scanText(text: string, config: SanitizeConfig, path = "<stdin>"): Finding[] {
  const out: Finding[] = [];
  const lines = text.split(/\r?\n/);
  const flags = config.caseInsensitive ? "giu" : "gu";
  config.blockedTerms.forEach((term, i) => {
    const re = new RegExp(`(?<![\\p{L}\\p{N}_])${escapeRegExp(term)}(?![\\p{L}\\p{N}_])`, flags);
    pushMatches(re, "term", i + 1, path, lines, out);
  });
  config.blockedEmails.forEach((email, i) => {
    pushMatches(new RegExp(escapeRegExp(email), "giu"), "email", i + 1, path, lines, out);
  });
  if (config.checkDashes && path.toLowerCase().endsWith(".md")) {
    pushMatches(new RegExp(DASHES.source, "gu"), "dash", 0, path, lines, out);
  }
  return out.sort((a, b) => a.line - b.line || a.col - b.col);
}

export function formatFinding(f: Finding): string {
  const shown = f.type === "dash" ? `U+${f.match.codePointAt(0)?.toString(16).toUpperCase().padStart(4, "0")}` : mask(f.type, f.index);
  return `${f.path}:${f.line}:${f.col}  ${f.type}  ${shown}`;
}
