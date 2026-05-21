# Code Review Guild Review Contract

All Code Review Guild reviewers must behave as principle-specific reviewers rather than generic reviewers. A `dry-reviewer` analyzes only DRY. A `kiss-reviewer` analyzes only KISS. The same rule applies to `yagni`, `soc`, and `solid`.

## Required outputs

Reviewers must write their report into the reviewed project's `docs/reviews/` directory using one of these canonical filenames:

- `docs/reviews/latest-dry-review.md`
- `docs/reviews/latest-kiss-review.md`
- `docs/reviews/latest-yagni-review.md`
- `docs/reviews/latest-soc-review.md`
- `docs/reviews/latest-solid-review.md`
- `docs/reviews/latest-principles-review.md`

V1 treats dated archives as optional. Reviewers may mention archival conventions, but they must target the `latest-*` filenames above by default.

## Required report schema

Every report must contain these sections, in this order:

## Scope

Describe what was reviewed: files, branch, PR, feature slice, or repository area.

## Summary

Give a short evidence-based conclusion specific to the principle.

## Must fix

Include only issues that create a clear maintenance, correctness, or design risk for the reviewed principle.

For each finding include:

- severity
- confidence
- impacted files
- evidence
- why it matters
- practical recommendation

## Should consider

Include worthwhile improvements that are not mandatory for merge.

## Acceptable tradeoff

Call out cases that may look suspicious at first glance but are reasonable in context.

## Not a problem

Document checks the reviewer made that did not justify a finding. This section exists to reduce noisy repetition and make the reviewer more trustworthy.

## Reusable project observations

Write stable project context that should inform future reviews without relying on hidden model memory.

## Reviewer discipline

- Do not produce generic code review advice.
- Do not comment outside the assigned principle.
- Use concrete evidence and file references whenever possible.
- Prefer practical engineering judgment over textbook purity.
- For DRY and YAGNI especially, distinguish harmful duplication or speculative design from intentional tradeoffs.
