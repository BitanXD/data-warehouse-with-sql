CREATE OR ALTER PROCEDURE dw_bronze.load_bronze AS
BEGIN

	TRUNCATE TABLE dw_bronze.crm_cust_info;
	BULK INSERT dw_bronze.crm_cust_info
	FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_crm\cust_info.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

	TRUNCATE TABLE dw_bronze.crm_prd_info;
	BULK INSERT dw_bronze.crm_prd_info
	FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_crm\prd_info.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

	TRUNCATE TABLE dw_bronze.crm_sales_details;
	BULK INSERT dw_bronze.crm_sales_details
	FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_crm\sales_details.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

	TRUNCATE TABLE dw_bronze.erp_cust_az12;
	BULK INSERT dw_bronze.erp_cust_az12
	FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_erp\CUST_AZ12.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

	TRUNCATE TABLE dw_bronze.erp_loc_a101;
	BULK INSERT dw_bronze.erp_loc_a101
	FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_erp\LOC_A101.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

	TRUNCATE TABLE dw_bronze.erp_px_cat_g1v2;
	BULK INSERT dw_bronze.erp_px_cat_g1v2
	FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

END
