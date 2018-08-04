CREATE TABLE [apietl].[ui_audit_trail_source_object_log]
(
[audit_id] [uniqueidentifier] NOT NULL,
[ui_id] [uniqueidentifier] NULL,
[session_id] [uniqueidentifier] NOT NULL,
[insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__ui_audit___inser__26BB7CF3] DEFAULT (getutcdate()),
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[raw_response] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[ui_audit_trail_source_object_log] ADD CONSTRAINT [PK__ui_audit__5AF33E3370F293A5] PRIMARY KEY CLUSTERED  ([audit_id])
GO
