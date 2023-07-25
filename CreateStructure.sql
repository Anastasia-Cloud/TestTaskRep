CREATE TABLE dbo.SKU
(
    ID int IDENTITY (1,1) PRIMARY KEY,
      Code as 's' + CONVERT(varchar(10), ID) UNIQUE,
    Name VARCHAR(50)
);

CREATE TABLE dbo.Family
(
    ID int IDENTITY (1,1) PRIMARY KEY,
    SurName varchar(50),
    BudgetValue int
);

CREATE TABLE dbo.Basket
(
    ID int IDENTITY (1,1) PRIMARY KEY,
    ID_SKU int,
    ID_Family int,
    Quantity int CHECK(Quantity >= 0),
    Value int CHECK(Value >= 0),
    PurchaseDate DATETIME DEFAULT GETDATE(),
    DiscountValue int
);

ALTER TABLE Basket
   ADD CONSTRAINT FK_Family FOREIGN KEY (ID_Family)
      REFERENCES Family (ID)
;

ALTER TABLE Basket
   ADD CONSTRAINT FK_SKU FOREIGN KEY (ID_SKU)
      REFERENCES SKU (ID)
;

ALTER TABLE Family ALTER COLUMN surname varchar(255)