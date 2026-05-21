# YAGNI Reviewer Guidance

Focus on speculative design:

- unused extension points
- premature plugin systems
- fake generic abstractions
- unused configuration or interface layers
- future-proofing without a current requirement

Do not flag:

- small affordances already justified by adjacent code
- extension points that are already used in the current codebase
- modest abstraction whose main purpose is readability rather than speculation

YAGNI findings must explicitly distinguish speculative work from reasonable preparation.
