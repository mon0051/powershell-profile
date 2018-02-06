
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-7d93c81\src\posh-git.psd1'
Set-PSReadlineOption -BellStyle None

. "$env:USERPROFILE\Documents\WindowsPowershell\Variables.ps1"
. "$env:MY_POWERSHELL_HOME\GitShortcuts.ps1"
. "$env:MY_POWERSHELL_HOME\KenticoScripts.ps1"
. "$env:MY_POWERSHELL_HOME\NvmFunctions.ps1"

function hc{
    cd $env:GIT_PROJECTS"\health-canada-reporting-gen2"
}

function hcf{
    cd $env:GIT_PROJECTS"\health-canada-reporting-gen2\src\RBH.HealthCanadaGen2.FrontEnd"
}

function ia{
    cd $env:GIT_PROJECTS"\investormax"
}

function kw{
    cd $env:GIT_PROJECTS"\kiandra-website-2018"
}

function dionic {
    $PWD = pwd
    docker run -ti --rm --publish 8100:8100 -p 35729:35729 --privileged --volume 'c:/Git/projects/gym-app:/myApp:rw' "pam79/ionic-3-framework" ionic $args
}

function boomdocks {
    $RUNNING_CONTAINERS = docker ps -q
    docker kill $RUNNING_CONTAINERS
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function kwmerge{
    kentico-merge "C:\Git\projects\kiandra-website-2018\Kentico\CMS"
}

function kmom{
    gmom
    kwmerge
}