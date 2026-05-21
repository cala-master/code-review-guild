# Codex Setup

Codex support is packaged as:

- `.codex-plugin/plugin.json`
- shared `skills/`
- shared `commands/`

Install with:

```bash
./install/install-codex.sh
```

Codex uses the shared skills as the source of truth. The command wrappers exist for explicit invocation flows, but behavior belongs in `skills/`.
