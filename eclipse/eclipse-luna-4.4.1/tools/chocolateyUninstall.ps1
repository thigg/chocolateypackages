#try {
  $cname = "eclipse-standard-luna"
  $package = 'eclipse-standard-luna-4.4'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  ### For BinRoot, use the following instead ###
  $binRoot = "$env:systemdrive\"
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package
  Remove-Item -Force -Recurse $installDir

  Write-ChocolateySuccess "$cname"
#} catch {
#  Write-ChocolateyFailure "$cname" "$($_.Exception.Message)"
  #throw 
#}