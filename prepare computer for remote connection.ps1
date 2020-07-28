# Install the Remote Server Administration Tools (RSAT)
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

# New GPO
New-GPO -Name “IT Team GPO” -StarterGPOName “IT Starter GPO”

# List of all GPO to get target for link
get-gpo -All | Select-Object displayname,domainName,path | format-list

# Links the new GPO to an AD DS container
New-GPLink -Name “IT Team GPO” -Target “OU=IT,DC=adatum,DC=com”