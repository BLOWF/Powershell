
# Gesperrte Accounts ausgeben 
search-ADAccount -LockedOut | Sort-Object LastLogonDate | Select-Object Name, LastLogonDate 
# Gesperrte Accounts exportieren 
search-ADAccount -LockedOut | Sort-Object LastLogonDate | Select-Object Name, LastLogonDate >C:\Users\daniel.eichberger\Desktop\lul.txt




$test = $false

$lockedUser = Search-ADAccount -LockedOut | Sort-Object LastLogonDate | Select-Object Name, LastLogonDate

foreach ($user in $lockedUser)
{
    if($user.Name = Career)
    {
       $test =$true
       # Search-ADAccount | Name = $user.Name
    }
}

# Inlusive BadPwdCount
$allUser = get-aduser -Filter {Enabled -eq $true} -Properties SamAccountName, badPwdCount
Write-Host "badPwdCount   SamAccountName"
foreach ($user in $allUser)
{
    if($user.badPwdCount -gt 2)
    {
        Write-Host "$($user.badPwdCount)             $($user.SamAccountName)"
    }
}

