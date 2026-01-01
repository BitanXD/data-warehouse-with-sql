-- crm_cust_info

-- Check for nulls or duplicates in Primary Key...
-- Expectation: No result

SELECT cst_id, COUNT(*) 
FROM dw_bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check for unwanted spaces...
-- Expectation: No result
SELECT cst_firstname
FROM dw_bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname
FROM dw_bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname);

-- Data Standardization and Consistency
SELECT DISTINCT cst_gndr
FROM dw_bronze.crm_cust_info;

SELECT DISTINCT cst_marital_status
FROM dw_bronze.crm_cust_info;


-- crm_prd_info

-- Check for nulls or duplicates in Primary Key...
-- Expectation: No result

SELECT prd_id, COUNT(*) 
FROM dw_bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for unwanted spaces...
-- Expectation: No result
SELECT prd_nm
FROM dw_bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);


-- Check for Null or Negative numbers...
-- Expectation: No result
SELECT prd_cost
FROM dw_bronze.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0;

-- Data Standardization and Consistency
SELECT DISTINCT prd_line
FROM dw_bronze.crm_prd_info;


-- Check for invalid date orders
SELECT *
FROM dw_bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt;
