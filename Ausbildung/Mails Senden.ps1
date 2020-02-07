$from = "Daniel <daniel.eichberger@fntsoftware.com>"
$to = "daniel.eichberger@fntsoftware.com"
$cred = Get-Credential "daniel.eichberger@fntsoftware.com"
$anz = 1

$srv = "smtp.office365.com"
$port = "587"
#smtp-mail.outlook.com

for ($i = 0; $i -ne $anz; $i++)
{
    $x = $i+1
    $sub = "Hi"
    $body = "Hi"
    Send-MailMessage -to $to -Subject $sub -Body $body -SmtpServer $srv -UseSsl -Port $port -From $from -Credential $cred
   # start-sleep -Seconds 1
} 