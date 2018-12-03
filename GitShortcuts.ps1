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

function gitIsClean(){
    if(git status --porcelain){
        return 0
    }else{
        return 1
    }
}

function cleanMergedBranches{
    git branch --merged | ForEach-Object{$_.trim()} | Where-Object{$_ -notmatch 'develop' -and $_ -notmatch 'master'} | ForEach-Object{git branch -d $_}
}

function gcmb{
    cleanMergedBranches
}

function gnb{
    git checkout master
    git checkout -b $args
}

function NewBranch{
    gnb $args
}

function Git-BranchExists($branchName){
    $branch = git branch | select-string $branchName
    if($branch){
        return $true
    }
    else{
        return $false
    }
}

function gbe($branchName){
    return Git-BranchExists $branchName
}

function co($branchName){
    $fixBranch = gbe $branchName
    
    if($fixBranch){
        $fullBranch = git branch | select-string $branchName
        $fullBranch = $fullBranch.Line.Trim()
        git checkout $fullBranch
    }else{
        Write-Warning -Message "Could not find any branch with $branchName included"
    }
}