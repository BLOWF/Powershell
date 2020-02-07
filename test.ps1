$DaysInactive = 180 
$time = (Get-Date).Adddays(-($DaysInactive))
 
# Get all AD computers with lastLogonTimestamp less than our time
Get-ADComputer -Filter {LastLogonTimeStamp -lt $time -and OperatingSystem -like "Windows 10 Pro" -and Enabled -eq $true} -Properties LastLogonTimeStamp, OperatingSystem, description |

# Output hostname and lastLogonTimestamp into CSV
select-object Name,OperatingSystem ,description,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp)}} #| export-csv 'C:\temp\Win10_Inactive_Computer.csv' -notypeinformation -delimiter ";"





