SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [preods].[FanMaker_UserHistory_Transactions]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) UserID_K
	,CONVERT(NVARCHAR(50),ISNULL([Status], '')) [Status_K]
	,CONVERT(NVARCHAR(50),ISNULL([Success], '')) [Success_K]
	,CONVERT(DATETIME2,ISNULL([TransactionsPurchasedAt], '')) [PurchasedAt_K]
	,CONVERT(DATETIME2,ISNULL([TransactionsCreatedAt], '')) [CreatedAt_K]
	,CONVERT(NVARCHAR(50),ISNULL([TransactionsDataType], '')) [DataType_K]
	,CONVERT(NVARCHAR(100),ISNULL([TransactionsTransactionNumber], '')) [TransactionNumber_K]
	,CONVERT(NVARCHAR(100),ISNULL([TransactionsTransactionID], '')) [TransactionID_K]
	,CONVERT(NVARCHAR(100),ISNULL([TransactionsEventID], '')) [EventID_K]
	,CONVERT(NVARCHAR(100),ISNULL([TransactionsLocationID], '')) [LocationID_K]
	,CONVERT(NVARCHAR(100),ISNULL([TransactionsTerminalID], '')) [TerminalID_K]
	,CONVERT(NVARCHAR(100),ISNULL([TransactionsMemberID], '')) [MemberID_K]
	,CONVERT(NVARCHAR(100),ISNULL([TransactionsTableNumber], '')) [TableNumber_K]
	,CONVERT(INT,ISNULL([TransactionsTransactionItemsTotalCents], '')) [TransactionItemsTotalCents_K]
	,CONVERT(INT,ISNULL([TransactionsTransactionItemsPriceCents], '')) [TransactionItemsPriceCents_K]
	,CONVERT(INT,ISNULL([TransactionsTransactionItemsQuantity], '')) [TransactionItemsQuantity_K]
	,CONVERT(NVARCHAR(255),ISNULL([TransactionsTransactionItemsName], '')) [TransactionItemsName_K]
	,CONVERT(NVARCHAR(255),ISNULL([TransactionsTransactionItemsCategory], '')) [TransactionItemsCategory_K]
	,CONVERT(NVARCHAR(255),ISNULL([TransactionsTransactionItemsBucket], '')) [TransactionItemsBucket_K]
FROM [src].[FanMaker_UserHistory] WITH (NOLOCK)
WHERE TransactionsCreatedAt IS NOT NULL



GO
