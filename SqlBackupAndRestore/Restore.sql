USE [master]
RESTORE DATABASE [$(DataBase)] FROM  DISK = N'$(DbFilePath)' WITH  FILE = 1,  MOVE N'$(DataBase)' TO N'$(SqlDataFolder)\$(DataBase).mdf',  MOVE N'$(DataBase)_log' TO N'$(SqlDataFolder)\$(DataBase)_log.LDF',  NOUNLOAD,  REPLACE,  STATS = 5
GO