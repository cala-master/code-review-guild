# Claude Integration Notes

Code Review Guild packages review skills for multiple harnesses. In this repo:

- `skills/` defines the behavior
- `.claude-plugin/` defines Claude-facing metadata
- `hooks/session-start.md` contains the narrow bootstrap message

When editing the Claude-facing packaging:

- keep the session-start bootstrap narrow
- reference the review skills rather than duplicating their content
- keep report filenames aligned with the shared contract
