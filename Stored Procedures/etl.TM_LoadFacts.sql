SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[TM_LoadFacts]
AS
BEGIN

	--SELECT GETDATE()

	DECLARE @BatchId INT = 0;
	DECLARE @ExecutionId uniqueidentifier = newid();
	DECLARE @ProcedureName nvarchar(255) = OBJECT_SCHEMA_NAME(@@PROCID) + '.' + OBJECT_NAME(@@PROCID);
	DECLARE @LogEventDefault NVARCHAR(255) = 'Processing Status'

	EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Fact Load', @LogEventDefault, 'Start', @ExecutionId

	DECLARE @LoadDate DATETIME = DATEADD(DAY, -1, GETDATE())

	--UPDATE p
	--SET p.class_name = CASE WHEN p.class_name = '' THEN t.class_name ELSE p.class_name END
	--, p.sales_source_name = CASE WHEN p.sales_source_name = '' THEN t.sales_source_name ELSE p.sales_source_name END
	--, p.renewal_ind = CASE WHEN p.renewal_ind = '' THEN t.renewal_ind ELSE p.renewal_ind END
	--FROM ods.TM_Plans p
	--INNER JOIN ods.TM_Tkt t ON p.acct_id = t.acct_id AND p.event_id = t.event_id AND p.plan_event_id = t.plan_event_id AND p.order_num = t.order_num AND p.order_line_item = t.order_line_item


	EXEC etl.FactTicketSales_DeleteReturns

	EXEC [etl].[TM_LoadFactTicketSales] 0, @LoadDate

	--EXEC etl.TM_Ticket_Pacing

	EXEC [etl].[Load_FactInventory]

	EXEC [etl].[FactAttendance_UpdateAttendance]
	EXEC [etl].[FactAttendance_UpdateAttendanceAPI]
	EXEC [etl].[FactInventory_UpdateResoldSeats]

	/*EXEC [etl].[TM_ProcessMergedAccountTransactions]*/


	EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Fact Load', @LogEventDefault, 'Complete', @ExecutionId

END
GO
