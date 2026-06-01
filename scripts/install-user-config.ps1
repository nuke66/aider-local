# Install LM Studio / Aider settings for use from any project directory.
$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path $PSScriptRoot -Parent

$TargetDir = Join-Path $env:USERPROFILE ".aider"
$TargetEnv = Join-Path $TargetDir "aider.env"
$BinDir = Join-Path $env:USERPROFILE ".local\bin"
$LauncherSrc = Join-Path $PSScriptRoot "lm-aider.cmd"
$LauncherDst = Join-Path $BinDir "lm-aider.cmd"

New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
New-Item -ItemType Directory -Force -Path $BinDir | Out-Null

$SourceEnv = Join-Path $RepoRoot ".env"
if (-not (Test-Path $SourceEnv)) {
    $SourceEnv = Join-Path $RepoRoot "config\user.env.example"
}

Copy-Item -Path $SourceEnv -Destination $TargetEnv -Force
Copy-Item -Path $LauncherSrc -Destination $LauncherDst -Force

Write-Host "Installed user config: $TargetEnv"
Write-Host "Installed launcher:    $LauncherDst"
Write-Host ""
Write-Host "From any project folder, run:"
Write-Host "  lm-aider"
Write-Host ""
Write-Host "Or use plain aider after copying the same file to %USERPROFILE%\.env"
Write-Host "Ensure $BinDir is on your PATH."
