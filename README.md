# Code Review Guild

Code Review Guild is a skill-first plugin repository for principle-based code review. The core product is a shared `skills/` library for `DRY`, `KISS`, `YAGNI`, `SoC`, `SOLID`, plus a consolidated `all-principles` review. Harness-specific packaging for Claude, Codex, Cursor, and GitHub Copilot is layered on top of those skills.

## Support model

Supported harnesses:

- Claude: skill packaging plus plugin metadata and session-start bootstrap files
- Codex: skill packaging plus plugin metadata
- Cursor: skill packaging plus plugin metadata, command wrappers, agent wrappers, and session-start hook config
- GitHub Copilot: skill packaging plus reusable prompt files and harness docs

Automatic bootstrap is intentionally narrow. It exists to expose Code Review Guild’s review skills at session start where the harness supports it. This repo does not import the broader Superpowers workflow catalog.

## Public skill catalog

- `review-dry`: harmful duplication only
- `review-kiss`: unnecessary complexity only
- `review-yagni`: speculative design only
- `review-soc`: separation of concerns only
- `review-solid`: practical SOLID issues only
- `review-all-principles`: consolidate the five principle reviews into one final report

The bootstrap skill `using-code-review-guild` is internal support plumbing. It exposes the review skills and the report contract, but it is not part of the public review surface.

## Report contract

Every review writes into the target project’s `docs/reviews/` directory using these canonical filenames:

- `docs/reviews/latest-dry-review.md`
- `docs/reviews/latest-kiss-review.md`
- `docs/reviews/latest-yagni-review.md`
- `docs/reviews/latest-soc-review.md`
- `docs/reviews/latest-solid-review.md`
- `docs/reviews/latest-principles-review.md`

Every report must include:

- `## Scope`
- `## Summary`
- `## Must fix`
- `## Should consider`
- `## Acceptable tradeoff`
- `## Not a problem`
- `## Reusable project observations`

The example reports in `examples/python/reports/` remain the reference shape.

## Repository structure

```text
skills/                 Source of truth for reviewer behavior
hooks/                  Session-start bootstrap assets
agents/                 Thin harness wrappers around the skills
commands/               Thin command wrappers around the skills
.claude-plugin/         Claude-facing packaging metadata
.codex-plugin/          Codex-facing packaging metadata
.cursor-plugin/         Cursor-facing packaging metadata
integrations/           Remaining harness-specific assets, including Copilot prompts
docs/                   Harness-specific install and usage docs
examples/python/        Imperfect demo project and canonical report examples
tests/                  Repo integrity tests for the skill/plugin architecture
```

## Installation

Use the harness-specific installers to copy the package shape you need:

```bash
./install/install-claude.sh
./install/install-codex.sh
./install/install-cursor.sh --dest /tmp/code-review-guild-cursor
./install/install-copilot-vscode.sh
```

All installers:

- accept `--dest PATH`
- refuse to overwrite an existing destination unless `--force` is passed
- copy the shared `skills/` library
- add only the harness-specific packaging files relevant to that install target

PowerShell equivalents are provided next to each shell script.

## Session-start bootstrap

Where supported, the session-start bootstrap loads the narrow Code Review Guild context:

- `using-code-review-guild`
- canonical report destinations
- the six review entrypoints

The bootstrap message lives in `hooks/session-start.md` and is emitted by `hooks/session-start.sh`. Cursor also includes explicit hook wiring through `hooks/hooks-cursor.json`.

## Harness docs

- [Claude setup](docs/README.claude.md)
- [Codex setup](docs/README.codex.md)
- [Cursor setup](docs/README.cursor.md)
- [GitHub Copilot setup](docs/README.copilot.md)

## Example workflow

1. Install the package for the harness you use.
2. Let the session-start bootstrap expose the review skills where supported.
3. Run one focused review such as `review-dry`.
4. Write the report to `docs/reviews/latest-dry-review.md`.
5. After the five focused reviews exist, run `review-all-principles` to write `docs/reviews/latest-principles-review.md`.

## Limitations

- GitHub Copilot support is prompt-oriented rather than true session-start bootstrap.
- The repo ships judgment-based review skills, not AST or static-analysis tooling.
- The legacy `core/` and `integrations/` files may remain as compatibility/reference material, but `skills/` is the behavioral source of truth.

## Contributing

Edit the `skills/` content first.

When changing behavior:

- update the relevant `skills/*/SKILL.md`
- keep wrappers in `agents/`, `commands/`, and plugin manifests thin
- preserve the canonical report filenames and section schema
- update harness docs if the installation or invocation story changes
- run `python3 -m unittest tests/test_repo_integrity.py -v`
