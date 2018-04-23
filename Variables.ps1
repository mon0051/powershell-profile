$env:GITHUB_HOST = "git.kiandra.com.au"
$env:GIT_PROJECTS = "C:\Git\projects"
$env:MY_POWERSHELL_HOME = "$env:USERPROFILE\Documents\WindowsPowershell"
$env:POSHGIT_SOURCE_CONTAINER_DIR = "C:\tools\poshgit"
$env:POSHGIT_REPO_FOLDER_NAME = "dahlbyk-posh-git-7d93c81"
$env:POSHGIT_REPO = "$env:POSHGIT_SOURCE_CONTAINER_DIR\$env:POSHGIT_REPO_FOLDER_NAME"
$env:POSHGIT_MODULE_FILE = "$env:POSHGIT_REPO\src\posh-git.psd1"
Set-Variable -Name 'psh' -Value $env:MY_POWERSHELL_HOME
