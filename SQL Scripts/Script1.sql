USE mydb;

SELECT 
	USER.UserID, 
	USER.UserFullName AS "StockOwner", 
    SUM(MADEORDER.OrderedQuantity) AS "TotalStocksOwned"
FROM MADEORDER
JOIN USER ON (MADEORDER.OrdererUserID = USER.UserID)
GROUP BY MADEORDER.OrdererUserID, USER.UserID
ORDER BY SUM(MADEORDER.OrderedQuantity) DESC;
