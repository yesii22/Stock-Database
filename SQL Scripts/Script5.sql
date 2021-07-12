USE mydb;

SELECT 
	COMPANY.CompanyName,
    COMPANY.CompanyAddress,
	COMPANY.CompanyStockSymbol,
    SUM(STOCK.StockPrice * MADEORDER.OrderedQuantity) AS "TotalStockCapital"
FROM MADEORDER
JOIN COMPANY ON (MADEORDER.OrderedStockSymbol = COMPANY.CompanyStockSymbol)
JOIN STOCK ON (MADEORDER.OrderedStockSymbol = STOCK.StockSymbol)
GROUP BY COMPANY.CompanyStockSymbol, COMPANY.CompanyName, COMPANY.CompanyAddress
ORDER BY SUM(STOCK.StockPrice * MADEORDER.OrderedQuantity) DESC;
