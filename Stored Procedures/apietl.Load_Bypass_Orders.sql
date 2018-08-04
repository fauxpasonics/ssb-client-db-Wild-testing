SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/************************************************
-- Author:		Ismail Fuseini
-- Create date: 11/28/2016
-- Description:	Load sProc for Bypass Orders

-- Change date: 04/21/2017 - AMEITIN 
Changed o.Loyalty_Account to NULL until Bypass confirms there are no credit card numbers in the data
***************************************************/
CREATE PROCEDURE [apietl].[Load_Bypass_Orders]
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;

    -- Insert statements for procedure here
        MERGE ods.Bypass_Orders_API AS TARGET
        USING
            (
              SELECT    o.ETL__insert_datetime AS [ETL__CreatedDate]
                      , GETDATE() AS [ETL__UpdatedDate]
                      , o.id
                      , o.state
                      , o.friendly_id
                      , o.name
                      , o.created_at
                      , CAST(o.total AS DECIMAL(13, 4)) AS total
                      , o.tippable
                      , CAST(o.tip AS DECIMAL(13, 4)) AS tip
                      , o.updated_at
                      , o.errors
                      , o.uuid
                      , CAST(o.subtotal AS DECIMAL(13, 4)) AS subtotal
                      , o.seat
                      , o.seat_number
                      , o.order_taker_name
                      , o.discounts_total
                      , o.sales_tax_total
                      , CAST(o.surcharge AS DECIMAL(13, 4)) AS surcharge
                      , CAST(o.balance_due AS DECIMAL(13, 4)) AS balance_due
                      , o.device_serial_number
                      , o.location_id
                      , o.service_location_id
                      , NULL AS loyalty_account --change 4/21/2017
                      , o.number_of_guests
                      , oc.id AS vendor_id
                      , oc.name AS venodr_name
                      , oc.description AS vendor_description
                      , o.concession
                      , o.section
                      , o.row
                      , o.gratuity_configuration_snapshot
              FROM      apietl.bypass_orders_0 AS o
                        INNER JOIN apietl.bypass_orders_concession_1 AS oc ON oc.ETL__bypass_orders_id = o.ETL__bypass_orders_id
            ) AS SOURCE
        ON ( TARGET.ETL__CreatedDate = SOURCE.ETL__CreatedDate
             AND TARGET.id = SOURCE.id
           )
        WHEN NOT MATCHED THEN
            INSERT ( ETL__CreatedDate
                   , ETL__UpdatedDate
                   , id
                   , state
                   , friendly_id
                   , name
                   , created_at
                   , total
                   , tippable
                   , tip
                   , updated_at
                   , errors
                   , uuid
                   , subtotal
                   , seat
                   , seat_number
                   , order_taker_name
                   , discounts_total
                   , sales_tax_total
                   , surcharge
                   , balance_due
                   , device_serial_number
                   , location_id
                   , service_location_id
                   , loyalty_account
                   , number_of_guests
                   , vendor_id
                   , venodr_name
                   , vendor_description
                   , concession
                   , section
                   , row
                   , gratuity_configuration_snapshot
	               )
            VALUES ( SOURCE.ETL__CreatedDate
                   , SOURCE.ETL__UpdatedDate
                   , SOURCE.id
                   , SOURCE.state
                   , SOURCE.friendly_id
                   , SOURCE.name
                   , SOURCE.created_at
                   , SOURCE.total
                   , SOURCE.tippable
                   , SOURCE.tip
                   , SOURCE.updated_at
                   , SOURCE.errors
                   , SOURCE.uuid
                   , SOURCE.subtotal
                   , SOURCE.seat
                   , SOURCE.seat_number
                   , SOURCE.order_taker_name
                   , SOURCE.discounts_total
                   , SOURCE.sales_tax_total
                   , SOURCE.surcharge
                   , SOURCE.balance_due
                   , SOURCE.device_serial_number
                   , SOURCE.location_id
                   , SOURCE.service_location_id
                   , SOURCE.loyalty_account
                   , SOURCE.number_of_guests
                   , SOURCE.vendor_id
                   , SOURCE.venodr_name
                   , SOURCE.vendor_description
                   , SOURCE.concession
                   , SOURCE.section
                   , SOURCE.row
                   , SOURCE.gratuity_configuration_snapshot
	               )
        OUTPUT
            $action
          , GETDATE() LOG_DATE
          , Inserted.ETL__ID
          , Inserted.ETL__CreatedDate
          , Inserted.ETL__UpdatedDate
          , Inserted.id
          , Inserted.state
          , Inserted.friendly_id
          , Inserted.name
          , Inserted.created_at
          , Inserted.total
          , Inserted.tippable
          , Inserted.tip
          , Inserted.updated_at
          , Inserted.errors
          , Inserted.uuid
          , Inserted.subtotal
          , Inserted.seat
          , Inserted.seat_number
          , Inserted.order_taker_name
          , Inserted.discounts_total
          , Inserted.sales_tax_total
          , Inserted.surcharge
          , Inserted.balance_due
          , Inserted.device_serial_number
          , Inserted.location_id
          , Inserted.service_location_id
          , Inserted.loyalty_account
          , Inserted.number_of_guests
          , Inserted.vendor_id
          , Inserted.venodr_name
          , Inserted.vendor_description
          , Inserted.concession
          , Inserted.section
          , Inserted.row
          , Inserted.gratuity_configuration_snapshot
          , Deleted.ETL__ID
          , Deleted.ETL__CreatedDate
          , Deleted.ETL__UpdatedDate
          , Deleted.id
          , Deleted.state
          , Deleted.friendly_id
          , Deleted.name
          , Deleted.created_at
          , Deleted.total
          , Deleted.tippable
          , Deleted.tip
          , Deleted.updated_at
          , Deleted.errors
          , Deleted.uuid
          , Deleted.subtotal
          , Deleted.seat
          , Deleted.seat_number
          , Deleted.order_taker_name
          , Deleted.discounts_total
          , Deleted.sales_tax_total
          , Deleted.surcharge
          , Deleted.balance_due
          , Deleted.device_serial_number
          , Deleted.location_id
          , Deleted.service_location_id
          , Deleted.loyalty_account
          , Deleted.number_of_guests
          , Deleted.vendor_id
          , Deleted.venodr_name
          , Deleted.vendor_description
          , Deleted.concession
          , Deleted.section
          , Deleted.row
          , Deleted.gratuity_configuration_snapshot
            INTO ods.Audit_Bypass_Orders;
    END;



GO
