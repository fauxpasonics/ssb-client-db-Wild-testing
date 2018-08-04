CREATE TABLE [audit].[TaskBatchLog]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[ParentID] [int] NULL,
[Step] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RunSQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExecuteStart] [datetime] NULL,
[ExecuteEnd] [datetime] NULL,
[ExecutionRuntimeSeconds] AS (CONVERT([float],datediff(second,[ExecuteStart],[ExecuteEnd]),(0))),
[CreatedOn] [datetime] NULL CONSTRAINT [DF__TaskBatch__Creat__323C154A] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__TaskBatch__Creat__33303983] DEFAULT (suser_sname())
)
GO
ALTER TABLE [audit].[TaskBatchLog] ADD CONSTRAINT [PK__TaskBatc__3214EC2777EA7AA3] PRIMARY KEY CLUSTERED  ([ID])
GO
ALTER TABLE [audit].[TaskBatchLog] ADD CONSTRAINT [FK_TaskBatchLog_ParentID] FOREIGN KEY ([ParentID]) REFERENCES [audit].[TaskBatchLog] ([ID])
GO
