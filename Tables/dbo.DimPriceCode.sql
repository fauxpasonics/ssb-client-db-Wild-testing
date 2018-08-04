CREATE TABLE [dbo].[DimPriceCode]
(
[DimPriceCodeId] [int] NOT NULL IDENTITY(1, 1),
[DimSeasonId] [int] NOT NULL,
[DimItemId] [int] NOT NULL,
[PriceCode] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceCodeDesc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceCodeClass] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PC1] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PC2] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PC3] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PC4] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsEnabled] [bit] NULL,
[EventSallable] [bit] NULL,
[PcSellable] [bit] NULL,
[InetPcSellable] [bit] NULL,
[TotalEvents] [int] NULL,
[Price] [decimal] (18, 6) NULL,
[ParentPriceCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketTypeCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FullPriceTicketTypeCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TtCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketTypeDesc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketTypeCategory] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompIndicator] [bit] NULL,
[DefaultHostOfferId] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketTypeRelationship] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PricingMethod] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TmPriceLevel] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TmTicketType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketTemplateOverride] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketTemplate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceCodeGroup] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceCodeInfo1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceCodeInfo2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceCodeInfo3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceCodeInfo4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceCodeInfo5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrintedPrice] [decimal] (18, 6) NOT NULL,
[PcTicket] [decimal] (18, 6) NOT NULL,
[PcTax] [decimal] (18, 6) NOT NULL,
[PcLicenseFee] [decimal] (18, 6) NOT NULL,
[PcOther1] [decimal] (18, 6) NOT NULL,
[PcOther2] [decimal] (18, 6) NOT NULL,
[TaxRateA] [decimal] (18, 6) NOT NULL,
[TaxRateB] [decimal] (18, 6) NOT NULL,
[TaxRateC] [decimal] (18, 6) NOT NULL,
[OnsaleDatetime] [datetime] NULL,
[OffsaleDatetime] [datetime] NULL,
[InetOnSaleDatetime] [datetime] NULL,
[InetOffSaleDatetime] [datetime] NULL,
[InetPriceCodeName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InetOfferText] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InetFullPrice] [decimal] (18, 6) NULL,
[InetMinTicketsPerTran] [int] NULL,
[InetMaxTicketsPerTran] [int] NULL,
[TidFamilyId] [int] NULL,
[OnPurchAddToAcctGroupId] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoAddMembershipName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RequiredMembershipList] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CardTemplateOverride] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CardTemplate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LedgerId] [int] NULL,
[LedgerCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MerchantId] [int] NULL,
[MerchantCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MerchantColor] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MembershipRequiredForPurpose] [bit] NULL,
[MembershipIdForMembership] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MembershipName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MembershipExpirationDate] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ClubGroupEnabled] [bit] NULL,
[IsRenewal] [bit] NULL,
[SSCreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSUpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSCreatedDate] [datetime] NULL,
[SSUpdatedDate] [datetime] NULL,
[SSID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSID_event_id] [int] NULL,
[SSID_price_code] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeltaHashKey] [binary] (32) NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NOT NULL,
[UpdatedDate] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL,
[DeleteDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[DimPriceCode] ADD CONSTRAINT [PK_DimPriceCode_1] PRIMARY KEY CLUSTERED  ([DimPriceCodeId])
GO
CREATE NONCLUSTERED INDEX [IDX_PC1] ON [dbo].[DimPriceCode] ([PC1])
GO
CREATE NONCLUSTERED INDEX [IDX_PC2] ON [dbo].[DimPriceCode] ([PC2])
GO
CREATE NONCLUSTERED INDEX [IDX_PC3] ON [dbo].[DimPriceCode] ([PC3])
GO
CREATE NONCLUSTERED INDEX [IDX_PC4] ON [dbo].[DimPriceCode] ([PC4])
GO
CREATE NONCLUSTERED INDEX [IDX_PriceCode] ON [dbo].[DimPriceCode] ([PriceCode])
GO
CREATE NONCLUSTERED INDEX [IDX_PriceCodeGroup] ON [dbo].[DimPriceCode] ([PriceCodeGroup])
GO
CREATE NONCLUSTERED INDEX [IDX_SSID_price_code] ON [dbo].[DimPriceCode] ([SSID_price_code])
GO
CREATE NONCLUSTERED INDEX [IX_UpdatedDate] ON [dbo].[DimPriceCode] ([UpdatedDate] DESC)
GO
