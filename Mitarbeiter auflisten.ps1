#Get-Aduser -Filter * -Properties SAMAccountName,Title | SELECT Name, Title | Measure-Object -Line
#Get-Aduser -Filter * -Properties SAMAccountName,Title | SELECT SAMAccountName,Title | Format-Table | Out-File "C:\Users\daniel.eichberger\Documents\_EigeneDokumente\output.csv"

$OUSTructure = Get-ADOrganizationalUnit -SearchBase "OU=FNT,DC=ell,DC=fnt,DC=de" -Filter {name -notlike "*global*" -and name -notlike "FNT.EU"} -searchscope 1  
foreach ($group in $OUStructure) 
{
    # Lists all active Users of each group
    $groupname = $group.Name
    get-aduser -filter {(Enabled -eq $true) -and (ObjectClass -eq "user")  -and (SamAccountName -notlike "ad.test-qao") -and (SamAccountName -notlike "be_*")} -SearchBase $group.DistinguishedName -Properties * | SELECT Name, Title | export-csv -Delimiter `t -Encoding UTF8 -Path "C:\Users\daniel.eichberger\Documents\_EigeneDokumente\$groupname.csv"
}
