SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_sync_TM_Class] AS (

SELECT * FROM ods.TM_Class (NOLOCK)

)

GO
