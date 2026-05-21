param(
    [string]$Destination = "$HOME/.codex/code-review-guild",
    [switch]$Force
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir

Write-Host "Installing the Codex Code Review Guild bundle..."
& (Join-Path $ScriptDir "lib/install_bundle.ps1") -ToolName "codex" -DefaultDestination "$HOME/.codex/code-review-guild" -RepoRoot $RepoRoot -Destination $Destination -Force:$Force
