$CopyFromUser = Get-ADUser FROMACCOUNT -prop MemberOf
$CopyToUser = Get-ADUser TOACCOUNT -prop MemberOf
$CopyFromUser.MemberOf | Where{$CopyToUser.MemberOf -notcontains $_} |  Add-ADGroupMember -Members $CopyToUser
