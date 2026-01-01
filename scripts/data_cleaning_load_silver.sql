-- crm_cust_info

INSERT INTO dw_silver.crm_cust_info (
cst_id,
cst_key,
cst_firstname,
cst_lastname,
cst_marital_status,
cst_gndr,
cst_create_date
)
SELECT 
cst_id,
cst_key,
TRIM(cst_firstname) AS cst_firstname,
TRIM(cst_lastname) AS cst_lastname,
CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
	 WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
	 ELSE 'N/A'
END AS cst_marital_status,
CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
	 WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
	 ELSE 'N/A'
END AS cst_gndr,
cst_create_date
FROM (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
FROM dw_bronze.crm_cust_info
WHERE cst_id IS NOT NULL) AS T
WHERE flag_last = 1;


-- crm_prd_info

SELECT 
prd_id,
prd_key,
REPLACE(SUBSTRING(prd_key, 1, 5),'-','_') AS cat_id,
SUBSTRING(prd_key, 7, LEN(prd_key)) AS prd_key,
prd_nm,
ISNULL(prd_cost,0) AS prd_cost,
CASE UPPER(TRIM(prd_line)) 
	 WHEN 'M' THEN 'Mountain'
	 WHEN 'R' THEN 'Road'
	 WHEN 'S' THEN 'Other Sales'
	 WHEN 'T' THEN 'Touring'
	 ELSE 'N/A'
END AS prd_line,
prd_start_dt,
prd_end_dt
FROM dw_bronze.crm_prd_info;
