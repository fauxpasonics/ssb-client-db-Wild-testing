SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_Fanmaker_Historical]
AS

	SELECT Username AS email
		, NULL AS [identity]
		, [Type] AS [type]
		, Subtype AS subtype
		, [Subject] AS [subject]
		, CONVERT(DATETIME,[Date]) AS created_at
		, Link AS source_url
		, Awarded AS worth
		, Awarded AS awarded
	FROM [stg].[FanMaker_Activities_Historical20170614] (NOLOCK)











GO
