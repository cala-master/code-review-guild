# KISS Review Report

## Scope
`examples/python/src/billing.py`

## Summary
The billing workflow is solving a small example with more branching and mixed return shapes than necessary.

## Must fix
### Finding 1: One method owns too many unrelated decisions
- Severity: Medium
- Confidence: High
- Files: `examples/python/src/billing.py`
- Evidence: `run()` handles preview modes, tax selection, charging, persistence, and notification formatting in one flow.
- Why it matters: the method is harder to read and harder to change safely.
- Recommendation: split preview handling, tax calculation, and charge persistence into smaller helpers.

## Should consider
### Finding 1: Preview branches return odd placeholder structure
- Severity: Low
- Confidence: High
- Files: `examples/python/src/billing.py`
- Evidence: both preview modes return `result_formatter: None`, which adds shape without present value.
- Why it matters: unnecessary placeholders increase mental overhead.
- Recommendation: return the smallest shape the current caller needs.

## Acceptable tradeoff
- Keeping tax selection inline is acceptable for a tiny example if the surrounding workflow is simplified.

## Not a problem
- The simple country-based branch was not flagged as a strategy-pattern problem on its own.

## Reusable project observations
- The sample intentionally leans toward obvious code smells rather than production realism.
