$namelist = get-aduser -filter {(Enabled -eq $true) -and (ObjectClass -eq "user")} -SearchBase "OU=FNT, DC=ell, DC=fnt, DC=de" | select Name

foreach ($name in $namelist) 
{
    $Path = "D:\"+ $name.Name
    New-Item -Path $Path -ItemType directory
}

