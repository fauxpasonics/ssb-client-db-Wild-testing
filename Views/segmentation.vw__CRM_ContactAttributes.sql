SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [segmentation].[vw__CRM_ContactAttributes]
AS

SELECT dc.SSB_CRMSYSTEM_CONTACT_ID 
, anniversary
, annualincome, annualincome_base, birthdate, childrensnames
, client_201314sohcustomer, client_201314sohcustomername, client_additionalthoughtsteamandpalyers
, client_additionalthoughtswildsatisfaction, client_anythingelsewildexperience, client_attendancecategory
, client_averagecost, client_avgsportsevtsperyear, client_birthdate, client_blockpurchasedprice
, client_blockpurchasedprice_base, client_brokerflag, client_businessmaintel, client_cdoflag
, client_childrenpresent, client_childrenpresentinhh, client_closedgroupoppnotthisseason
, client_closedgroupoppnotthisseasonname, client_closedgroupoppthisseason, client_closedgroupoppthisseasonname
, client_closedticketoppthisseason, client_closedticketoppthisseasonname, client_compltedtps, client_contactid
, client_currentseasonadditionaltickets, client_cust_name_id, client_dateofform, client_dii
, client_disttoclientvenue, client_emaillastmodifieddate, client_estannualhhincome, client_event_name
, client_eventcode, client_fanrelationsticketgroup, client_fencesitter, client_fse_value, client_fsevalue
, client_fullplanscore, client_fullymissedgames, client_game, client_game1date, client_game1message
, client_game2date, client_game2message, client_game3date, client_game3message, client_game4message
, client_game5message, client_game6message, client_game7message, client_gamedate4, client_gamespurchased
, client_groupformspecialrequestandcomments, client_groupticketoppforcurrentseason, client_groupticketoppforcurrentseasonname
, client_halfplanscore, client_hooverscompanyname, client_incementalinvestment, client_initialmembershippackagesent
, client_initialmembershippackagesentname, client_inputindoccupation, client_kidsclubmembershippaid
, client_kidsclubmembershippaidname, client_kidsclubmembertype, client_kidsclubmembertypename
, client_kidsclubpaymentstatus, client_kidsclubpaymentstatusname, client_kidsclubpaymenttype
, client_kidsclubpaymenttypename,  client_lifestyleattribute1, client_likelihoodtorenew, client_mailorderdonor
, client_mergetoeloqua, client_mergetoeloquaname, client_millitaryaffiliation, client_millitaryaffiliationname
, client_monthsincelastevent, client_monthssincelastpurch, client_multipleticketopps, client_nextautofollowupdate
, client_numberofkids, client_numberofseats, client_numberoftickets, client_numofticketops, client_numoftouchpoints
, client_numseats, client_ofseats_game1, client_ofseats_game1name, client_oldemail, client_opengroupoppnotthisseason
, client_opengroupoppnotthisseasonname, client_opengroupoppthisseason, client_opengroupoppthisseasonname
, client_opportunitythisyear, client_opportunitythisyearname, client_paidamount, client_paidamount_base
, client_paymentplanoptions
 , client_personicxcluster, client_personicxgroup, client_pin, client_plangrade, client_planscore
 , client_plantypeforrenewal, client_planvalue, client_planvalue_base, client_postaltrackingnumber
 , client_premiumseatingemailquestion, client_premiumseatingemailquestionname, client_primary_age
