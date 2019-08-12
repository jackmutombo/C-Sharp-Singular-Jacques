﻿/*
Deployment script for JacquesSingularTestVer

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "JacquesSingularTestVer"
:setvar DefaultFilePrefix "JacquesSingularTestVer"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [dbo].[spAddress_Insert]...';


GO
CREATE PROCEDURE [dbo].[spAddress_Insert]
	@Id int output,
	@Type nvarchar(50),
	@AddressName nvarchar(200),
	@Street nvarchar(100),
	@Suburb nvarchar(100),
	@City nvarchar(100),
	@PostalCode nvarchar(50),
	@AuthUserId nvarchar(128)
AS

BEGIN

	SET NOCOUNT ON;

	insert into dbo.Address([Type], AddressName, Street,Suburb, City, PostalCode, AuthUserId)
	values (@Type, @AddressName, @Street,Suburb, @City, @PostalCode, @AuthUserId);

	SELECT CAST(SCOPE_IDENTITY() as int);

	select @Id =@@IDENTITY;

END
GO
PRINT N'Creating [dbo].[spUser_Insert]...';


GO
CREATE PROCEDURE [dbo].[spUser_Insert]
@Id int output,
	@AuthUserId nvarchar(128),
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@EmailAddress nvarchar(256),
	@CellPhone varchar(20)

AS

BEGIN

	SET NOCOUNT ON;

	insert into [dbo].[User](AuthUserId, FirstName, LastName, EmailAddress, CellPhone)
	values (@AuthUserId, @FirstName, @LastName, @EmailAddress, @CellPhone);

	SELECT CAST(SCOPE_IDENTITY() as int);

	select @Id =@@IDENTITY;

END
GO
PRINT N'Update complete.';


GO
