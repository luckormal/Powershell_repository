
# Active Directory Capability enable
e

# List of all ADUsers with all properties
Get-ADUser -Filter * -Properties *

Get-ADUser -filter * -Properties * | 
    Select-Object DisplayName,SamAccountName,lastLogonDate,Enabled,AccountExpirationDate,profilepath |
    ft

# Set new password to user, must be used with an administrator account
$user = 'username'
$newPass = 'password'
Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$newPass" -Force)

# Set expiration date
Set-ADAccountExpiration -Identity $user -DateTime "2020-07-25"

# New AD User
New-ADUser