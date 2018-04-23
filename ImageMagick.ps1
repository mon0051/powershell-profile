function img-resize($image, $size){
    $absPath = [io.path]::GetFullPath($image)
    $filenameNoExt = [io.path]::GetFileNameWithoutExtension($absPath)
    $ext = [io.path]::GetExtension($absPath)
    $newName = "$filenameNoExt"+"$size"+"$ext"
    magick $image -resize $size $newName
}