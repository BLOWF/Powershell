[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$objForm = New-Object System.Windows.Forms.Form
$objForm.StartPosition = "CenterScreen"
$objForm.Size = New-Object System.Drawing.Size(800,300)
$objForm.Text = "Titel"

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(100,60)
$objLabel.Size = New-Object System.Drawing.Size(1000,20)
$objLabel.Text = "Bitte geben sie einen Text ein:"
$objForm.Controls.Add($objLabel)

$objTextBox = New-Object System.Windows.Forms.TextBox
$objTextBox.Location = New-Object System.Drawing.Size(300,20)
$objTextBox.Size = New-Object System.Drawing.Size(200,40)
$objForm.Controls.Add($objTextBox)

$objCombobox = New-Object System.Windows.Forms.Combobox
# Die nächsten beiden Zeilen legen die Position und die Größe des Buttons fest
$objCombobox.Location = New-Object System.Drawing.Size(300,80)
$objCombobox.Size = New-Object System.Drawing.Size(200,20)
$objCombobox.Height = 70
$objForm.Controls.Add($objCombobox)
$objForm.Topmost = $True
$objCombobox.Add_SelectedIndexChanged({ })

$objListbox = New-Object System.Windows.Forms.Listbox
$objListbox.Location = New-Object System.Drawing.Size(300,120)
$objListbox.Size = New-Object System.Drawing.Size(260,20)
$objListbox.SelectionMode = "MultiExtended"
[void] $objListbox.Items.Add("1. User")
[void] $objListbox.Items.Add("2. Computer")
[void] $objListbox.Items.Add("3. E-Mail")
$objListbox.Height = 70
$objForm.Controls.Add($objListbox)

$CancelButton = New-Object System.Windows.Forms.Button
# Die nächsten beiden Zeilen legen die Position und die Größe des Buttons fest
$CancelButton.Location = New-Object System.Drawing.Size(600,165)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = "Abbrechen"
$CancelButton.Name = "Abbrechen"
$CancelButton.DialogResult = "Cancel"
#Die folgende Zeile ordnet dem Click-Event die Schließen-Funktion für das Formular zu
$CancelButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($CancelButton)

[void] $objForm.ShowDialog()
