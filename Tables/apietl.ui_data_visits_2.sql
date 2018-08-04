CREATE TABLE [apietl].[ui_data_visits_2]
(
[ui_data_visits_id] [uniqueidentifier] NOT NULL,
[ui_data_id] [uniqueidentifier] NULL,
[last_login] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[desktop] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mobile] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[ui_data_visits_2] ADD CONSTRAINT [PK__ui_data___02DBA74A81A2C4C6] PRIMARY KEY CLUSTERED  ([ui_data_visits_id])
GO
