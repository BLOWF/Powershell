$d = (Get-Date).addDays(-365)
Get-ADComputer -Property LastLogonDate -Filter {lastLogonDate -lt $d} | select DNSHostName, LastLogonDate | Sort-Object LastLogonDate #>C:\Users\daniel.eichberger\Desktop\lastLogon.txt
