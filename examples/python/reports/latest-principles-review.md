# Principles Review Report

## Scope
`examples/python/src/`

## Summary
The sample code demonstrates intentional design tradeoffs for a focused review demo, with the strongest recurring theme being oversized methods that combine multiple concerns.

## Must fix
### Finding 1: Billing workflow concentrates too many responsibilities
- Severity: Medium
- Confidence: High
- Files: `examples/python/src/billing.py`
- Evidence: the file combines preview behavior, tax rules, charging, and persistence, which was surfaced by KISS, SoC, and SOLID.
- Why it matters: the method is hard to read and hard to change safely.
- Recommendation: split preview handling, tax policy, and persistence coordination into smaller units.

### Finding 2: Order validation duplicates one business rule path
- Severity: Medium
- Confidence: High
- Files: `examples/python/src/order_service.py`
- Evidence: the same validation checks appear in both `validate()` and `create_order()`.
- Why it matters: duplicated logic can drift.
- Recommendation: centralize the validation path and call it from the order creation flow.

## Should consider
### Finding 1: Preview placeholders add speculative complexity
- Severity: Low
- Confidence: High
- Files: `examples/python/src/billing.py`
- Evidence: preview branches return an unused `result_formatter` field.
- Why it matters: it adds an extension point with no present requirement.
- Recommendation: remove the placeholder until a real formatter contract exists.

## Acceptable tradeoff
- The example code is intentionally explicit and slightly flawed so each reviewer has something concrete to discuss.

## Not a problem
- None of the principle reviewers recommended introducing heavyweight framework abstractions.

## Reusable project observations
- The strongest findings in this example are practical and local, not theoretical.
