SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [rpt].[DimCustomer_Waterfall]
AS
SELECT a.SourceSystem
	, b.LastUpdate
	, a.RecordCount TotalRecordCount
	, (a.RecordCount - a.DistinctRecordCount) Source_Duplicates
	, a.DistinctRecordCount
	, CAST(CAST((CAST((a.RecordCount - a.DistinctRecordCount) AS DECIMAL(15,2))/CAST(a.DistinctRecordCount AS DECIMAL(15,2))) AS DECIMAL(5,2))*100 AS NVARCHAR(10)) + '%' PercentTotal
	, b.ValidAddress
	, b.ValidPhone
	, b.ValidEmail
--INTO rpt.TEMP_DimCustomer_Waterfall
FROM ( --#tmpa a
		SELECT SourceSystem
			, COUNT(SSB_CRMSYSTEM_CONTACT_ID) RecordCount
			, COUNT(DISTINCT SSB_CRMSYSTEM_CONTACT_ID) DistinctRecordCount
		FROM dbo.dimcustomerssbid (NOLOCK)
		WHERE IsDeleted <> 1
		GROUP BY SourceSystem
	) a
INNER JOIN ( --#tmpb b 
		SELECT SourceSystem
			, SUM(CASE WHEN AddressPrimaryIsCleanStatus = 'Valid' THEN 1
				ELSE 0
				END) AS ValidAddress
			, SUM(CASE WHEN PhonePrimaryIsCleanStatus = 'Valid' THEN 1
				ELSE 0
				END) AS ValidPhone
			, SUM(CASE WHEN EmailPrimaryIsCleanStatus = 'Valid' THEN 1
				ELSE 0
				END) AS ValidEmail
			, MAX(UpdatedDate) LastUpdate
		FROM dbo.DimCustomer (NOLOCK)
		WHERE IsDeleted <> 1
		GROUP BY SourceSystem
	) b
	ON a.SourceSystem = b.SourceSystem
LEFT OUTER JOIN (
		SELECT
			ss.SourceSystem,
			ssp.SourceSystemPriority
		FROM mdm.SourceSystemPriority ssp
		INNER JOIN mdm.SourceSystems ss
			ON  ssp.SourceSystemId = ss.SourceSystemID
		WHERE ElementID = 1
	) p
	ON  a.SourceSystem = p.SourceSystem
ORDER BY ISNULL(p.SourceSystemPriority, -1) DESC, a.SourceSystem
GO
