$cname='eclipse-standard-luna'
#try {
  $package = 'eclipse-standard-luna-4.4'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  ### For BinRoot, use the following instead ###
  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package
  $zipUrl = 'http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/R/eclipse-standard-luna-R-win32.zip&r=1'
  $zip64Url = 'http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/R/eclipse-standard-luna-R-win32-x86_64.zip&r=1'

  Get-ChocolateyWebFile "$cname" "${binRoot}\eclipse.zip" "$zipUrl" "$zip64Url"
  
  $cmd7z = "${Env:ProgramFiles}\7-Zip\7z.exe"
  Start-Process -FilePath "$cmd7z" -Wait -WorkingDirectory "$binRoot" -ArgumentList "x -y ${binRoot}\eclipse.zip"
  Rename-Item "${binRoot}\eclipse" "$package" -Force
  Remove-Item "${binRoot}\eclipse.zip"

  $target = Join-Path $installDir 'eclipse.exe'
  Install-ChocolateyDesktopLink $target

#  Write-ChocolateySuccess "$cname"
#} catch {
#  Write-ChocolateyFailure "$cname" "$($_.Exception.Message)"
  #throw 
#}