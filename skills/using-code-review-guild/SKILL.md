---
name: using-code-review-guild
description: Use when Code Review Guild is installed in the current session or before handling a principle-based code review request so the correct review skills and report contract are loaded instead of generic review behavior
---

# Using Code Review Guild

## Overview

Code Review Guild provides narrow review skills for practical engineering principles. Load the smallest relevant review skill instead of defaulting to a generic review.

## When to Use

Use this when:

- the session-start hook says Code Review Guild is installed
- the user asks for a review through a principle lens
- the user wants one consolidated principles review

Do not use this for implementation or debugging workflows.

## Available review skills

- `review-dry`
- `review-kiss`
- `review-yagni`
- `review-soc`
- `review-solid`
- `review-all-principles`

## Output contract

Write reports to:

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
