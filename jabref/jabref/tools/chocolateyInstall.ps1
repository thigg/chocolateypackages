$url = 'http://downloads.sourceforge.net/project/jabref/jabref/2.10/JabRef-2.10-setup.exe?r=&ts=1416053772&use_mirror=heanet'
$validExitCodes = @(0) 
Install-ChocolateyPackage "JabRef" "EXE" "/S" "$url"  -validExitCodes $validExitCodes