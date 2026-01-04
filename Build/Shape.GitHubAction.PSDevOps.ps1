#requires -Module PSDevOps
Import-BuildStep -SourcePath (
    Join-Path $PSScriptRoot 'GitHub'
) -BuildSystem GitHubAction

$PSScriptRoot | Split-Path | Push-Location

New-GitHubAction -Name "NewShape" -Description 'Shape Generator' -Action ShapeAction -Icon chevron-right -OutputPath .\action.yml

Pop-Location