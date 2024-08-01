# Author: Alex Cortada
# Description: A super simple Powershell script that grabs permissions from one user and adds it to another.
# Date: 08.01.2024
# Version: 2024.08.01

# Script begins here

#Add the usernames in the FROMACCOUNT and TOACCOUNT sections. Verify all changes in AD when finished.
$CopyFromUser = Get-ADUser FROMACCOUNT -prop MemberOf
$CopyToUser = Get-ADUser TOACCOUNT -prop MemberOf
$CopyFromUser.MemberOf | Where{$CopyToUser.MemberOf -notcontains $_} |  Add-ADGroupMember -Members $CopyToUser
