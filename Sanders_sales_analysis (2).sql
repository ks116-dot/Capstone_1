SELECT COUNT(ShiptoState)
FROM online_sales
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		OR ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%';
SELECT Date, SUM(SalesTotal) AS Sales_Revenue 
FROM online_sales
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		or ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%'
GROUP BY Date 
ORDER BY 1 desc;

SELECT YEAR(Date), MONTH(Date), SUM(SalesTotal) AS Sales_Revenue
FROM online_sales
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		or ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%'
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY 1 asc;

SELECT Region, State, SalesManager
FROM management
WHERE State LIKE 'Maryland%'
	OR  State LIKE 'Massachusetts%'
		or State LIKE 'Maine%'
			OR State LIKE 'New Jersey%';
SELECT SUM(SalesTotal) AS NJ_Revenue 
FROM online_sales
WHERE ShiptoState LIKE 'New Jersey%';

select count(SalesTotal), month(Date)
from online_sales
join products
	on online_sales.ProdNum = products.ProdNum
where ShiptoState Like 'New Jersey%'
group by month(Date);

SELECT COUNT(SalesTotal) AS Sale_Count, MONTH(Date) AS The_Month, ShiptoState, AVG(SalesTotal) AS AVG_Trans, Subcategoryid
FROM online_sales
JOIN products
	ON online_sales.ProdNum = products.ProdNum
WHERE ShiptoState LIKE 'New Jersey%'
GROUP BY MONTH(Date), ShiptoState, Subcategoryid;

