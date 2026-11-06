SELECT COUNT(ShiptoState)
FROM online_sales
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		OR ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%';
SELECT Date, SUM(SalesTotal) AS Sales_Revenu, ShiptoState
FROM online_sales
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		or ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%'
GROUP BY Date, ShiptoState
ORDER BY 1 desc;

SELECT YEAR(Date), SUM(SalesTotal) AS Sales_Revenue, ShiptoState
FROM online_sales
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		or ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%'
GROUP BY YEAR(Date), ShiptoState
ORDER BY 1 desc
limit 4; 

SELECT ShiptoState, MONTH(Date) AS Month, YEAR(Date) AS Year, Category, AVG(SalesTotal) AS AVG_sales, COUNT(SalesTotal) AS Transaction_Count
FROM online_sales
JOIN products
	on  online_sales.ProdNum = products.ProdNum
left join inventory_categories
	on inventory_categories.Categoryid = products.Categoryid
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		or ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%'
GROUP BY YEAR(Date), MONTH(Date),  ShiptoState, Category
ORDER BY 1 asc, 2 asc; -- question 4

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

SELECT COUNT(SalesTotal) AS Sale_Count, MONTH(Date) AS The_Month, ShiptoState, AVG(SalesTotal) AS AVG_Trans, Category
FROM online_sales
JOIN products
	ON online_sales.ProdNum = products.ProdNum
Left Join inventory_categories
	on inventory_categories.Categoryid = products.Categoryid
WHERE ShiptoState LIKE 'New Jersey%'
GROUP BY MONTH(Date), ShiptoState, Category;

SELECT State, SUM(SalesTotal) AS Sales_Perfomance, Year(Date)
FROM management
LEFT JOIN online_sales
	ON online_sales.ShiptoState = management.State
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		or ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%'
GROUP BY State, Date
ORDER BY 1 DESC;

SELECT state, SUM(SalesTotal) AS Sales_Perfomance
FROM management
LEFT JOIN online_sales
	ON online_sales.ShiptoState = management.State
WHERE ShiptoState LIKE 'Maine%'
GROUP BY State
ORDER BY 1 DESC;

Select Count(StoreLocation), State
from store_locations
WHERE State LIKE 'Maryland%'
	OR  State LIKE 'Massachusetts%'
		or State LIKE 'Maine%'
			OR State LIKE 'New Jersey%'
Group by State
Limit 4;

SELECT Date, ShiptoState,  SUM(SalesTotal) AS Sales_Revenue
FROM online_sales
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		or ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%'
GROUP BY Date,ShiptoState
ORDER BY ShiptoState,Date  ASC;

SELECT ShiptoState, MAX(Date)
FROM online_sales
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		or ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%'
group by ShiptoState
order by 2 desc;

SELECT ShiptoState, MIN(Date)
FROM online_sales
WHERE ShiptoState LIKE 'Maryland%'
	OR ShiptoState LIKE 'Massachusetts%'
		or ShiptoState LIKE 'Maine%'
			OR ShiptoState LIKE 'New Jersey%'
group by ShiptoState
order by 2 desc;


SELECT
    SUM(combined_sales),
    MAX(combined_sales),
    MIN(combined_sales),
    AVG(combined_sales)
FROM (
    SELECT Sale_Amount AS combined_sales
    FROM store_sales

    UNION ALL

    SELECT SalesTotal
    FROM online_sales
) AS sales_data;




Select SUM(Sale_Amount), State
from store_sales
right join store_locations
	on store_sales.Store_ID = store_locations.StoreId
where State  LIKE 'New Jersey%'
group by State;

Select SUM(SalesTotal), ShiptoState
from online_sales
where ShiptoState  LIKE 'New Jersey%'
Group by ShiptoState;

select Year(Date), sum(SalesTotal) AS Revenue_PerYear
from online_sales
where ShiptoState  LIKE 'New Jersey%'
Group By Year(Date) 
Order by 1 asc;

Select MAX(Sale_Amount) 
from store_sales;

SELECT MAX(SalesTotal)
FROM online_sales


SELECT 
    SUM(combined_sales),
    MAX(combined_sales),
    MIN(combined_sales),
    AVG(combined_sales)
FROM (
    SELECT Sale_Amount AS combined_sales
    FROM store_sales
	join store_locations
		on store_locations.StoreId = store_sales.Store_ID
	where State LIKE 'New Jersey%'
    UNION ALL

    SELECT SalesTotal
    FROM online_sales
    where ShiptoState  LIKE 'New Jersey%'
) AS sales_data;
