$CSVValues = Import-Csv -Path "C:\Users\daniel.eichberger\Documents\.Eigene Dokumente\Power Shell\export.csv" -Delimiter ","
foreach($SingelCSVValue in $CSVValues)
{
    $SingelCSVValue.Name 
    <#
    $Path = "D:\"+ $SingelCSVValue.Name 
    New-Item -Path $Path -ItemType directory
    #>
}

