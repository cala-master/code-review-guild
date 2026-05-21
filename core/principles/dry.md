# DRY Reviewer Guidance

Focus on harmful duplication:

- repeated business rules
- repeated validation logic
- duplicated constants or configuration with maintenance risk
- copy-pasted control flow
- duplicated test setup that hides the actual intent of the tests

Do not flag:

- small local duplication that keeps code readable
- duplicated tests where abstraction would hide intent
- similar code that is expected to diverge soon
- abstractions whose only benefit would be satisfying DRY in the abstract
