# Efficiency pilot: rubrics and sanitize check

A small, self-contained pilot with two parts:

1. **`docs/rubrics.md`**: short yes/no checklists (rubrics) so agents produce consistent output with one self-check pass. **These rubrics are a proposal pending owner approval.**
2. **`sanitize-check`**: a TypeScript CLI, used as a git pre-commit hook, that blocks private data (configured names and email addresses) and em or en dashes in Markdown from reaching a public repo.

## Requirements

Node.js LTS (20 or later). No runtime dependencies; dev dependencies are only `typescript` and `@types/node`.

## Install, build, test

```sh
npm install
npm run check   # type check only (tsc --noEmit)
npm run build   # compile to dist/
npm test        # build, then run node:test on the compiled output
```

## Configure

Real block terms live only in a local, git-ignored file:

```sh
cp sanitize.config.example.json sanitize.config.json
# then edit sanitize.config.json with the real terms (never commit it)
```

| Field | Type | Default | Meaning |
|---|---|---|---|
| `blockedTerms` | string[] | required | Names matched as whole words |
| `blockedEmails` | string[] | required | Addresses matched literally, case-insensitive |
| `allowedPaths` | string[] | `[]` | Path prefixes to skip (a trailing `*` or `**` is ignored) |
| `caseInsensitive` | boolean | `true` | Case handling for `blockedTerms` |
| `checkDashes` | boolean | `true` | Flag U+2014 and U+2013 in `.md` files |

A missing or invalid config is a clear error with exit code 2.

## Run

```sh
node dist/src/cli.js                          # scan staged files (git index)
node dist/src/cli.js --files README.md docs/rubrics.md
echo "text" | node dist/src/cli.js --stdin    # add --name x.md to enable the dash check
node dist/src/cli.js --config other.json --stdin
```

Output is one line per finding, `path:line:col  type  match`, with the match masked (first character plus `***`) so logs never contain the full value. Dashes are shown as their code point.

Exit codes: `0` clean, `1` findings, `2` usage or config error. Binary files (NUL byte in the first 8000 bytes) are skipped.

## Pre-commit hook

The repo ships `.githooks/pre-commit`:

```sh
#!/bin/sh
exec node "$(git rev-parse --show-toplevel)/dist/src/cli.js" --config "$(git rev-parse --show-toplevel)/sanitize.config.json"
```

Enable it once per clone (after `npm run build`):

```sh
chmod +x .githooks/pre-commit
git config core.hooksPath .githooks
```

The hook scans staged content (`git show :path`), not the working tree, so it checks exactly what will be committed.

## Layout

- `src/config.ts`: config type guard and loader
- `src/scan.ts`: pure functions (`scanText`, `mask`, `isBinary`, `isAllowedPath`)
- `src/cli.ts`: argument parsing and I/O
- `test/`: `node:test` suites (unit and CLI exit codes)
