# Code Review Guild

Code Review Guild is a file-based collection of focused AI reviewers for practical engineering principles. Instead of one giant "review my code" prompt, it ships narrow reviewer bundles for `DRY`, `KISS`, `YAGNI`, `SoC`, `SOLID`, plus an `all-principles` orchestrator that consolidates the results.

## What v1 includes

- Shared reviewer contracts in [`core/`](/Users/ilastarikov/Projects/personal/code-review-guild/core)
- Tool bundles for Claude, Codex, Cursor, and GitHub Copilot in [`integrations/`](/Users/ilastarikov/Projects/personal/code-review-guild/integrations)
- Copy-based installer scripts in [`install/`](/Users/ilastarikov/Projects/personal/code-review-guild/install)
- A Python example with sample reports in [`examples/python/`](/Users/ilastarikov/Projects/personal/code-review-guild/examples/python)

## Reviewers

- `review-dry`
- `review-kiss`
- `review-yagni`
- `review-soc`
- `review-solid`
- `review-all-principles`

Each reviewer is intentionally narrow:

- It analyzes one principle only.
- It avoids generic code review noise.
- It separates `Must fix`, `Should consider`, and `Acceptable tradeoff`.
- It writes reusable Markdown reports into `docs/reviews/` in the reviewed project.

## Report contract

V1 standardizes these output files in the target project:

- `docs/reviews/latest-dry-review.md`
- `docs/reviews/latest-kiss-review.md`
- `docs/reviews/latest-yagni-review.md`
- `docs/reviews/latest-soc-review.md`
- `docs/reviews/latest-solid-review.md`
- `docs/reviews/latest-principles-review.md`

Each report must include:

- `Scope`
- `Summary`
- `Must fix`
- `Should consider`
- `Acceptable tradeoff`
- `Not a problem`
- `Reusable project observations`

The full contract lives in [core/review-contract.md](/Users/ilastarikov/Projects/personal/code-review-guild/core/review-contract.md).

## Repository layout

```text
core/                  Shared reviewer guidance and report contracts
integrations/          Tool-specific reviewer bundles
install/               Shell and PowerShell installers
examples/python/       Imperfect sample project and sample reports
tests/                 Repository integrity checks
```

## Installation

Each installer copies one integration bundle into a destination directory and refuses to overwrite an existing install unless `--force` is passed.

Examples:

```bash
./install/install-claude.sh
./install/install-codex.sh --dest "$HOME/.codex/custom-reviewers"
./install/install-cursor.sh --dest /tmp/cursor-bundle --force
./install/install-copilot-vscode.sh
```

PowerShell equivalents are available next to each shell script.

Default destinations:

- Claude: `~/.claude/code-review-guild`
- Codex: `~/.codex/code-review-guild`
- Cursor: `~/.cursor/code-review-guild`
- GitHub Copilot: `~/.github/copilot/code-review-guild`

The installers copy the tool-specific bundle into a folder named after the integration, for example `~/.codex/code-review-guild/codex/`.

## How to use the bundles

Claude:
- Copy or reference the files from `agents/` and `commands/` in your Claude setup.

Codex:
- Copy the `.toml` agent files and the `AGENTS.md` guidance into your Codex project or user config.

Cursor:
- Use the `rules/` and `commands/` files as opt-in review helpers. They are intentionally not always-on.

GitHub Copilot:
- Use the prompt files directly inside VS Code or copy them into your preferred prompt-file workflow.

## Example

The Python example shows the intended quality bar:

- deliberately imperfect source files in [`examples/python/src/`](/Users/ilastarikov/Projects/personal/code-review-guild/examples/python/src)
- one report per principle in [`examples/python/reports/`](/Users/ilastarikov/Projects/personal/code-review-guild/examples/python/reports)

## Verification

Run the repository integrity suite with:

```bash
python3 -m unittest tests/test_repo_integrity.py -v
```

This validates:

- all expected core and integration files exist
- report contracts mention the canonical filenames and sections
- shell installers copy bundles and enforce overwrite protection
- PowerShell installers expose the same destination and force contract
