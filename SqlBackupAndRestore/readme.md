# Info
This scripts allow you to backup a db from any server and restore it a local server.

Backup.ps1 backups a local or remote database to your local c:\temp.
Restore.ps1 restores a database .bak file to a local server instance

c:\temp is used as folder to place the db backup files (.bak)
Tested with Sql Server 2008 R2 and Powershell 4

# How to use
- Modify Configuration.ps1 according your requirements
- Edit links in ExampleUsage to target a database of your choice. Right click => properties => 'target:' => modify PitStop to your db name and for Restore you can also modify dbFilePath to a .bak file of your chosing
