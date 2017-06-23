function rotate($LOG){
    Write-Host Stopping Snort...
    Stop-Service -Name Snort
    foreach($ITEM in $LOG){
        del C:\Snort\log\$ITEM
        write-host $ITEM deleted... 
    }
    Write-Host Starting Snort...
    Start-Service -Name Snort
}

$ROTATELOG = @()
foreach($LOG in Get-ChildItem C:\Snort\log){
    if($LOG -like "*.ids"){
        if($LOG.Length -gt 3GB){
            $ROTATELog += $LOG
            <#Write-Host $LOG#>
        }
    }elseif($LOG -like "*.log*"){
        if($LOG.Length -gt 3GB){
            $ROTATELog += $LOG
            <#Write-Host $LOG#>
        }
    }
}
if($ROTATELOG -gt 0){
    rotate($ROTATELOG)
}
Write-Host Complete