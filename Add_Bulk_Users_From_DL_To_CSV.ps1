#Import from file, idenitify all corp employees, display. Add distro list EXACTLY as shown

Import-Csv "C:\Temp\allemps.csv" | ForEach {Add-DistributionGroupMember -Identity "All Corporate Employees" -Member $_.displayname}

--------------------------------------------------------------------
#Idenitify all corp employees via groups, show results, then export to csv

$groups = "Add employee distro lists using commas, and quotes"
$results = foreach ($group in $groups) {Get-ADGroupMember $group | select samaccountname, name, @{n='GroupName';e={$group}}, @{n='Description';e={(Get-ADGroup $group -Properties description).description}}}
$results
$results | Export-csv C:\Temp\GroupMemberShipsnames.txt -NoTypeInformation

------------------------------------------------------------------
#Show group members, show results for samname, name, proxy, then export to csv

$groups = "GROUPNAMEHERE"
$results = foreach ($group in $groups) {Get-ADGroupMember $group | FL* select samaccountname, name, proxyaddress, @{n='GroupName';e={$group}}, @{n='Description';e={(Get-ADGroup $group -Properties description).description}}}
$results
$results | Export-csv C:\TEMPFOLDER\GroupMemberShipsFULLEMAILS.txt -NoTypeInformation

-----------------------------------------------------------------------
#Import user list, then select username, grab samname, displayname, and emailaddress, then export to csv ($dn = $user."USER" defines the search parameter)

$list = Import-Csv C:\temp\GroupswNamesFullList.csv
ForEach($user in $list){    
$dn = $user.user
Get-ADUser -Filter { displayName -like $dn } -Properties *| Select samaccountname,displayname,emailaddress|Export-Csv C:\temp\emailsforgroupusers.csv -NoType -Append } 
----------------------------------------------------------------------
