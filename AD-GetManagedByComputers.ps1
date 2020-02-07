$nameofuser = "Daniel Eichberger"
$userObject = (Get-ADUser -Filter "Name -like '$nameofuser'")
$userDistName = ($userObject.DistinguishedName) 
[array]$Computerlist = $null
[array]$Computerlist = Get-ADComputer -Filter "ManagedBy -eq '$userDistName'" 
$Computerlist | select Name, DNSHostName, DistinguishedName | Format-List
$anzcomp = $Computerlist.count
Write-Output "$nameofuser ist bei $anzcomp Rechner(n) als ManagedBy eingetragen"

#Get-ADComputer -Filter "Name -like 'nbell03000'" -Properties *