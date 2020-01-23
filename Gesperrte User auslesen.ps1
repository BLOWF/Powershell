
# Gesperrte Accounts ausgeben 
search-ADAccount -LockedOut | Sort-Object LastLogonDate | select Name, LastLogonDate 
# Gesperrte Accounts exportieren 
search-ADAccount -LockedOut | Sort-Object LastLogonDate | select Name, LastLogonDate >C:\Users\daniel.eichberger\Desktop\lul.txt




$test = $false

$lockedUser = Search-ADAccount -LockedOut | Sort-Object LastLogonDate | select Name, LastLogonDate

foreach ($user in $lockedUser)
{
    if($user.Name = Career)
    {
       $test =$true
       # Search-ADAccount | Name = $user.Name
    }
}