# Session zu Exchange Server aufbauen
Set-ExecutionPolicy RemoteSigned

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

Get-MailboxCalendarConfiguration -Identity daniel.eichberger | Format-List
Get-MailboxCalendarFolder -Identity "daniel.eichberger:\Kalender"


# EWS
#Import-Module -Name “C:\Program Files\Microsoft\Exchange\Web Services\2.2\Microsoft.Exchange.WebServices.dll"
$dllpath = “C:\Program Files\Microsoft\Exchange\Web Services\2.2\Microsoft.Exchange.WebServices.dll"
[void][Reflection.Assembly]::LoadFile($dllpath)
$exchService = New-Object Microsoft.Exchange.WebServices.Data.ExchangeService([Microsoft.Exchange.WebServices.Data.ExchangeVersion]::Exchange2010_SP1)
$exchService.UseDefaultCredentials = $true 




$exchService.RedirectionUrlValidationCallback = {$true};
 
# den eben selbst erstellten Datentyp in dem ServicePointManager veröffentlichen
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy


$uri=[system.URI] "https://autodiscover-s.outlook.com/autodiscover/autodiscover.svc"
$exchService.Url = $uri



# mit dem Service automatisch den Exchange Server finden, der für die Mailbox zuständig ist.
$exchService.AutodiscoverUrl("daniel.eichberger@fntsoftware.com")




$Calendar = [Microsoft.Exchange.WebServices.Data.Folder]::Bind($exchservice,[Microsoft.Exchange.WebServices.Data.WellKnownFolderName]::Calendar)