/*10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order*/ 


WITH A AS 
(
SELECT P.division, S.product_code, P.product, SUM(S.sold_quantity) AS Total_sold_quantity
FROM dim_product P JOIN fact_sales_monthly S
ON P.product_code = S.product_code
WHERE S.fiscal_year = 2021 
GROUP BY  S.product_code, division, P.product
),
B AS 
(
SELECT division, product_code, product, Total_sold_quantity,
        RANK() OVER(PARTITION BY division ORDER BY Total_sold_quantity DESC) AS 'Rank_Order' 
FROM A
)
 SELECT A.division, A.product_code, A.product, B.Total_sold_quantity, B.Rank_Order
 FROM A JOIN B
 ON A.product_code = B.product_code
WHERE B.Rank_Order IN (1,2,3);
