param(
    [string]$Destination = (Get-Location).Path,
    [switch]$Force
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir

function Copy-ScaffoldFile {
    param(
        [string]$SourceRelativePath,
        [string]$TargetRelativePath
    )

    $sourcePath = Join-Path $RepoRoot $SourceRelativePath
    $targetPath = Join-Path $Destination $TargetRelativePath
    $targetParent = Split-Path -Parent $targetPath

    if ($targetParent) {
        New-Item -ItemType Directory -Force -Path $targetParent | Out-Null
    }

    if ((Test-Path $targetPath) -and -not $Force) {
        throw "Destination already contains $TargetRelativePath. Re-run with -Force to overwrite."
    }

    Copy-Item -Force $sourcePath $targetPath
}

Write-Host "Installing GitHub Copilot Code Review Guild project scaffolding..."

Copy-ScaffoldFile `
    -SourceRelativePath "integrations/github-copilot/instructions/code-review-guild.instructions.md" `
    -TargetRelativePath ".github/copilot-instructions.md"

Get-ChildItem -Path (Join-Path $RepoRoot "integrations/github-copilot/prompts") -Filter "*.prompt.md" -File | ForEach-Object {
    Copy-ScaffoldFile `
        -SourceRelativePath ("integrations/github-copilot/prompts/" + $_.Name) `
        -TargetRelativePath (".github/prompts/" + $_.Name)
}

Write-Host "Installed Code Review Guild GitHub Copilot scaffolding into $Destination"
Write-Host "Custom instructions: $Destination/.github/copilot-instructions.md"
Write-Host "Prompt files: $Destination/.github/prompts"
