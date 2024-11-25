/*4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

with cte1 as
(
select 
	(p.segment) as A,
	count(distinct s.product_code) as Q
from fact_sales_monthly s 
join  dim_product p on  p.product_code=s.product_code
where  s.fiscal_year = "2020"  group by s.fiscal_year, p.segment),
cte2 as 
(
select 
	(p.segment) as B,
	count(distinct s.product_code) as R
from fact_sales_monthly s 
join  dim_product p on  p.product_code=s.product_code
where  s.fiscal_year = "2021"  group by s.fiscal_year, p.segment)
select
   cte1.A as segment,
   cte1.Q as Product_count_2020, 
   cte2.R as Product_count_2021,
   (cte2.R-cte1.Q) as difference
from cte1 , cte2 
where cte1.A=cte2.B ;
