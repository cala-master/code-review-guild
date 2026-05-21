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

This repo packages a Codex-oriented bundle under `~/.codex/code-review-guild` by default. That packaging is compatible with Codex skills and plugins, but OpenAI's public docs currently describe skills support more clearly than a single canonical local install path. Treat this installer as a prepared local bundle rather than a claim of automatic activation semantics.
