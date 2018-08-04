CREATE TABLE [apietl].[o_authorization_payment_1]
(
[o_authorization_payment_id] [uniqueidentifier] NOT NULL,
[o_id] [uniqueidentifier] NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_four_digits] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[card_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_authorization_payment_1] ADD CONSTRAINT [PK__o_author__7F63971280E63664] PRIMARY KEY CLUSTERED  ([o_authorization_payment_id])
GO
