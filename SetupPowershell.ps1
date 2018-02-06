. "$env:USERPROFILE\Documents\WindowsPowershell\Variables.ps1"

if (-Not (Test-Path($env:POSHGIT_SOURCE_CONTAINER_DIR))){
    mkdir $env:POSHGIT_SOURCE_CONTAINER_DIR
}

if (-Not (Test-Path($env:POSHGIT_REPO))){
    Push-Location $env:POSHGIT_SOURCE_CONTAINER_DIR
    git clone https://github.com/dahlbyk/posh-git.git $env:POSHGIT_REPO_FOLDER_NAME
    Pop-Location
}

