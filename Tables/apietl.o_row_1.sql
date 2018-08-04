CREATE TABLE [apietl].[o_row_1]
(
[o_row_id] [uniqueidentifier] NOT NULL,
[o_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seats_array] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_row_1] ADD CONSTRAINT [PK__o_row_1__BE31F810AE198388] PRIMARY KEY CLUSTERED  ([o_row_id])
GO
