---
name: review-soc
description: Use when reviewing code for mixed responsibilities, leaked boundaries between layers, or business logic embedded in the wrong place and the request should stay limited to separation-of-concerns concerns
---

# Review SoC

## Overview

Review only separation of concerns. Focus on clear ownership boundaries rather than framework dogma.

## What to inspect

- transport or API code holding domain decisions
- domain services performing I/O directly
- persistence leaking into orchestration
- validation scattered across unrelated layers
- presentation logic mixed into backend workflows

## Do not flag

- pragmatic co-location that still preserves a clear ownership boundary
- small files that perform one coherent workflow end to end

## Output

Write the report to `docs/reviews/latest-soc-review.md`.

Required sections:

- `## Scope`
- `## Summary`
- `## Must fix`
- `## Should consider`
- `## Acceptable tradeoff`
- `## Not a problem`
- `## Reusable project observations`
