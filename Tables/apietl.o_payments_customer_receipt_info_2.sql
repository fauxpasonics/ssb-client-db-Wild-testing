CREATE TABLE [apietl].[o_payments_customer_receipt_info_2]
(
[o_payments_customer_receipt_info_id] [uniqueidentifier] NOT NULL,
[o_payments_id] [uniqueidentifier] NULL,
[Reference Number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_payments_customer_receipt_info_2] ADD CONSTRAINT [PK__o_paymen__890C6E929C39A8D4] PRIMARY KEY CLUSTERED  ([o_payments_customer_receipt_info_id])
GO
