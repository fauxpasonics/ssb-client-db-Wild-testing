SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_UserDetails]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [UserID_K]
	,CONVERT(NVARCHAR(50),[status]) [Status]
	,CONVERT(NVARCHAR(50),[success]) [Success]
	,CONVERT(NVARCHAR(50),[EmailDeliverable]) [EmailDeliverable]
	,CONVERT(NVARCHAR(255),[Fanfluence]) [Fanfluence]
	,CONVERT(NVARCHAR(255),[FirstName]) [FirstName]
	,CONVERT(NVARCHAR(255),[LastName]) [LastName]
	,CONVERT(NVARCHAR(500),[profileURL]) [ProfileURL]
	,CONVERT(DATETIME2,[CreatedAt]) [CreatedAt]
	,CONVERT(DATETIME2,[TCAcceptedAt]) [TCAcceptedAt]
	,CONVERT(NVARCHAR(50),[MembershipAssignment]) [MembershipAssignment]
FROM [src].[FanMaker_UserDetails] WITH (NOLOCK)
WHERE profileURL IS NOT NULL

GO
