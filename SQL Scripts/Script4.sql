USE mydb;

SELECT 
	COMPANY.CompanyName,
    COMPANY.CompanyAddress,
	COMPANY.CompanyStockSymbol,
    SUM(MADEORDER.OrderedQuantity) AS "StockUnitsVendored"
FROM MADEORDER
JOIN COMPANY ON (MADEORDER.OrderedStockSymbol = COMPANY.CompanyStockSymbol)
GROUP BY COMPANY.CompanyStockSymbol, COMPANY.CompanyName, COMPANY.CompanyAddress
ORDER BY SUM(MADEORDER.OrderedQuantity) DESC;
