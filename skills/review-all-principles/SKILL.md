---
name: review-all-principles
description: Use when a full Code Review Guild pass is needed across DRY, KISS, YAGNI, SoC, and SOLID and the output should consolidate those focused reviews into one final principles report
---

# Review All Principles

## Overview

This skill consolidates the five focused Code Review Guild reviews. It should not turn back into a generic review.

## Inputs

Read or request these focused reports first:

- `docs/reviews/latest-dry-review.md`
- `docs/reviews/latest-kiss-review.md`
- `docs/reviews/latest-yagni-review.md`
- `docs/reviews/latest-soc-review.md`
- `docs/reviews/latest-solid-review.md`

## Output

Write the consolidated report to `docs/reviews/latest-principles-review.md`.

Required sections:

- `## Scope`
- `## Summary`
- `## Must fix`
- `## Should consider`
- `## Acceptable tradeoff`
- `## Not a problem`
- `## Reusable project observations`

## Rules

- preserve the originating principle when summarizing findings
- deduplicate overlap without inventing new unsupported issues
- keep the report evidence-based
