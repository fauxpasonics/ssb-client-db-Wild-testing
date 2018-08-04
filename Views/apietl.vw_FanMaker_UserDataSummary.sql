SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [apietl].[vw_FanMaker_UserDataSummary]
AS

SELECT u.Username, ud.UserID
	, CASE WHEN ud.UserID IS NOT NULL THEN 1 ELSE 0 END AS HasDetails
	, CASE WHEN uh.UserID IS NOT NULL THEN 1 ELSE 0 END AS HasHistory
FROM ods.FanMaker_Users_New u (NOLOCK)
LEFT JOIN ods.FanMaker_UserDetails_Email ud (NOLOCK)
	ON u.Username = ud.ContactInfo_Email
LEFT JOIN (
		SELECT DISTINCT ETL__multi_query_value_for_audit AS UserID
		FROM apietl.FanMaker_UserHistory (NOLOCK)
	) uh ON ud.UserID = uh.UserID





GO
