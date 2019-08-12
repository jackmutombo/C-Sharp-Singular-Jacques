CREATE TABLE [dbo].[BasketDetail]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [BasketId] INT NOT NULL, 
    [ProductId] INT NOT NULL, 
	[Quantity] INT NOT NULL DEFAULT 1,
    [Price] MONEY NOT NULL, 
    [Time] DATETIME2 NOT NULL DEFAULT getutcdate(), 
    CONSTRAINT [FK_BasketDetail_ToBasket] FOREIGN KEY (BasketId) REFERENCES Basket(Id), 
    CONSTRAINT [FK_BasketDetail_ToProduct] FOREIGN KEY (ProductId) REFERENCES Product(Id)
	)
   
