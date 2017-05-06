/*

Before running this script, please make sure you are familiar with proper management of SQL Server transaction log files - kCura publishes a document on this subject called
Managing Relativity SQL Log Files.  It can be found on the public documentation site at https://help.kcura.com.  Truncating logs should not be a regular practice, but can
be necessary for maintenance when logs have grown too large.

Replace all occurrences of 'xxxxxxx' below to reference the database for which you need to truncate the log.

*/

USE EDDSxxxxxxx
GO
-- Truncate the log by changing the database recovery model to SIMPLE.
ALTER DATABASE EDDSxxxxxxx
SET RECOVERY SIMPLE;
GO
-- Shrink the truncated log file to 1 GB.
DBCC SHRINKFILE (EDDSxxxxxxx_Log, 1024);
GO
-- Reset the database recovery model.
ALTER DATABASE EDDSxxxxxxx
SET RECOVERY FULL;
GO
