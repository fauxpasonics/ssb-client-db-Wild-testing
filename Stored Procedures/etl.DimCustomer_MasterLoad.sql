SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








/*******CHANGE LOG*********
5/2/2017 - AMEITIN added FanMaker
11/7/2017 - AMEITIN standardized view names

*************************/


CREATE PROCEDURE [etl].[DimCustomer_MasterLoad]

AS
BEGIN



--	CRM Account
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Wild', @LoadView = 'etl.vw_Load_DimCustomer_DynamicsAccount', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'



--	CRM Contact
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Wild', @LoadView = 'etl.vw_Load_DimCustomer_DynamicsContacts', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


--	Eloqua
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Wild', @LoadView = 'etl.vw_Load_DimCustomer_Eloqua', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


--	FanMaker
--	EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Wild', @LoadView = '[etl].[vw_Load_DimCustomer_FanMaker]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

--	NCR Retail (added 12/22 by AMEITIN)
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'Wild', @LoadView = '[etl].[vw_Load_DimCustomer_NCR_Retail]', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'





END












GO
