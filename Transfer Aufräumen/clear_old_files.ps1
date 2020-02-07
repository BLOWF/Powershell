#$DatumVor14Tagen = (Get-Date).AddDays(-14) 
#$Source = "D:\"  
#start-transcript "$Source $(get-date -format MMddyyHHmmss).txt" 
#get-childitem "$Source " -recurse | where {$_.lastwritetime -lt $DatumVorTagen -and -not $_.psiscontainer} |% {remove-item $_.fullname -force -verbose}


$DatumVor30Tagen = (Get-Date).AddDays(-30)
$Source = „D:\“
#start-transcript „$Source $(get-date -format yyMMdd).txt“
get-childitem „$Source “ -recurse | where {$_.lastwritetime -lt $DatumVor30Tagen -and -not $_.psiscontainer} |% {remove-item $_.fullname -force -verbose -whatif}