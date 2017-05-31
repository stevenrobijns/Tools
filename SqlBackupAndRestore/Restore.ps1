param(
	[string] $database
)

if($database -eq ''){
	throw "Database parameter not supplied"
}

. $PSScriptRoot\Configuration.ps1

sqlcmd -S .\dev -U $User -P $Password -i KillConnectionsForDb.sql -v DataBase = "$database"
sqlcmd -S .\dev -U $User -P $Password -i Restore.sql -v DataBase = "$database" SqlDataFolder = "$SqlDataFolder"

Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

