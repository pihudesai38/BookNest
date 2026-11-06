IF OBJECT_ID('dbo.cart_tbl', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.cart_tbl
    (
        Cart_Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        Cart_User_Id INT NOT NULL,
        Cart_Prod_Id INT NOT NULL,
        Quantity INT NOT NULL CONSTRAINT DF_cart_tbl_Quantity DEFAULT (1),
        Added_Date DATETIME NOT NULL CONSTRAINT DF_cart_tbl_Added_Date DEFAULT (GETDATE()),
        Total DECIMAL(18,2) NULL
    );
END;
GO

-- Optional foreign keys. Run these only if Register.Id and Add_Books_tbl.Book_Id
-- are both INT primary keys in the database.
-- ALTER TABLE dbo.cart_tbl ADD CONSTRAINT FK_cart_tbl_Register
--     FOREIGN KEY (Cart_User_Id) REFERENCES dbo.Register(Id);
-- ALTER TABLE dbo.cart_tbl ADD CONSTRAINT FK_cart_tbl_Add_Books
--     FOREIGN KEY (Cart_Prod_Id) REFERENCES dbo.Add_Books_tbl(Book_Id);
GO