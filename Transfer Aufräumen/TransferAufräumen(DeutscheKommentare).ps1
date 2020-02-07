# Pfad des temporären Ordners
$temppath = "$env:temp\robodel"
# Pfad des zu bearbeitenden Laufwerks/Ordners
$targetpath = "D:\"

# Dateien auf die seit über 14 Tagen nicht zugegriffen wurde mit Robocopy in das Temp-Verzeichnis verschieben. Leere Ordner werden auch verschoben
robocopy.exe $targetpath $temppath /E /MOVE  /MINLAD:15 /R:1 /W:1       
# Ordner im Temp-Verzeichnis mit den alten Dateien löschen
remove-item -path $temppath -Force -Recurse -ErrorAction SilentlyContinue     

# Laden des Moduls ActiveDirectory
Import-Module ActiveDirectory
# Liste mit allen Gruppen der OU FNT, in denen normale Domänen-User sind erstellen
$OUSTructure = Get-ADOrganizationalUnit -SearchBase "OU=FNT,DC=ell,DC=fnt,DC=de" -Filter {name -notlike "*global*" -and name -notlike "FNT.EU"} -searchscope 1       
foreach ($group in $OUStructure) 
{
    # Liste mit allen aktiven Usern der Gruppe erstellen
    $namelist = get-aduser -filter {(Enabled -eq $true) -and (ObjectClass -eq "user")  -and (SamAccountName -notlike "ad.test-qao") -and (SamAccountName -notlike "be_*")} -SearchBase $group.DistinguishedName -Properties Givenname,sn        
    foreach ($name in $namelist) 
    {
         # Der Variable "Path" wird der Pfad für den Ordner des jeweiligen User zugewiesen
        $userpath = $targetpath + ($name.UserPrincipalName.Replace("@fntsoftware.com", "")).ToLower()
        if ((Test-Path -Path $userpath) -eq $false)       
        {
            # Wenn der Ordner noch nicht existiert wird ein Ordner erstellt
            New-Item -Path $userpath -ItemType Directory       
        }
    }
}
