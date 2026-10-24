import { readFile } from "node:fs/promises";

export interface SanitizeConfig {
  blockedTerms: string[];
  blockedEmails: string[];
  allowedPaths: string[];
  caseInsensitive: boolean;
  checkDashes: boolean;
}

export class ConfigError extends Error {
  override name = "ConfigError";
}

function isStringArray(x: unknown): x is string[] {
  return Array.isArray(x) && x.every((v) => typeof v === "string" && v.length > 0);
}

/** Validates raw JSON (unknown) and returns a normalized config, or throws ConfigError. */
export function parseConfig(raw: unknown): SanitizeConfig {
  if (typeof raw !== "object" || raw === null || Array.isArray(raw)) {
    throw new ConfigError("config must be a JSON object");
  }
  const o = raw as Record<string, unknown>;
  if (!isStringArray(o["blockedTerms"])) throw new ConfigError("blockedTerms must be an array of non-empty strings");
  if (!isStringArray(o["blockedEmails"])) throw new ConfigError("blockedEmails must be an array of non-empty strings");
  const allowed = o["allowedPaths"];
  if (allowed !== undefined && !isStringArray(allowed)) throw new ConfigError("allowedPaths must be an array of non-empty strings");
  const ci = o["caseInsensitive"];
  if (ci !== undefined && typeof ci !== "boolean") throw new ConfigError("caseInsensitive must be a boolean");
  const cd = o["checkDashes"];
  if (cd !== undefined && typeof cd !== "boolean") throw new ConfigError("checkDashes must be a boolean");
  return {
    blockedTerms: o["blockedTerms"],
    blockedEmails: o["blockedEmails"],
    allowedPaths: allowed ?? [],
    caseInsensitive: ci ?? true,
    checkDashes: cd ?? true,
  };
}

export async function loadConfig(path: string): Promise<SanitizeConfig> {
  let text: string;
  try {
    text = await readFile(path, "utf8");
  } catch {
    throw new ConfigError(`config file not found or unreadable: ${path} (copy sanitize.config.example.json to sanitize.config.json)`);
  }
  let raw: unknown;
  try {
    raw = JSON.parse(text);
  } catch {
    throw new ConfigError(`config file is not valid JSON: ${path}`);
  }
  return parseConfig(raw);
}
