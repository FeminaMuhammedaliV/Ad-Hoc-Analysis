/*9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/

WITH cte1 AS
(
SELECT C.channel,
       CONCAT(ROUND(SUM(G.gross_price*FS.sold_quantity/1000000), 2) , ' M') AS Gross_sales_mln
FROM fact_sales_monthly FS JOIN dim_customer C ON FS.customer_code = C.customer_code
						   JOIN fact_gross_price G ON FS.product_code = G.product_code
WHERE FS.fiscal_year = 2021
GROUP BY channel
)
SELECT channel,Gross_sales_mln , CONCAT(ROUND(Gross_sales_mln*100/total , 2), ' %') AS percentage
FROM
(
(SELECT SUM(Gross_sales_mln) AS total FROM cte1) A,
(SELECT * FROM cte1) B
)
ORDER BY percentage DESC ;
