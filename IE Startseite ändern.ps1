#Startseite auslesen
$path = 'HKCU:\Software\Microsoft\Internet Explorer\Main\'
$name = 'start page'

(Get-Itemproperty -Path $path -Name $name).$name


#Starseite ändern
$path = 'HKCU:\Software\Microsoft\Internet Explorer\Main\'
$name = 'start page'
$value = 'http://www.google.com'

Set-Itemproperty -Path $path -Name $name -Value $value


#baconslizzing.com setzen
Set-Itemproperty -Path 'HKCU:\Software\Microsoft\Internet Explorer\Main\' -Name 'start page' -Value 'http://www.baconsizzling.com/'
start iexplore