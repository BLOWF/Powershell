# Path of the temporary folder
$temppath = "$env:temp\robodel"
# Path of the Drive/Folder in which the Script runs
$targetpath = "D:\"

# Move Data which haven't been accessed for more then 14 days with robocopy in the temporary folder. Empty folders will be  moved, too.
robocopy.exe $targetpath $temppath /E /MOVE  /MINLAD:15 /R:1 /W:1
# Delete the temporary folder with the old data        
remove-item -path $temppath -Force -Recurse -ErrorAction SilentlyContinue     

# Load Active Directory moudule
Import-Module ActiveDirectory

# Lists all groups of the OU "FNT" with normal Domain-Users                                            
$OUSTructure = Get-ADOrganizationalUnit -SearchBase "OU=FNT,DC=ell,DC=fnt,DC=de" -Filter {name -notlike "*global*" -and name -notlike "FNT.EU"} -searchscope 1       
foreach ($group in $OUStructure) 
{
    # Lists all active Users of each group
    $namelist = get-aduser -filter {(Enabled -eq $true) -and (ObjectClass -eq "user")  -and (SamAccountName -notlike "ad.test-qao") -and (SamAccountName -notlike "be_*")} -SearchBase $group.DistinguishedName -Properties Givenname,sn        
    foreach ($name in $namelist) 
    {
        # The variable "userpath" gets the path of the respective user
        $userpath = $targetpath + ($name.UserPrincipalName.Replace("@fntsoftware.com", "")).ToLower()
        if ((Test-Path -Path $userpath) -eq $false)       
        {
            # Creates a folder if it doesn't exist
            New-Item -Path $userpath -ItemType Directory       
        }
    }
}

