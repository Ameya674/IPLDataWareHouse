-- =======================================================================
-- THE FOLLOWING CODE CREATES THE DATA WAREHOUSE AND THE SCHEMAS INSIDE IT
-- =======================================================================

-- use the master database
USE master;

-- check if the IPL datawarehouse exists and drop it if it does
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'IPLDataWareHouse')
BEGIN
	-- set the datawarehouse to single user mode 
	ALTER DATABASE IPLDataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	-- drop the datawarehouse
	DROP DATABASE IPLDataWareHouse;
END
GO

-- create the IPLDataWareHouse database
CREATE DATABASE IPLDataWareHouse;
GO

-- use this created database
USE IPLDataWareHouse;
GO

-- create the bronze, silver, and gold schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
