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

function gmom{
    git fetch
    git merge origin/master
}