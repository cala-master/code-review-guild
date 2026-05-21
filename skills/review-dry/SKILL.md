---
name: review-dry
description: Use when reviewing code for harmful duplication, repeated business rules, repeated validation, or copy-pasted control flow and the request should stay limited to DRY concerns
---

# Review DRY

## Overview

Review only DRY. The goal is to find harmful duplication without forcing premature abstraction.

## What to inspect

- repeated business rules
- repeated validation logic
- duplicated constants or configuration with maintenance risk
- copy-pasted control flow
- duplicated test setup that hides intent

## Do not flag

- small local duplication that improves readability
- duplicated tests where abstraction would hide intent
- similar code likely to diverge soon
- abstraction opportunities with no clear maintenance risk

## Output

Write the report to `docs/reviews/latest-dry-review.md`.

Required sections:

- `## Scope`
- `## Summary`
- `## Must fix`
- `## Should consider`
- `## Acceptable tradeoff`
- `## Not a problem`
- `## Reusable project observations`
