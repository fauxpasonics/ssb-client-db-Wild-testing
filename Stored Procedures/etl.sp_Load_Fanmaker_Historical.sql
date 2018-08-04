SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[sp_Load_Fanmaker_Historical]
AS


INSERT INTO ods.FanMaker_Activities (ETL__CreatedDate, ETL__UpdatedDate, email, [identity], [type], subtype, [subject], created_at, source_url, worth, awarded, FanMakerActivitiesDirtyHash)

SELECT GETDATE(), GETDATE(), h.email, h.[identity], h.[type], h.subtype, h.[subject], h.created_at, h.source_url, h.worth, h.awarded, NULL
FROM etl.vw_Load_Fanmaker_Historical h
LEFT JOIN ods.FanMaker_Activities f
	ON h.email = f.email
	AND h.[identity] = f.[identity]
	AND h.[type] = f.[type]
	AND h.subtype = f.subtype
	AND h.[subject] = f.[subject]
	AND CAST(h.created_at AS DATETIME) = CAST(f.created_at AS DATETIME)
	AND h.source_url = f.source_url
	AND h.worth = f.worth
	AND h.awarded = f.awarded
WHERE f.ETL__ID IS NULL




GO
