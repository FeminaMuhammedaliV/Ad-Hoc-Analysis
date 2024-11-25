/*6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage*/

SELECT 
c.customer_code , c.customer , 
concat(round(AVG(p.pre_invoice_discount_pct)*100,2),'%')AS average_discount_percentage
FROM dim_customer c , fact_pre_invoice_deductions p
where c.customer_code= p.customer_code and c.market = 'india' and p.fiscal_year = 2021
group by c.customer_code , c.customer
order by AVG(p.pre_invoice_discount_pct) desc
limit 5;
