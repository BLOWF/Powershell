robocopy.exe D:\ $env:temp\robodel /E /MOVE  /MINLAD:14 /R:1 /W:1
remove-item -path "$env:temp\robodel" -Force -Recurse -ErrorAction SilentlyContinue         

$OUSTructure = Get-ADOrganizationalUnit -SearchBase "OU=FNT,DC=ell,DC=fnt,DC=de" -Filter {name -notlike "*global*" -and name -notlike "FNT.EU"} -searchscope 1 
foreach ($group in $OUStructure) 
{
    $namelist = get-aduser -filter {(Enabled -eq $true) -and (ObjectClass -eq "user")} -SearchBase $group.DistinguishedName | select SamAccountName
    foreach ($name in $namelist) 
    {
        $Path = "D:\"+ $name.SamAccountName
        if ((Test-Path -Path $Path) -eq $false)
        {
            New-Item -Path $Path -ItemType Directory               
        }
    }
}

