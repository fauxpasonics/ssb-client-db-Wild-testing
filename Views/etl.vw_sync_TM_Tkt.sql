SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_sync_TM_Tkt] AS (

SELECT * FROM ods.TM_Tkt (NOLOCK)

)

GO
