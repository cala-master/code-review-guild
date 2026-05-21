# Code Review Guild Agent Notes

This repository is skill-first.

Rules for changes:

- `skills/` is the behavioral source of truth.
- `agents/`, `commands/`, hooks, and plugin manifests are packaging layers.
- Keep the public review entrypoints stable:
  - `review-dry`
  - `review-kiss`
  - `review-yagni`
  - `review-soc`
  - `review-solid`
  - `review-all-principles`
- Preserve the canonical report outputs under `docs/reviews/latest-*.md`.
- Update `tests/test_repo_integrity.py` when the packaging surface changes.

If a change affects only wording or packaging, avoid drifting the actual review logic away from the skills.
