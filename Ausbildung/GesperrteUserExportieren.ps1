# Gesperrte Accounts exportieren 
Get-Date >C:\Users\daniel.eichberger\Desktop\lul.txt
search-ADAccount -LockedOut | Sort-Object LastLogonDate | select Name, LastLogonDate >>C:\Users\daniel.eichberger\Desktop\lul.txt
