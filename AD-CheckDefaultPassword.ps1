$defaultpw = "Eugen_0123"

Function Test-ADAuthentication 
{
    param($username,$password)
    (new-object directoryservices.directoryentry "",$username,$password).psbase.name -ne $null
}

$allUser = get-aduser -Filter * | Select-Object SamAccountName

foreach ($user in $allUser)
{
    if ((Test-ADAuthentication "ell.fnt.de\$($user.SamAccountName)" $defaultpw) -eq "True")
    {
        Write-Host "$($user.samaccountname) is using the default password!"
    }
}