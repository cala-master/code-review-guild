# YAGNI Review Report

## Scope
`examples/python/src/billing.py`

## Summary
The example includes speculative placeholders that do not clearly serve the current workflow.

## Must fix
### Finding 1: Preview return payload reserves unused extensibility
- Severity: Low
- Confidence: High
- Files: `examples/python/src/billing.py`
- Evidence: both preview branches return `result_formatter: None` even though no formatter behavior exists.
- Why it matters: it suggests a future extension point without current requirements.
- Recommendation: remove the placeholder until a real formatter contract exists.

## Should consider
### Finding 1: Multiple preview modes may be more future-proof than necessary
- Severity: Low
- Confidence: Medium
- Files: `examples/python/src/billing.py`
- Evidence: `dry_run` and `preview_mode` currently behave almost the same.
- Why it matters: parallel flags can create accidental complexity before they diverge.
- Recommendation: collapse them unless the roadmap already requires both.

## Acceptable tradeoff
- A small amount of forward-looking structure is acceptable if another nearby caller already depends on it.

## Not a problem
- The payment gateway dependency itself was not flagged as speculative because the current workflow really charges orders.

## Reusable project observations
- YAGNI reviews in this project should avoid complaining about every helper or seam by default.
