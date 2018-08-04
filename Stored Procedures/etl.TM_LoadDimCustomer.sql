SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [etl].[TM_LoadDimCustomer] 

as
BEGIN



--	TM
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Wild', @LoadView = 'ods.vw_TM_LoadDimCustomer', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


	update t 
	set t.IsDeleted = 1, t.DeleteDate = getdate()
	, UpdatedDate = GETDATE()
	from dbo.DimCustomer t (NOLOCK)
	left outer join ods.TM_Cust s (NOLOCK)
		on t.SSID = convert(varchar(25), s.acct_id) + ':' + convert(varchar(25), s.cust_name_id)
	WHERE t.SourceSystem = 'TM' and s.acct_id is NULL AND t.IsDeleted = 0

END





GO