, client_product, client_productname, client_promocode, client_repinterenallimitemail
, client_repinterenallimitemailname, client_satisfactionbuildingacompetitiveteam, client_satisfactionfanrelationsrep
, client_scheduledtime, client_signupdate, client_singleplanscore, client_sm_abilitytoreselltickets
, client_sm_overallgamedayexperience, client_sm_playoffpriority, client_sm_teamperformance
, client_sm_ticketprices, client_sm_timeconstraints, client_smstexttrigger, client_sthprofilecompleteness
, client_suggestedpackage, client_tenurecategory, client_tixpricegrade, client_tixpricescore
, client_tkteventprice101201, client_totalkidclubmemberships, client_totalspent
, client_totalspentdollars, client_totseasspndgrade, client_totseasspndscore, client_totsportsevents
, client_totsportsspend, client_touchpointid, client_touchpointlookup, client_unidentifiedpartner
, client_unidentifiedpartnername, client_upgradefrom, client_upgradefromname, client_wildenews
, client_wildenewsname, client_wildfanrelationsrep, client_wildticketgroup, client_wrhasloggedin
, client_wrhasloggedinname, client_wrnooflogins, client_wrpromopoints, client_wrroadgamepoints
, client_wrsocialmediapoints, client_wrspecialeventspoints, cm_donotsms, cm_donotsmsname, cm_isanonymous
, cm_isanonymousname, cm_leadscore, contactid, pc.createdby, createdbyname, createdbyyominame, createdon
, createdonbehalfby, createdonbehalfbyname, createdonbehalfbyyominame
, creditonhold, creditonholdname, customersizecode, customersizecodename, customertypecode, customertypecodename
, donotbulkemail, donotbulkemailname
, donotbulkpostalmail, donotbulkpostalmailname, donotemail, donotemailname, donotfax, donotfaxname, donotphone
, donotphonename, donotpostalmail, donotpostalmailname, donotsendmarketingmaterialname, donotsendmm
, kore_checkedoutby, kore_checkedoutbyname
, kore_checkedoutbyyominame, kore_checkedoutuntil, kore_groupbuyername, kore_groupcategory, kore_groupcategoryname
, kore_groupsalesrep, kore_groupsalesrepname, kore_groupsalesrepyominame, kore_heritagenationality, kore_importid
, kore_invoicebalance, kore_invoicebalance_base, kore_lastcontacted, kore_lastcontactedbyid, kore_lastcontactedbyidname
, kore_lastcontactedbyidyominame, kore_lastsync, kore_listattributename, kore_listattributevalue
, kore_managerphonedncstatus, kore_managerphonedncstatusname, kore_milesfromfacility, kore_miniplanholder
, kore_miniplanholdername, kore_mobilephonedncstatus, kore_mobilephonedncstatusname, kore_optoutofduplicatedetection
, kore_optoutofduplicatedetectionname, kore_overridecheckoutexpiration, kore_overridecheckoutexpirationname
, kore_parentcustomeridstrippedname, kore_primaryaccountnumber, kore_primaryarchticsid, kore_seasonticketholder
, kore_seasonticketholdername, kore_secondaryarchticsname, kore_secondaryemail, kore_senioritydate, kore_sincedate
, kore_sourcemarketinglistid, kore_sourcemarketinglistidname, kore_stateorprovinceid, kore_stateorprovinceidname
, kore_suitebuyer, kore_suitebuyername, kore_suitesalesrep, kore_suitesalesrepname, kore_suitesalesrepyominame
, kore_ticketingcontacttype, kore_ticketingcontacttypename, kore_ticketingsalesrep, kore_ticketingsalesrepname
, kore_ticketingsalesrepyominame, kore_ticketingservicerep, kore_ticketingservicerepname, kore_ticketingservicerepyominame
, kore_ticketingtype, kore_ticketingtypename, kore_type, kore_typename, koreps_accountstrippedname
, koreps_appointmentsin90days, koreps_callsin90days, koreps_companyid, koreps_consecutivemissedgames
, koreps_consecutiveseasons, koreps_contacttype, koreps_contacttypename, koreps_disablecontactsync
, koreps_disablecontactsyncname, koreps_donotstream, koreps_donotstreamname, koreps_emailsin90days, koreps_ficoscore
, koreps_invalidemail, koreps_invalidemailname, koreps_lastcontacted, koreps_nextbirthday, koreps_purchasedseasons
, koreps_seasonattendancebygames, koreps_seasonattendancebyseats, koreps_syncpriority, koreps_tenure
, koreps_ticketingaccounttype, koreps_ticketingcontacttype, lastusedincampaign, leadsourcecode
, leadsourcecodename, managername, managerphone, mastercontactidname, mastercontactidyominame, masterid
, modifiedby, modifiedbyname, modifiedon
, modifiedonbehalfby, modifiedonbehalfbyname, modifiedonbehalfbyyominame
, ownerid, owneridname, owneridtype
, parentcontactidname, parentcustomerid, parentcustomeridname
, parentcustomeridtype, parentcustomeridyominame, participatesinworkflow, participatesinworkflowname
, paymenttermscode, paymenttermscodename, preferredappointmentdaycode, preferredappointmentdaycodename
, preferredappointmenttimecode, preferredappointmenttimecodename, preferredcontactmethodcode
, preferredcontactmethodcodename, preferredequipmentid, preferredequipmentidname, preferredserviceid
, preferredserviceidname, preferredsystemuseridname
, processid, stageid, statecode
, statecodename, statuscode, statuscodename
FROM Wild_Reporting.[Prodcopy].[vw_Contact] pc
JOIN [dbo].[vwDimCustomer_ModAcctId] dc ON dc.SourceSystem = 'Dynamics CRM - Contacts'  AND CAST(pc.contactid AS NVARCHAR(100)) = dc.SSID









GO
