
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-7d93c81\src\posh-git.psd1'
Set-PSReadlineOption -BellStyle None

. "$env:USERPROFILE\Documents\WindowsPowershell\Variables.ps1"
. "$env:MY_POWERSHELL_HOME\GitShortcuts.ps1"
. "$env:MY_POWERSHELL_HOME\KenticoScripts.ps1"
. "$env:MY_POWERSHELL_HOME\NvmFunctions.ps1"
. "$env:MY_POWERSHELL_HOME\ProjectShortcuts.ps1"

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function powerhome{
    cd $env:MY_POWERSHELL_HOME
}

function rebash(){
  . $profile
}