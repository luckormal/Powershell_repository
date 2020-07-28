# Active Directory Capability enable
Get-WindowsCapability -Online | Where-Object {$_.Name -like "*ActiveDirectory.DS-LDS*"} | Add-WindowsCapability -Online

# Install the Remote Server Administration Tools (RSAT)
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

# List of all ADUsers with all properties
Get-ADUser -Filter * -Properties *

Get-ADUser -filter * -Properties * | 
    Select-Object DisplayName,SamAccountName,lastLogonDate,Enabled,AccountExpirationDate,profilepath |
    Format-Table

# Set new password to user, must be used with an administrator account
$user = 'username'
$newPass = 'password'
Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$newPass" -Force)

# Set expiration date
Set-ADAccountExpiration -Identity $user -DateTime "2020-07-25"

# New AD User
New-ADUser

# Disable AD Account
Disable-ADAccount -Identity PattiFul

# Delete AD User
Remove-ADUser -Identity GlenJohn

# Delete disabled accounts
Search-ADAccount -AccountDisabled | where {$_.ObjectClass -eq 'user'} | Remove-ADUser