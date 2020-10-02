#this script will read a txt file of email addresses (one per line) and set their password to never expire. good for service accounts that are rarely accessed

$credential = Get-Credential

Connect-MsolService -Credential $credential

ForEach ($u in [System.IO.File]::ReadLines("C:\Scripts\emails.txt"))
{
	Set-MsolUser -UserPrincipalName $u -PasswordNeverExpires $true
}
