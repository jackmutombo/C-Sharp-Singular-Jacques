CREATE TABLE [dbo].[Basket]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [AuthUserId] NVARCHAR(128) NOT NULL, 
    [TotalAmount] MONEY NULL DEFAULT 0, 
    CONSTRAINT [FK_Basket_ToUser] FOREIGN KEY (AuthUserId) REFERENCES [User](AuthUserId)
)
