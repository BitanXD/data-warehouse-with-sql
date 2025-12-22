-- The main difference is efficiency for large data: INSERT adds records one by one (or in small batches), while BULK INSERT loads many records in a single, optimized operation, 
-- drastically reducing network traffic, transaction overhead, and logging, making it much faster for big data loads by parsing logic once and handling data in large chunks, 
-- though individual inserts offer more granular control and error isolation per row.
-- The TABLOCK hint in SQL Server is a query optimizer instruction that forces a table-level lock for the duration of a bulk insert operation. 

BULK INSERT dw_bronze.crm_cust_info
FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_crm\cust_info.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

BULK INSERT dw_bronze.crm_prd_info
FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_crm\prd_info.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

BULK INSERT dw_bronze.crm_sales_details
FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_crm\sales_details.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

BULK INSERT dw_bronze.erp_cust_az12
FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_erp\CUST_AZ12.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

BULK INSERT dw_bronze.erp_loc_a101
FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_erp\LOC_A101.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

BULK INSERT dw_bronze.erp_px_cat_g1v2
FROM 'C:\Users\bitan\OneDrive\Documents\Datasets\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);
