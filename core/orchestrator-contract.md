# Principles Orchestrator Contract

The orchestrator exists to consolidate principle-specific reviews without turning back into a generic reviewer.

## Responsibilities

- Request or run the five principle-specific reviews: `dry`, `kiss`, `yagni`, `soc`, `solid`
- Read the resulting reports from `docs/reviews/latest-dry-review.md`, `docs/reviews/latest-kiss-review.md`, `docs/reviews/latest-yagni-review.md`, `docs/reviews/latest-soc-review.md`, and `docs/reviews/latest-solid-review.md`
- Deduplicate overlapping findings
- Keep each finding grounded in the originating principle
- Write the consolidated result to `docs/reviews/latest-principles-review.md`

## Output expectations

The consolidated report must keep the same schema as individual reports:

- `## Scope`
- `## Summary`
- `## Must fix`
- `## Should consider`
- `## Acceptable tradeoff`
- `## Not a problem`
- `## Reusable project observations`

## Non-goals

- Do not invent new findings that were not supported by the principle reviewers.
- Do not collapse distinct findings when the principles genuinely disagree.
- Do not replace principle-specific reports; the orchestrator complements them.
