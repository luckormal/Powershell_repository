
# Active Directory Capability enable
Get-WindowsCapability -Online | Where-Object {$_.Name -like "*ActiveDirectory.DS-LDS*"} | Add-WindowsCapability -Online

# Import module activedirectory
import-module activedirectory

# List of all ADUsers
Get-ADUser -Filter * -Properties *