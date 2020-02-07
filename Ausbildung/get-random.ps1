#allgemein
function Get-RandomCharacters($length, $characters) 
{ 
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length } 
    $private:ofs="" 
    return [String]$characters[$random]
}

#random Zahl
$Wuerfel = New-Object System.Random
$randomWuerfel= $Wuerfel.next(1,100)
$randomWuerfel


#random Buchstabe
for($i=0; $i -eq 8; $i++)
{
    $ZufaelligerBuchstabe = New-Object System.Random
    $randomChar = [char]$ZufaelligerBuchstabe.next(65,90)
    $randomChar
}


#random aus Array
Function ZufaelligesEssen
{

    $RandomRestaurant = @('Chinesen';'Döner','Kaufschland','Metzger','Megges','Burger King')
    $Date  = Get-Date
    $Aussage = "$($Date.DayOfWeek), $($Date.Day).$($Date.Month).$($Date.Year)`nHeute essen wir beim $($RandomRestaurant.Item($(Get-Random -Maximum $RandomRestaurant.Count))).`n`nPasst's ned?"
    $Result =[System.Windows.Forms.MessageBox]::Show($Aussage,"Mahlzeit",5,[System.Windows.Forms.MessageBoxIcon]::Asterisk) 

    If ($Result -eq "Retry")
    {
        ZufaelligesEssen
    }
}

ZufaelligesEssen