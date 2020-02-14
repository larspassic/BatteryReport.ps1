#Lock in start time
$start = Get-Date
$filedate = Get-Date -Format FileDateTime
$reportname = "Battery Report $filedate"

#Log start time to the report file
Write-Host "Starting battery life test at $start"
"Starting battery life test at $start" | Out-File "$reportname.txt"

#Begin the loop
Write-Host "Waiting for battery to drain. This will automatically close when the battery reaches 6%..."
While ((Get-WmiObject win32_battery).estimatedChargeRemaining -gt 6){Sleep 60}

#Record the end time
$end=Get-Date
Write-Host "Ending battery life test at $end"
"Ending battery life test at $end" | Out-File "$reportname.txt" -Append
$result=($end - $start).TotalSeconds

#Log the result to the report file
Write-Host "Battery test duration: $result seconds"
"Battery test duration: $result" | Out-File "$reportname.txt" -Append