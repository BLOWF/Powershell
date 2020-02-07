
foreach ($group in $OUStructure) 
{
    $namelist = get-aduser -filter {(Enabled -eq $true) -and (ObjectClass -eq "user")} -SearchBase $group.DistinguishedName | select Name
    foreach ($name in $namelist) 
    {
        $Path = "D:\"+ $name.Name
        New-Item -Path $Path -ItemType directory
    }
}
pause

