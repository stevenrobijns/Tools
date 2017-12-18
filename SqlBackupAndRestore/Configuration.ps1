# will be used when taking a backup from a remote server so that the server's disk space is preserved
# -------------------------
$BackupShare = '\\YOURBACKUPSERVER\backups\temp\' # make sure it ends with backslash
# backup configuration
# -------------------------
$ServerForBackup = '' # if local server start with .\ e.g.: '.\dev'
$UserForBackup = ''
$PasswordForBackup = ''
$BackupShare = '\\BCKMACADAM01.macadam.local\backups\temp\' # will be used when taking a backup from a remote server so that the server's disk space is preserved

# restore configuration. Only restore to local server is supported for now
# -------------------------
$ServerForRestore = ''
$UserForRestore = ''
$PasswordForRestore = ''
$SqlDataFolder = "C:\Program Files\Microsoft SQL Server\MSSQL10_50.DEV\MSSQL\DATA" # folder where your db's and db log files are located. Check db properties => files in Sql Server
