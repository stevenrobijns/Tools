param(
	[Parameter(Mandatory = $true)] [string] $dbName,
	[Parameter(Mandatory = $false)] [string] $dbFilePath
)

if($dbName -eq ''){
	throw "dbName parameter not supplied"
}

if($dbFilePath -eq ''){
	$dbFilePath = ("c:\temp\{0}.bak" -f $dbName)
	Write-Host ("dbFilePath parameter not supplied. Taking default path {0}" -f $dbFilePath)
}

$dbPath = "`"$dbFilePath`"" 
. $PSScriptRoot\Configuration.ps1

sqlcmd -S $ServerForRestore -U $UserForRestore -P $PasswordForRestore -i $PSScriptRoot\KillConnectionsForDb.sql -v DataBase = "$dbName"
sqlcmd -S $ServerForRestore -U $UserForRestore -P $PasswordForRestore -i $PSScriptRoot\Restore.sql -v DataBase = "$dbName" DbFilePath = "$dbPath" SqlDataFolder = "$SqlDataFolder" 

Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

