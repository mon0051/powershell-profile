function RebuildVS2017($sln, $project){
    & "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe" $project /Rebuild
}