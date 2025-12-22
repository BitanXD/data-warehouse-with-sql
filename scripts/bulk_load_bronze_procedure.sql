CREATE OR ALTER PROCEDURE dw_bronze.load_bronze AS
BEGIN
DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		PRINT '----------------------------------------------------------------------------------';
		PRINT 'Loading CRM tables';
		PRINT '----------------------------------------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating table: dw_bronze.crm_cust_info';
		TRUNCATE TABLE dw_bronze.crm_cust_info;
		PRINT '>> Inserting data into table: dw_bronze.crm_cust_info';
		BULK INSERT dw_bronze.crm_cust_info
		FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_crm\cust_info.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' secs';
		PRINT '------------------------------------------------------------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating table: dw_bronze.crm_prd_info';
		TRUNCATE TABLE dw_bronze.crm_prd_info;
		PRINT '>> Inserting data into table: dw_bronze.crm_prd_info';
		BULK INSERT dw_bronze.crm_prd_info
		FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_crm\prd_info.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' secs';
		PRINT '------------------------------------------------------------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating table: dw_bronze.crm_sales_details';
		TRUNCATE TABLE dw_bronze.crm_sales_details;
		PRINT '>> Inserting data into table: dw_bronze.crm_sales_details';
		BULK INSERT dw_bronze.crm_sales_details
		FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_crm\sales_details.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' secs';
		PRINT '------------------------------------------------------------------------------------------';


		PRINT '----------------------------------------------------------------------------------';
		PRINT 'Loading ERP tables';
		PRINT '----------------------------------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating table: dw_bronze.erp_cust_az12';
		TRUNCATE TABLE dw_bronze.erp_cust_az12;
		PRINT '>> Inserting data into table: dw_bronze.erp_cust_az12';
		BULK INSERT dw_bronze.erp_cust_az12
		FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_erp\CUST_AZ12.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' secs';
		PRINT '------------------------------------------------------------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating table: dw_bronze.erp_loc_a101';
		TRUNCATE TABLE dw_bronze.erp_loc_a101;
		PRINT '>> Inserting data into table: dw_bronze.erp_loc_a101';
		BULK INSERT dw_bronze.erp_loc_a101
		FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_erp\LOC_A101.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' secs';
		PRINT '------------------------------------------------------------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> Truncating table: dw_bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE dw_bronze.erp_px_cat_g1v2;
		PRINT '>> Inserting data into table: dw_bronze.erp_px_cat_g1v2';
		BULK INSERT dw_bronze.erp_px_cat_g1v2
		FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' secs';
		PRINT '------------------------------------------------------------------------------------------';

	END TRY

	BEGIN CATCH
	PRINT '--------------------------------------------------------------------';
	PRINT 'Error occured during loading Bronze Layer Tables';
	PRINT 'Error Message: ' + ERROR_MESSAGE();
	PRINT 'Error Message: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT 'Error Message: ' + CAST(ERROR_STATE() AS NVARCHAR);
	PRINT '--------------------------------------------------------------------';
	END CATCH
END
