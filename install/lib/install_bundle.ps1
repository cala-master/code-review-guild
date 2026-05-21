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

$sourceDir = Join-Path $RepoRoot "integrations/$ToolName"
$targetRoot = Join-Path $Destination $ToolName

if (-not (Test-Path $sourceDir)) {
    throw "Missing integration bundle: $sourceDir"
}

if ((Test-Path $targetRoot) -and -not $Force) {
    throw "Destination already exists: $targetRoot. Re-run with -Force to overwrite."
}

New-Item -ItemType Directory -Force -Path $Destination | Out-Null
if (Test-Path $targetRoot) {
    Remove-Item -Recurse -Force $targetRoot
}
Copy-Item -Recurse -Force $sourceDir $targetRoot

Write-Host "Installed $ToolName bundle to $targetRoot"
Write-Host "Next: use the review-dry, review-kiss, review-yagni, review-soc, review-solid, and review-all-principles entrypoints from that bundle."
