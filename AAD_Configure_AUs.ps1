# Connect to Azure AD
$credential = Get-Credential daniel.eichberger@fntsoftware.com
Connect-AzureAD -Credential $credential
# Set variables
$adminname = 'deichberger2@fntsoftware.com'
$PartnerAU = Get-AzureADAdministrativeUnit | Where-Object{$_.DisplayName -eq 'AU_PartnerUser'}
$adminrole = "Groups Administrator"
# Get the specifed adminrole
$admins = Get-AzureADDirectoryRole
foreach($i in $admins) {
    if($i.DisplayName -eq "$adminrole") {
        $uaAdmin = $i
    }
}
#Add User as admin to the AU
$testadmin = Get-AzureADUser -Filter "UserPrincipalName eq '$adminname'"
$uaRoleMemberInfo = New-Object -TypeName Microsoft.Open.AzureAD.Model.RoleMemberInfo -Property @{ ObjectId =  $testadmin.ObjectId }
Add-AzureADScopedRoleMembership -RoleObjectId $uaAdmin.ObjectId -ObjectId $PartnerAU.ObjectId -RoleMemberInfo $uaRoleMemberInfo

#Admins der AUs auslesen
Get-AzureADScopedRoleMembership -ObjectId $PartnerAU.ObjectId | fl *




#$user = Get-AzureADUser -All $true | Where-Object {$_.UserPrincipalName -eq 'email@fntsoftware.com'}
$aadgroups = Get-AzureADGroup -All $true
$i = 0
foreach($group in $aadgroups){
    $i++
    if($i -lt 600){
        
    }   
    if($i -gt 600){
        Write-Output $i $group
        #Add-AzureADGroupMember -ObjectId $group.ObjectID -RefObjectId $user.ObjectID
    } 

    
}