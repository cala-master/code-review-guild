# SOLID Review Report

## Scope
`examples/python/src/billing.py`, `examples/python/src/notifications.py`

## Summary
The example contains practical SRP and dependency-shape issues, but it does not need artificial interface hierarchies.

## Must fix
### Finding 1: Billing workflow has a strong SRP violation
- Severity: Medium
- Confidence: High
- Files: `examples/python/src/billing.py`
- Evidence: one class controls preview branching, tax policy, payment execution, and persistence.
- Why it matters: multiple reasons to change are concentrated in one unit.
- Recommendation: separate tax policy and charge persistence responsibilities from the workflow coordinator.

## Should consider
### Finding 1: Notification manager depends on more concrete collaborators than it needs
- Severity: Low
- Confidence: Medium
- Files: `examples/python/src/notifications.py`
- Evidence: one method directly coordinates email, SMS, and audit dependencies.
- Why it matters: consumers cannot reuse a narrower notification capability without carrying the full dependency set.
- Recommendation: split delivery concerns or expose narrower collaborators.

## Acceptable tradeoff
- The code does not need formal interfaces for every dependency in a Python example; simple callable collaborators are fine.

## Not a problem
- The example was not flagged for lacking inheritance-based extension points.

## Reusable project observations
- SOLID guidance here should stay practical and avoid turning Python functions into ceremony.
