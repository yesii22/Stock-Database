USE mydb;

SELECT USER.UserFullName AS "LocalStockOwner",
	USER.Address, 
    MADEORDER.OrderedStockSymbol AS "StockOwned",
    COMPANY.CompanyName AS "LocalCompany",
    COMPANY.CompanyAddress
FROM MADEORDER
INNER JOIN COMPANY ON (MADEORDER.OrderedStockSymbol = COMPANY.CompanyStockSymbol)
INNER JOIN USER ON (MADEORDER.OrdererUserID = USER.UserID)
WHERE SUBSTRING(USER.Address, CHAR_LENGTH(USER.Address) - 1, 2) 
	LIKE SUBSTRING(COMPANY.CompanyAddress, CHAR_LENGTH(COMPANY.CompanyAddress) - 1, 2);
