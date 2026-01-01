SELECT * FROM dw_silver.crm_cust_info;

-- data quality checks
-- Check for nulls or duplicates in Primary Key...
-- Expectation: No result

SELECT cst_id, COUNT(*) 
FROM dw_silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check for unwanted spaces...
-- Expectation: No result
SELECT cst_firstname
FROM dw_silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname
FROM dw_silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname);

-- Data Standardization and Consistency
SELECT DISTINCT cst_gndr
FROM dw_silver.crm_cust_info;

SELECT DISTINCT cst_marital_status
FROM dw_silver.crm_cust_info;
