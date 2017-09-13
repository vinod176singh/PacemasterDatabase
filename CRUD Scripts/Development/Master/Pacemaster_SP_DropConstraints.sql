USE [PACEMASTER]
GO
/****** Object:  StoredProcedure [dbo].[uspDropForeignKeyConstraints]    Script Date: 12/22/2016 6:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[uspDropForeignKeyConstraints]
AS
BEGIN


IF (OBJECT_ID( 'FK_DivisionRegulatoryId_ID','F') IS NOT NULL)
ALTER TABLE dbo.DivisionUserMapping DROP CONSTRAINT FK_DivisionRegulatoryId_ID

IF (OBJECT_ID( 'FK_UserId_ID','F') IS NOT NULL)
ALTER TABLE dbo.DivisionUserMapping DROP CONSTRAINT FK_UserId_ID

IF (OBJECT_ID( 'FK_DivisionCompanyMaster_DivisionMaster','F') IS NOT NULL)
ALTER TABLE dbo.DivisionCompanyMaster DROP CONSTRAINT FK_DivisionCompanyMaster_DivisionMaster

IF (OBJECT_ID( 'FK_DivisionMaster_SubscriberMaster','F') IS NOT NULL)
ALTER TABLE dbo.DivisionMaster DROP CONSTRAINT FK_DivisionMaster_SubscriberMaster

IF (OBJECT_ID( 'FK_DivisionRegulatoryMaster_DivisionMaster','F') IS NOT NULL) 
ALTER TABLE dbo.DivisionRegulatoryMaster DROP CONSTRAINT FK_DivisionRegulatoryMaster_DivisionMaster 

IF (OBJECT_ID( 'FK_UserMaster_SubscriberMaster','F') IS NOT NULL) 
ALTER TABLE dbo.UserMaster DROP CONSTRAINT FK_UserMaster_SubscriberMaster

IF ( OBJECT_ID('Disease.FK_Transaction_DiseaseArea','F') IS NOT NULL) 
ALTER TABLE Disease.[Transaction] DROP CONSTRAINT FK_Transaction_DiseaseArea

IF (OBJECT_ID( 'Disease.FK_Transaction_Indication','F') IS NOT NULL)
ALTER TABLE Disease.[Transaction] DROP CONSTRAINT FK_Transaction_Indication 

IF (OBJECT_ID( 'Pipeline.FK_MoleculeTransactionMapping_Transaction ','F') IS NOT NULL)
ALTER TABLE Pipeline.MoleculeTransactionMapping DROP CONSTRAINT FK_MoleculeTransactionMapping_Transaction 



IF (OBJECT_ID( 'FK_ForumAttachment_ForumAnswer_Id','F') IS NOT NULL)
ALTER TABLE [dbo].[ForumAttachment] DROP CONSTRAINT [FK_ForumAttachment_ForumAnswer_Id];
IF (OBJECT_ID( 'FK_ForumAttachment_ForumQuestion','F') IS NOT NULL)
ALTER TABLE [dbo].[ForumAttachment] DROP CONSTRAINT [FK_ForumAttachment_ForumQuestion];
IF (OBJECT_ID( 'FK_ForumAnswer_ForumQuestion','F') IS NOT NULL)
ALTER TABLE [dbo].[ForumAnswer] DROP CONSTRAINT [FK_ForumAnswer_ForumQuestion];
IF (OBJECT_ID( 'Inline.FK_IndicationMapping_IndicationMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[IndicationMapping] DROP CONSTRAINT [FK_IndicationMapping_IndicationMaster];
IF (OBJECT_ID( 'Pipeline.FK_IndicationTransactionMapping_IndicationMaster','F') IS NOT NULL)
ALTER TABLE [Pipeline].[IndicationTransactionMapping] DROP CONSTRAINT [FK_IndicationTransactionMapping_IndicationMaster];
IF (OBJECT_ID( 'Inline.FK_MoleculeMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Inline].[MoleculeMapping] DROP CONSTRAINT [FK_MoleculeMapping_Transaction];
IF (OBJECT_ID( 'Inline.FK_IndicationMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Inline].[IndicationMapping] DROP CONSTRAINT [FK_IndicationMapping_Transaction];
IF (OBJECT_ID( 'inline.FK_DiseaseAreaTransactionMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Inline].[DiseaseAreaTransactionMapping] DROP CONSTRAINT [FK_DiseaseAreaTransactionMapping_Transaction];
IF (OBJECT_ID( 'Inline.FK_PharmaClassMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Inline].[PharmaClassMapping] DROP CONSTRAINT [FK_PharmaClassMapping_Transaction];
IF (OBJECT_ID( 'Disease.FK_MoleculeMapping_MoleculeMaster','F') IS NOT NULL)
ALTER TABLE [Disease].[MoleculeMapping] DROP CONSTRAINT [FK_MoleculeMapping_MoleculeMaster];
IF (OBJECT_ID( 'Inline.FK_MoleculeMapping_MoleculeMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[MoleculeMapping] DROP CONSTRAINT [FK_MoleculeMapping_MoleculeMaster];
IF (OBJECT_ID( 'Pipeline.FK_Transaction_MoleculeMaster','F') IS NOT NULL)
ALTER TABLE [Pipeline].[Transaction] DROP CONSTRAINT [FK_Transaction_MoleculeMaster];
IF (OBJECT_ID( 'Pipeline.FK_MoleculeTransactionMapping_MoleculeMaster','F') IS NOT NULL)
ALTER TABLE [Pipeline].[MoleculeTransactionMapping] DROP CONSTRAINT [FK_MoleculeTransactionMapping_MoleculeMaster];
IF (OBJECT_ID('Inline.FK_ExclusivityTransaction_PatentCodeMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[ExclusivityTransaction] DROP CONSTRAINT [FK_ExclusivityTransaction_PatentCodeMaster];
IF (OBJECT_ID( 'Pipeline.FK_Transaction_ProductCategoryMaster','F') IS NOT NULL)
ALTER TABLE [Pipeline].[Transaction] DROP CONSTRAINT [FK_Transaction_ProductCategoryMaster];
IF (OBJECT_ID( 'Pipeline.FK_ProductTransactionMapping_ProductMaster','F') IS NOT NULL)
ALTER TABLE [Pipeline].[ProductTransactionMapping] DROP CONSTRAINT [FK_ProductTransactionMapping_ProductMaster];
IF (OBJECT_ID( 'Inline.FK_PharmaClassMapping_PharmaClassMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[PharmaClassMapping] DROP CONSTRAINT [FK_PharmaClassMapping_PharmaClassMaster];
IF (OBJECT_ID( 'Inline.FK_PharmaClassMapping_PharmaClassMaster1','F') IS NOT NULL)
ALTER TABLE [Inline].[PharmaClassMapping] DROP CONSTRAINT [FK_PharmaClassMapping_PharmaClassMaster1];
IF (OBJECT_ID( 'Inline.FK_PharmaClassMapping_PharmaClassMaster2','F') IS NOT NULL)
ALTER TABLE [Inline].[PharmaClassMapping] DROP CONSTRAINT [FK_PharmaClassMapping_PharmaClassMaster2];
IF (OBJECT_ID('Inline.FK_PharmaClassMapping_PharmaClassMaster3','F') IS NOT NULL)
ALTER TABLE [Inline].[PharmaClassMapping] DROP CONSTRAINT [FK_PharmaClassMapping_PharmaClassMaster3];
IF (OBJECT_ID( 'Pipeline.FK_Transaction_PharmaClassMaster','F') IS NOT NULL)
ALTER TABLE [Pipeline].[Transaction] DROP CONSTRAINT [FK_Transaction_PharmaClassMaster];
IF (OBJECT_ID( 'Pipeline.FK_Transaction_PharmaClassMaster1','F') IS NOT NULL)
ALTER TABLE [Pipeline].[Transaction] DROP CONSTRAINT [FK_Transaction_PharmaClassMaster1];
IF (OBJECT_ID( 'Pipeline.FK_Transaction_PharmaClassMaster2','F') IS NOT NULL)
ALTER TABLE [Pipeline].[Transaction] DROP CONSTRAINT [FK_Transaction_PharmaClassMaster2];
IF (OBJECT_ID( 'Pipeline.FK_RegimenTransactionMapping_RegimenMaster','F') IS NOT NULL)
ALTER TABLE [Pipeline].[RegimenTransactionMapping] DROP CONSTRAINT [FK_RegimenTransactionMapping_RegimenMaster];
IF (OBJECT_ID( 'Disease.FK_MoleculeMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Disease].[MoleculeMapping] DROP CONSTRAINT [FK_MoleculeMapping_Transaction];
IF (OBJECT_ID( 'Pipeline.FK_ROA_TransactionMapping_ROA_Master','F') IS NOT NULL)
ALTER TABLE [Pipeline].[ROA_TransactionMapping] DROP CONSTRAINT [FK_ROA_TransactionMapping_ROA_Master];
IF (OBJECT_ID( 'Pipeline.FK_MOA_TransactionMapping_MOA_Master','F') IS NOT NULL)
ALTER TABLE [Pipeline].[MOA_TransactionMapping] DROP CONSTRAINT [FK_MOA_TransactionMapping_MOA_Master];
IF (OBJECT_ID( 'Pipeline.FK_Transaction_AnalystEstimate','F') IS NOT NULL)
ALTER TABLE [Pipeline].[Transaction] DROP CONSTRAINT [FK_Transaction_AnalystEstimate];
IF (OBJECT_ID( 'Pipeline.FK_CompanyTransactionMapping_CompanyMaster','F') IS NOT NULL)
ALTER TABLE [Pipeline].[CompanyTransactionMapping] DROP CONSTRAINT [FK_CompanyTransactionMapping_CompanyMaster];
IF (OBJECT_ID( 'Pipeline.FK_DiseaseAreaTransactionMapping_DiseaseAreaMaster','F') IS NOT NULL)
ALTER TABLE [Pipeline].[DiseaseAreaTransactionMapping] DROP CONSTRAINT [FK_DiseaseAreaTransactionMapping_DiseaseAreaMaster];
IF (OBJECT_ID( 'Inline.FK_DiseaseAreaTransactionMapping_DiseaseAreaMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[DiseaseAreaTransactionMapping] DROP CONSTRAINT [FK_DiseaseAreaTransactionMapping_DiseaseAreaMaster];
IF (OBJECT_ID( 'Inline.FK_ExclusivityTransaction_ExclusivityCodeMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[ExclusivityTransaction] DROP CONSTRAINT [FK_ExclusivityTransaction_ExclusivityCodeMaster];
IF (OBJECT_ID( 'Pipeline.FK_Transaction_Dosages','F') IS NOT NULL)
ALTER TABLE [Pipeline].[Transaction] DROP CONSTRAINT [FK_Transaction_Dosages];
IF (OBJECT_ID( 'fk_feedSetting_id','F') IS NOT NULL)
ALTER TABLE [dbo].[FeedItemMapping] DROP CONSTRAINT [fk_feedSetting_id];
IF (OBJECT_ID( 'fk_feedItem_id','F') IS NOT NULL)
ALTER TABLE [dbo].[FeedItemMapping] DROP CONSTRAINT [fk_feedItem_id];
IF (OBJECT_ID( 'Pipeline.FK_CompanyTransactionMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Pipeline].[CompanyTransactionMapping] DROP CONSTRAINT [FK_CompanyTransactionMapping_Transaction];
IF (OBJECT_ID( 'Pipeline.FK_RegimenTransactionMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Pipeline].[RegimenTransactionMapping] DROP CONSTRAINT [FK_RegimenTransactionMapping_Transaction];
IF (OBJECT_ID( 'Pipeline.FK_ROA_TransactionMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Pipeline].[ROA_TransactionMapping] DROP CONSTRAINT [FK_ROA_TransactionMapping_Transaction];
IF (OBJECT_ID( 'Pipeline.FK_ProductTransactionMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Pipeline].[ProductTransactionMapping] DROP CONSTRAINT [FK_ProductTransactionMapping_Transaction];
IF (OBJECT_ID( 'Pipeline.FK_IndicationTransactionMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Pipeline].[IndicationTransactionMapping] DROP CONSTRAINT [FK_IndicationTransactionMapping_Transaction];
IF (OBJECT_ID( 'Pipeline.FK_DiseaseAreaTransactionMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Pipeline].[DiseaseAreaTransactionMapping] DROP CONSTRAINT [FK_DiseaseAreaTransactionMapping_Transaction];
IF (OBJECT_ID( 'Pipeline.FK_MOA_TransactionMapping_Transaction','F') IS NOT NULL)
ALTER TABLE [Pipeline].[MOA_TransactionMapping] DROP CONSTRAINT [FK_MOA_TransactionMapping_Transaction];
IF (OBJECT_ID( 'Pipeline.FK_Transaction_PhaseMaster','F') IS NOT NULL)
ALTER TABLE [Pipeline].[Transaction] DROP CONSTRAINT [FK_Transaction_PhaseMaster];
IF (OBJECT_ID( 'FK_ForumQuestion_UserMaster','F') IS NOT NULL)
ALTER TABLE [dbo].[ForumQuestion] DROP CONSTRAINT [FK_ForumQuestion_UserMaster];
IF (OBJECT_ID( 'FK_ForumAnswer_UserMaster','F') IS NOT NULL)
ALTER TABLE [dbo].[ForumAnswer] DROP CONSTRAINT [FK_ForumAnswer_UserMaster];
IF (OBJECT_ID( 'Inline.FK_Transaction_ProductCategoryMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT [FK_Transaction_ProductCategoryMaster];
IF (OBJECT_ID( 'Inline.FK_IndicationMapping_Transaction1','F') IS NOT NULL)
ALTER TABLE [Inline].[IndicationMapping] DROP CONSTRAINT [FK_IndicationMapping_Transaction1];
IF (OBJECT_ID( 'Inline.FK_Transaction_SubstanceMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT [FK_Transaction_SubstanceMaster];
IF (OBJECT_ID( 'Inline.FK_Transaction_ProductTypeMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT [FK_Transaction_ProductTypeMaster];
IF (OBJECT_ID( 'Inline.FK_Transaction_ROA_Master','F') IS NOT NULL)
ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT [FK_Transaction_ROA_Master];
IF (OBJECT_ID( 'Inline.FK_Transaction_CompanyMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT [FK_Transaction_CompanyMaster];
IF (OBJECT_ID( 'Inline.FK_Transaction_ProductCodeMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT [FK_Transaction_ProductCodeMaster];
IF (OBJECT_ID( 'Inline.FK_ExclusivityTransaction_ProductCodeMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[ExclusivityTransaction] DROP CONSTRAINT [FK_ExclusivityTransaction_ProductCodeMaster];
IF (OBJECT_ID( 'Inline.FK_Transaction_ProductMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT [FK_Transaction_ProductMaster];

IF (OBJECT_ID( 'FK_UserNotifications_UserMaster','F') IS NOT NULL)
ALTER TABLE UserNotifications DROP CONSTRAINT [FK_UserNotifications_UserMaster];

IF (OBJECT_ID( 'FK_UserAccessForecastPlatform_UserMaster','F') IS NOT NULL)
ALTER TABLE UserAccessForecastPlatform DROP CONSTRAINT [FK_UserAccessForecastPlatform_UserMaster];

IF (OBJECT_ID( 'FK_UserAccess_UserMaster','F') IS NOT NULL)
ALTER TABLE UserAccess DROP CONSTRAINT FK_UserAccess_UserMaster;

IF (OBJECT_ID( 'Disease.FK_Transaction_RegimenMaster','F') IS NOT NULL)
ALTER TABLE Disease.[Transaction] DROP CONSTRAINT [FK_Transaction_RegimenMaster];

IF (OBJECT_ID( 'Inline.FK_Transaction_FormMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT [FK_Transaction_FormMaster];

--IF (OBJECT_ID( 'Inline.FK_Transaction_MoleculeMaster','F') IS NOT NULL)
--ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT [FK_Transaction_MoleculeMaster];

IF (OBJECT_ID( 'Inline.FK_Transaction_NADAC_PricingUnitMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT [FK_Transaction_NADAC_PricingUnitMaster];

IF (OBJECT_ID( 'Inline.FK_Transaction_PriceSourceMaster','F') IS NOT NULL)
ALTER TABLE [Inline].[Transaction] DROP CONSTRAINT FK_Transaction_PriceSourceMaster;

END;