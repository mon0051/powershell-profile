Function Get-FolderMetaData($folder)
{ 
    $attributeIndex = 0 
    $objShell = New-Object -ComObject Shell.Application 
    $objFolder = $objShell.namespace($folder) 
    $FolderMetaData = @()
    foreach ($File in $objFolder.items()) 
    {  
        $FileMetaData = New-Object PSOBJECT 
        for ($attributeIndex ; $attributeIndex  -le 266; $attributeIndex++) 
        {  
            if($objFolder.getDetailsOf($File, $attributeIndex)) 
            { 
                $hash += @{$($objFolder.getDetailsOf($objFolder.items, $attributeIndex)) = $($objFolder.getDetailsOf($File, $attributeIndex)) } 
                $FileMetaData | Add-Member $hash 
                $hash.clear()  
            } #end if 
        } #end for

        $attributeIndex=0 
        $FolderMetaData += $FileMetaData 
    } #end foreach $file

    return $FolderMetaData
}

function Get-FileMetaData($file){
    $folder = [io.path]::GetDirectoryName($file)
    $filename = [io.path]::GetFileName($file)
    $items = Get-FolderMetaData $folder

    foreach($item in $items){
        if($item.Name -eq $filename){
            return $item; 
        }
    }

    Write-Host "File Not Found"
}