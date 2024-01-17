# https://github.com/naderi/scoop-bucket/blob/master/scripts/jetbrain-portabler.ps1
param([Parameter(Mandatory)][String] $Directory, [Parameter(Mandatory)][String] $Persist)

$properties = Join-Path 'IDE' 'bin\idea.properties'

if (-not (Join-Path $Persist $properties | Test-Path)) {
    Write-Host 'File' $properties 'does not exists. Creating.' -ForegroundColor Yellow

    $fullProp = Join-path $Directory $properties
    $currentForward = (Split-Path $Directory | Join-Path -ChildPath 'current') -replace '\\', '/'
    $profileDir = "$currentForward/profile"

    $CONT = Get-Content $fullProp
    # Set portable configuration
    $CONT = $CONT -replace '^#\s*(idea.config.path=).*$', "`$1$profileDir/config"
    $CONT = $CONT -replace '^#\s*(idea.system.path=).*$', "`$1$profileDir/system"
    $CONT = $CONT -replace '^#\s*(idea.plugins.path=).*$', '$1${idea.config.path}/plugins'
    $CONT = $CONT -replace '^#\s*(idea.log.path=).*$', '$1${idea.system.path}/log'

    Set-Content $fullProp $CONT -Encoding Ascii -Force
}