# GitHub Copilot Setup

GitHub Copilot support is repository-oriented rather than plugin-oriented.

The installer scaffolds native Copilot customization files into the target project:

- `.github/copilot-instructions.md`
- `.github/prompts/*.prompt.md`

Install into the repository you want to review:

```bash
./install/install-copilot-vscode.sh --dest /path/to/your-project
```

If you run the installer from the target repository root, `--dest` is optional and defaults to the current working directory.

For VS Code prompt files, enable workspace setting `"chat.promptFiles": true` if your Copilot setup has not enabled prompt files yet.

Use the prompt files directly in your Copilot workflow. The report contract and review behavior still come from the shared skills.
