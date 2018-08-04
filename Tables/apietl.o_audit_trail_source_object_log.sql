CREATE TABLE [apietl].[o_audit_trail_source_object_log]
(
[audit_id] [uniqueidentifier] NOT NULL,
[o_id] [uniqueidentifier] NULL,
[session_id] [uniqueidentifier] NOT NULL,
[insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__o_audit_t__inser__07CCE17F] DEFAULT (getutcdate()),
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[raw_response] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_audit_trail_source_object_log] ADD CONSTRAINT [PK__o_audit___5AF33E33366BDCAD] PRIMARY KEY CLUSTERED  ([audit_id])
GO
