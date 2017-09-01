
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-7d93c81\src\posh-git.psd1'

function gst{
    git status
}

function gaa{
    git add -A
}

function gcmsg{
    git commit -m $args
}

function gco{
    git checkout $args
}

function pushup{
    git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

cd /
