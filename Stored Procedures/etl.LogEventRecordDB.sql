SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



 
CREATE PROCEDURE [etl].[LogEventRecordDB] 
(
	@BatchId NVARCHAR(50) = 0,
	@ClientId NVARCHAR(255) = NULL,
	@EventLevel NVARCHAR(255) = 'Info', 	
	@EventSource NVARCHAR(255) = NULL, 
	@EventCategory NVARCHAR(255) = NULL,
	@LogEvent NVARCHAR(255), 
	@LogMessage NVARCHAR(2000) = NULL,
	@ExecutionId UNIQUEIDENTIFIER = NULL
)
AS

BEGIN

SET NOCOUNT ON;

BEGIN TRY

	INSERT INTO CentralIntelligence.etl.EventLog (BatchId, Client, EventLevel, EventSource, EventCategory, LogEvent, LogMessage, EventDate, ExecutionId, UserName, SourceSystem)
	VALUES (@BatchId, DB_NAME(), @EventLevel, @EventSource, @EventCategory, @LogEvent, @LogMessage, GETDATE(), ISNULL(@ExecutionId, NEWID()), SUSER_NAME(), HOST_NAME())

END TRY
BEGIN CATCH
	
END CATCH

END






GO
