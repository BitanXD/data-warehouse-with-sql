use master;

-- Drop and re-create the database DataWarehouse
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;

USE DataWarehouse;

-- Create the Schemas following MEDALLION Architecture
CREATE SCHEMA dw_bronze;
GO
CREATE SCHEMA dw_silver;
GO
CREATE SCHEMA dw_gold;
GO
