# DRY Review Report

## Scope
`examples/python/src/order_service.py`

## Summary
The sample contains harmful duplication in validation logic that can drift over time.

## Must fix
### Finding 1: Order validation is duplicated in two paths
- Severity: Medium
- Confidence: High
- Files: `examples/python/src/order_service.py`
- Evidence: `create_order()` repeats the same `customer_id`, `items`, and `total` validation already implemented in `validate()`.
- Why it matters: future rule changes can update one path and miss the other.
- Recommendation: call `validate()` once and remove the duplicated checks from `create_order()`.

## Should consider
- None.

## Acceptable tradeoff
- Keeping the validation near the entry point can be reasonable if the project is intentionally avoiding a shared domain helper, but that is not what the file currently communicates.

## Not a problem
- The duplicated dictionary lookups inside one validation path were not flagged separately because they are part of the same core issue.

## Reusable project observations
- This example intentionally tolerates obvious duplication to demonstrate reviewer behavior.
