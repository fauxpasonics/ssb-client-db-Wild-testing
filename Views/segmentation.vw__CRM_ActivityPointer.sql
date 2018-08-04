SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [segmentation].[vw__CRM_ActivityPointer]
AS

SELECT dc.SSB_CRMSYSTEM_CONTACT_ID 
, activitytypecodename, actualend, actualstart, createdbyname, createdon
, createdonbehalfbyname, deliveryprioritycode
, deliveryprioritycodename, instancetypecode, instancetypecodename, isbilled
, isbilledname, ismapiprivate, ismapiprivatename, isregularactivity, isregularactivityname, isworkflowcreated
, isworkflowcreatedname, leftvoicemail, leftvoicemailname, modifiedbyname
, modifiedon, modifiedonbehalfbyname, owneridname
, prioritycode, prioritycodename, processid
, statecode, statecodename, statuscode, statuscodename
, [subject]
FROM Wild_Reporting.[Prodcopy].[ActivityPointer] pc (NOLOCK) 
JOIN [dbo].[vwDimCustomer_ModAcctId] dc ON dc.SourceSystem = 'Dynamics CRM - Contacts' AND CAST(pc.regardingobjectid AS NVARCHAR(100)) = dc.SSID 
WHERE pc.regardingobjecttypecode = 'contact'










GO
