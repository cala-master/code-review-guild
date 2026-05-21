---
name: review-solid
description: Use when reviewing code for practical SRP, OCP, LSP, ISP, or DIP issues and the request should stay limited to concrete SOLID design costs rather than textbook commentary
---

# Review SOLID

## Overview

Review only SOLID. Keep the findings practical and grounded in design cost.

## What to inspect

- SRP violations that make a unit hard to change safely
- extension pain caused by hard-coded behavior
- substitutability problems in interfaces or inheritance
- bulky abstractions that force consumers to depend on unused surface area
- tightly coupled concrete dependencies that make testing or change hard

## Do not flag

- code for not using classes or interfaces when simple functions are enough
- theoretical SOLID complaints with no concrete maintenance cost

## Output

Write the report to `docs/reviews/latest-solid-review.md`.

Required sections:

- `## Scope`
- `## Summary`
- `## Must fix`
- `## Should consider`
- `## Acceptable tradeoff`
- `## Not a problem`
- `## Reusable project observations`
