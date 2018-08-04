CREATE TABLE [apietl].[fanmaker_getusers_audit_trail_source_object_log]
(
[ETL__audit_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_getusers_id] [uniqueidentifier] NULL,
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__fanmaker___inser__0B335E0F] DEFAULT (getutcdate()),
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[raw_response] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_getusers_audit_trail_source_object_log] ADD CONSTRAINT [PK__fanmaker__5AF33E3312D53BFF] PRIMARY KEY CLUSTERED  ([ETL__audit_id])
GO
