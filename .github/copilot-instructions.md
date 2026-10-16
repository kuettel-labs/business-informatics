# Repository instructions

## Project overview

This repository is a learning portfolio and collection of related projects, not a single application. It contains:

- A German-language MkDocs portfolio and learning materials, configured in `mkdocs.yml`.
- A SQLite data model in `sql/`, with seed data and SQL test cases under `tests/`.
- Joomla and Odoo-related artifacts under `plugins/` and `odoo/`.
- Optional Playwright browser tests in `tests/playwright/` for a locally running Joomla instance.

Before changing a component, inspect its nearby documentation and follow the conventions already used there. Keep learning content in its existing language and structure.

## Validation

- SQLite schema, seed, and case tests: run `bash tests/run_tests.sh` from the repository root. This requires Bash and the `sqlite3` CLI.
- Playwright tests: from `tests/playwright/`, run `npx playwright test`; these require the Node dependencies and the local Joomla site at `http://localhost/joomla`. To run one spec, pass its path relative to that directory, such as `npx playwright test tests/admin-login.spec.ts`.
- The root README documents `pip install -r requirements.txt` and `mkdocs serve`, but no root `requirements.txt` is present. Check the current project setup before relying on that install command.

Run the narrowest relevant checks for the files changed. Do not assume the local Joomla site or its dependencies are available.

## Change guidance

- Keep changes scoped to the affected project area; do not treat the repository as one deployable application.
- Preserve the existing SQL schema, seed ordering, and foreign-key expectations. Add or update focused SQL test cases for data-model changes.
- Keep browser tests aligned with the Playwright configuration and its local Joomla base URL.
- Avoid unrelated formatting or content rewrites.
