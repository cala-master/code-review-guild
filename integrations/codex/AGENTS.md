# Code Review Guild for Codex

Codex reviewers are intentionally narrow, read-only reviewers. Each `.toml` file under `agents/` is responsible for one principle or for orchestrating the consolidated report.

Canonical report destinations:

- `docs/reviews/latest-dry-review.md`
- `docs/reviews/latest-kiss-review.md`
- `docs/reviews/latest-yagni-review.md`
- `docs/reviews/latest-soc-review.md`
- `docs/reviews/latest-solid-review.md`
- `docs/reviews/latest-principles-review.md`

Use the principle reviewers independently when you want one engineering lens. Use `principles-orchestrator.toml` when you want one final report that deduplicates overlapping findings without turning into a generic review.
