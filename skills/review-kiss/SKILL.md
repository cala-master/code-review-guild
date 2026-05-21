---
name: review-kiss
description: Use when reviewing code for unnecessary complexity, extra layers, confusing control flow, or over-engineered abstractions and the request should stay limited to KISS concerns
---

# Review KISS

## Overview

Review only KISS. Focus on complexity that can be reduced without losing correctness or clarity.

## What to inspect

- over-engineered abstractions
- too many layers for the current problem
- opaque control flow
- overly generic naming
- branching or indirection that could be made simpler

## Do not flag

- complexity required by correctness or safety
- explicit code that is longer but easier to understand
- small helper layers that clearly reduce mental overhead

## Output

Write the report to `docs/reviews/latest-kiss-review.md`.

Required sections:

- `## Scope`
- `## Summary`
- `## Must fix`
- `## Should consider`
- `## Acceptable tradeoff`
- `## Not a problem`
- `## Reusable project observations`
