$ErrorActionPreference = 'SilentlyContinue'
Write-Host "   ,,_"
Write-Host '  o"  )~'
Write-Host "   ''''"
Write-Host Installing Snort IDS...

$INTLIST = C:\Snort\bin\snort.exe -W

foreach($IND in $INTLIST){
    Write-Host $IND
}
Write-Host
$INTERFACE = Read-Host -Prompt "Provide the interface number from the above list (eg, 1)"

C:\Snort\bin\nssm.exe install Snort C:\Snort\bin\snort.exe -i $INTERFACE -c C:\Snort\etc\snort.conf

Write-Host Installation complete
Write-Host Starting Service...
Start-Service -Name Snort
Write-Host Service running.
Write-Host Done.