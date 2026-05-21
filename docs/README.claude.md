# Claude Setup

Claude support is packaged as:

- `.claude-plugin/plugin.json`
- shared `skills/`
- session-start bootstrap assets in `hooks/`

Prepare a local plugin bundle with:

```bash
./install/install-claude.sh
```

This installer prepares a Claude-compatible plugin directory containing `skills/`, `.claude-plugin/`, `hooks/session-start.sh`, and this doc.

Claude Code does not treat a copied folder under `~/.claude/` as installed by itself. Use one of Claude's native loading flows:

- local development: `claude --plugin-dir ~/.claude/code-review-guild`
- plugin management or marketplace flows documented by Claude Code

Use the review skills for focused reviews and write reports to the canonical `docs/reviews/latest-*.md` targets.
