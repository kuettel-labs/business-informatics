# Efficiency pilot: rubrics and sanitize check

A small, self-contained pilot with two parts:

1. **`docs/rubrics.md`**: short yes/no checklists (rubrics) so agents produce consistent output with one self-check pass. **These rubrics are a proposal pending owner approval.**
2. **`sanitize-check`**: a TypeScript CLI, used as a git pre-commit hook, that blocks private data (configured names and email addresses) and em or en dashes in Markdown from reaching a public repo.

## Requirements

Node.js LTS (20 or later). No runtime dependencies; dev dependencies are only `typescript` and `@types/node`.

## Setup

In the target repo this package lives at `tools/efficiency-pilot/`. Do this once per clone:

```sh
cd tools/efficiency-pilot
cp sanitize.config.example.json sanitize.config.json   # git-ignored: never commit it
# edit sanitize.config.json locally and fill in the real terms and email addresses
npm ci && npm run build
chmod +x .githooks/pre-commit
cd ../..                                               # back to the repo root
git config core.hooksPath tools/efficiency-pilot/.githooks
```

Exit codes (CLI and hook):

- `0`: clean, the commit goes ahead
- `1`: findings, the commit is blocked; each finding is printed as rule type plus index (e.g. `term#3`)
- `2`: usage or setup error (missing build, missing or invalid config, not a git repo); the commit is blocked to fail safe

CI uses `sanitize.config.example.json` (placeholders only), never real terms.

## Develop

```sh
npm ci
npm run check   # type check only (tsc --noEmit)
npm run build   # compile to dist/
npm test        # build, then run node:test on the compiled output
```

## Configure

| Field | Type | Default | Meaning |
|---|---|---|---|
| `blockedTerms` | string[] | required | Names matched as whole words |
| `blockedEmails` | string[] | required | Addresses matched literally, case-insensitive |
| `allowedPaths` | string[] | `[]` | Repo-root-relative path prefixes to skip (a trailing `*` or `**` is ignored) |
| `caseInsensitive` | boolean | `true` | Case handling for `blockedTerms` |
| `checkDashes` | boolean | `true` | Flag U+2014 and U+2013 in `.md` files |

**Paths are always repo-root-relative POSIX paths.** Staged mode uses git's paths as is. `--files` resolves each path against the current directory and makes it relative to `git rev-parse --show-toplevel` (or to the current directory outside a git repo). So `allowedPaths` entries need the `tools/efficiency-pilot/` prefix, as in the example config.

## Run

```sh
node dist/src/cli.js                          # scan staged files (git index)
node dist/src/cli.js --files README.md docs/rubrics.md
echo "text" | node dist/src/cli.js --stdin    # add --name x.md to enable the dash check
node dist/src/cli.js --config other.json --stdin
```

Output is one line per finding, `path:line:col  type  match`, with the match replaced by its rule type and index, e.g. `term#3` or `email#1`, so logs contain no character of the value. The index is 1-based: `term#3` is the third entry in `blockedTerms`, `email#1` the first entry in `blockedEmails`. Dashes are shown as their code point, e.g. `U+2014`.

Exit codes: `0` clean, `1` findings, `2` usage or config error. Binary files (NUL byte in the first 8000 bytes) are skipped.

## Pre-commit hook

`.githooks/pre-commit` (POSIX sh) resolves the repo root with `git rev-parse --show-toplevel`, uses `<root>/tools/efficiency-pilot` as the package dir (override with `SANITIZE_PKG_DIR`) and `<package>/sanitize.config.json` as the config (override with `SANITIZE_CONFIG`). If `dist/` or the config is missing it prints a one-line hint and exits 2. It runs the CLI from the repo root and scans staged content (`git show :path`), so it checks exactly what will be committed.

## CI

The workflow lives at `.github/workflows/efficiency-pilot.yml` in the repo root. It runs `npm ci`, `check`, `build` and `test` in `tools/efficiency-pilot`, then self-scans the package's tracked files with the example config.

## Layout

- `src/config.ts`: config type guard and loader
- `src/paths.ts`: path normalization to repo-root-relative POSIX form
- `src/scan.ts`: pure functions (`scanText`, `mask`, `isBinary`, `isAllowedPath`)
- `src/cli.ts`: argument parsing and I/O
- `test/`: `node:test` suites (unit, paths, CLI exit codes, staged mode)

## Pilot measurement

Timebox: 2 weeks from the merge. Baselines are placeholders until measured on real work; no numbers are filled in before they are counted.

| Metric | Baseline | Target |
| --- | --- | --- |
| Review rounds until GO | TBD | lower than baseline |
| Fix commits after review | TBD | lower than baseline |
| Sanitize findings before commit (caught by the hook) | TBD | tracked |
| Sanitize findings after push | TBD | 0 |
| Credits per deliverable | TBD | lower than baseline |
| Share of clones with `core.hooksPath` set | TBD | 100% |

At the end of the timebox the owner decides whether to keep, adjust or drop the pilot.

