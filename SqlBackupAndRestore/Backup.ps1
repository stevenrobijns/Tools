param(
	[string] $database
)

if($database -eq ''){
	throw "Database parameter not supplied"
}

# create temp folder if not exits
New-Item -ItemType Directory -Force -Path c:\temp

. $PSScriptRoot\Configuration.ps1

sqlcmd -S .\dev -U $User -P $Password -i Backup.sql -v DataBase = "$database"

Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")