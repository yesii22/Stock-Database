USE mydb;

SELECT USER.UserFullName, 
	STOCK.StockSymbol, 
	STOCK.StockName, 
    STOCK.StockPrice, 
    SUM(MADEORDER.OrderedQuantity) AS "QuantityOwned"
FROM USER
JOIN MADEORDER ON (USER.UserID = MADEORDER.OrdererUserID)
JOIN STOCK ON (STOCK.StockSymbol = MADEORDER.OrderedStockSymbol)
WHERE USER.UserFirstName = "Robert" AND USER.UserLastName = "Hinton"
GROUP BY STOCK.StockSymbol, UserFullName, STOCK.StockSymbol, STOCK.StockName, STOCK.StockPrice;
