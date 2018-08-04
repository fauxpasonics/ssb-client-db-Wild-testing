CREATE TABLE [apietl].[bypass_orders_audit_trail_source_object_log]
(
[ETL__audit_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_id] [uniqueidentifier] NULL,
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__bypass_or__inser__2EE8454E] DEFAULT (getutcdate()),
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[raw_response] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_audit_trail_source_object_log] ADD CONSTRAINT [PK__bypass_o__5AF33E339F57EEEF] PRIMARY KEY CLUSTERED  ([ETL__audit_id])
GO
