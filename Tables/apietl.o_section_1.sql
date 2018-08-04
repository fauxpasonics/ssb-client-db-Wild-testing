CREATE TABLE [apietl].[o_section_1]
(
[o_section_id] [uniqueidentifier] NOT NULL,
[o_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_section_1] ADD CONSTRAINT [PK__o_sectio__5C8E7EC1E51D8F7A] PRIMARY KEY CLUSTERED  ([o_section_id])
GO
