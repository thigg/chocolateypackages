$url = 'http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/R/eclipse-java-luna-R-win32.zip&r=1&protocol=http'
$url64 = 'http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/R/eclipse-java-luna-R-win32-x86_64.zip&r=1&protocol=http'
$packageName = 'eclipse-java-luna' 
Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "$url64"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$target = Join-Path $toolsDir "eclipse\eclipse.exe"
Install-ChocolateyDesktopLink $target