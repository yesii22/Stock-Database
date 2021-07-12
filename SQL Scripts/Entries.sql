USE mydb;

INSERT INTO STOCK(StockSymbol, StockName, StockPrice)
VALUES('APPL', 'Apple', 117.15);
INSERT INTO STOCK(StockSymbol, StockName, StockPrice)
VALUES('MSFT', 'Microsoft', 210.47);
INSERT INTO STOCK(StockSymbol, StockName, StockPrice)
VALUES('FB', 'Facebook', 270.45);
INSERT INTO STOCK(StockSymbol, StockName, StockPrice)
VALUES('WMT', 'Walmart', 150.25);
INSERT INTO STOCK(StockSymbol, StockName, StockPrice)
VALUES('DIS', 'Disney', 141.41);
INSERT INTO STOCK(StockSymbol, StockName, StockPrice)
VALUES('BA', 'Boeing', 190.20);
INSERT INTO STOCK(StockSymbol, StockName, StockPrice)
VALUES('SQ', 'Square', 196.20);
INSERT INTO STOCK(StockSymbol, StockName, StockPrice)
VALUES('GE', 'General Electric', 9.73);
INSERT INTO STOCK(StockSymbol, StockName, StockPrice)
VALUES('NTDOY', 'Nintendo', 66.28);
INSERT INTO STOCK(StockSymbol, StockName, StockPrice)
VALUES('F', 'Ford', 8.75);


INSERT INTO COMPANY(CompanyID, CompanyStockSymbol, CompanyName, CompanyAddress)
VALUES(1103323, 'APPL', 'Apple Inc.', 'One Infinite Loop. Cupertino, CA');
INSERT INTO COMPANY(CompanyID, CompanyStockSymbol, CompanyName, CompanyAddress)
VALUES(1442466, 'MSFT', 'Microsoft Corporation', 'One Microsoft Way. Redmond, WA');
INSERT INTO COMPANY(CompanyID, CompanyStockSymbol, CompanyName, CompanyAddress)
VALUES(1542266, 'FB', 'Facebook Inc.', '1 Hacker Way. Menlo Park, CA');
INSERT INTO COMPANY(CompanyID, CompanyStockSymbol, CompanyName, CompanyAddress)
VALUES(1423235, 'WMT', 'Walmart Inc.', '702 S.W. 8th St. Bentonville, AK');
INSERT INTO COMPANY(CompanyID, CompanyStockSymbol, CompanyName, CompanyAddress)
VALUES(1324466, 'DIS', 'The Walt Disney Company', 'P.O. Box 10000. Lake Buena Vista, FL');
INSERT INTO COMPANY(CompanyID, CompanyStockSymbol, CompanyName, CompanyAddress)
VALUES(1537467, 'BA', 'The Boeing Company', '00 North Riverside. Chicago, IL');
INSERT INTO COMPANY(CompanyID, CompanyStockSymbol, CompanyName, CompanyAddress)
VALUES(1775355, 'SQ', 'Square Inc.', '1455 Market Street Suite 600. San Francisco, CA');
INSERT INTO COMPANY(CompanyID, CompanyStockSymbol, CompanyName, CompanyAddress)
VALUES(1233255, 'GE', 'General Electric Company', '41 Farnsworth Street. Boston, MA');
INSERT INTO COMPANY(CompanyID, CompanyStockSymbol, CompanyName, CompanyAddress)
VALUES(1635356, 'NTDOY', 'Nintendo Corporation', '4600 150th Ave NE. Redmond, WA');
INSERT INTO COMPANY(CompanyID, CompanyStockSymbol, CompanyName, CompanyAddress)
VALUES(1324744, 'F', 'Ford Motor Company', '1 American Road. Dearborn, MI');


INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9646747, 'Amy', 'Kim', '104 Smith Road. Atlanta, GA', 1094);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9545266, 'Ann', 'Gaither', '923 Alpaca Way. Yorba Linda, CA', 4456);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9244457, 'Jennifer', 'Fogle', '4846 Steve Hunt Road. Miami, FL', 1344);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9562234, 'Rachel', 'Smith', '4639 Maud Street. Philadelphia, PA', 2552);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9443554, 'Reggie', 'Gorman', '2754 Davis Court. Summerfield, IL', 525);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9434432, 'Bran', 'Ybarra', '3138 Hillhaven Drive. Los Angeles, CA', 535);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9533522, 'Ryan', 'Hannan', '144 Broad Street. Birmingham, AL', 7554);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9324566, 'Raymond', 'Martinez', '3970 Wilkinson Street. Nashville, TN', 6543);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9566422, 'James', 'Rose', '4976 County Line Road. New Port Richey, FL', 363433);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9545544, 'William', 'Newsome', '2674 Clark Street. Brentwood, NY', 6444);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9827376, 'Maya', 'Klotz', '2592 Loving Acres Road. Kansas City, MO', 112);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9738332, 'Linda', 'Lewis', '1587 Tetrick Road. Avon Park, FL', 7656);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9733332, 'Edgar', 'Hayes', '1559 Trymore Road. Osseo, MN', 87655);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9743321, 'So', 'Escobedo', '3697 Wood Duck Drive. Marquette, MI', 99433);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9336363, 'David', 'Lopez', '4731 Hershell Hollow Road. Kent, WA', 45773);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9751511, 'Robert', 'Hinton', '1785 Eden Drive. Richmond, VA', 1342);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9038333, 'Darlene', 'Brey', '4465 Romines Mill Road. Dallas, TX', 25255);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9736525, 'James', 'Carter', '2422 Payne Street. Haysi, VA', 2426);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9165434, 'Aaron', 'Scales', '576 Hill Street. Toledo, OH', 53553);
INSERT INTO USER(UserID, UserFirstName, UserLastName, Address, BrokerBalance)
VALUES(9523630, 'Edward', 'Smith', '1044 Oak Street. Syracuse, NY', 53577);

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5434445, 9646747, 'APPL', 10, '2020-01-01');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5569345, 9646747, 'DIS', 4, '2020-02-13');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5643445, 9646747, 'BA', 56, '2020-03-23');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5766445, 9646747, 'SQ', 5, '2020-04-30');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5222675, 9545266, 'FB', 32, '2018-01-13');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5734715, 9545266, 'BA', 36, '2020-11-24');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5045465, 9545266, 'NTDOY', 66, '2020-02-14');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5035465, 9545266, 'GE', 4, '2020-01-23');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5973458, 9244457, 'MSFT', 15, '2019-10-12');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5974418, 9244457, 'F', 76, '2020-08-01');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5993238, 9244457, 'FB', 44, '2020-09-02');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5121219, 9562234, 'WMT', 66, '2020-01-04');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5681329, 9562234, 'MSFT', 2, '2020-05-20');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5782212, 9443554, 'BA', 3, '2012-05-02');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5722312, 9443554, 'GE', 6, '2014-01-30');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5745262, 9443554, 'F', 45, '2016-08-14');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5886542, 9443554, 'APPL', 320, '2020-06-31');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5786482, 9443554, 'SQ', 44, '2020-07-13');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5233221, 9434432, 'WMT', 55, '2017-11-04');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5683432, 9434432, 'MSFT', 77, '2017-10-03');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5643314, 9434432, 'GE', 35, '2018-12-31');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5635341, 9434432, 'APPL', 53, '2018-01-13');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5687561, 9434432, 'FB', 77, '2018-04-24');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5665321, 9434432, 'F', 64, '2018-06-04');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5814318, 9533522, 'APPL', 53, '2019-01-01');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5675221, 9324566, 'SQ', 535, '2019-01-01');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5643421, 9324566, 'FB', 87, '2019-06-23');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5693641, 9324566, 'MSFT', 43, '2020-04-10');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5114335, 9324566, 'BA', 55, '2017-03-10');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5125315, 9324566, 'APPL', 84, '2018-02-20');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5136555, 9324566, 'SQ', 53, '2019-03-30');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5132265, 9324566, 'WMT', 74, '2020-05-01');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5114323, 9324566, 'BA', 54, '2020-08-03');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5114222, 9324566, 'NTDOY', 55, '2020-09-06');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5332355, 9566422, 'DIS', 4, '2018-07-13');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5324433, 9566422, 'F', 7, '2019-08-24');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5322476, 9566422, 'GE', 32, '2020-09-12');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5333243, 9566422, 'BA', 66, '2020-10-23');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5234333, 9545544, 'FB', 5, '2019-11-12');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5235544, 9545544, 'WMT', 5, '2019-12-31');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5453476, 9545544, 'APPL', 4, '2020-01-03');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5545643, 9827376, 'APPL', 44, '2020-05-02');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5745444, 9827376, 'SQ', 7, '2020-08-13');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5765655, 9827376, 'GE', 2, '2020-09-03');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5765532, 9738332, 'NTDOY', 64, '2018-01-01');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5844356, 9738332, 'DIS', 40, '2019-04-07');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5263335, 9733332, 'FB', 24, '2020-03-08');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5252563, 9733332, 'F', 55, '2020-02-13');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5545532, 9743321, 'F', 58, '2019-01-31');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5254433, 9743321, 'BA', 36, '2019-01-23');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5287523, 9743321, 'GE', 64, '2019-01-14');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5243355, 9743321, 'WMT', 14, '2019-01-23');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5654444, 9336363, 'NTDOY', 44, '2020-09-13');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5654122, 9336363, 'F', 55, '2020-09-21');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5643344, 9336363, 'FB', 7, '2020-11-13');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5155322, 9751511, 'SQ', 6, '2020-07-03');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5524556, 9751511, 'DIS', 5, '2020-08-01');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5155335, 9751511, 'BA', 3, '2020-09-07');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5153553, 9751511, 'WMT', 4, '2020-09-09');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5446766, 9751511, 'APPL', 5, '2020-09-21');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5934254, 9038333, 'BA', 1, '2019-01-14');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5987821, 9038333, 'DIS', 1, '2019-01-12');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5925451, 9038333, 'NTDOY', 1, '2019-03-30');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5934341, 9038333, 'FB', 40, '2019-05-29');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5923551, 9038333, 'APPL', 1, '2019-07-30');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5425321, 9038333, 'MSFT', 7, '2019-07-26');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5924321, 9038333, 'BA', 253, '2020-09-28');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5394321, 9038333, 'GE', 43, '2020-10-24');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5923341, 9038333, 'F', 5, '2020-11-11');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5434883, 9736525, 'SQ', 75, '2016-10-30');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5654443, 9736525, 'WMT', 42, '2017-03-13');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5653876, 9736525, 'BA', 3, '2018-03-23');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5546283, 9736525, 'MSFT', 4, '2019-01-12');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5054642, 9165434, 'NTDOY', 66, '2020-02-13');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5543333, 9736525, 'BA', 65, '2020-06-13');
INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5654583, 9736525, 'F', 54, '2020-07-27');

INSERT INTO MADEORDER(OrderID, OrdererUserID, OrderedStockSymbol, OrderedQuantity, OrderDate)
VALUES(5234331, 9523630, 'GE', 76, '2020-07-11');
