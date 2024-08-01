#First line installs the EOM module that allows PoSh to connect to Exchange Online. UserPrinc is gonna be your email as the admin user for MS365 Admin center
Install-Module ExchangeOnlineManagement
Import-Module ExchangeOnlineManagment
Connect-ExchangeOnline -UserPrincipalName alex.cortada@12345.com
#Add the name of the names of the people you pulled and add it as the Identity below.

Get-DistributionGroup -Identity "A name from the groups text file you created above" | Get-DistributionGroupMember | ft name, primarysmtpaddress >> C:\\members.txt
 
#Get that CSV export action goodness, baby
Get-DistributionGroup -Filter * | Export-CSV -Path C:\temp\distributionlists.csv

#Grabs the specified AD group and produces a CSV file with the name, employee number and ID of the users in that group.
Get-ADGroupMember -identity “corporateemployees” | select name,employeeNumber,sAMAccountName | Export-csv -path C:\Temp\Groupmembers.csv -NoTypeInformation


Import-CSV FileName.csv | ForEach {Add-DistributionGroupMember -Identity "GroupName" -Member $_.NTlogin}
