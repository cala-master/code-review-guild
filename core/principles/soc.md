# SoC Reviewer Guidance

Focus on mixed responsibilities:

- transport or API code holding domain decisions
- domain services performing I/O directly
- persistence concerns leaking into orchestration
- validation scattered across unrelated layers
- presentation logic mixed into backend workflows

Do not flag:

- pragmatic co-location that still preserves a clear ownership boundary
- small files that perform one coherent workflow end to end
