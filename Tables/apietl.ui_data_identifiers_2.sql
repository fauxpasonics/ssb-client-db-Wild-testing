CREATE TABLE [apietl].[ui_data_identifiers_2]
(
[ui_data_identifiers_id] [uniqueidentifier] NOT NULL,
[ui_data_id] [uniqueidentifier] NULL,
[identifier] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[active] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[ui_data_identifiers_2] ADD CONSTRAINT [PK__ui_data___5C01762BCBF919DE] PRIMARY KEY CLUSTERED  ([ui_data_identifiers_id])
GO
