# create home directory and set accessrights for user
New-Item -ItemType Directory -Path "\\ell.fnt.de\FNTPublic\HomeDir\catherine.utz" | Out-Null
$Acl = Get-Acl "\\ell.fnt.de\FNTPublic\HomeDir\catherine.utz"
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule((((Get-ADDomain).Name).ToString() + "\catherine.utz"),"FullControl","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl "\\ell.fnt.de\FNTPublic\HomeDir\catherine.utz" $Acl*