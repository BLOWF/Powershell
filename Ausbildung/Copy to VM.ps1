# Gastdienstschnittstelle aktivieren
Enable-VMIntegrationService -VMName "<Name-der-VM>" -Name "Gastdienstschnittstelle"

# Auf srvellhy01 ausführen
Copy-VMFile "Baramundi Winsrv 2016" -SourcePath C:\NetPhone\NetPhoneClientGerman64.msi -DestinationPath "C:\NetPhoneClientGerman64.msi" -FileSource Host -ComputerName srvellhy01

$vmname = "Baramundi Winsrv 2016"
$sourcepath = "C:\NetPhone\NetPhoneClientGerman64.msi"
$despath = "C:\NetPhoneClientGerman64.msi"
$hypervisor = "srvellhy01"

Enter-PSSession $hypervisor -Credential adm-deichberger 

Invoke-Command -ComputerName $hypervisor -ScriptBlock {ipconfig}

Copy-VMFile $vmname -SourcePath $sourcepath -DestinationPath $despath -FileSource Host -ComputerName $hypervisor