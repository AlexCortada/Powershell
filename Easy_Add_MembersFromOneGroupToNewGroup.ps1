# Author: Alex Cortada
# Description: A Powershell script that finds members from one group, pulls all of the names, then adds them to another group.
# Date: 08.01.2024
# Version: 2024.08.01

# Script begins here

# Import the Active Directory module
Import-Module ActiveDirectory

# Define the source and destination groups. Make sure to verify the names in AD using the Attribute Editor. If not, youll get errors.
$sourceGroup = "Finance_91cf710738bf"
$destinationGroup = "GitLab-Finance"

# Get the members of the source group
$members = Get-ADGroupMember -GroupObjectId $sourceGroup

# Add the members to the destination group
foreach ($member in $members) {
    Add-ADGroupMember -GroupObjectId $destinationGroup -Members $member
}
