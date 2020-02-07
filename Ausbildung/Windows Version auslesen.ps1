$winver = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name ReleaseID | Select-Object ReleaseID
if ($winver -notlike "*1803*" -and "*1809*")
{
   [System.Windows.Forms.MessageBox]::Show("Bitte Windows Updates installieren","Windows Version veraltet!",0) 
}
