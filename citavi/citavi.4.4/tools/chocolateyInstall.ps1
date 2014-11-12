$packageName = 'citavi' 
$installerType = 'MSI' 
$url = 'http://citavi.com/msi-setup'
$silentArgs = '/quiet'
$validExitCodes = @(0) 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes