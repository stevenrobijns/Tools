USE [master]
BACKUP DATABASE [$(DataBase)] TO  DISK = N'c:\temp\$(DataBase).bak' WITH NOFORMAT, INIT,  NAME = N'$(DataBase)-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO