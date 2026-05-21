param(
    [string]$Destination = "$HOME/.github/copilot/code-review-guild",
    [switch]$Force
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir

Write-Host "Installing the GitHub Copilot Code Review Guild bundle..."
& (Join-Path $ScriptDir "lib/install_bundle.ps1") -ToolName "github-copilot" -DefaultDestination "$HOME/.github/copilot/code-review-guild" -RepoRoot $RepoRoot -Destination $Destination -Force:$Force
