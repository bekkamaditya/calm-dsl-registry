# Check RAM and CPU utilisation and print percentages
$os = Get-CimInstance Win32_OperatingSystem
$totalMemKB = $os.TotalVisibleMemorySize
$freeMemKB = $os.FreePhysicalMemory
$usedMemPct = if ($totalMemKB -gt 0) { [math]::Round(100 * ($totalMemKB - $freeMemKB) / $totalMemKB, 2) } else { 0 }
Write-Output "RAM usage: $usedMemPct%"
$cpu = Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average
$cpuPct = if ($cpu.Average) { [math]::Round($cpu.Average, 2) } else { 0 }
Write-Output "CPU usage: $cpuPct%"
