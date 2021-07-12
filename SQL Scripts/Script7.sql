USE mydb;

SELECT MADEORDER.OrderDate AS "PurchaseDate",
	USER.UserFullName AS "StockOwner",
	USER.UserID,
    STOCK.StockSymbol, 
    STOCK.StockName,
    MADEORDER.OrderedQuantity
FROM USER
JOIN MADEORDER ON (USER.UserID = MADEORDER.OrdererUserID)
JOIN STOCK ON (STOCK.StockSymbol = MADEORDER.OrderedStockSymbol)
WHERE MADEORDER.OrderDate LIKE "%-06-%";
