# Info
This scripts allow you to backup a db from any server and restore it to another server.
c:\temp is used as folder to place the db backup files (.bak)
Tested with Sql Server 2008 R2 and Powershell 4

# How to use
- Modify Configuration.ps1 according your requirements
- Copy a link in the ExampleUsage folder to any location. Right click => properties => 'target:' => modify PitStop to your db name & modify paths in 'target:' and 'start in:' to where you've put this repo
