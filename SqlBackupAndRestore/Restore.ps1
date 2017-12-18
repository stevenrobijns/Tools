param(
	[string] $dbName,
	[string] $dbFilePath
)

if($dbName -eq ''){
	throw "dbName parameter not supplied"
}

if($dbFilePath -eq ''){
	throw "dbFilePath parameter not supplied"
}

$dbPath = "`"$dbFilePath`"" 
. $PSScriptRoot\Configuration.ps1

sqlcmd -S $ServerForRestore -U $UserForRestore -P $PasswordForRestore -i KillConnectionsForDb.sql -v DataBase = "$dbName"
sqlcmd -S $ServerForRestore -U $UserForRestore -P $PasswordForRestore -i Restore.sql -v DataBase = "$dbName" DbFilePath = "$dbPath" SqlDataFolder = "$SqlDataFolder" 

Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

