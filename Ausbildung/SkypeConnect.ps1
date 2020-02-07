$userCredential = Get-Credential
$sfbSession = New-CsOnlineSession -Credential $userCredential
Import-PSSession $sfbSession

Get-CsExternalAccessPolicy
Set-CsAllowedDomainre