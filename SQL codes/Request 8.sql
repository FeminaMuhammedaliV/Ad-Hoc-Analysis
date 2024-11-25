/*8.  In which quarter of 2020, got the maximum total_sold_quantity? The final 
output contains these fields sorted by the total_sold_quantity, 
Quarter 
total_sold_quantity */

SELECT 
	case
		when date BETWEEN '2019-09-01' AND '2019-11-01' THEN 'Q1'
        when date BETWEEN '2019-12-01' AND '2020-02-01' THEN 'Q2'
        when date BETWEEN '2020-03-01' AND '2020-05-01' THEN 'Q3'
        when date BETWEEN '2020-06-01' AND '2020-08-01' THEN 'Q4'
end as quarter,
sum(sold_quantity) as total_sold_quandity
FROM gdb023.fact_sales_monthly
where fiscal_year = 2020
group by quarter 
order by total_sold_quandity desc ;
