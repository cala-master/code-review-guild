param(
    [string]$Destination = "$HOME/.cursor/code-review-guild",
    [switch]$Force
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir

Write-Host "Installing the Cursor Code Review Guild bundle and shared skills..."
& (Join-Path $ScriptDir "lib/install_bundle.ps1") -ToolName "cursor" -DefaultDestination "$HOME/.cursor/code-review-guild" -RepoRoot $RepoRoot -Destination $Destination -Force:$Force
