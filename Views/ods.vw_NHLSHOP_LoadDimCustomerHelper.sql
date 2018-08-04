SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [ods].[vw_NHLSHOP_LoadDimCustomerHelper]
AS
    SELECT  mce.FAN_ID
          , mce.NAME_FIRST
          , mce.NAME_LAST
          , mce.ADDRESS2
          , mce.ADDRESS1
          , mce.CITY1
          , mce.REGION_FT
          , mce.POSTCODE1
          , mce.EMAIL
          , mce.DIRECT_MAIL_ELIGIBLE
          , mce.SEX_FT
          , mce.TELNR_MOBILE
          , mce.TELNR_LONG
          , mce.LANGUAGE_FT
          , mce.IN_MARKET
          , mce.DATA_SOURCE_NM
          , mce.CREATE_SEASON
          , mce.FAVORITE_TEAM_NAME
          , mce.FAVORITE_TEAM_CODE
          , mce.NHL_COUNTRY_ISO
          , mce.SHOP_LAST_PURCHASE_DATE
          , mce.SHOP_TOTAL_REVENUE
          , mce.SHOP_TOTAL_ORDERS
          , mce.LAST_EMAIL_OPEN_DATE
          , mce.LAST_EMAIL_CLICK_DATE
          , mce.LAST_ACTIVITY_DATE
          , mce.GCL_TOTAL_REVENUE
          , mce.GCL_TOTAL_ORDERS
          , mce.GCL_LAST_VIEW_DATE
          , mce.GCL_LAST_PURCHASE_DATE
          , mce.DEVICE_TYPE
          , mce.PLATFORM
          , mce.ACTIVITY_SOURCE
          , mce.SHOP_RECENCY_CODE
          , mce.SHOP_FREQUENCY_CODE
          , mce.SHOP_MONETARY_CODE
          , ROW_NUMBER() OVER ( PARTITION BY mce.FAN_ID,
                                CAST(mce.SHOP_LAST_PURCHASE_DATE AS DATE) ORDER BY CAST(mce.SHOP_LAST_PURCHASE_DATE AS DATE) DESC ) AS order_date_rank
    FROM    stg.MIN_CLUB_EMAIL_12132016 AS mce;
GO
