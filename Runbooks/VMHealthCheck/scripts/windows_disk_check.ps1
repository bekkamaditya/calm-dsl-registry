# Check C: drive usage and print percentage
$drive = Get-PSDrive C -ErrorAction SilentlyContinue
if (-not $drive) { Write-Output "Disk usage: N/A"; exit 1 }
$total = $drive.Used + $drive.Free
if ($total -eq 0) { Write-Output "Disk usage: 0%" } else {
  $pctUsed = [math]::Round(100 * $drive.Used / $total, 2)
  Write-Output "Disk usage: $pctUsed%"
}
