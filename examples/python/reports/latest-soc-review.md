# SoC Review Report

## Scope
`examples/python/src/billing.py`, `examples/python/src/notifications.py`

## Summary
The example intentionally mixes orchestration, persistence, and communication responsibilities in a few broad methods.

## Must fix
### Finding 1: Billing workflow mixes domain, persistence, and messaging concerns
- Severity: Medium
- Confidence: High
- Files: `examples/python/src/billing.py`
- Evidence: `run()` calculates tax, charges the gateway, writes to the database, and sends user-facing output concerns through the same method.
- Why it matters: changes in one concern increase risk in unrelated areas.
- Recommendation: isolate charge calculation and persistence from outer workflow concerns.

## Should consider
### Finding 1: Notification manager also owns audit logging
- Severity: Low
- Confidence: High
- Files: `examples/python/src/notifications.py`
- Evidence: the method sends user notifications and writes audit log entries.
- Why it matters: delivery logic and audit behavior may evolve independently.
- Recommendation: move audit recording into a separate collaborator or event hook.

## Acceptable tradeoff
- A compact orchestration layer can legitimately coordinate several collaborators if it does not absorb their internal logic.

## Not a problem
- Passing collaborators in as parameters was not flagged by itself; the concern is ownership mixing, not dependency count alone.

## Reusable project observations
- SoC findings in this project should prefer clear ownership boundaries over framework-specific layering dogma.
