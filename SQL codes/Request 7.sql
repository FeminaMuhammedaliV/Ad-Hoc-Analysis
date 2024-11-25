/*7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/


SELECT 
(s.date)  as month ,
year(s.date)  as year ,
round(sum(g.gross_price),2 ) as gross_price_amount
FROM fact_sales_monthly s  
join fact_gross_price g on  g.product_code = s.product_code
join dim_customer c
	on c.customer_code=s.customer_code
where customer = 'Atliq Exclusive'
group by month , year
order by year , month ;
