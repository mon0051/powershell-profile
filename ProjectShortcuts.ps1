. "$env:USERPROFILE\Documents\WindowsPowershell\Variables.ps1"
. "$env:MY_POWERSHELL_HOME\KenticoScripts.ps1"
. "$env:MY_POWERSHELL_HOME\GitShortcuts.ps1"
. "$env:MY_POWERSHELL_HOME\SqlScripts.ps1"
. "$env:MY_POWERSHELL_HOME\VisualStudio.ps1"

function LoadAllProjectScripts{
    $Path = "$env:MY_POWERSHELL_HOME\ProjectScripts"
    Get-ChildItem -Path $Path -Filter *.ps1 |ForEach-Object { . $_.FullName }
}

. LoadAllProjectScripts

