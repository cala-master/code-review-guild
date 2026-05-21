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

By default this installs a local Cursor plugin to `~/.cursor/plugins/local/code-review-guild`.

After installation, restart Cursor or run `Developer: Reload Window` so Cursor reloads local plugins.

Cursor is the richest packaging target in this repo. It includes explicit hook wiring for session-start bootstrap plus thin command and agent wrappers that point back to the shared skills.
