SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[FanMaker_Users_New]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(20),[Status]) [Status]
	,CONVERT(NVARCHAR(20),[Success]) [Success]
	,CONVERT(NVARCHAR(255),[Username]) [Username_K]
	,CONVERT(DATETIME2,[CreatedAt]) [CreatedAt]
	,CONVERT(NVARCHAR(100),[UserID]) [UserID]
FROM [src].[FanMaker_Users] WITH (NOLOCK)
WHERE ISNULL(Username, '') <> ''
GO
