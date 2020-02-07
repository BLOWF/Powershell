Credentials speichern
# Generate a random AES Encryption Key.
$AESKey = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($AESKey)
$AESKeyFilePath = "C:\Temp\aeskey_user.txt"
$SecurePwdFilePath = "C:\Temp\credpassword_user.txt"
    
# Store the AESKey into a file. This file should be protected!  (e.g. ACL on the file to allow only select people to read)
Set-Content $AESKeyFilePath $AESKey   # Any existing AES Key file will be overwritten       
$credObject = Get-Credential -UserName "sa_aad@fntsoftware.com" -Message "Passwort!" # The credObject now holds the password in a ‘securestring’ format 
$passwordSecureString = $credObject.password
$password = $passwordSecureString | ConvertFrom-SecureString -Key $AESKey
Set-Content $SecurePwdFilePath $password

Credentials lesen
$username = "sa_aad@fntsoftware.com"
$AESKeyFilePath = "C:\Temp\aeskey_user.txt"
$SecurePwdFilePath = "C:\Temp\credpassword_user.txt"
$AESKey = Get-Content $AESKeyFilePath
$pwdTxt = Get-Content $SecurePwdFilePath
$securePwd = $pwdTxt | ConvertTo-SecureString -Key $AESKey
$credObject = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securePwd