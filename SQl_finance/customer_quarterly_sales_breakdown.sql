SELECT s.date , s.product_code, 
p.product, p.variant,s.sold_quantity,
g.gross_price, 
ROUND(g.gross_price*s.sold_quantity,2) as gross_price_total 


FROM fact_sales_monthly s

JOIN dim_product p                  	       	 	### joining product code 
ON p.product_code = s.product_code

JOIN fact_gross_price g 							### 
ON g.product_code=s.product_code 
AND g.fiscal_year=get_fiscal_year(s.date) 

WHERE 
	customer_code=90002002 AND
    get_fiscal_year(DATE)=2021 AND
    get_fiscal_quarter(DATE)="Q4" 
ORDER BY date asc 



