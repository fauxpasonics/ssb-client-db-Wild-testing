CREATE TABLE [apietl].[u_data_identifiers_2]
(
[u_data_identifiers_id] [uniqueidentifier] NOT NULL,
[u_data_id] [uniqueidentifier] NULL,
[identifier] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[active] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[u_data_identifiers_2] ADD CONSTRAINT [PK__u_data_i__8810B89D7CC92D3A] PRIMARY KEY CLUSTERED  ([u_data_identifiers_id])
GO
