<#
.SYNOPSIS
  Sync .agents/skills from this template to downstream projects.

.DESCRIPTION
  Copies every skill in <template>/.agents/skills into each target project
  (overwrites same-named files, never deletes project-specific skills).
  Optionally commits (only .agents/skills) and pushes.

.EXAMPLE
  .\scripts\sync-skills.ps1 -DryRun                 # preview only
  .\scripts\sync-skills.ps1                         # copy only
  .\scripts\sync-skills.ps1 -Commit -Push           # copy + commit + push
  .\scripts\sync-skills.ps1 -Projects MyApp -Commit # custom target(s)
#>
[CmdletBinding()]
param(
    # Project folder names (siblings of the template) or absolute paths.
    [string[]]$Projects = @('WebCrawler', 'BrianWebTemplate', 'BrianTripPlanning'),
    [switch]$Commit,
    [switch]$Push,
    [switch]$DryRun,
    [string]$Message = 'chore(ai): sync skills from AIAppTemplateGB'
)

$ErrorActionPreference = 'Stop'
$templateRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $templateRoot '.agents\skills'
$workspace = Split-Path -Parent $templateRoot

if (-not (Test-Path $source)) { throw "Source not found: $source" }
if ($Push -and -not $Commit) { $Commit = $true }

$results = foreach ($p in $Projects) {
    $root = if ([IO.Path]::IsPathRooted($p)) { $p } else { Join-Path $workspace $p }
    $name = Split-Path -Leaf $root
    $status = 'ok'

    if (-not (Test-Path $root)) {
        [pscustomobject]@{ Project = $name; Status = 'SKIP: folder not found' }
        continue
    }
    if ($DryRun) {
        [pscustomobject]@{ Project = $name; Status = "DRY-RUN: would sync to $root\.agents\skills" }
        continue
    }

    try {
        $dest = Join-Path $root '.agents\skills'
        New-Item -ItemType Directory -Path $dest -Force | Out-Null
        Copy-Item -Path (Join-Path $source '*') -Destination $dest -Recurse -Force

        if ($Commit) {
            if (-not (Test-Path (Join-Path $root '.git'))) {
                $status = 'copied (not a git repo, commit skipped)'
            }
            else {
                git -C $root add -- .agents/skills 2>$null
                git -C $root diff --cached --quiet -- .agents/skills
                if ($LASTEXITCODE -eq 0) {
                    $status = 'up-to-date (no changes)'
                }
                else {
                    # Path-limited commit: never sweeps up unrelated staged files.
                    git -C $root commit -m $Message -- .agents/skills | Out-Null
                    if ($LASTEXITCODE -ne 0) { throw 'git commit failed' }
                    $status = 'committed'
                    if ($Push) {
                        git -C $root push 2>&1 | Out-Null
                        if ($LASTEXITCODE -ne 0) { throw 'git push failed' }
                        $status = 'committed + pushed'
                    }
                }
            }
        }
        else {
            $status = 'copied'
        }
    }
    catch {
        $status = "ERROR: $($_.Exception.Message)"
    }
    [pscustomobject]@{ Project = $name; Status = $status }
}

$results | Format-Table -AutoSize
