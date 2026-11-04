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
WHERE ShiptoState LIKE 'New Jersey%'
           

