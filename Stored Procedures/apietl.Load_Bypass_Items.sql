SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		Ismail Fuseini
-- Create date: 11/28/2016
-- Description:	Load sProc for Bypass Line Items
-- =============================================
CREATE PROCEDURE [apietl].[Load_Bypass_Items]
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;

    -- Insert statements for procedure here
        MERGE ods.Bypass_Line_Items_API AS TARGET
        USING
            (
              SELECT    CAST(o.created_at AS DATETIME2) AS [ETL__CreatedDate]
                      , GETDATE() AS ETL__UpdatedDate
                      , o.id AS order_id
                      , oli.id AS line_item_id
                      , CAST(oli.unit_price AS DECIMAL(13, 4)) AS unit_price
                      , CAST(oli.count AS INT) AS count
                      , oli.refunded
                      , oli.cancelled
                      , oli.name
                      , oli.menu_name
                      , oli.sku
                      , oli.printer
                      , oli.category
                      , oli.catalog
                      , oli.uuid
                      , CAST(oli.tax_rate AS DECIMAL(13, 4)) AS tax_rate
                      , CAST(oli.price AS DECIMAL(13, 4)) AS price
                      , oli.item_id
                      , CAST(oli.net_price_per_item AS DECIMAL(13, 4)) AS net_price_per_item
                      , oli.notes
                      , oli.guest
                      , oli.tax_inclusive
                      , oli.net_weight
                      , oli.tare_weight
                      , oli.weight_unit
                      , oli.discount_amount
                      , oli.discount_name
                      , oli.item_variant
                      , oli.side
                      , oli.discount_configuration_snapshot
                      , olilia.name AS addon_name
                      , CAST(olilia.quantity AS INT) AS addon_quantity
                      , CAST(olilia.price AS DECIMAL(13, 4)) AS addon_price
                      , olilia.group_name AS addon_group_name
              FROM      apietl.bypass_orders_line_items_1 AS oli
                        INNER JOIN apietl.bypass_orders_0 AS o ON o.ETL__bypass_orders_id = oli.ETL__bypass_orders_id
                        INNER JOIN apietl.bypass_orders_line_items_item_2 AS olii ON olii.ETL__bypass_orders_line_items_id = oli.ETL__bypass_orders_line_items_id
                        LEFT JOIN apietl.bypass_orders_line_items_line_item_addons_2
                        AS olilia ON olilia.ETL__bypass_orders_line_items_id = olii.ETL__bypass_orders_line_items_id
            ) AS SOURCE
        ON ( TARGET.ETL__CreatedDate = SOURCE.ETL__CreatedDate
             AND TARGET.line_item_id = SOURCE.line_item_id
           )
        WHEN NOT MATCHED THEN
            INSERT ( ETL__CreatedDate
                   , ETL__UpdatedDate
				   , order_id
                   , line_item_id
                   , unit_price
                   , count
                   , refunded
                   , cancelled
                   , name
                   , menu_name
                   , sku
                   , printer
                   , category
                   , catalog
                   , uuid
                   , tax_rate
                   , price
                   , item_id
                   , net_price_per_item
                   , notes
                   , guest
                   , tax_inclusive
                   , net_weight
                   , tare_weight
                   , weight_unit
                   , discount_amount
                   , discount_name
                   , item_variant
                   , side
                   , discount_configuration_snapshot
                   , addon_name
                   , addon_quantity
                   , addon_price
                   , addon_group_name
	               )
            VALUES ( SOURCE.ETL__CreatedDate
                   , SOURCE.ETL__UpdatedDate
				   , source.order_id
                   , SOURCE.line_item_id
                   , SOURCE.unit_price
                   , SOURCE.count
                   , SOURCE.refunded
                   , SOURCE.cancelled
                   , SOURCE.name
                   , SOURCE.menu_name
                   , SOURCE.sku
                   , SOURCE.printer
                   , SOURCE.category
                   , SOURCE.catalog
                   , SOURCE.uuid
                   , SOURCE.tax_rate
                   , SOURCE.price
                   , SOURCE.item_id
                   , SOURCE.net_price_per_item
                   , SOURCE.notes
                   , SOURCE.guest
                   , SOURCE.tax_inclusive
                   , SOURCE.net_weight
                   , SOURCE.tare_weight
                   , SOURCE.weight_unit
                   , SOURCE.discount_amount
                   , SOURCE.discount_name
                   , SOURCE.item_variant
                   , SOURCE.side
                   , SOURCE.discount_configuration_snapshot
                   , SOURCE.addon_name
                   , SOURCE.addon_quantity
                   , SOURCE.addon_price
                   , SOURCE.addon_group_name
                   );
    END;



GO
