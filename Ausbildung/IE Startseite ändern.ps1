#Startseite auslesen
$path = 'HKCU:\Software\Microsoft\Internet Explorer\Main\'
$name = 'start page'
(Get-Itemproperty -Path $path -Name $name).$name

#Starseite ändern
$path = 'HKCU:\Software\Microsoft\Internet Explorer\Main\'
$name = 'start page'
$value = 'www.ismycomputeron.com'
Set-Itemproperty -Path $path -Name $name -Value $value

#baconslizzing.com setzen
New-PSSession -ComputerName nbell02970
Set-Itemproperty -Path 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -Name 'start page' -Value 'www.ismycomputeron.com'

start iexplore
