# Cursor Setup

Cursor support is packaged as:

- `.cursor-plugin/plugin.json`
- shared `skills/`
- `agents/`
- `commands/`
- `hooks/hooks-cursor.json`

Install with:

```bash
./install/install-cursor.sh
```

Cursor is the richest packaging target in this repo. It includes explicit hook wiring for session-start bootstrap plus thin command and agent wrappers that point back to the shared skills.
