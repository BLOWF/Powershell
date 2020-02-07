# Gesperrte Accounts exportieren 
Get-Date >C:\inetpub\wwwroot\index.html
search-ADAccount -LockedOut | Sort-Object -Descending LastLogonDate |Select-Object -First 10 | select Name, LastLogonDate | ConvertTo-Html >C:\inetpub\wwwroot\index.html