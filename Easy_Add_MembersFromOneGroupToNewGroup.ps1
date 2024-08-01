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
