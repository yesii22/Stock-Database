USE mydb;

SELECT USER.UserFullName AS "StockOwner", 
	STOCK.StockSymbol, 
    STOCK.StockName, 
    STOCK.StockPrice, 
    SUM(MADEORDER.OrderedQuantity) AS "QuantityOwned"
FROM USER
JOIN MADEORDER ON (MADEORDER.OrdererUserID = USER.UserID)
JOIN STOCK ON (MADEORDER.OrderedStockSymbol = STOCK.StockSymbol)
WHERE StockPrice > 200
GROUP BY USER.UserFullName, STOCK.StockSymbol, STOCK.StockName, STOCK.StockPrice;
