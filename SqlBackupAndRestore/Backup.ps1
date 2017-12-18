param(
	[string] $database
)

if($database -eq ''){
	throw "Database parameter not supplied"
}

# create temp folder if not exits
New-Item -ItemType Directory -Force -Path c:\temp

$dbBackupFilePath = "c:\temp\" + $database + ".bak"

if (Test-Path $dbBackupFilePath) {
	Remove-Item -Path $dbBackupFilePath -Force
}

. $PSScriptRoot\Configuration.ps1

sqlcmd -S $ServerForBackup -U $UserForBackup -P $PasswordForBackup -i $PSScriptRoot\Backup.sql -v DataBase = "$database"

Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")