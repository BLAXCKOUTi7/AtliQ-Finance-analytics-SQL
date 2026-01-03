SELECT SUM(sold_quantity)
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code=c.customer_code
where get_fiscal_year(s.date)=2021 and c.market='india' 
GROUP BY c.market