param(
    [Parameter(Mandatory = $true)]
    [string]$ToolName,
    [Parameter(Mandatory = $true)]
    [string]$DefaultDestination,
    [Parameter(Mandatory = $true)]
    [string]$RepoRoot,
    [string]$Destination,
    [switch]$Force
)

if (-not $Destination) {
    $Destination = $DefaultDestination
}

function Get-PackagePaths {
    param([string]$Name)

    switch ($Name) {
        "claude" {
            @(".claude-plugin", "skills", "hooks", "AGENTS.md", "CLAUDE.md", "README.md", "LICENSE", "docs/README.claude.md")
        }
        "codex" {
            @(".codex-plugin", "skills", "commands", "AGENTS.md", "README.md", "LICENSE", "docs/README.codex.md")
        }
        "cursor" {
            @(".cursor-plugin", "skills", "hooks", "agents", "commands", "AGENTS.md", "README.md", "LICENSE", "docs/README.cursor.md")
        }
        "github-copilot" {
            @("skills", "AGENTS.md", "README.md", "LICENSE", "docs/README.copilot.md", "integrations/github-copilot")
        }
        default {
            throw "Unknown tool: $Name"
        }
    }
}

if ((Test-Path $Destination) -and -not $Force) {
    throw "Destination already exists: $Destination. Re-run with -Force to overwrite."
}

if (Test-Path $Destination) {
    Remove-Item -Recurse -Force $Destination
}
New-Item -ItemType Directory -Force -Path $Destination | Out-Null

foreach ($relativePath in (Get-PackagePaths -Name $ToolName)) {
    $sourcePath = Join-Path $RepoRoot $relativePath
    $targetPath = Join-Path $Destination $relativePath
    $targetParent = Split-Path -Parent $targetPath

    if ($targetParent) {
        New-Item -ItemType Directory -Force -Path $targetParent | Out-Null
    }

    Copy-Item -Recurse -Force $sourcePath $targetPath
}

Write-Host "Installed Code Review Guild package for $ToolName to $Destination"
Write-Host "Shared skills are available under $Destination/skills"
