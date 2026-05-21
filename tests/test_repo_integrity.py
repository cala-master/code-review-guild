import os
import pathlib
import subprocess
import tempfile
import unittest


REPO_ROOT = pathlib.Path(__file__).resolve().parents[1]

CORE_FILES = [
    "core/principles/dry.md",
    "core/principles/kiss.md",
    "core/principles/yagni.md",
    "core/principles/soc.md",
    "core/principles/solid.md",
    "core/review-contract.md",
    "core/report-template.md",
    "core/severity-rubric.md",
    "core/orchestrator-contract.md",
]

INTEGRATION_FILES = [
    "integrations/claude/agents/dry-reviewer.md",
    "integrations/claude/agents/kiss-reviewer.md",
    "integrations/claude/agents/yagni-reviewer.md",
    "integrations/claude/agents/soc-reviewer.md",
    "integrations/claude/agents/solid-reviewer.md",
    "integrations/claude/agents/principles-orchestrator.md",
    "integrations/claude/commands/review-dry.md",
    "integrations/claude/commands/review-kiss.md",
    "integrations/claude/commands/review-yagni.md",
    "integrations/claude/commands/review-soc.md",
    "integrations/claude/commands/review-solid.md",
    "integrations/claude/commands/review-all-principles.md",
    "integrations/codex/agents/dry-reviewer.toml",
    "integrations/codex/agents/kiss-reviewer.toml",
    "integrations/codex/agents/yagni-reviewer.toml",
    "integrations/codex/agents/soc-reviewer.toml",
    "integrations/codex/agents/solid-reviewer.toml",
    "integrations/codex/agents/principles-orchestrator.toml",
    "integrations/codex/AGENTS.md",
    "integrations/cursor/rules/dry-reviewer.mdc",
    "integrations/cursor/rules/kiss-reviewer.mdc",
    "integrations/cursor/rules/yagni-reviewer.mdc",
    "integrations/cursor/rules/soc-reviewer.mdc",
    "integrations/cursor/rules/solid-reviewer.mdc",
    "integrations/cursor/rules/principles-orchestrator.mdc",
    "integrations/cursor/commands/review-dry.md",
    "integrations/cursor/commands/review-kiss.md",
    "integrations/cursor/commands/review-yagni.md",
    "integrations/cursor/commands/review-soc.md",
    "integrations/cursor/commands/review-solid.md",
    "integrations/cursor/commands/review-all-principles.md",
    "integrations/github-copilot/prompts/review-dry.prompt.md",
    "integrations/github-copilot/prompts/review-kiss.prompt.md",
    "integrations/github-copilot/prompts/review-yagni.prompt.md",
    "integrations/github-copilot/prompts/review-soc.prompt.md",
    "integrations/github-copilot/prompts/review-solid.prompt.md",
    "integrations/github-copilot/prompts/review-all-principles.prompt.md",
    "integrations/github-copilot/instructions/code-review-guild.instructions.md",
]

INSTALLER_FILES = [
    "install/install-claude.sh",
    "install/install-claude.ps1",
    "install/install-codex.sh",
    "install/install-codex.ps1",
    "install/install-cursor.sh",
    "install/install-cursor.ps1",
    "install/install-copilot-vscode.sh",
    "install/install-copilot-vscode.ps1",
]

REPORT_FILENAMES = [
    "latest-dry-review.md",
    "latest-kiss-review.md",
    "latest-yagni-review.md",
    "latest-soc-review.md",
    "latest-solid-review.md",
    "latest-principles-review.md",
]

REPORT_SECTIONS = [
    "## Scope",
    "## Summary",
    "## Must fix",
    "## Should consider",
    "## Acceptable tradeoff",
    "## Not a problem",
    "## Reusable project observations",
]


class RepoIntegrityTests(unittest.TestCase):
    def test_core_files_exist(self):
        for relative_path in CORE_FILES:
            self.assertTrue((REPO_ROOT / relative_path).is_file(), relative_path)

    def test_integration_files_exist(self):
        for relative_path in INTEGRATION_FILES:
            self.assertTrue((REPO_ROOT / relative_path).is_file(), relative_path)

    def test_installer_files_exist(self):
        for relative_path in INSTALLER_FILES:
            self.assertTrue((REPO_ROOT / relative_path).is_file(), relative_path)

    def test_report_contract_mentions_expected_filenames_and_sections(self):
        content = (REPO_ROOT / "core/review-contract.md").read_text()
        for filename in REPORT_FILENAMES:
            self.assertIn(filename, content)
        for section in REPORT_SECTIONS:
            self.assertIn(section, content)

    def test_integrations_reference_review_outputs(self):
        targets = [
            REPO_ROOT / "integrations/claude",
            REPO_ROOT / "integrations/codex",
            REPO_ROOT / "integrations/cursor",
            REPO_ROOT / "integrations/github-copilot",
        ]
        for target in targets:
            combined = "\n".join(
                path.read_text()
                for path in sorted(target.rglob("*"))
                if path.is_file()
            )
            for filename in REPORT_FILENAMES:
                self.assertIn(filename, combined, f"{target} missing {filename}")

    def test_example_python_project_contains_sample_reports(self):
        example_root = REPO_ROOT / "examples/python"
        self.assertTrue((example_root / "src").is_dir())
        self.assertTrue((example_root / "reports").is_dir())
        for filename in REPORT_FILENAMES:
            report_path = example_root / "reports" / filename
            self.assertTrue(report_path.is_file(), report_path)
            content = report_path.read_text()
            for section in REPORT_SECTIONS:
                self.assertIn(section, content)

    def test_shell_installers_copy_files_and_refuse_overwrite_without_force(self):
        shell_scripts = [
            ("install/install-claude.sh", "claude"),
            ("install/install-codex.sh", "codex"),
            ("install/install-cursor.sh", "cursor"),
            ("install/install-copilot-vscode.sh", "github-copilot"),
        ]

        for relative_script, integration_name in shell_scripts:
            with self.subTest(script=relative_script):
                script_path = REPO_ROOT / relative_script
                with tempfile.TemporaryDirectory() as tmp_dir:
                    destination = pathlib.Path(tmp_dir) / "dest"
                    first = subprocess.run(
                        ["/bin/sh", str(script_path), "--dest", str(destination)],
                        cwd=REPO_ROOT,
                        capture_output=True,
                        text=True,
                    )
                    self.assertEqual(first.returncode, 0, first.stderr)
                    copied_root = destination / integration_name
                    self.assertTrue(copied_root.is_dir(), copied_root)

                    second = subprocess.run(
                        ["/bin/sh", str(script_path), "--dest", str(destination)],
                        cwd=REPO_ROOT,
                        capture_output=True,
                        text=True,
                    )
                    self.assertNotEqual(second.returncode, 0)
                    self.assertIn("--force", second.stderr + second.stdout)

                    third = subprocess.run(
                        [
                            "/bin/sh",
                            str(script_path),
                            "--dest",
                            str(destination),
                            "--force",
                        ],
                        cwd=REPO_ROOT,
                        capture_output=True,
                        text=True,
                    )
                    self.assertEqual(third.returncode, 0, third.stderr)

    def test_powershell_scripts_expose_dest_and_force_contract(self):
        for relative_path in [path for path in INSTALLER_FILES if path.endswith(".ps1")]:
            content = (REPO_ROOT / relative_path).read_text()
            self.assertIn("Destination", content, relative_path)
            self.assertIn("Force", content, relative_path)
            self.assertIn("Write-Host", content, relative_path)


if __name__ == "__main__":
    unittest.main()
