--- 1. Product with the highest total revenue (SQL Server)
SELECT TOP 1 Product, SUM(Total_Price) AS Total_Revenue
FROM salesdata..sample_sales_data_15000
GROUP BY Product
ORDER BY Total_Revenue DESC;

---2. Average quantity sold per transaction by region
SELECT Region, SUM(CAST(Quantity AS FLOAT))/COUNT(CAST(Quantity AS FLOAT)) AS Avg_Quantity
FROM salesdata..sample_sales_data_15000
GROUP BY Region
ORDER BY Avg_Quantity DESC;

--3. Region with the most total sales
SELECT TOP 1 Region, SUM(Total_Price) AS Total_Sales
FROM salesdata..sample_sales_data_15000
GROUP BY Region
ORDER BY Total_Sales DESC;

--4. Top 3 best-selling products by volume
SELECT TOP 3 Product, SUM(Quantity) AS Total_Volume 
FROM salesdata..sample_sales_data_15000
GROUP BY Product
ORDER BY Total_Volume DESC;

--5. Average unit price per product by region
SELECT Product, Region, SUM(CAST(Unit_Price AS FLOAT))/COUNT(CAST(Unit_Price AS FLOAT))AS Avg_Unit_Price 
FROM salesdata..sample_sales_data_15000
GROUP BY Product, Region
ORDER BY Product, Region;

--6. Regions with highest average quantity per sale
SELECT TOP 3 Region, SUM(CAST(Quantity AS FLOAT))/COUNT(CAST(Quantity AS FLOAT))AS Avg_Quantity
FROM salesdata..sample_sales_data_15000
GROUP BY Region
ORDER BY Avg_Quantity DESC;

--7. Products with highest and lowest average total sale value
SELECT TOP 3 Product, SUM(CAST(Total_Price AS FLOAT))/COUNT(CAST(Total_Price AS FLOAT))AS Avg_Total_Sales_By_Product
FROM salesdata..sample_sales_data_15000
GROUP BY Product
ORDER BY Avg_Total_Sales_By_Product DESC;

SELECT TOP 3 Product, SUM(CAST(Total_Price AS FLOAT))/COUNT(CAST(Total_Price AS FLOAT))AS Avg_Total_Sales_By_Product
FROM salesdata..sample_sales_data_15000
GROUP BY Product
ORDER BY Avg_Total_Sales_By_Product ASC;


--8. Correlation between unit price and quantity sold
SELECT Unit_Price, SUM(CAST(Quantity AS FLOAT))/COUNT(CAST(Quantity AS FLOAT)) AS Avg_Quantity
FROM salesdata..sample_sales_data_15000
GROUP BY Unit_Price
ORDER BY Unit_Price;

SELECT 
    CASE 
        WHEN Unit_Price < 20 THEN '$0 - $20'
        WHEN Unit_Price < 40 THEN '$20 - $39.99' 
        WHEN Unit_Price < 80 THEN '$40 - $79.99'
        ELSE '$80+'
    END AS Price_Bracket,
    COUNT(*) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity
FROM salesdata..sample_sales_data_15000
GROUP BY 
    CASE 
        WHEN Unit_Price < 20 THEN '$0 - $20'
        WHEN Unit_Price < 40 THEN '$20 - $39.99'
        WHEN Unit_Price < 80 THEN '$40 - $79.99'
        ELSE '$80+'
    END
ORDER BY Total_Quantity ASC;