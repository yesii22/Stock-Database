USE mydb;

SELECT 
	USER.UserID, 
    USER.UserFullName AS "StockOwner", 
    SUM(STOCK.StockPrice * MADEORDER.OrderedQuantity) AS "TotalMoneyInvested"
FROM MADEORDER
JOIN USER ON (MADEORDER.OrdererUserID = USER.UserID)
JOIN STOCK ON (MADEORDER.OrderedStockSymbol = STOCK.StockSymbol)
GROUP BY MADEORDER.OrdererUserID, USER.UserID
ORDER BY SUM(STOCK.StockPrice * MADEORDER.OrderedQuantity) DESC;
