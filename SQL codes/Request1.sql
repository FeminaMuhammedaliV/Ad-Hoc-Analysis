/*1. Provide the list of markets in which customer "Atliq Exclusive" operates its
business in the APAC region.*/

SELECT 
c.market 
FROM gdb023.dim_customer c
where c.customer= "Atliq Exclusive"  and c.region = "APAC"
GROUP BY c.market 
order by  c.region;
