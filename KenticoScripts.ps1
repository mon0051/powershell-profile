function AppIsOffline($Path){
    return Test-Path "$Path\App_Offline.htm"
}

function TakeApplicationOfflineIfRequired($Path){
    if (!(AppIsOffline))
    {
        "<html><head></head><body>Continuous integration restore in progress...</body></html>" > "$Path\App_Offline.htm"
        return $true
    }
    return $false
}

function RunKenticoContinuousIntegrationTool($Path){
    & "$Path\bin\ContinuousIntegration.exe" -r -s
}

function StopExternalKenticoServices($Path){
     $servicesStopped =  @(Get-WmiObject win32_service `
        | ?{ $_.Name -Like "KenticoCMS*" -And $_.State -Eq "Running" -And $_.PathName -like '*'+ $Path +'"' } `
        | % {
            Stop-Service $_.Name
            return $_.Name
        })
    return $servicesStopped
}

function BringApplicationOnlineIfRequired($Path, $thisScriptTookApplicationOffline){
    if ($thisScriptTookApplicationOffline)
    {
        Remove-Item "$Path\App_Offline.htm"
    }
}

function StartKenticoServices($ServicesStoped) {
    $ServicesStoped | % { Start-Service $_ }
}

function Merge-KenticoCI($Path){
    $servicesStopped = StopExternalKenticoServices $Path
    $thisScriptTookApplicationOffline = TakeApplicationOfflineIfRequired $Path
    RunKenticoContinuousIntegrationTool $Path
    BringApplicationOnlineIfRequired $Path $thisScriptTookApplicationOffline
    StartKenticoServices $servicesStopped
    Clear-Variable servicesStoped, thisScriptTookApplicationOffline
}