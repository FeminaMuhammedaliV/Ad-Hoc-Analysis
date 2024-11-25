/*2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg*/


WITH X AS (
    SELECT COUNT(DISTINCT(product_code)) AS A 
    FROM fact_sales_monthly
    WHERE fiscal_year = 2020
),
Y AS (
    SELECT COUNT(DISTINCT(product_code)) AS B 
    FROM fact_sales_monthly
    WHERE fiscal_year = 2021
)
SELECT 
    up2020.A AS unique_product_2020, 
    up2021.B AS unique_products_2021, 
    ROUND((up2021.B - up2020.A) * 100 / up2020.A, 2) AS percentage_chg
FROM 
    X up2020 , Y up2021;
