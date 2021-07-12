USE mydb;

SELECT 
	USER.UserID, 
    USER.UserFullName AS "StockOwner", 
    MADEORDER.OrderedStockSymbol AS "XStockOwned",
    SUM(MADEORDER.OrderedQuantity) AS "TotalStocksOwned"
FROM MADEORDER
JOIN USER ON (MADEORDER.OrdererUserID = USER.UserID)
JOIN COMPANY ON (MADEORDER.OrderedStockSymbol = COMPANY.CompanyStockSymbol)
WHERE MADEORDER.OrderedStockSymbol = 'APPL'
GROUP BY MADEORDER.OrdererUserID, USER.UserID
ORDER BY SUM(MADEORDER.OrderedQuantity) DESC;
