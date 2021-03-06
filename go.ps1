# Get pictures of Hobart and surrounds and cycle them for wallpapers

$workingDirectory = Join-Path $env:USERPROFILE ".hobart-wallpaper"

if (-not (Test-Path $workingDirectory)){
$wd = new-item $workingDirectory -ItemType Directory
$wd.Attributes = "hidden"
$wd = $null
"Created Working Directory: '$workingDirectory"
}

Function Set-WallPaper($Value){
write-host "Setting wallpaper to $value"
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
rundll32.exe user32.dll, UpdatePerUserSystemParameters

}

Function Get-RoseBayKunanyi {
  Invoke-WebRequest -uri "http://www.rosebay.tas.school/wp-content/uploads/webcampic-large.jpg" -OutFile $workingDirectory/rbk.jpg
}

Function Get-BarnBougle {
  $baseUri= "http://blob.anglersalliance.org.au/camera-uploads/LF1/"
  $imageFolder = get-date -f "yyyy-MM-dd"
  $imageName = "image" + (get-date -f "yy-MM-dd") + "10"

}



while ($true){
  Get-RoseBayKunanyi
  Set-WallPaper $workingDirectory\rbk.jpg
  start-sleep -s 900
}
