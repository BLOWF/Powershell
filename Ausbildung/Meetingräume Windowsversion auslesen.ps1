$meetingrooms = get-adcomputer -Filter * -SearchBase "OU=Meeting Rooms,OU=Server,DC=ell,DC=fnt,DC=de" | Select-Object -ExpandProperty Name
foreach ($room in $meetingrooms){
Invoke-Command -ScriptBlock { Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name ReleaseID | Select-Object ReleaseID } -ComputerName $room
}
#write-host 