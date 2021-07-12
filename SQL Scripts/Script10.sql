USE mydb;

SELECT COMPANY.CompanyName,
    STOCK.StockSymbol, 
    SUM(MADEORDER.OrderedQuantity) AS "StocksSoldIn2020" 
FROM COMPANY
JOIN STOCK ON (COMPANY.CompanyStockSymbol = STOCK.StockSymbol)
JOIN MADEORDER ON (STOCK.StockSymbol = MADEORDER.OrderedStockSymbol)
JOIN USER ON (MADEORDER.OrdererUserID = USER.UserID)
WHERE MADEORDER.OrderDate LIKE "2020%"
GROUP BY COMPANY.CompanyStockSymbol, COMPANY.CompanyName, STOCK.StockSymbol;