param(
	[string] $database
)

if($database -eq ''){
	throw "Database parameter not supplied"
}

#load configuration
. $PSScriptRoot\Configuration.ps1

# create temp folder if not exits
New-Item -ItemType Directory -Force -Path c:\temp

$localBackupFilePath = "`"C:\Temp\$database.bak`""
Write-Host ('Local Backup File Path: {0}' -f $localBackupFilePath)

if (Test-Path $localBackupFilePath) {
	Remove-Item -Path $localBackupFilePath -Force
}

if ($ServerForBackup.StartsWith(".")) {
	$sqlBackupPath = $localBackupFilePath # do not use an intermediate share since we are taking a backup from a local db. 
} else {
	$sqlBackupPath = "{0}{1}.bak" -f $BackupShare, $database
	# remove previous backup file on the backup share	
	New-PSDrive -Name YDrive -PSProvider filesystem -Root $BackupShare	
	if (Test-Path YDrive:\PitStop.bak) {
		Remove-Item YDrive:\PitStop.bak
	}
}

sqlcmd -S $ServerForBackup -U $UserForBackup -P $PasswordForBackup -i $PSScriptRoot\Backup.sql -v DataBase = "$database" BackupPath = "$sqlBackupPath"

if ($sqlBackupPath.StartsWith("\\")) {
	Write-Host "Copying db backup file to local c:\temp This can take a few minutes..."
	Copy-Item YDrive:\PitStop.bak -Destination "c:\Temp\"
	Remove-PSDrive -Name YDrive
}

Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

