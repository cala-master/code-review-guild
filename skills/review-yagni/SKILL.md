---
name: review-yagni
description: Use when reviewing code for speculative design, unused extension points, premature generic abstractions, or future-proofing without current requirements and the request should stay limited to YAGNI concerns
---

# Review YAGNI

## Overview

Review only YAGNI. Focus on speculative structure that adds current cost without a present need.

## What to inspect

- unused extension points
- premature plugin systems
- fake generic abstractions
- unused configuration or interface layers
- future-proofing without a current requirement

## Do not flag

- small affordances already justified by nearby code
- extension points already used in the current codebase
- modest abstraction whose main purpose is readability

## Output

Write the report to `docs/reviews/latest-yagni-review.md`.

Required sections:

- `## Scope`
- `## Summary`
- `## Must fix`
- `## Should consider`
- `## Acceptable tradeoff`
- `## Not a problem`
- `## Reusable project observations`
