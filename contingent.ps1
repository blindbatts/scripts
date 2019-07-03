#**********************************************************************************************************************
# By Kevin Tansey
# 7/2/2019
#**********************************************************************************************************************

# A script to run a one-time update of "Display Name" in Exchange to append " [C]" at the end. C = Contingent Worker or Vendor.
# The criteria is for any "enabled" user if their Description says �Vendor�.  
#   
#   
#

import-module activedirectory

# Specify what OU should be searched for user objects (CN for built-in AD OU names or individual users for testing)
#_
# For testing replace with - $OUName = 'CN=Bruce Wayne,CN=Users,DC=xxx,DC=xxx,DC=com'
$OUName = 'CN=Users,DC=xxx,DC=xxx,DC=com'

# Specify the search criteria
#_
# For testing replace with - $Filter = {DisplayName -like "*Bruce*" -and enabled -eq $true}
$Filter = { Description -like "*Vendor" -and enabled -eq $true}

# Run the actual search for user objects in the $OUName and $Filter we want
$Vendors = Get-ADUser -SearchBase $OUName -Filter $Filter -Properties displayname |

#_Uncomment for testing what user objects are grabbed here to sanity check and don't run the rest of the script.
Out-GridView 

# Update each user object's displayname with previous displayname + " [C]"
# __Uncomment next line to enable object changes___
#ForEach-Object { Set-ADUser $_ -DisplayName ($_.DisplayName + " [C]") }
