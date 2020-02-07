Get-Date

$h = (Get-Date).Hour
$min = (Get-Date).Minute
$time = "Es ist $min Minuten nach $h Uhr."
$time

"Uhrzeit: " + (Get-Date).ToShortTimeString()
"Datum:   " + (Get-Date).ToShortDateString()
