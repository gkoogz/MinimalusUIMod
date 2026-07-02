param(
    [string]$OutputDir = ".build/MobileOverlay"
)

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$pcAltered = Join-Path $repoRoot "assets/Altered"
$mobileAltered = Join-Path $repoRoot "assets/AlteredMobile"
$outputPath = Join-Path $repoRoot $OutputDir

if (-not (Test-Path $pcAltered)) {
    throw "Missing PC altered folder: $pcAltered"
}

if (-not (Test-Path $mobileAltered)) {
    throw "Missing mobile altered folder: $mobileAltered"
}

$resolvedRepo = [System.IO.Path]::GetFullPath($repoRoot)
$resolvedOutput = [System.IO.Path]::GetFullPath($outputPath)
$allowedBuildRoot = [System.IO.Path]::GetFullPath((Join-Path $repoRoot ".build"))

if (-not $resolvedOutput.StartsWith($allowedBuildRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to clean output outside .build: $resolvedOutput"
}

if (Test-Path $resolvedOutput) {
    Remove-Item -LiteralPath $resolvedOutput -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $resolvedOutput | Out-Null

$pcFiles = Get-ChildItem -LiteralPath $pcAltered -Filter "*.dds" -File
$mobileFiles = Get-ChildItem -LiteralPath $mobileAltered -Filter "*.dds" -File

foreach ($file in $pcFiles) {
    Copy-Item -LiteralPath $file.FullName -Destination (Join-Path $resolvedOutput $file.Name)
}

foreach ($file in $mobileFiles) {
    Copy-Item -LiteralPath $file.FullName -Destination (Join-Path $resolvedOutput $file.Name) -Force
}

$duplicates = @($pcFiles.Name) + @($mobileFiles.Name) |
    Group-Object |
    Where-Object { $_.Count -gt 1 } |
    Select-Object -ExpandProperty Name

$manifest = @()
$manifest += "Minimalus mobile overlay build"
$manifest += "Generated: $(Get-Date -Format o)"
$manifest += ""
$manifest += "Priority order:"
$manifest += "1. assets/Altered/*.dds"
$manifest += "2. assets/AlteredMobile/*.dds"
$manifest += ""
$manifest += "PC DDS count: $($pcFiles.Count)"
$manifest += "Mobile DDS count: $($mobileFiles.Count)"
$manifest += "Output DDS count: $((Get-ChildItem -LiteralPath $resolvedOutput -Filter "*.dds" -File | Measure-Object).Count)"
$manifest += ""
$manifest += "Duplicate filename overrides, if any:"
if ($duplicates.Count -eq 0) {
    $manifest += "(none)"
} else {
    $manifest += $duplicates
}

$manifest | Set-Content -LiteralPath (Join-Path $resolvedOutput "manifest-mobile-overlay.txt") -Encoding UTF8

Write-Output "Built mobile overlay: $resolvedOutput"
Write-Output "PC DDS: $($pcFiles.Count)"
Write-Output "Mobile DDS: $($mobileFiles.Count)"
Write-Output "Duplicate filename overrides: $($duplicates.Count)"
