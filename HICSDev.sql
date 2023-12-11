USE [master]
GO
/****** Object:  Database [HICSDEV]    Script Date: 30/11/2023 11:18:13 ******/
CREATE DATABASE [HICSDEV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HICS', FILENAME = N'D:\Xiasma\HGCompany\HICS-dev.mdf' , SIZE = 2325760KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HICS_log', FILENAME = N'D:\Xiasma\HGCompany\HICS-dev_log.ldf' , SIZE = 24576KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HICSDEV] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HICSDEV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HICSDEV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HICSDEV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HICSDEV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HICSDEV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HICSDEV] SET ARITHABORT OFF 
GO
ALTER DATABASE [HICSDEV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HICSDEV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HICSDEV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HICSDEV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HICSDEV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HICSDEV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HICSDEV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HICSDEV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HICSDEV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HICSDEV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HICSDEV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HICSDEV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HICSDEV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HICSDEV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HICSDEV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HICSDEV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HICSDEV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HICSDEV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HICSDEV] SET  MULTI_USER 
GO
ALTER DATABASE [HICSDEV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HICSDEV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HICSDEV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HICSDEV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HICSDEV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HICSDEV] SET QUERY_STORE = OFF
GO
USE [HICSDEV]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [HICSDEV]
GO
/****** Object:  User [VCU]    Script Date: 30/11/2023 11:18:13 ******/
CREATE USER [VCU] FOR LOGIN [VCU] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MatrixAdmin]    Script Date: 30/11/2023 11:18:13 ******/
CREATE USER [MatrixAdmin] FOR LOGIN [MatrixAdmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HAYMAN0\Vmelbek]    Script Date: 30/11/2023 11:18:13 ******/
CREATE USER [HAYMAN0\Vmelbek] FOR LOGIN [HAYMAN0\Vmelbek] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HAYMAN0\SQLNetworkAccess]    Script Date: 30/11/2023 11:18:13 ******/
CREATE USER [HAYMAN0\SQLNetworkAccess] FOR LOGIN [HAYMAN0\SQLNetworkAccess] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HAYMAN0\Reporting]    Script Date: 30/11/2023 11:18:13 ******/
CREATE USER [HAYMAN0\Reporting] FOR LOGIN [HAYMAN0\Reporting] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HAYMAN0\guyqADMIN]    Script Date: 30/11/2023 11:18:13 ******/
CREATE USER [HAYMAN0\guyqADMIN] FOR LOGIN [HAYMAN0\guyqADMIN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HAYMAN0\garye]    Script Date: 30/11/2023 11:18:13 ******/
CREATE USER [HAYMAN0\garye] FOR LOGIN [HAYMAN0\garye] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HAYMAN0\Domain Users]    Script Date: 30/11/2023 11:18:13 ******/
CREATE USER [HAYMAN0\Domain Users] FOR LOGIN [HAYMAN0\Domain Users]
GO
/****** Object:  User [HAYMAN0\AutoscribeI]    Script Date: 30/11/2023 11:18:13 ******/
CREATE USER [HAYMAN0\AutoscribeI] FOR LOGIN [HAYMAN0\AutoscribeI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [Users]    Script Date: 30/11/2023 11:18:13 ******/
CREATE ROLE [Users]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [HAYMAN0\Vmelbek]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [HAYMAN0\Vmelbek]
GO
ALTER ROLE [Users] ADD MEMBER [HAYMAN0\Reporting]
GO
ALTER ROLE [db_owner] ADD MEMBER [HAYMAN0\guyqADMIN]
GO
ALTER ROLE [db_owner] ADD MEMBER [HAYMAN0\garye]
GO
ALTER ROLE [Users] ADD MEMBER [HAYMAN0\Domain Users]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Suppliers1]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_Suppliers1] as
SELECT
	[SUCODE] AS [Code],
[SUPHONE] AS [Phone],
[SUPHONE2] AS [Phone2],
[SUFAX] AS [Fax],
[SUCONTACT] AS [Contact],
[SUSALUTE] AS [Salute],
[SU_IMPORT_CODE] AS [ImportCode],
[SU_COUNTRY_CODE] AS [CountryCode],
[SU_VAT_REG_NO] AS [VATRegNo],
[SU_EC_DELIVERY] AS [ECDelivery],
[SU_EC_T_NATURE] AS [ECTNature],
[SU_EC_T_MODE] AS [ECTMode],
[SUSORT] AS [Sort],
[SUUSER1] AS [User1],
[SUUSER2] AS [User2],
[SUUSER3] AS [User3],
[SUCURRENCYCODE] AS [CurrencyCode],
[SU_NOTES] AS [Notes],
[SU_BANK_SORT] AS [BankSort],
[SU_BANK_AC_NO] AS [BankAccNo],
[SU_BANK_AC_NAME] AS [BankAccName],
[SU_BANK_BACSREF] AS [BankBACSRef],
[SU_BANK_BANKNAME] AS [BankName],
[SU_DATE_INV] AS [DateInvoice],
[SU_DATE_PAY] AS [DatePay],
[SU_USER_PUTIN] AS [UserPutIn],
[SU_DATE_PUTIN] AS [DatePutIn],
[SU_DATE_EDITED] AS [DateEdited],
[SU_USER_EDITED] AS [UserEdited],
[SU_MU_STATUS] AS [MUStatus],
[SU_TERMS] AS [Terms],
[SU_ANALYSIS] AS [Analysis],
[SU_TAX_CODE] AS [TAXCode],
[SU_BANK_ANALYS] AS [BankAnalysis],
[SU_EMAIL] AS [Email],
[SU_SOURCE] AS [SourceID],
[SU_DOC_DESTINATION] AS [DocDestination],
[SU_CIS_UTR] AS [CISUTR],
[SU_CIS_NI_NUMBER] AS [CISNINumber],
[SU_CIS_COMPANY_REG_NO] AS [CISRegNo],
[SU_CIS300_NAME] AS [CIS300Name],
[SU_VERIFICATION_NUMBER] AS [VerificationNo],
[SU_DATE_MATCHED] AS [DateMatached],
[SU_PARTNERSHIP_LINK] AS [PartnershipLink],
[SU_CIS_TITLE] AS [CISTitle],
[SU_CIS_FORENAME1] AS [CISForename1],
[SU_CIS_FORENAME2] AS [CISForename2],
[SU_CIS_SURNAME] AS [CISSurname],
[SU_INSURANCE_COMPANY] AS [InsuranceCompany],
[SU_INSURANCE_POLICY_NO] AS [InsurancePolicyNo],
[SU_INSURANCE_EXPIRY_DATE] AS [InsuranceExpiryDate],
[SU_COMPANY_REG_NUMBER] AS [RegNo],
[SUNAME] AS [Name],
[SUADDRESS] AS [Address],
[SUPOSTCODE] AS [Postcode],
[SU_MULTI_CURR] AS [MultiCurrency],
[SUBALANCE] AS [Balance],
[SUBALANCE_C] AS [BalanceC],
[SUAGED_1] AS [Aged1],
[SUAGED_2] AS [Aged2],
[SUAGED_3] AS [Aged3],
[SUAGED_4] AS [Aged4],
[SUAGED_5] AS [Aged5],
[SUAGED_6] AS [Aged6],
[SUAGED_UNALLOC] AS [AgedUnallocated],
[SUUSED] AS [Used],
[SU_US1099] AS [US1099],
[SUTURNOVERPTD] AS [TurnoverPTD],
[SUTURNOVR_L1] AS [TurnoverL1],
[SUTURNOVR_L2] AS [TurnoverL2],
[SUTURNOVR_L3] AS [TurnoverL3],
[SUTURNOVR_L4] AS [TurnoverL4],
[SUTURNOVR_L5] AS [TurnoverL5],
[SUTURNOVR_L6] AS [TurnoverL6],
[SUTURNOVR_L7] AS [TurnoverL7],
[SUTURNOVR_L8] AS [TurnoverL8],
[SUTURNOVR_L9] AS [TurnoverL9],
[SUTURNOVR_L10] AS [TurnoverL10],
[SUTURNOVR_L11] AS [TurnoverL11],
[SUTURNOVR_L12] AS [TurnoverL12],
[SUTURNOVR_L13] AS [TurnoverL13],
[SUTURNOVR_C1] AS [TurnoverC1],
[SUTURNOVR_C2] AS [TurnoverC2],
[SUTURNOVR_C3] AS [TurnoverC3],
[SUTURNOVR_C4] AS [TurnoverC4],
[SUTURNOVR_C5] AS [TurnoverC5],
[SUTURNOVR_C6] AS [TurnoverC6],
[SUTURNOVR_C7] AS [TurnoverC7],
[SUTURNOVR_C8] AS [TurnoverC8],
[SUTURNOVR_C9] AS [TurnoverC9],
[SUTURNOVR_C10] AS [TurnoverC10],
[SUTURNOVR_C11] AS [TurnoverC11],
[SUTURNOVR_C12] AS [TurnoverC12],
[SUTURNOVR_C13] AS [TurnoverC13],
[SUTURNOVR_O1] AS [TurnoverO1],
[SUTURNOVR_O2] AS [TurnoverO2],
[SUTURNOVR_O3] AS [TurnoverO3],
[SUTURNOVR_O4] AS [TurnoverO4],
[SUTURNOVR_O5] AS [TurnoverO5],
[SUTURNOVR_O6] AS [TurnoverO6],
[SUTURNOVR_O7] AS [TurnoverO7],
[SUTURNOVR_O8] AS [TurnoverO8],
[SUTURNOVR_O9] AS [TurnoverO9],
[SUTURNOVR_O10] AS [TurnoverO10],
[SUTURNOVR_O11] AS [TurnoverO11],
[SUTURNOVR_O12] AS [TurnoverO12],
[SUTURNOVR_O13] AS [TurnoverO13],
[SUTURNOVERYTD] AS [TurnoverYTD],
[SUTURNOVR_L1_C] AS [TurnoverL1C],
[SUTURNOVR_L2_C] AS [TurnoverL2C],
[SUTURNOVR_L3_C] AS [TurnoverL3C],
[SUTURNOVR_L4_C] AS [TurnoverL4C],
[SUTURNOVR_L5_C] AS [TurnoverL5C],
[SUTURNOVR_L6_C] AS [TurnoverL6C],
[SUTURNOVR_L7_C] AS [TurnoverL7C],
[SUTURNOVR_L8_C] AS [TurnoverL8C],
[SUTURNOVR_L9_C] AS [TurnoverL9C],
[SUTURNOVR_L10_C] AS [TurnoverL10C],
[SUTURNOVR_L11_C] AS [TurnoverL11C],
[SUTURNOVR_L12_C] AS [TurnoverL12C],
[SUTURNOVR_L13_C] AS [TurnoverL13C],
[SUTURNOVR_C1_C] AS [TurnoverC1C],
[SUTURNOVR_C2_C] AS [TurnoverC2C],
[SUTURNOVR_C3_C] AS [TurnoverC3C],
[SUTURNOVR_C4_C] AS [TurnoverC4C],
[SUTURNOVR_C5_C] AS [TurnoverC5C],
[SUTURNOVR_C6_C] AS [TurnoverC6C],
[SUTURNOVR_C7_C] AS [TurnoverC7C],
[SUTURNOVR_C8_C] AS [TurnoverC8C],
[SUTURNOVR_C9_C] AS [TurnoverC9C],
[SUTURNOVR_C10_C] AS [TurnoverC10C],
[SUTURNOVR_C11_C] AS [TurnoverC11C],
[SUTURNOVR_C12_C] AS [TurnoverC12C],
[SUTURNOVR_C13_C] AS [TurnoverC13C],
[SUTURNOVR_O1_C] AS [TurnoverO1C],
[SUTURNOVR_O2_C] AS [TurnoverO2C],
[SUTURNOVR_O3_C] AS [TurnoverO3C],
[SUTURNOVR_O4_C] AS [TurnoverO4C],
[SUTURNOVR_O5_C] AS [TurnoverO5C],
[SUTURNOVR_O6_C] AS [TurnoverO6C],
[SUTURNOVR_O7_C] AS [TurnoverO7C],
[SUTURNOVR_O8_C] AS [TurnoverO8C],
[SUTURNOVR_O9_C] AS [TurnoverO9C],
[SUTURNOVR_O10_C] AS [TurnoverO10C],
[SUTURNOVR_O11_C] AS [TurnoverO11C],
[SUTURNOVR_O12_C] AS [TurnoverO12C],
[SUTURNOVR_O13_C] AS [TurnoverO13C],
[SUTURNOVR_YTD_C] AS [TurnoverYTDC],
[SUTURNOVR_PTD_C] AS [TurnoverPTDC],
[SU_REM_ADD_CDE] AS [RemAddCode],
[SU_INV_ADD_CDE] AS [InvAddCode],
[SU_DEL_ADD_CDE] AS [DelAddCode],
[SU_ST_ADD_CODE] AS [STAddCode],
[SU_LINE_DISC] AS [LineDiscount],
[SU_TOT_DISC] AS [TotalDiscount],
[SU_SETT_DISC1] AS [SettDiscount1],
[SU_SETT_DISC2] AS [SettDiscount2],
[SU_SETT_DAYS1] AS [SettDays1],
[SU_SETT_DAYS2] AS [SettDays2],
[SU_ON_STOP] AS [OnStop],
[SU_CREDIT_LIMIT] AS [CreditLimit],
[SU_DEL_CHARGE] AS [DelCharge],
[SU_DEL_CHARGE_C] AS [DelChargeC],
[SU_MIN_ORDR] AS [MinOrder],
[SU_MIN_ORDR_C] AS [MinOrderC],
[SU_DUE_DAYS] AS [DueDays],
[SU_A_P_DAYS] AS [APDays],
[SU_DEL_CHG_PCNT] AS [DelChgPcnt],
[SU_DUEDATE_TYPE] AS [DueDateType],
[SU_PRICE_KEY] AS [PriceKey],
[SU_ADDRESS_USER1] AS [AddressUser1],
[SU_ADDRESS_USER2] AS [AddressUSer2],
[SU_PRIMARY] AS [Primary],
[SU_CURRENCY_CHANGED] AS [CurrencyChanged],
[SU_COUNTRY] AS [Country],
[SU_DO_NOT_USE] AS [DoNotUse],
[SU_LEAD_TIME] AS [LeadTime],
[SU_CIS] AS [CIS],
[SU_CIS_TAX_STATUS] AS [CISTAXStatus],
[SU_CIS_INACTIVE] AS [CISInactive],
[SU_CIS_BUSINESS_TYPE] AS [CISBusinessType],
[SU_CONTRACT_AGREED] AS [ContractAgreed],
[SU_INSURANCE_CHECKED] AS [InsuranceChecked],
[SU_CITB_LEVY] AS [CITBLevy],
[SU_MATCH_IN_PROGRESS] AS [MatchInProgress],
[SU_CURR_CREDIT_LIMIT] AS [CurrentCreditLimit],
[SU_ANT_DAYS_FROM_DATES_OPT] AS [AntDaysFromDatesOpt]
FROM
	[ASC_LIVE].[dbo].[PL_ACCOUNTS] WITH (NOLOCK)
GO
/****** Object:  Table [dbo].[Tb_SC_Parts]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SC_Parts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkPartID] [int] NOT NULL,
	[PrintedLotNumberPosition] [varchar](255) NULL,
	[UnitBarcode] [varchar](50) NULL,
	[GroupedBarcode] [varchar](50) NULL,
 CONSTRAINT [PK_Tb_SC_Parts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Parts]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_Parts] as
SELECT 
	SC.[PMA_UNIQUE]								AS [ID],
    SC.[PMA_SOURCE_IND]							AS [SourceID],
    SC.[PMA_CREATED]							AS [CreatedOn],
    SC.[PMA_UPDATED]							AS [ModifiedOn],
    SC.[PMA_PART_ONLY]							COLLATE Latin1_General_CI_AS	AS [Part],
    SC.[PMA_PART_REV]							COLLATE Latin1_General_CI_AS	AS [PartRev],
    SC.[PMA_DESC]								COLLATE Latin1_General_CI_AS	AS [Description1],
    SC.[PMA_DESC_1]								COLLATE Latin1_General_CI_AS	AS [Description2],
    SC.[PMA_EXT]								COLLATE Latin1_General_CI_AS	AS [HasExtraText],
    SC.[PMA_DRAWING]							COLLATE Latin1_General_CI_AS	AS [Drawing],
    SC.[PMA_DRAWING_REV]						COLLATE Latin1_General_CI_AS	AS [DrawingRev],
    SC.[PMA_PROC_CODE]							COLLATE Latin1_General_CI_AS	AS [ProcurementCode],
    SC.[PMA_ABC_CODE]							COLLATE Latin1_General_CI_AS	AS [ABCCode],
    SC.[PMA_WH]									COLLATE Latin1_General_CI_AS	AS [DefaultWarehouse],
    SC.[PMA_BIN]								COLLATE Latin1_General_CI_AS	AS [DefaultBin],
    SC.[PMA_UOM]								COLLATE Latin1_General_CI_AS	AS [UoM],
    SC.[PMA_UOI]								COLLATE Latin1_General_CI_AS	AS [UoI],
    SC.[PMA_UOO]								COLLATE Latin1_General_CI_AS	AS [UoO],
    SC.[PMA_CONV_FACT]							AS [ConvFact],
    SC.[PMA_CONV_FACT_1]						AS [ConvFact1],
    SC.[PMA_PART_CODE]							COLLATE Latin1_General_CI_AS	AS [PartCode],
	SC.[PMA_COST]								AS [RolledUpLabourCost],
    SC.[PMA_COST_PER]							AS [LabourCostPer],
	SC.[PMA_COST_MAT]							AS [MaterialCost],
    SC.[PMA_COST_MAT_PER]						AS [MaterialCostPer],
    SC.[PMA_SELL]								AS [SellingPrice],
    SC.[PMA_SELL_PER]							AS [SellingPricePer],
    SC.[PMA_MARGIN]								AS [Margin],
    SC.[PMA_EFFECT_DATE_ON]						AS [StartDate],
    SC.[PMA_MAN_LEAD]							AS [ManufacturingDays],
    SC.[PMA_PUR_LEAD]							AS [PurchasingDays],
    SC.[PMA_CRASH_LEAD]							AS [QuickestAssemblyDays],
    SC.[PMA_EOQ]								AS [EOQ],
    SC.[PMA_PRIME_SUP]							COLLATE Latin1_General_CI_AS	AS [PrimarySupplier],
    SC.[PMA_SEC_SUP]							COLLATE Latin1_General_CI_AS	AS [SecondarySupplier],
    SC.[PMA_MIN_ORDER]							AS [MinOrderQty],
    SC.[PMA_MAX_ORDER]							AS [MaxOrderQty],
    SC.[PMA_SAFETY]								AS [SafetyStockLevel],
    SC.[PMA_MAX_STOCK]							AS [MaxStockLevel],
    SC.[PMA_SHRINKAGE]							AS [ShrinkagePercent],
    SC.[PMA_EFFECT_DATE_OFF]					AS [EndDate],
    SC.[PMA_PHYSICAL]							AS [PhysicalStockLevel],
    SC.[PMA_ORDERED]							AS [StockOnPOs],
    SC.[PMA_ALLOCATED]							AS [StockOnKits],
    SC.[PMA_DEMAND]								AS [Demand],
    SC.[PMA_ON_SITE_QTY]						AS [StockRecievedNotAccepted],
	SC.[PMA_PICKED]								AS [ThisLabourCost],
    SC.[PMA_USAGE_1]							AS [Usage1],
    SC.[PMA_USAGE_2]							AS [Usage2],
    SC.[PMA_MADE_IN_ORDERS]						AS [StockOnWOs],
    SC.[PMA_CUST_ORDERS]						AS [OrderQuantity],
    SC.[PMA_SUPPLIER_PART]						COLLATE Latin1_General_CI_AS	AS [PrimarySupPart],
    SC.[PMA_LAST_PRICE_PER]						AS [LastPricePer],
    SC.[PMA_LAST_UOO]							COLLATE Latin1_General_CI_AS	AS [LastUoO],
    SC.[PMA_LABOUR_HOUR]						AS [LabourHours],
    SC.[PMA_CUST_ALLOCS]						AS [StockAllocatedOnSOs],
    SC.[PMA_VAT_IND]							COLLATE Latin1_General_CI_AS	AS [VATCode],
    SC.[PMA_WAITING_INV]						AS [QuantityWaitingInvoice],
    SC.[PMA_C_O_C_REQ]							COLLATE Latin1_General_CI_AS	AS [CoCRequired],
    SC.[PMA_STOCK_USAGE1]						AS [StockUsage1],
	SC.[PMA_STOCK_USAGE2]						AS [StockUsage2],
	SC.[PMA_STOCK_USAGE3]						AS [StockUsage3],
	SC.[PMA_STOCK_USAGE4]						AS [StockUsage4],
	SC.[PMA_STOCK_USAGE5]						AS [StockUsage5],
	SC.[PMA_STOCK_USAGE6]						AS [StockUsage6],
	SC.[PMA_STOCK_USAGE7]						AS [StockUsage7],
	SC.[PMA_STOCK_USAGE8]						AS [StockUsage8],
	SC.[PMA_STOCK_USAGE9]						AS [StockUsage9],
	SC.[PMA_STOCK_USAGE10]						AS [StockUsage10],
	SC.[PMA_STOCK_USAGE11]						AS [StockUsage11],
	SC.[PMA_STOCK_USAGE12]						AS [StockUsage12],
	SC.[PMA_STOCK_USAGE13]						AS [StockUsage13],
	SC.[PMA_HELD_ORDERED]						AS [HeldOrdered],
    SC.[PMA_INSP_REQ]							COLLATE Latin1_General_CI_AS	AS [InspectionCode],
    SC.[PMA_COST_CODE]							COLLATE Latin1_General_CI_AS	AS [CostCode],
    SC.[PMA_LAST_USED_DATE]						AS [LastIssued],
    SC.[PMA_LAST_CHECK_DATE]					AS [LastChecked],
    SC.[PMA_SALES_ACCOUNT]						COLLATE Latin1_General_CI_AS	AS [SalesAccountCode],
    SC.[PMA_PURCH_ACCOUNT]						COLLATE Latin1_General_CI_AS	AS [PurchaseAccountCode],
    SC.[PMA_OTHER_ACC_1]						COLLATE Latin1_General_CI_AS	AS [OtherAccountCode],
    SC.[PMA_COMMODITY_CODE]						COLLATE Latin1_General_CI_AS	AS [CommodityCode],
    SC.[PMA_ANAL_FIELD1]						COLLATE Latin1_General_CI_AS	AS [Analysis1],
    SC.[PMA_ANAL_FIELD2]						COLLATE Latin1_General_CI_AS	AS [Analysis2],
    SC.[PMA_ANAL_FIELD3]						COLLATE Latin1_General_CI_AS	AS [Analysis3],
    SC.[PMA_ANAL_FIELD4]						COLLATE Latin1_General_CI_AS	AS [Analysis4],
    SC.[PMA_ANAL_FIELD5]						COLLATE Latin1_General_CI_AS	AS [Analysis5],
    SC.[PMA_ANAL_FIELD6]						COLLATE Latin1_General_CI_AS	AS [Analysis6],
    SC.[PMA_ANAL_FIELD7]						COLLATE Latin1_General_CI_AS	AS [Analysis7],
    SC.[PMA_ANAL_FIELD8]						COLLATE Latin1_General_CI_AS	AS [Analysis8],
    SC.[PMA_ANAL_FIELD9]						COLLATE Latin1_General_CI_AS	AS [Analysis9],
    SC.[PMA_ANAL_FIELD10]						COLLATE Latin1_General_CI_AS	AS [Analysis10],
    SC.[PMA_SHELF_LIFE]							AS [ShelfLifeDays],
    SC.[PMA_WEIGHT]								AS [Weight],
    SC.[PMA_WEIGHT_PER]							AS [WeightPer],
    SC.[PMA_CAPACITY]							AS [Capacity],
    SC.[PMA_CAPACITY_PER]						AS [CapacityPer],
    SC.[PMA_OTHER_FIELD]						COLLATE Latin1_General_CI_AS	AS [OtherField],
    SC.[PMA_WEIGHT_UOM]							COLLATE Latin1_General_CI_AS	AS [WeightUoM],
    SC.[PMA_CAPACITY_UOM]						COLLATE Latin1_General_CI_AS	AS [CapacityUoM],
    SC.[PMA_AV_MATERIAL]						AS [AvgMatCost],
    SC.[PMA_AV_MAT_PER]							AS [AvgMatCostPer],
    SC.[PMA_AV_LABOUR]							AS [AvgLabourCost],
    SC.[PMA_AV_LABOUR_PER]						AS [AvgLabourCostPer],
    SC.[PMA_AV_SUB_C]							AS [AvgSubContCost],
    SC.[PMA_AV_SUB_C_PER]						AS [AvgSubContCostPer],
    SC.[PMA_AV_THIS_LABOUR]						AS [AvgThisLabour],
    SC.[PMA_AV_THIS_LAB_PER]					AS [AvgThisLabourPer],
    SC.[PMA_LAB_OHD_RATE]						AS [LabourOverheadRate],
    SC.[PMA_MAT_OHD_RATE]						AS [MaterialOverheadRate],
    SC.[PMA_PRODUCT_GROUP]						COLLATE Latin1_General_CI_AS	AS [ProductGroup],
	SC.[PMA_LOT_GROUP]							COLLATE Latin1_General_CI_AS	AS [LotGroup],
    SC.[PMA_WORKS_COST]							AS [WorksCost],
    SC.[PMA_MAX_WHDISC]							AS [MaxWholeOrderDiscount],
    SC.[PMA_ALT_PART_ONLY]						COLLATE Latin1_General_CI_AS	AS [AlternativePart],
    SC.[PMA_ALT_PART_REV]						COLLATE Latin1_General_CI_AS	AS [AlternativePartRev],
    SC.[PMA_ALT_PART_FACTOR]					AS [AlternativePartFactor],
    SC.[PMA_OS_REASON_CODE]						COLLATE Latin1_General_CI_AS	AS [OutOfStockReasonCode],
	SC.[PMA_SALES_ROUNDING]						AS [SalesRounding],
    SC.[PMA_PRICE_UOM]							COLLATE Latin1_General_CI_AS	AS [PricingUoM], 
    SC.[PMA_SALES_UOM]							COLLATE Latin1_General_CI_AS	AS [SalesUoM],
    SC.[PMA_NON_STOCK_ITEM]						COLLATE Latin1_General_CI_AS	AS [NonStockItem],
    SC.[PMA_INCREMENT]							AS [Increment],
    SC.[PMA_FOR_PART_ONLY]						COLLATE Latin1_General_CI_AS	AS [ForecastPart],
    SC.[PMA_FOR_PART_REV]						COLLATE Latin1_General_CI_AS	AS [ForecastPartRev],
    SC.[PMA_CREATE_MSC]							COLLATE Latin1_General_CI_AS	AS [CreateMastSchedule],
    SC.[PMA_WEB_PART]							COLLATE Latin1_General_CI_AS	AS [WebPart],
    SC.[PMA_CREATE_BTB_PO]						COLLATE Latin1_General_CI_AS	AS [CreateBTBPO],
    SC.[PMA_ALLOC_TOLERANCE]					AS [AllocTolerance],
    SC.[PMA_ALLOC_RULE_1]						AS [AllocRule1],
    SC.[PMA_ALLOC_RULE_2]						AS [AllocRule2],
    SC.[PMA_UOP]								COLLATE Latin1_General_CI_AS	AS [UoP],
    SC.[PMA_CR_SHOP_SO_FULL]					COLLATE Latin1_General_CI_AS	AS [CRShopSOFull],
    SC.[PMA_DUTY_CODE]							COLLATE Latin1_General_CI_AS	AS [DutyCode],
    SC.[PMA_DUTYABLE_CONTENT]					AS [DutyableContent],
    SC.[PMA_TIED_PART_ONLY]						COLLATE Latin1_General_CI_AS	AS [TiedPart],
    SC.[PMA_TIED_PART_REV]						COLLATE Latin1_General_CI_AS	AS [TiedPartRev],
    SC.[PMA_MIN_STOCK_DAYS]						AS [MinStockDays],
    SC.[PMA_MIN_STOCK_USAGE_MONTHS]				AS [MinStockUsageMonths],
    SC.[PMA_NO_PO_COST_UPDATE]					COLLATE Latin1_General_CI_AS	AS [NoPOCostUpdate],
    SC.[PMA_USE_BATCH_LIFE_CYCLE_TRACKING]		COLLATE Latin1_General_CI_AS	AS [UseBatchLifecycleTracking],
    SC.[PMA_ALLOW_BOM_IN_MRP]					COLLATE Latin1_General_CI_AS	AS [AllowBoMInMRP],
    SC.[PMA_DESC_3]								COLLATE Latin1_General_CI_AS	AS [Description3],
    SC.[PMA_PICK_WH]							COLLATE Latin1_General_CI_AS	AS [PickWarehouse],
    SC.[PMA_PICK_BIN]							COLLATE Latin1_General_CI_AS	AS [PickBin],
    SC.[PMA_JBC_ACCOUNT]						COLLATE Latin1_General_CI_AS	AS [JBCAccount],
    SC.[PMA_BAR_CODE]							COLLATE Latin1_General_CI_AS	AS [PartBardcode],
    SC.[PMA_DEFAULT_LOT_QTY]					AS [DefaultLotQty],
    SC.[PMA_OS_ECO]								AS [OSEco],
    SC.[PMA_MIN_SELLING_PRICE]					AS [MinSellingPrice],
    SC.[PMA_MIN_SELL_PER]						AS [MinSellingPricePer],
    SC.[PMA_RRP]								AS [RRP],
    SC.[PMA_RRP_PER]							AS [RRPPer],
    SC.[PMA_ENFORCE_MIN_SELL]					COLLATE Latin1_General_CI_AS	AS [EnforceMinSellingPrice],
    SC.[PMA_EAN_CODE]							COLLATE Latin1_General_CI_AS	AS [EANCode],
    SC.[PMA_QTY_PER_PALLET]						AS [QuantityPerPallet],
    SC.[PMA_PEG_OPTION]							COLLATE Latin1_General_CI_AS	AS [PEGOption],
    SC.[PMA_APP_SALE]							COLLATE Latin1_General_CI_AS	AS [AppSale],
    SC.[PMA_LONG_PART_NUMBER]					COLLATE Latin1_General_CI_AS	AS [LongPartNumber],
    SC.[PMA_SO_INCREMENT]						AS [SOIncrement],
    SC.[PMA_MIN_SO_QTY]							AS [MinSOQuantity],
    SC.[PMA_RESTRICTED]							AS [Restricted],
    SC.[PMA_REQ_PO_APPROVAL]					AS [ReqPOApproval],
    SC.[PMA_MAT_BACKFLUSH]						AS [MaterialBackflush],
    SC.[PMA_SEC_UOM]							COLLATE Latin1_General_CI_AS	AS [SecUoM],
    SC.[PMA_SEC_ROUND]							AS [SecRound],
    SC.[PMA_FULL_SHIP_ONLY]						AS [FullShipOnly],
    SC.[PMA_PRO_RATA_PHANTOM]					AS [ProRataPhantom],
    SC.[PMA_CREATE_BTB_WO]						COLLATE Latin1_General_CI_AS	AS [CreateBTBWO],
    SC.[PMA_DELTA_PARTIAL_QTY]					COLLATE Latin1_General_CI_AS	AS [DeltaPartialQuantity],
    SC.[PMA_WARRANTY_TRACKED]					AS [WarrantyTracked],
    SC.[PMA_WARRANTY_TYPE]						COLLATE Latin1_General_CI_AS	AS [WarrantyType],
    SC.[PMA_DELTA_HHT_ENABLED]					AS [DeltaHHTEnabled],
    SC.[PMA_EXPIRY_DATE_VALIDATION]				AS [ExpiryDateValidation],
    SC.[PMA_EXPIRY_DATE_TOLERANCE]				AS [ExpiryDateTolerance],
    SC.[PMA_MRP_EXPIRY_DATE_CALC]				AS [MRPExpiryDateCalc],
    SC.[PMA_CONSOLIDATION_DAYS]					AS [ConsolidationDays],
	ISNULL(HICS.[PrintedLotNumberPosition],'')	AS [PrintedLotNumberPosition],
	ISNULL(HICS.[UnitBarcode],'')				AS [UnitBarcode],
	ISNULL(HICS.[GroupedBarcode],'')			AS [GroupedBarcode]
FROM 
				[ASC_LIVE].[dbo].[ASC_PMA_TBL]	SC		WITH (NOLOCK)
LEFT OUTER JOIN	[Tb_SC_Parts]					HICS	WITH (NOLOCK) ON SC.[PMA_UNIQUE] = HICS.[LnkPartID]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_PriceMatrix]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_PriceMatrix] as
SELECT
	[VEN_UNIQUE]				AS [ID],
    [VEN_SOURCE_IND]			AS [SrouceID],
    [VEN_CREATED]				AS [CreatedOn],
    [VEN_UPDATED]				AS [ModifiedOn],
    [VEN_PART_ONLY]			COLLATE Latin1_General_CI_AS	AS [Part],
    [VEN_PART_REV]			COLLATE Latin1_General_CI_AS	AS [PartRev],
    [VEN_CODE]				COLLATE Latin1_General_CI_AS	AS [SupCode],
    [VEN_MANUF]				COLLATE Latin1_General_CI_AS	AS [Manufacturer],
    [VEN_FROM_QTY]				AS [QtyFrom],
    [VEN_TO_QTY]				AS [QtyTo],
    [VEN_FROM_DATE]				AS [DateFrom],
    [VEN_TO_DATE]				AS [DateTo],
    [VEN_PART_CODE]			COLLATE Latin1_General_CI_AS	AS [PartCode],
    [VEN_PART_REF_ONLY]		COLLATE Latin1_General_CI_AS	AS [PartRef],
    [VEN_PART_REF_REV]		COLLATE Latin1_General_CI_AS	AS [PartRefRev],
    [VEN_MANUF_PART_ONLY]	COLLATE Latin1_General_CI_AS	AS [ManufacturerPart],
    [VEN_MANUF_PART_REV]	COLLATE Latin1_General_CI_AS	AS [ManufacturerPartRev],
    [VEN_NOTE]				COLLATE Latin1_General_CI_AS	AS [Note],
    [VEN_STATUS]			COLLATE Latin1_General_CI_AS	AS [Status],
    [VEN_PRICE]					AS [Price],
    [VEN_PRICE_PER]				AS [PricePer],
    [VEN_DISCOUNT]				AS [Rebate],
    [VEN_CURRENCY]			COLLATE Latin1_General_CI_AS	AS [Currency],
    [VEN_OK]				COLLATE Latin1_General_CI_AS	AS [OK],
    [VEN_DATE_CREATED]			AS [DateCreated],
    [VEN_DATE_AMENDED]			AS [DateModified],
    [VEN_UOM]				COLLATE Latin1_General_CI_AS	AS [UoM],
    [VEN_FACTOR]				AS [Factor],
    [VEN_RATING1]				AS [Rating1],
    [VEN_RATING2]				AS [Rating2],
    [VEN_RATING3]				AS [Rating3],
    [VEN_RATING4]				AS [Rating4],
    [VEN_RATING5]				AS [Rating5],
    [VEN_JOB]				COLLATE Latin1_General_CI_AS	AS [Job],
    [VEN_UOP]				COLLATE Latin1_General_CI_AS	AS [UoP],
    [VEN_UOP_PRICE]				AS [UoPPrice],
    [VEN_UOP_PRICE_PER]			AS [UoPPricePer],
    [VEN_ANY_CURR_FLAG]			AS [AnyCurrency],
    [VEN_OOS]					AS [OOS],
    [VEN_OOS_DATE]				AS [OOSDate],
    [VEN_LEAD]					AS [Lead],
    [VEN_APPROVED]				AS [Approved]
FROM
	[ASC_PILOT].[dbo].[ASC_VEN_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_PriceMatrix]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_ASC_LIVE_Rep_PriceMatrix] as
SELECT 
	ISNULL(S.[Code],'')						AS [SupCode],
	ISNULL(S.[Name],'')						AS [SupName],
	ISNULL(S.[Phone],'')					AS [SupTel],
	ISNULL(S.[Contact],'')					AS [SupContact],
	ISNULL(S.[Postcode],'')					AS [SupPostcode],
	P.[Part],
	CASE P.[ProcurementCode]
		WHEN '0' THEN 'Yes'
		ELSE 'No'
	END										AS [Phantomised],
	P.[Description1],
	P.[Description2],
	ISNULL(V.[QtyFrom],0)					AS [QtyFrom],
	ISNULL(V.[QtyTo],0)						AS [QtyTo],
	ISNULL(V.[Price],0)						AS [Price],
	ISNULL(V.[PricePer],0)					AS [PricePer],
	ISNULL(V.[Currency],'')					AS [Currency],
	ISNULL(V.[Rebate],0)					AS [Rebate],
	ISNULL(V.[Price] - V.[Rebate],0)		AS [NetPrice],
	ISNULL(V.[Note],'')						AS [Note],
	ISNULL(V.[OOS],'')						AS [OOS],
	ISNULL(V.[OOSDate],'')					AS [OOSDate]
FROM
				[vw_ASC_LIVE_Parts]			P
LEFT OUTER JOIN	[vw_ASC_LIVE_PriceMatrix]	V	ON P.[Part]			= V.[Part]
LEFT OUTER JOIN	[vw_ASC_LIVE_Suppliers1]	S	ON V.[SupCode]		= S.[Code] COLLATE Latin1_General_CI_AS

GO
/****** Object:  Table [dbo].[Tb_Users]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Locked] [bit] NOT NULL,
	[LockedOn] [datetime] NULL,
	[LockedBy] [int] NULL,
	[OpenedLast] [datetime] NULL,
	[OpenedCount] [int] NULL,
	[ADUsername] [varchar](255) NOT NULL,
	[Forenames] [varchar](512) NOT NULL,
	[Surname] [varchar](512) NOT NULL,
	[P_LastPage] [varchar](50) NULL,
	[P_LastButton] [varchar](50) NULL,
	[P_LastEnvironment] [int] NULL,
	[Email] [varchar](512) NULL,
	[HideFromList] [bit] NOT NULL,
	[ADCreatedOn] [datetime] NULL,
	[ADDisabled] [bit] NOT NULL,
	[Online] [bit] NOT NULL,
	[LastOnline] [datetime] NULL,
	[Department] [varchar](255) NOT NULL,
	[DistinguishedName] [varchar](255) NOT NULL,
	[DistinguishedManager] [varchar](255) NOT NULL,
	[Manager] [int] NOT NULL,
	[Office] [varchar](255) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[P_CoAI_FontSize] [int] NOT NULL,
	[P_CoAI_SortOrder] [int] NOT NULL,
	[ADGUID] [varchar](50) NULL,
	[GVGUID] [varchar](50) NULL,
	[P_WEDI_SortOrder] [int] NOT NULL,
	[P_WEDI_SearchInData] [bit] NOT NULL,
	[P_ITAR_OrderBy] [varchar](50) NULL,
	[P_ITAR_OrderDirection] [int] NULL,
	[P_ITAR_ActiveOnly] [int] NULL,
	[P_SR_OrderBy] [varchar](50) NULL,
	[P_SR_OrderDirection] [int] NULL,
	[P_SR_ThisYearOnly] [int] NULL,
	[P_SRLT_IncludeCompleted] [int] NULL,
	[P_SR_HideSuperseded] [int] NULL,
	[P_BI_Printer] [varchar](255) NULL,
	[P_SR_Printer] [varchar](255) NULL,
	[P_SR_HideClosed] [int] NULL,
	[P_PM_HidePhantomised] [int] NULL,
	[P_SBU_SkipProductChecks] [int] NULL,
	[PO_CanRaise] [bit] NOT NULL,
	[PO_Limit] [int] NOT NULL,
	[PO_Approver] [int] NULL,
	[P_DOCS_LastSearch] [varchar](255) NULL,
	[P_SR_OnlyMe] [int] NULL,
	[P_AR_FilterAdd] [varchar](50) NULL,
	[P_AR_FilterType] [varchar](50) NULL,
	[P_AR_FilterSupplier] [int] NULL,
	[P_AR_FilterStatus] [int] NULL,
	[P_AR_OrderBy] [varchar](50) NULL,
	[P_AR_OrderDirection] [int] NULL,
	[P_AR_IncludeDisabled] [int] NULL,
	[P_ARA_MineOnly] [int] NULL,
 CONSTRAINT [PK_Tb_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Users]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vw_HICS_Users] as 
SELECT 
	T1.[ID],
	T1.[CreatedOn],
	T1.[CreatedBy],
	T1.[ModifiedOn],
	T1.[ModifiedBy],
	T1.[Locked],
	T1.[LockedOn],
	T1.[LockedBy],
	T1.[ADUsername],
	CASE T1.[DomainSplit]
		WHEN 0 THEN ''
		ELSE LEFT(T1.[ADUsername],[DomainSplit]-1)
	END																					AS [Domain],
	T1.[ADCreatedOn],
	T1.[ADDisabled],
	CASE T1.[DomainSplit]
		WHEN 0 THEN T1.[ADUsername]
		ELSE RIGHT(T1.[ADUsername],LEN(T1.[ADUsername])-[DomainSplit])
	END																					AS [Username],
	T1.[Forenames],
	T1.[Surname],
	CASE
		WHEN	(T1.[Surname] + ', ' + T1.[Forenames] = ', ') OR 
				(LTRIM(RTRIM(T1.[Surname])) = '') OR 
				(LTRIM(RTRIM(T1.[Forenames])) = '') THEN CASE T1.[DomainSplit]
															WHEN 0 THEN T1.[ADUsername]
															ELSE RIGHT(T1.[ADUsername],LEN(T1.[ADUsername])-[DomainSplit])
														END
		ELSE T1.[Surname] + ', ' + T1.[Forenames] 
	END																					AS [FullName],
	lower(T1.[Email])																	AS [Email],
	T1.[Title],
	T1.[Department],
	T1.[Manager],
	T1.[Office],
	T1.[HideFromLists],
	T1.[HICS_LastOpened],
	T1.[HICS_OpenedCount],
	T1.[HICS_LastPage],
	T1.[HICS_LastButton],
	T1.[HICS_Online],
	T1.[HICS_LastOnline],
	T1.[CanRaisePOs],
	T1.[POLimit],
	T1.[POApprover]
FROM 
	(SELECT 
		U.[ID],
		U.[CreatedOn],
		U.[CreatedBy],
		U.[ModifiedOn],
		U.[ModifiedBy],
		U.[Locked],
		U.[LockedOn],
		U.[LockedBy],
		U.[ADUsername],
		PATINDEX('%\%',U.[ADUsername])														AS [DomainSplit],
		U.[ADCreatedOn],
		U.[ADDisabled],
		U.[Forenames],
		U.[Surname],
		ISNULL(U.[Email],'')																AS [Email],
		U.[Title],
		U.[Department],
		U.[Manager],
		U.[Office],
		U.[HideFromList]																	AS [HideFromLists],
		U.[OpenedLast]																		AS [HICS_LastOpened],
		U.[OpenedCount]																		AS [HICS_OpenedCount],
		U.[P_LastPage]																		AS [HICS_LastPage],
		U.[P_LastButton]																	AS [HICS_LastButton],
		U.[Online]																			AS [HICS_Online],
		U.[LastOnline]																		AS [HICS_LastOnline],
		U.[PO_CanRaise]																		AS [CanRaisePOs],
		U.[PO_Limit]																		AS [POLimit],
		U.[PO_Approver]																		AS [POApprover]
	FROM 
		[Tb_Users] U WITH (NOLOCK)) T1
GO
/****** Object:  Table [dbo].[Tb_CoA_Monographs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_CoA_Monographs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Version] [int] NOT NULL,
	[ParentID] [int] NULL,
	[MasterParentID] [int] NULL,
	[Name] [varchar](255) NOT NULL,
	[ShortName] [varchar](15) NOT NULL,
	[Description] [varchar](255) NULL,
	[ConformanceStatement] [varchar](1024) NULL,
	[TimesUsed] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[DontShowPL] [bit] NOT NULL,
 CONSTRAINT [PK_Tb_CoA_Monographs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_CoA_Monographs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_HICS_CoA_Monographs] AS
SELECT 
	M.[CreatedOn],
	U1.[FullName]					AS [CreatedBy],
	M.[ModifiedOn],
	U2.[FullName]					AS [ModifiedBy],
	M.[ID],
	M.[Enabled],
	M.[Version],
	ISNULL(M.[ParentID],'')			AS [ParentID],
	ISNULL(M.[MasterParentID],'')	AS [MasterParentID],
	M.[Name],
	M.[ShortName],
	M.[Description],
	M.[ConformanceStatement],
	M.[TimesUsed]
FROM
				[Tb_CoA_Monographs] M WITH (NOLOCK)
LEFT OUTER JOIN	[vw_HICS_Users]		U1	ON	M.[CreatedBy] = U1.[ID]
LEFT OUTER JOIN	[vw_HICS_Users]		U2	ON	M.[ModifiedBy] = U2.[ID]
where
	m.[DeletedBy] IS NULL
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_PART]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vw_ASC_LIVE_PART] AS
SELECT 
	P.[PMA_CREATED]									AS [CreatedOn],
	P.[PMA_UPDATED]									AS [ModifiedOn],
	P.[PMA_UNIQUE]									AS [ID],
	P.[PMA_PART_ONLY]								AS [Part],
	P.[PMA_DESC]									AS [Description1],
	P.[PMA_DESC_1]									AS [Description2],
	P.[PMA_DESC] +
	CASE P.[PMA_DESC_1] 
		WHEN '' THEN '' 
		ELSE ' ' + P.[PMA_DESC_1] 
	END												AS [Description],
	P.[PMA_EXT]										AS [HasExtraText],
	P.[PMA_DRAWING]									AS [Drawing],
	P.[PMA_DRAWING_REV]								AS [DrawingRevision],
	P.[PMA_PROC_CODE]								AS [ProcCode],
	CASE P.[PMA_PROC_CODE]					
		WHEN 'M' THEN 'Manufactured'
		WHEN 'P' THEN 'Purchased'
		WHEN 'S' THEN 'Sub-contractor'
		WHEN 'O' THEN 'Other'
		WHEN 'I' THEN 'Ignore for MRP purposes'
		WHEN '0' THEN 'Phantomised'
		ELSE 'UNKNOWN'
	END												AS [ProcDescription],
	P.[PMA_ABC_CODE]								AS [PartClass],
	P.[PMA_WH]										AS [DefaultWarehouse],
	P.[PMA_BIN]										AS [DefaultBin],
	P.[PMA_UOM]										AS [UoM],
	P.[PMA_UOI]										AS [UoI],
	P.[PMA_UOO]										AS [UoO],
	P.[PMA_CONV_FACT]								AS [ConvFactor1],
	P.[PMA_CONV_FACT_1]								AS [ConvFactor2],
	P.[PMA_PART_CODE]								AS [CategoryCode],
	P.[PMA_COST]									AS [Cost],
	P.[PMA_COST_PER]								AS [CostPer],
	P.[PMA_COST_MAT]								AS [CostMat],
	P.[PMA_COST_MAT_PER]							AS [CostMatPer],
	P.[PMA_SELL]									AS [Sell],
	P.[PMA_SELL_PER]								AS [SellPer],
	P.[PMA_EFFECT_DATE_ON]							AS [EffectiveFrom],
	P.[PMA_EFFECT_DATE_OFF]							AS [EffectiveUntil],
	P.[PMA_MAN_LEAD]								AS [ManufacturingLeadDays],
	P.[PMA_PUR_LEAD]								AS [PurchasingLeadDays],
	P.[PMA_CRASH_LEAD]								AS [AssemblyDays],
	P.[PMA_EOQ]										AS [EconomicOrderQty],
	P.[PMA_PRIME_SUP]								AS [PrimarySupplier],
	P.[PMA_SUPPLIER_PART]							AS [PrimarySupplierPart],
	P.[PMA_SEC_SUP]									AS [SecondarySupplier],
	P.[PMA_MIN_ORDER]								AS [MinOrderQty],
	P.[PMA_MAX_ORDER]								AS [MaxOrderQty],
	P.[PMA_SAFETY]									AS [StockSafetyLevel],
	P.[PMA_MAX_STOCK]								AS [StockMaxLevel],
	P.[PMA_SHRINKAGE]								AS [Shrinkage],
	P.[PMA_PHYSICAL]								AS [StockPhysical],
	P.[PMA_ORDERED]									AS [StockOnOrder],
	P.[PMA_ALLOCATED]								AS [StockAllocated],
	P.[PMA_DEMAND]									AS [Demand],
	P.[PMA_USAGE_2]									AS [LastPricePaid],
	P.[PMA_LAST_PRICE_PER]							AS [LastPricePaidPerQtyOf],
	P.[PMA_LAST_UOO]								AS [LastPricePaidUnitOfOrder],
	P.[PMA_MADE_IN_ORDERS]							AS [MadeOnWO],
	P.[PMA_CUST_ORDERS]								AS [CustomerOrders],
	P.[PMA_CUST_ALLOCS]								AS [AllocatedOnSO],
	P.[PMA_VAT_IND]									AS [VATCode],
	P.[PMA_WAITING_INV]								AS [QtyAwaitingInvoicing],
	P.[PMA_STOCK_USAGE1]							AS [StockUsage-11Mths],
	P.[PMA_STOCK_USAGE2]							AS [StockUsage-10Mths],
	P.[PMA_STOCK_USAGE3]							AS [StockUsage-9Mths],
	P.[PMA_STOCK_USAGE4]							AS [StockUsage-8Mths],
	P.[PMA_STOCK_USAGE5]							AS [StockUsage-7Mths],
	P.[PMA_STOCK_USAGE6]							AS [StockUsage-6Mths],
	P.[PMA_STOCK_USAGE7]							AS [StockUsage-5Mths],
	P.[PMA_STOCK_USAGE8]							AS [StockUsage-4Mths],
	P.[PMA_STOCK_USAGE9]							AS [StockUsage-3Mths],
	P.[PMA_STOCK_USAGE10]							AS [StockUsage-2Mths],
	P.[PMA_STOCK_USAGE11]							AS [StockUsage-1Mth],
	P.[PMA_STOCK_USAGE12]							AS [StockUsage-ThisMth],
	P.[PMA_STOCK_USAGE13]							AS [StockUsageYTD],
	P.[PMA_INSP_REQ]								AS [DefaultInspectionCode],
	P.[PMA_LAST_USED_DATE]							AS [LastUsedDate],
	P.[PMA_LAST_CHECK_DATE]							AS [LastCheckedDate],
	P.[PMA_SALES_ACCOUNT]							AS [SalesAccCode],
	P.[PMA_COMMODITY_CODE]							AS [CommodityCode],
	P.[PMA_ANAL_FIELD1]								AS [A1_NotUsed],
	P.[PMA_ANAL_FIELD2]								AS [A2_Variant],
	P.[PMA_ANAL_FIELD3]								AS [A3_CustomsCodes],
	P.[PMA_ANAL_FIELD4]								AS [A4_Analysis/NominalDetail],
	P.[PMA_ANAL_FIELD5]								AS [A5_PackType2],
	P.[PMA_ANAL_FIELD6]								AS [A6_StockNominalAccountDetail],
	P.[PMA_ANAL_FIELD7]								AS [A7_PackType],
	P.[PMA_ANAL_FIELD8]								AS [A8_PurchaseAnalysisDetail],
	P.[PMA_ANAL_FIELD9]								AS [A9_TaxTariffCode],
	P.[PMA_ANAL_FIELD10]							AS [A10_ProductGroup],
	P.[PMA_WEIGHT]									AS [Weight],
	P.[PMA_WEIGHT_PER]								AS [WeightPer],
	P.[PMA_WEIGHT_UOM]								AS [WeightUoM],
	P.[PMA_CAPACITY]								AS [Capacity],
	P.[PMA_CAPACITY_PER]							AS [CapacityPer],
	P.[PMA_CAPACITY_UOM]							AS [CapacityUoM],
	P.[PMA_AV_MATERIAL]								AS [AverageMaterialPer],
	P.[PMA_PRODUCT_GROUP]							AS [ProductGroup],
	P.[PMA_LOT_GROUP]								AS [LotGroup],
	P.[PMA_PRICE_UOM]								AS [PricingUnitOfMeasure],
	P.[PMA_SALES_UOM]								AS [SalesUnitOfMeasure],
	CASE P.[PMA_NON_STOCK_ITEM]
		WHEN 'Y' THEN 'N'
		WHEN 'N' THEN 'Y'
		ELSE 'UNKNOWN'
	END												AS [StockItem],
	P.[PMA_INCREMENT]								AS [IncrementsOf],
	P.[PMA_CREATE_MSC]								AS [CreateMasterSchedules],
	P.[PMA_CREATE_BTB_PO]							AS [BackToBackPO],
	P.[PMA_CREATE_BTB_WO]							AS [BackToBackWO],
	P.[PMA_ALLOC_TOLERANCE],
	P.[PMA_ALLOC_RULE_1],
	P.[PMA_ALLOC_RULE_2],
	P.[PMA_UOP]										AS [UnitofPurchase],
	P.[PMA_CR_SHOP_SO_FULL],
	P.[PMA_DUTY_CODE],
	P.[PMA_DUTYABLE_CONTENT],
	P.[PMA_TIED_PART_ONLY]							AS [TiedPart],
	P.[PMA_NO_PO_COST_UPDATE],
	P.[PMA_USE_BATCH_LIFE_CYCLE_TRACKING],
	P.[PMA_ALLOW_BOM_IN_MRP],
	P.[PMA_BAR_CODE]								AS [PartBarcode],
	P.[PMA_MIN_SELLING_PRICE]						AS [MinimumSellingPrice],
	P.[PMA_RRP]										AS [RRP],
	P.[PMA_ENFORCE_MIN_SELL]						AS [EnforceMinSellingPrice],
	P.[PMA_EAN_CODE]								AS [EAN-13Code],
	P.[PMA_QTY_PER_PALLET]							AS [QtyPerPallet],
	P.[PMA_APP_SALE],
	P.[PMA_LONG_PART_NUMBER],
	P.[PMA_SO_INCREMENT],
	P.[PMA_MIN_SO_QTY],
	P.[PMA_REQ_PO_APPROVAL],
	P.[PMA_MAT_BACKFLUSH]
FROM 
	[ASC_LIVE].[dbo].[ASC_PMA_TBL] P WITH (NOLOCK)

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Users]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_ASC_LIVE_Users] AS
SELECT 
	U.[USER_DATE_PUTIN]									AS [CreatedOn],
	ISNULL(U.[USER_DATE_EDITED],'')						AS [ModifiedOn],
	ISNULL(U.[USER_EDITED],'')							AS [ModifiedBy],
	P.[PP_CODE]											AS [Code],
	U.[USER_NAME]										AS [Username],
	P.[PP_TITLE]										AS [Title],
	P.[PP_FIRST_NAME]									AS [Forenames],
	P.[PP_SURNAME]										AS [Surname],
	CASE P.[PP_FIRST_NAME] + P.[PP_SURNAME]
		WHEN '' THEN U.[USER_NAME]
		ELSE P.[PP_SURNAME] + ', ' + P.[PP_FIRST_NAME]
	END													AS [Fullname],
	P.[PP_JOB_TITLE]									AS [JobTitle],
	ISNULL(P.[PP_EMAIL],'')								AS [Email],
	ISNULL(U.[DATE_IN] + U.[TIME_IN],'')				AS [LastLoggedIn],
	U.[USER_NUMBER_LOGONS]								AS [NumberOfLogons],
	U.[USER_PROFILE_CODE]								AS [SecurityProfile]
	,U.*
FROM
					[ASC_LIVE].[dbo].[SYS_PEOPLE]	P WITH (NOLOCK)
LEFT OUTER JOIN		[ASC_LIVE].[dbo].[SYS_USER]		U WITH (NOLOCK)	ON	P.[PP_CODE] = U.[USER_ID]

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_SystemCodes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[vw_ASC_LIVE_SystemCodes] AS
SELECT 
	
	C.[CDS_UNIQUE]					AS [ID],
	C.[CDS_SOURCE_IND]				AS [SourceID],
	C.[CDS_CREATED]					AS [CreatedOn],
	C.[CDS_UPDATED]					AS [ModifiedOn],
	C.[CDS_PK]					COLLATE Latin1_General_CI_AS	AS [TypeCode],
	CASE C.[CDS_PK] COLLATE Latin1_General_CI_AS
		WHEN '2' THEN 'Duty code'
		WHEN '4' THEN 'Downtime reason code'
		WHEN 'C' THEN 'Customer type'
		WHEN 'G' THEN 'Country code'
		WHEN 'I' THEN 'Rejection code'
		WHEN 'Q' THEN 'Question of Quality actions'
		WHEN 'R' THEN 'Sales Order Status Reason'
		WHEN 'V' THEN 'VAT Information'
		WHEN 'W' THEN 'Warehouse'
		WHEN 'Y' THEN 'UoM'
		ELSE 'Unknown (' + C.[CDS_PK] COLLATE Latin1_General_CI_AS + ')'
	END	COLLATE Latin1_General_CI_AS							AS [TypeDescription],
	C.[CDS_TYPE]				COLLATE Latin1_General_CI_AS	AS [SystemCode],
	C.[CDS_TEXT]				COLLATE Latin1_General_CI_AS	AS [SystemDescription],
	C.[CDS_TEXT_1]				COLLATE Latin1_General_CI_AS	AS [SystemDescription1],
	C.[CDS_ABC_DAYS]				AS [ABCDays],
	C.[CDS_ABC_LAST_DATE]			AS [ABCLastDate],
	C.[CDS_ABC_NEXT_DATE]			AS [ABCNextDate],
	C.[CDS_CURR_CONVERSION]		COLLATE Latin1_General_CI_AS	AS [CurrencyConversion],
	C.[CDS_CURR_RATE]				AS [CurrencyRate],
	C.[CDS_CURR_ROUNDING]			AS [CurrencyRounding],
	C.[CDS_RECALC]				COLLATE Latin1_General_CI_AS	AS [Recalc],
	C.[CDS_INSP_TYPE]			COLLATE Latin1_General_CI_AS	AS [InspectionType],
	C.[CDS_INSP_REJ_TYPE]		COLLATE Latin1_General_CI_AS	AS [InspectionRejectionType],
	C.[CDS_PAY_CREDIT_DAYS]			AS [PayCreditDays],
	C.[CDS_PAY_CHARGED_AT]			AS [PayChargedAt],
	C.[CDS_PAY_CREDIT_MONTH]	COLLATE Latin1_General_CI_AS	AS [PayCreditMonth],
	C.[CDS_WH_CONS_LOTS]		COLLATE Latin1_General_CI_AS	AS [WHConsLots],
	C.[CDS_SET_DISC_PERC]			AS [SettlementDiscPerc],
	C.[CDS_SET_DISC_DAYS]			AS [SettlementDiscDays],
	C.[CDS_SET_OVER_VALUE]			AS [SettlementDiscOverVal],
	C.[CDS_MILEAGE_RATE]			AS [MileageRate],
	C.[CDS_DUTY_RATE]				AS [DutyRate],
	C.[CDS_DUTY_PER]			COLLATE Latin1_General_CI_AS	AS [DutyPer],
	C.[CDS_USE_AS_ACTUAL_COS]	COLLATE Latin1_General_CI_AS	AS [UseAsActualCos],
	C.[CDS_EU_MEMBER_STATE]		COLLATE Latin1_General_CI_AS	AS [EUMemberState],
	C.[CDS_EDI_MEASURE_IND]		COLLATE Latin1_General_CI_AS	AS [EDIMeasureInd],
	C.[CDS_LABOUR_QTY]				AS [LabourQty],
	C.[CDS_QOQ_TYPE]				AS [QoQType],
	C.[CDS_QOQ_ACTION_CODE]		COLLATE Latin1_General_CI_AS	AS [QoQActionCode]
FROM
	[ASC_LIVE].[dbo].[ASC_CDS_ASC] C WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Customers]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_ASC_LIVE_Customers] AS
SELECT
	A1.[CU_DATE_PUTIN]			AS [CreatedOn],
	A1.[CU_USER_PUTIN]			AS [CreatedBy],
	ISNULL(U1.[Fullname],'')	AS [CreatedByFullname],
	A1.[CU_DATE_EDITED]			AS [ModifiedOn],
	A1.[CU_USER_EDITED]			AS [ModifiedBy],
	ISNULL(U2.[Fullname],'')	AS [ModifiedByFullname],
	A1.[CUCODE]					AS [Code],
	A1.[CUNAME]					AS [Name],
	A1.[CUADDRESS]				AS [AddressStreet],
	A1.[CU_ADDRESS_USER1]		AS [AddressTown],
	A1.[CU_ADDRESS_USER2]		AS [AddressCounty],
	A1.[CUPOSTCODE]				AS [AddressPostcode],
	A1.[CU_COUNTRY]				AS [AddressCountry],
	A1.[CU_COUNTRY_CODE]		AS [CountryCode],
	S1.[SystemDescription]		AS [CountryCodeDescription],
	A1.[CUPHONE]				AS [Telephone],
	A1.[CUFAX]					AS [Fax],
	A1.[CUCONTACT]				AS [ContactFullname],
	A2.[CU_CONTACT_TITLE]		AS [ContactTitle],
	A2.[CU_CONTACT_INITIALS]	AS [ContactInitials],
	A2.[CU_CONTACT_FIRSTNAME]	AS [ContactFirstName],
	A2.[CU_CONTACT_SURNAME]		AS [ContactSurname],
	A2.[CU_CONTACT_JOB]			AS [ContactJobTitle],
	A1.[CUSALUTE]				AS [ContactSalute],
	A2.[CU_MOBILE_NUMBER]		AS [ContactMobile],
	A1.[CU_EMAIL]				AS [ContactEmail],
	A1.[CU_EXPORT_CODE]			AS [ExportCode],
	CASE A1.[CU_EXPORT_CODE]
		WHEN 'U' THEN 'GB VAT'
		WHEN 'O' THEN 'Non-EU State'
		WHEN 'E' THEN 'EU State'
		ELSE 'Unknown (' + A1.[CU_EXPORT_CODE] + ')'
	END							AS [ExportCodeDescription],
	A1.[CU_VAT_REG_NO]			AS [VATNumber],
	A1.[CU_EC_DELIVERY]			AS [EUDelivery],
	A1.[CU_EC_T_NATURE]			AS [EUTransaction],
	A1.[CU_EC_T_MODE]			AS [EUTransport],
	A1.[CUSORT]					AS [SortKey],
	A1.[CUUSER1]				AS [UserSort1],
	A1.[CUUSER2]				AS [UserSort2],
	A1.[CUUSER3]				AS [UserSort3],
	A1.[CUCURRENCYCODE]			AS [Currency],
	A1.[CU_NOTES]				AS [Notes],
	A1.[CU_ANALYSIS]			AS [SalesAnalysis],
	A1.[CU_TAX_CODE]			AS [VATCode],
	S2.[SystemDescription]		AS [VATDescription],
	A1.[CU_SOURCE]				AS [Source],
	A1.[CU_TERMS_LINK]			AS [TermsLink],
	A1.[CU_MULTI_CURR]			AS [MultiCurrency],
	A1.[CU_MULTIADD_FLG]		AS [MultiAddFlg],
	A1.[CU_INV_ADD_CDE]			AS [InvoiceAddressCode],
	A1.[CU_DEL_ADD_CDE]			AS [DeliveryAddressCode],
	A1.[CU_ON_STOP]				AS [OnStop],
	A1.[CU_A_P_DAYS]			AS [APDays],
	A1.[CU_PRICE_KEY]			AS [PriceKey],
	A2.[CU_USRCHAR4]			AS [CoAEmailTo],
	A2.[CU_BANK_BANKNAME]		AS [BankName],
	A2.[CU_BANK_SORT]			AS [BankSortCode],
	A2.[CU_BANK_AC_NO]			AS [BankAccNo],
	A2.[CU_BANK_AC_NAME]		AS [BankAccName],
	A2.[CU_BANK_BACSREF]		AS [BankBACSRef],
	A2.[CU_IBAN_NO]				AS [IBAN],
	A2.[CU_OUR_ACCOUNT_CODE]	AS [OurAccCode]
FROM
				[ASC_LIVE].[dbo].[SL_ACCOUNTS]	A1  WITH (NOLOCK)
LEFT OUTER JOIN [ASC_LIVE].[dbo].[SL_ACCOUNTS2]	A2  WITH (NOLOCK)	ON	A1.[CUCODE]				= A2.[CUCODE2]
LEFT OUTER JOIN	[vw_ASC_LIVE_USERS]				U1	ON	A1.[CU_USER_PUTIN]		= U1.[Code]
LEFT OUTER JOIN	[vw_ASC_LIVE_USERS]				U2	ON	A1.[CU_USER_EDITED]		= U2.[Code]
LEFT OUTER JOIN [vw_ASC_LIVE_SystemCodes]		S1	ON	A1.[CU_COUNTRY_CODE]	= S1.[SystemCode]	COLLATE Latin1_General_CI_AS
													AND	S1.[TypeCode]			= 'G'
LEFT OUTER JOIN [vw_ASC_LIVE_SystemCodes]		S2	ON	A1.[CU_TAX_CODE]		= S2.[SystemCode]	COLLATE Latin1_General_CI_AS
													AND	S2.[TypeCode]			= 'V'


												
GO
/****** Object:  Table [dbo].[Tb_CoA_PrintMaps]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_CoA_PrintMaps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkCustomer] [int] NOT NULL,
	[LnkProduct] [int] NOT NULL,
	[LnkMonographID] [int] NOT NULL,
	[Filename] [varchar](512) NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Tb_CoA_PrintMaps] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_CoA_PrintMaps]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_HICS_CoA_PrintMaps] AS
SELECT 
	PM.[CreatedOn],
	U1.[FullName]				AS [CreatedBy],
	PM.[ID],
	ISNULL(C.[Name],'')			AS [Customer],
	ISNULL(P.[Part],'')			AS [Part],
	ISNULL(M.[ShortName],'')	AS [Monograph],
	PM.[Filename]				AS [Filename],
	PM.[Deleted]				AS [Deleted],
	ISNULL(PM.[DeletedOn],'')	AS [DeletedOn],
	ISNULL(U2.[FullName],'')	AS [DeletedBy]
FROM
				[Tb_CoA_PrintMaps]			PM WITH (NOLOCK)
LEFT OUTER JOIN [vw_HICS_Users]				U1	ON	PM.[CreatedBy]		= U1.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_CUSTOMERS]		C	ON	PM.[LnkCustomer]	= C.[Code]
LEFT OUTER JOIN [vw_ASC_LIVE_PART]			P	ON	PM.[LnkProduct]		= P.[ID]
LEFT OUTER JOIN [vw_HICS_CoA_Monographs]	M	ON	PM.[LnkMonographID]	= M.[ID]
LEFT OUTER JOIN [vw_HICS_Users]				U2	ON	PM.[DeletedBy]		= U2.[ID]
GO
/****** Object:  Table [dbo].[Tb_CoA_Generations]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_CoA_Generations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[SONo] [varchar](255) NOT NULL,
	[Part] [int] NOT NULL,
	[Test] [int] NOT NULL,
	[Monograph] [int] NOT NULL,
	[Template] [int] NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[Path] [varchar](255) NOT NULL,
	[Sent] [datetime] NULL,
	[SentBy] [int] NULL,
	[Deleted] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[SCBatchNo] [varchar](50) NULL,
 CONSTRAINT [PK_Tb_CoA_Generations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Config]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Config](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Value] [varchar](500) NOT NULL,
	[Description] [varchar](255) NULL,
 CONSTRAINT [PK_Tb_Config] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_CoA_Generations]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE VIEW [dbo].[vw_HICS_CoA_Generations] AS
SELECT 
	G.[ID],
	G.[CreatedOn],
	G.[CreatedBy],
	U.[FullName]				AS [CreatedByUsername],
	G.[SONo]					AS [SalesOrderNo],
	ISNULL(G.[SCBatchNo],'')	AS [SCBatchNo],
	P.[Part],
	G.[Test],
	G.[Monograph],
	M.[Name]					AS [MonographName],
	PM.[Filename]				AS [TemplateName],
	G.[Filename]				AS [FileName],
	C.[Value] + G.[Path]		AS [Path],
	ISNULL(G.[Sent],'')			AS [SentOn],
	ISNULL(U2.[FullName],'')	AS [SentBy]
FROM 
				[Tb_CoA_Generations]			G WITH (NOLOCK)
LEFT OUTER JOIN [vw_HICS_Users]					U	ON G.[CreatedBy]	= U.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_Parts] 			P	ON G.[Part]			= P.[ID]
LEFT OUTER JOIN [vw_HICS_CoA_Monographs]		M	ON G.[Monograph]	= M.[ID]
LEFT OUTER JOIN [vw_HICS_CoA_PrintMaps]			PM	ON G.[Template]		= PM.[ID]
LEFT OUTER JOIN [vw_HICS_Users]					U2	ON G.[SentBy]		= U2.[ID]
CROSS JOIN (select [Value] from Tb_Config where [Name] = 'CoAOutputFolder') C
WHERE
	G.[Deleted] IS NULL

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_VAT_CONTROL]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_ASC_LIVE_VAT_CONTROL] AS
SELECT
	V.[VAT_DATE_PUTIN]					AS [CreatedOn],
	V.[VAT_USER_PUTIN]					AS [CreatedBy],
	ISNULL(U1.[Fullname],'')			AS [CreatedByFullName],
	ISNULL(V.[VAT_DATE_EDITED],'')		AS [ModifiedOn],
	ISNULL(V.[VAT_USER_EDITED],'')		AS [ModifiedBy],
	ISNULL(U2.[Fullname],'')			AS [ModifiedByFullName],
	V.[VAT_CODE]						AS [VATCode],
	V.[VAT_NAME]						AS [VATDescription],
	ISNULL(V.[UPDTE_FROM_YEAR],'')		AS [UpdateFromYear],
	ISNULL(V.[UPDTE_TO_YEAR],'')		AS [UpdateToYear],
	V.[EC_TYPE]							AS [ECType],
	ISNULL(V.[ESL_YEAR_FROM],'')		AS [ESLYearFrom],
	ISNULL(V.[ESL_YEAR_TO],'')			AS [ESLYearTo],
	ISNULL(V.[TAX_SORT_CODE],'')		AS [TAXSortCode],
	V.[VAT_RATE]						AS [VATRate],
	V.[VAT_NET_OUTPUT]					AS [VATNetOutput],
	V.[VAT_NET_INPUT]					AS [VATNetInput],
	V.[VAT_OUTPUT]						AS [VATOutput],
	V.[VAT_INPUT]						AS [VATInput],
	V.[UPDTE_FROM_PER]					AS [UpdateFromPer],
	V.[UPDTE_TO_PER]					AS [UpdateToPer]
FROM
				[ASC_LIVE].[dbo].[SYS_VATCONTROL]	V WITH (NOLOCK)
LEFT OUTER JOIN [vw_ASC_LIVE_USERS]					U1	ON	V.[VAT_USER_PUTIN]			= U1.[Code]			COLLATE Latin1_General_CI_AS
LEFT OUTER JOIN [vw_ASC_LIVE_USERS]					U2	ON	V.[VAT_USER_EDITED]			= U2.[Code]			COLLATE Latin1_General_CI_AS
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_AnalysisCodes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_AnalysisCodes] AS
SELECT
	A.[CAN_UNIQUE]			AS [ID],
	A.[CAN_SOURCE_IND]		AS [SourceID],
	A.[CAN_CREATED]			AS [CreatedOn],
	A.[CAN_UPDATED]			AS [ModifiedOn],
	A.[CAN_TYPE] COLLATE Latin1_General_CI_AS			AS [TypeCode],
	A.[CAN_NUMBER]			AS [LabelCode],
	A.[CAN_CODE] COLLATE Latin1_General_CI_AS			AS [AnalysisCode],
	A.[CAN_DESC] COLLATE Latin1_General_CI_AS			AS [AnalysisDescription],
	A.[CAN_SUN]	COLLATE Latin1_General_CI_AS			AS [Sun]
FROM 
				[ASC_LIVE].[dbo].[ASC_CAN_TBL] A WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_ORDER_TYPE_CODES]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE View [dbo].[vw_ASC_LIVE_ORDER_TYPE_CODES] AS
SELECT 
	O.[OTY_CREATED]								AS [CreatedOn],
	O.[OTY_UPDATED]								AS [ModifiedOn],
	O.[OTY_TYPE] COLLATE Latin1_General_CI_AS	AS [OrderType],
	CASE O.[OTY_TYPE] COLLATE Latin1_General_CI_AS
		WHEN 'A' THEN 'Adjustment'
		WHEN 'P' THEN 'Purchase order'
		WHEN 'S' THEN 'Sales order'
		WHEN 'W' THEN 'Works order'
		ELSE 'Unknown (' + O.[OTY_TYPE] COLLATE Latin1_General_CI_AS + ')'
	END											AS [OrderTypeDescription],
	O.[OTY_CODE] COLLATE Latin1_General_CI_AS	AS [Code],
	O.[OTY_DESC] COLLATE Latin1_General_CI_AS	AS [CodeDescription]
FROM 
	[ASC_LIVE].[dbo].[ASC_OTY_TBL] O WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_SALES_ORDERS]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vw_ASC_LIVE_SALES_ORDERS] AS
SELECT
	C.[COR_CREATED]														AS [CreatedOn],
	C.[COR_ENTERED_BY]													AS [CreatedBy],
	ISNULL(U.[Fullname],'')												AS [CreatedByFullName],
	C.[COR_UPDATED]														AS [ModifiedOn],
	C.[COR_UNIQUE]														AS [ID],
	C.[COR_PART_ONLY]													AS [Part],
	C.[COR_TIED_PART_ONLY]												AS [TiedPart],
	C.[COR_OUR_NUMBER]													AS [OrderRef],
	C.[COR_OUR_NUMBER_N]												AS [OrderNo],
	C.[COR_SUB]															AS [SubLine],
	C.[COR_CUSTOMER_CODE]												AS [Customer],
	C.[COR_CUSTOMER_DUE]												AS [CustomerDueDate],
	C.[COR_CUSTOMER_ORDER]												AS [CustomerOrderRef],
	C.[COR_QTY_ORDERED]													AS [QtyOrdered],
	C.[COR_QTY_ALLOCATED]												AS [QtyAllocated],
	C.[COR_QTY_DELIVERED]												AS [QtyDelivered],
	C.[COR_THIS_DVY_QTY]												AS [QtyOnLastDelivery],
	C.[COR_QTY_INVOICED]												AS [QtyInvoiced],
	C.[COR_EXPECTED_DATE]												AS [ExpectedDate],
	C.[COR_ORIG_PRICE]													AS [OriginalPrice],
	C.[COR_DISC_PRICE]													AS [DiscountedPrice],
	C.[COR_DISC_CODE]													AS [DiscountCode],
	C.[COR_PRICE_PER]													AS [FinalPrice],
	C.[COR_CURRENCY]													AS [OrderCurrency],
	C.[COR_FOREIGN_PRICE]												AS [ForeignPrice],
	C.[COR_ORDER_STATUS]												AS [OrderStatus],
	CASE C.[COR_ORDER_STATUS] 
		WHEN 'B' THEN 'Barred'
		WHEN 'C' THEN 'Complete'
		WHEN 'H' THEN 'Held'
		WHEN ' ' THEN 'Released'
		ELSE 'Unknown (' + C.[COR_ORDER_STATUS] + ')'
	END																	AS [OrderStatusDescription],
	C.[COR_ORDER_STATUS_2]												AS [OrderStatusReason],
	ISNULL(CD1.[SystemDescription],'')									AS [OrderStatusReasonDescription],
	C.[COR_NARR] + C.[COR_NARR_ACT] + C.[COR_NARR_CARR]					AS [ShortNote],
	C.[COR_PAY_TERMS]													AS [PaymentTerms],
	C.[COR_DSP_NOTE]													AS [PicknoteNo],
	C.[COR_WO]															AS [B2BWONo],
	C.[COR_ORDER_TYPE]													AS [OrderType],
	ISNULL(OT.[CodeDescription],'')										AS [OrderTypeDescription],		
	C.[COR_TAX_CODE]													AS [TaxCode],
	ISNULL(V.[VATDescription],'')										AS [TaxDescription],
	C.[COR_ANAL_FIELD2]													AS [TaskForceDetails],
	C.[COR_ANAL_FIELD3]													AS [TransportMethod],
	ISNULL(AC.[AnalysisDescription],'')									AS [TransportMethodDescription],
	C.[COR_ANAL_FIELD6]													AS [On\By],
	C.[COR_ANAL_FIELD7]													AS [OrderStatus2],
	C.[COR_ANAL_FIELD8]													AS [W8Returned],
	C.[COR_ANAL_FIELD9]													AS [DutyAuthorisationRef],
	C.[COR_ANAL_FIELD10]												AS [DeliveryTime],
	C.[COR_ACCOUNT]														AS [SalesAccount],
	CASE C.[COR_PRO_FORMA]
		WHEN 'Y' THEN 'Y'
		ELSE 'N'
	END																	AS [ProFormaOrder],
	C.[COR_APPLY_WL_DISC]												AS [WholeOrderDiscount],
	C.[COR_WL_DISC_CODE]												AS [WholeOrderDiscountCode],
	CASE C.[COR_PICKED_FLAG]
		WHEN 'P' THEN 'Y'
		ELSE 'N'
	END																	AS [PickListPrinted],
	C.[COR_QTY_ENTERED]													AS [QtyOrderedInUoM],
	C.[COR_UOM_ENTERED]													AS [OrderUoM],
	ISNULL(CD2.[SystemDescription],'')									AS [OrderUoMDescription],
	C.[COR_PRICE_SOURCE]												AS [PriceSource],
	C.[COR_PR_LIST]														AS [PRList],
	C.[COR_EXCHANGE_RATE]												AS [ExchangeRate],
	C.[COR_PO]															AS [PO],
	CASE C.[COR_DUTY]
		WHEN 0 THEN 'No duty'
		WHEN 1 THEN 'Has duty'
		WHEN 2 THEN 'Is duty'
		ELSE 'Unknown (' +  CONVERT(VARCHAR(20),C.[COR_DUTY]) + ')'
	END																	AS [Duty],
	C.[COR_NO_DUTY_REASON]												AS [NoDutyReason],
	ISNULL(RTRIM(LEFT(CD3.[SystemDescription], LEN(CD3.[SystemDescription])-2)),'')		AS [NoDutyReasonDescription],
	CASE C.[COR_DUTY_HOW_PAID]
		WHEN 0 THEN 'N\A'
		WHEN 1 THEN 'Deferred'
		WHEN 2 THEN 'Paid Now'
		ELSE 'Unknown (' + CONVERT(VARCHAR(20),C.[COR_DUTY_HOW_PAID]) + ')'
	END																	AS [DutyHowPaid],
	CASE C.[COR_DUTY_CUS_DEFERMENT]
		WHEN 0 THEN 'No deferment'
		WHEN 1 THEN 'Customer deferment with VAT'
		WHEN 2 THEN 'Customer deferment without VAT'
		WHEN 3 THEN 'Our own deferment'
		ELSE 'Unknown (' + CONVERT(VARCHAR(20),C.[COR_DUTY_CUS_DEFERMENT]) + ')'
	END																	AS [DutyCustomerDeferment],
	C.[COR_QTY_PICKED]													AS [LastConfirmedPickQty],
	CASE C.[COR_PROCESS_STATUS]
		WHEN '0' THEN 'order entered, nothing done'
		WHEN '10' THEN 'Awaiting picking'
		WHEN '11' THEN 'Awaiting picking (reserved for future use)'
		WHEN '20' THEN 'Being processed'
		WHEN '30' THEN 'Confirmed picked (ready for despatch)'
		WHEN '40' THEN 'Loaded'
		WHEN '50' THEN 'Despatched'
		WHEN '55' THEN 'Delivery confirmed (reserved for future use)'
		WHEN '60' THEN 'Invoiced'
		ELSE 'Unknown (' + CONVERT(VARCHAR(20),C.[COR_PROCESS_STATUS]) + ')'
	END																	AS [ProcessStatus],
	C.[COR_FIX_FINAL_PRICE]												AS [FixedPrice],
	C.[COR_LINE_NUM]													AS [LineNumber],
	C.[COR_PALLET_QTY]													AS [PalletQty],
	C.[COR_DUEDATE_TYPE]												AS [DueDateType],
	C.[COR_DUE_DAYS]													AS [DueDays]
FROM
				[ASC_LIVE].[dbo].[ASC_COR_TBL]		C  WITH (NOLOCK)
LEFT OUTER JOIN [vw_ASC_LIVE_ORDER_TYPE_CODES]		OT	ON	C.[COR_ORDER_TYPE]					= OT.[Code]				COLLATE Latin1_General_CI_AS
														AND	OT.[OrderType]						= 'S'					COLLATE Latin1_General_CI_AS
LEFT OUTER JOIN [vw_ASC_LIVE_VAT_CONTROL]			V	ON	C.[COR_TAX_CODE]					= V.[VATCode]			COLLATE Latin1_General_CI_AS
LEFT OUTER JOIN	[vw_ASC_LIVE_AnalysisCodes]			AC	ON	C.[COR_ANAL_FIELD3]					= AC.[AnalysisCode]		COLLATE Latin1_General_CI_AS
														AND	AC.[TypeCode]						= 'T'
														AND AC.[LabelCode]						= 3
LEFT OUTER JOIN [vw_ASC_LIVE_SystemCodes]			CD1	ON	C.[COR_ORDER_STATUS_2]				= CD1.[SystemCode]		COLLATE Latin1_General_CI_AS
														AND CD1.[TypeCode]						= 'R'
LEFT OUTER JOIN [vw_ASC_LIVE_SystemCodes]			CD2	ON	C.[COR_UOM_ENTERED]					= CD2.[SystemCode]		COLLATE Latin1_General_CI_AS
														AND CD2.[TypeCode]						= 'Y'
LEFT OUTER JOIN [vw_ASC_LIVE_SystemCodes]			CD3	ON	C.[COR_NO_DUTY_REASON]				= CD3.[SystemCode]		COLLATE Latin1_General_CI_AS
														AND CD3.[TypeCode]						= 'I'
														AND RIGHT(CD3.[SystemDescription],2)	= '5N'
LEFT OUTER JOIN [vw_ASC_LIVE_USERS]					U	ON	C.[COR_ENTERED_BY]					= U.[Code]			COLLATE Latin1_General_CI_AS

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Bins]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_ASC_LIVE_Bins] AS
SELECT 
	B.[WHB_UNIQUE]																		AS [ID],
	B.[WHB_SOURCE_IND]																	AS [SourceID],
	B.[WHB_CREATED]																		AS [CreatedOn],
	B.[WHB_UPDATED]																		AS [ModifiedOn],
	B.[WHB_WH]	COLLATE Latin1_General_CI_AS											AS [Warehouse],
	ISNULL(LTRIM(RTRIM(LEFT(S.[SystemDescription],LEN(S.[SystemDescription])-2))),'')	AS [WarehouseDescription],
	B.[WHB_BIN_ONLY]	COLLATE Latin1_General_CI_AS									AS [Bin],
	B.[WHB_DESC]	COLLATE Latin1_General_CI_AS										AS [BinDescription],
	ISNULL(B.[WHB_CHECK_DATE],'')														AS [CheckDate],
	B.[WHB_COMMENTS]	COLLATE Latin1_General_CI_AS									AS [Comments],
	B.[WHB_W1]			COLLATE Latin1_General_CI_AS									AS [W1],
	B.[WHB_W2]			COLLATE Latin1_General_CI_AS									AS [W2],
	B.[WHB_W3]			COLLATE Latin1_General_CI_AS									AS [W3],
	B.[WHB_W4]			COLLATE Latin1_General_CI_AS									AS [W4],
	B.[WHB_W5]			COLLATE Latin1_General_CI_AS									AS [W5]
FROM 
				[ASC_LIVE].[dbo].[ASC_WHB_TBL]	B  WITH (NOLOCK)
LEFT OUTER JOIN	[vw_ASC_LIVE_SystemCodes]		S	WITH (NOLOCK) ON	B.[WHB_WH] COLLATE Latin1_General_CI_AS		= S.[SystemCode]
													AND	S.[TypeCode]	= 'W'
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_BoMs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_ASC_LIVE_BoMs] as 
SELECT 
	B.[BOM_UNIQUE]						AS [ID],
	B.[BOM_SOURCE_IND]					AS [SourceID],
	B.[BOM_CREATED]						AS [CreatedOn],
	B.[BOM_UPDATED]						AS [ModifiedOn],
	B.[BOM_PARENT_PART_ONLY]	COLLATE Latin1_General_CI_AS		AS [ParentPart],
	B.[BOM_PARENT_PART_REV]		COLLATE Latin1_General_CI_AS		AS [ParentPartRev],
	B.[BOM_OWNED_PART_ONLY]		COLLATE Latin1_General_CI_AS		AS [OwnedPart],
	B.[BOM_OWNED_PART_REV]		COLLATE Latin1_General_CI_AS		AS [OwnedPartRev],
	B.[BOM_USED_BY_CODE]		COLLATE Latin1_General_CI_AS		AS [UsedBy],
	B.[BOM_REF]					COLLATE Latin1_General_CI_AS		AS [Ref],
	B.[BOM_IL]							AS [Sequence],
	B.[BOM_QTY_USED]					AS [QtyUsed],
	B.[BOM_DIVISION_FACTOR]				AS [DivisionFactor],
	B.[BOM_HOW_USED]			COLLATE Latin1_General_CI_AS		AS [HowUsed],
	B.[BOM_EXTRA_TEXT]			COLLATE Latin1_General_CI_AS		AS [HasExtraText],
	B.[BOM_ON_ORDER_FLAG]		COLLATE Latin1_General_CI_AS		AS [ShownOnSales],
	B.[BOM_PERCENTAGE_USED]				AS [PercentageUsed],
	CASE B.[BOM_FIXED]
		WHEN 0 THEN 'N'
		WHEN 1 THEN 'Y'
		ELSE 'Unknown (' + CONVERT(VARCHAR(20),B.[BOM_FIXED]) + ')'
	END 								AS [Fixed],
	B.[BOM_ECO]							AS [ECONo],
	ISNULL(B.[BOM_EFFECT_ON_DATE],'')	AS [EffectiveFrom],
	ISNULL(B.[BOM_EFFECT_OFF_DATE],'')	AS [EffectiveUntil],
	B.[BOM_ANAL_1]				COLLATE Latin1_General_CI_AS		AS [Analysis1],
	B.[BOM_ANAL_2]				COLLATE Latin1_General_CI_AS		AS [Analysis2],
	B.[BOM_ANAL_3]				COLLATE Latin1_General_CI_AS		AS [Analysis3],
	B.[BOM_ANAL_4]				COLLATE Latin1_General_CI_AS		AS [Analysis4],
	B.[BOM_ANAL_5]				COLLATE Latin1_General_CI_AS		AS [Analysis5],
	B.[BOM_ANAL_6]				COLLATE Latin1_General_CI_AS		AS [Analysis6],
	B.[BOM_ANAL_7]				COLLATE Latin1_General_CI_AS		AS [Analysis7],
	B.[BOM_ANAL_8]				COLLATE Latin1_General_CI_AS		AS [Analysis8],
	B.[BOM_ANAL_9]				COLLATE Latin1_General_CI_AS		AS [Analysis9],
	B.[BOM_ANAL_0]				COLLATE Latin1_General_CI_AS		AS [Analysis0],
	B.[BOM_COMMENTS_1]			COLLATE Latin1_General_CI_AS		AS [Comment1],
	B.[BOM_COMMENTS_2]			COLLATE Latin1_General_CI_AS		AS [Comment2],
	B.[BOM_QTY_DIVISOR]					AS [QtyDivisor],
	B.[BOM_QTY_DIVIDEND]				AS [QtyDividend],
	B.[BOM_ORIG_QTY_USED]				AS [OriginalQtyUsed]
FROM
	[ASC_LIVE].[dbo].[ASC_BOM_TBL] B WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_PartsWithoutBoMs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_ASC_LIVE_Rep_PartsWithoutBoMs] as 
SELECT
	P.[Part],
	CONVERT(DATE,P.[CreatedOn])	AS [CreatedOn],
	RTRIM(P.[Description1] + ' ' + P.[Description2]) AS [Description],
	P.[ProcurementCode],
	P.[MaterialCost],
	P.[MaterialCostPer],
	P.[UoM]
FROM 
	[vw_ASC_LIVE_Parts] P 
WHERE
	P.[Part] NOT IN (SELECT DISTINCT [ParentPart] FROM [vw_ASC_LIVE_BoMs])
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_TO_BE_INVOICED]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_TO_BE_INVOICED] as 
SELECT 
	I.[TBI_CREATED]				AS [CreatedOn],
	I.[TBI_UPDATED]				AS [ModifiedOn],
	I.[TBI_INVOICE_DATE]		AS [InvoiceDate],
	I.[TBI_DELIVERY_DATE]		AS [DeliveryDate],
	I.[TBI_OUR]					AS [OrderRef],
	CONVERT(INT,I.[TBI_OUR])	AS [OrderNo],
	I.[TBI_SOURCE_IND]			AS [Source],
	I.[TBI_PART_ONLY]			AS [Part],
	I.[TBI_SUB]					AS [SubLine],
	I.[TBI_NUM]					AS [SubNumber],
	I.[TBI_QTY]					AS [QtyDspInv],
	CASE I.[TBI_STAT_AC]
		WHEN 'Y' THEN 'Y'
		WHEN ' ' THEN 'N'
		ELSE 'Unknown (' + I.[TBI_STAT_AC] + ')'
	END							AS [InJournal],
	I.[TBI_STATUS]				AS [StatusCode],
	CASE I.[TBI_STATUS]
		WHEN ' ' THEN 'Prepared for despatch'
		WHEN 'D' THEN 'Printed on despatch note'
		WHEN 'J' THEN 'Journalled (becomes P at end of invoice processing)'
		WHEN 'P' THEN 'Printed on invoice (credits are invoices with - value)'
		WHEN 'C' THEN 'Credited invoice (Complete - has been replaced by cr.note & new despatched order, which can be adjusted)'
		WHEN 'E' THEN 'Reprinting despatch note (While at status D)'
		WHEN 'U' THEN 'Reprinting despatch note (While at status J)'
		WHEN 'I' THEN 'Reprinting despatch note (While at status P)'
		WHEN 'S' THEN 'Reprinting invoice (While at status J)'
		WHEN 'R' THEN 'Reprinting invoice (While at status P)'
		WHEN 'T' THEN 'Reprinting invoice (when at stage C)'
		WHEN 'V' THEN 'Reversed despatch'
		ELSE 'Unknown (' + I.[TBI_STATUS] + ')'
	END							AS [StatusCodeDescription],
	I.[TBI_ORIG_PRICE]			AS [OriginalPrice],
	I.[TBI_PRICE]				AS [Price],
	I.[TBI_CURRENCY]			AS [Currency],
	I.[TBI_FOREIGN_PRICE]		AS [ForeignPrice],
	I.[TBI_LOT_TYPE]			AS [LotType],
	I.[TBI_LOT_NUM]				AS [LotNum],
	I.[TBI_SERIAL_NO]			AS [SerialRef],
	I.[TBI_COST_OF_SALE]		AS [CostOfSale],
	I.[TBI_ORIG_INVOICE_NO]		AS [OriginalInvoiceNo],
	I.[TBI_INVOICE_NO]			AS [InvoiceNo],
	I.[TBI_DELIVERY_NO]			AS [DespatchNo],
	I.[TBI_CUS]					AS [CustomerCode],
	C.[Name]					AS [CustomerName],
	I.[TBI_CUS_TYPE]			AS [CustomerType],
	ISNULL(S.[SystemDescription],'')		AS [CustomerTypeDescription],
	I.[TBI_ANAL_FIELD1]			AS [AnalysisField1],
	I.[TBI_ANAL_FIELD2]			AS [AnalysisField2],
	I.[TBI_ANAL_FIELD3]			AS [AnalysisField3],
	I.[TBI_ANAL_FIELD4]			AS [AnalysisField4],
	I.[TBI_ANAL_FIELD5]			AS [AnalysisField5],
	I.[TBI_ACTUAL_COST]			AS [AcutalCost],
	I.[TBI_ACTUAL_COST_MAT]		AS [ActualMaterialCost],
	I.[TBI_EXCHANGE_RATE]		AS [ExchangeRate],
	I.[TBI_DUTY_TYPE]			AS [DutyType],
	I.[TBI_SL_PERIOD]			AS [AccoutingPeriod],
	I.[TBI_W5_NUMBER]			AS [W5Number],
	I.[TBI_CALC_WEIGHT]			AS [CalculatedWeight],
	I.[TBI_ACT_WEIGHT]			AS [ActualWeight],
	I.[TBI_ACT_WEIGHT_UOM]		AS [ActualWeightUoM],
	I.[TBI_CALC_VOLUME]			AS [CalculatedVolume],
	I.[TBI_ACT_VOLUME]			AS [ActualVolume],
	I.[TBI_SPCK_UNIQUE]			AS [PicknoteID]
FROM
	 			[ASC_LIVE].[dbo].[ASC_TBI_TBL]	I WITH (NOLOCK)
LEFT OUTER JOIN [vw_ASC_LIVE_Customers]			C	ON	I.[TBI_CUS]			= C.[Code]			COLLATE Latin1_General_CI_AS
LEFT OUTER JOIN [vw_ASC_LIVE_SystemCodes]		S	ON	I.[TBI_CUS_TYPE]	= S.[SystemCode]
													AND	S.[TypeCode]		= 'C'
GO
/****** Object:  Table [dbo].[Tb_CoA_Tests]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_CoA_Tests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[TestedBy] [int] NULL,
	[VerifiedBy] [int] NULL,
	[LockedBy] [int] NULL,
	[LockedOn] [datetime] NULL,
	[BatchRef] [varchar](100) NOT NULL,
	[SampleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[LockComment] [varchar](255) NULL,
	[DisabledBy] [int] NULL,
	[DisabledOn] [datetime] NULL,
	[DisableComment] [varchar](255) NULL,
 CONSTRAINT [PK_Tb_CoA_Tests_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_CoA_Tests]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_HICS_CoA_Tests] AS
SELECT 
	T.[ID],
	T.[CreatedOn],
	U1.[FullName]				AS [CreatedBy],
	T.[ModifiedOn],
	U2.[FullName]				AS [ModifiedBy],
	ISNULL(U3.[FullName],'')	AS [TestedBy],
	ISNULL(U4.[FullName],'')	AS [VerifiedBy],
	ISNULL(T.[LockedOn],'')		AS [LockedOn],
	ISNULL(U5.[FullName],'')	AS [LockedBy],
	ISNULL(T.[LockComment],'')	AS [LockComment],
	T.[BatchRef]				AS [BatchRef],
	T.[SampleDate]				AS [SampleDate],
	T.[ProductID],
	P.[Part]					AS [Product],
	T.[DisabledOn],
	T.[DisabledBy],
	T.[DisableComment]
FROM
				[Tb_CoA_Tests]		T WITH (NOLOCK)
LEFT OUTER JOIN [vw_HICS_Users]		U1	ON	T.[CreatedBy]	= U1.[ID]
LEFT OUTER JOIN [vw_HICS_Users]		U2	ON	T.[ModifiedBy]	= U2.[ID]
LEFT OUTER JOIN [vw_HICS_Users]		U3	ON	T.[TestedBy]	= U3.[ID]
LEFT OUTER JOIN [vw_HICS_Users]		U4	ON	T.[VerifiedBy]	= U4.[ID]
LEFT OUTER JOIN [vw_HICS_Users]		U5	ON	T.[LockedBy]	= U5.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]	P	ON	T.[ProductID]	= P.[ID]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_WorksOrders]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_WorksOrders] as
SELECT 
[WOR_UNIQUE] AS [ID],
[WOR_SOURCE_IND] AS [SourceID],
[WOR_CREATED] AS [CreatedOn],
[WOR_UPDATED] AS [ModifiedOn],
[WOR_ORDER] COLLATE Latin1_General_CI_AS AS [WorksOrderNo],
[WOR_PARENT_ORDER] COLLATE Latin1_General_CI_AS AS [ParentWorksOrderNo],
[WOR_ITEM_ONLY] COLLATE Latin1_General_CI_AS AS [Part],
[WOR_ITEM_REV] COLLATE Latin1_General_CI_AS AS [PartRev],
[WOR_SALORD] COLLATE Latin1_General_CI_AS AS [SalesOrder],
[WOR_QUOTE] COLLATE Latin1_General_CI_AS AS [Quote],
[WOR_CUSTOMER] COLLATE Latin1_General_CI_AS AS [CustomerCode],
[WOR_CUS_REF] COLLATE Latin1_General_CI_AS AS [CustomerOrderRef],
[WOR_CUS_DWG] COLLATE Latin1_General_CI_AS AS [CustomerDrawing],
[WOR_ROUTE] COLLATE Latin1_General_CI_AS AS [Route],
[WOR_ORIG_QTY] AS [OriginalQty],
[WOR_AMD_QTY] AS [AmendedQty],
[WOR_GOOD_QTY] AS [QtyMadeToDate],
[WOR_REJECTED_QTY] AS [QtyRejected],
[WOR_SCRAP_QTY] AS [QtyScrapped],
[WOR_FIRST_QTY] AS [QtyFirstOff],
[WOR_ANAL_FIELD1] COLLATE Latin1_General_CI_AS AS [Analysis1],
[WOR_ANAL_FIELD2] COLLATE Latin1_General_CI_AS AS [Analysis2],
[WOR_ANAL_FIELD3] COLLATE Latin1_General_CI_AS AS [Analysis3],
[WOR_ANAL_FIELD4] COLLATE Latin1_General_CI_AS AS [Analysis4],
[WOR_ANAL_FIELD5] COLLATE Latin1_General_CI_AS AS [Analysis5],
[WOR_ANAL_FIELD6] COLLATE Latin1_General_CI_AS AS [Analysis6],
[WOR_ANAL_FIELD7] COLLATE Latin1_General_CI_AS AS [Analysis7],
[WOR_ANAL_FIELD8] COLLATE Latin1_General_CI_AS AS [Analysis8],
[WOR_ANAL_FIELD9] COLLATE Latin1_General_CI_AS AS [Analysis9],
[WOR_ANAL_FIELD10] COLLATE Latin1_General_CI_AS AS [Analysis10],
[WOR_MRP_DATE] AS [MRPDate],
[WOR_DATE_SCHED] AS [DueDate],
[WOR_PRIORITY] AS [Priority],
[WOR_PREDICT_SLIP] AS [PredictedSlippage],
[WOR_FIRST_DATE] AS [FirstDate],
[WOR_DONE_DATE] AS [CompletedDate],
[WOR_ACT_SLIP] AS [ActualSlipage],
[WOR_ORDER_TYPE] COLLATE Latin1_General_CI_AS AS [OrderType],
[WOR_ORIG_EST_HOURS] AS [OriginalEstHours],
[WOR_ORIG_EST_MAT_COST] AS [OriginalEstMatCost],
[WOR_ORIG_EST_LAB_COST] AS [OriginalEstLabCost],
[WOR_ORIG_EST_OHD_COST] AS [OriginalEstOHDCost],
[WOR_TARGET_HOURS] AS [TargetHours],
[WOR_TARGET_MAT_COST] AS [TargetMatCost],
[WOR_TARGET_LAB_COST] AS [TargetLabCost],
[WOR_TARGET_OHD_COST] AS [TargetOHDCost],
[WOR_ACT_HOURS] AS [ActualHours],
[WOR_ACT_MAT_COST] AS [ActualMatCost],
[WOR_ACT_LAB_COST] AS [ActualLabCost],
[WOR_ACT_OHD_COST] AS [ActualOHDCost],
[WOR_STATUS] COLLATE Latin1_General_CI_AS AS [Status],
[WOR_MAT_STAT] COLLATE Latin1_General_CI_AS AS [MaterialStatus],
[WOR_LAST_MAT_DUE_DATE] AS [LastMaterialDueDate],
[WOR_TEX_FLAG] COLLATE Latin1_General_CI_AS AS [HasExtraText],
[WOR_CREATED_BY] COLLATE Latin1_General_CI_AS AS [CreatedBy],
[WOR_CREATED_DATE] AS [CreatedDate],
[WOR_LAST_AMEND_DATE] AS [ModifiedDate],
[WOR_ACCOUNT_CLOSED] COLLATE Latin1_General_CI_AS AS [AccountClosed],
[WOR_STOCK_ACCOUNT] COLLATE Latin1_General_CI_AS AS [StockAccount],
[WOR_FLAGS_SPARE] COLLATE Latin1_General_CI_AS AS [FlagsSpare],
[WOR_PRINTED] COLLATE Latin1_General_CI_AS AS [Printed],
[WOR_LINE_TYPE] COLLATE Latin1_General_CI_AS AS [LineType],
[WOR_COR_SUB] AS [SalesOrderSub],
[WOR_ACTUAL_EXPENSES] AS [ActualExpense],
[WOR_BY_PRODUCT] AS [ByProduct],
[WOR_DEST_WH] COLLATE Latin1_General_CI_AS AS [DestinationWarehouse],
[WOR_DEST_BIN] COLLATE Latin1_General_CI_AS AS [DestinationBin],
[WOR_PROJECT] COLLATE Latin1_General_CI_AS AS [Project],
[WOR_COST_CENTRE] COLLATE Latin1_General_CI_AS AS [CostCentre],
[WOR_PEG_FLAG] COLLATE Latin1_General_CI_AS AS [PegFlag],
[WOR_BOOKED_MAT_COST] AS [BookedMatCost],
[WOR_BOOKED_SC_COST] AS [BookedSCCost],
[WOR_BOOKED_LAB_COST] AS [BookedLabCost],
[WOR_ORIGIN] COLLATE Latin1_General_CI_AS AS [Origin],
[WOR_MSC_UNIQUE] AS [MSCUnique],
[WOR_TYPE] COLLATE Latin1_General_CI_AS AS [Type],
[WOR_USER_DATE_1] AS [UserDate1],
[WOR_USER_DATE_2] AS [UserDate2],
[WOR_USER_DATE_3] AS [UserDate3],
[WOR_USER_DATE_4] AS [UserDate4],
[WOR_USER_DATE_5] AS [UserDate5],
[WOR_USER_TEXT1] COLLATE Latin1_General_CI_AS AS [UserText1],
[WOR_USER_TEXT2] COLLATE Latin1_General_CI_AS AS [UserText2],
[WOR_USER_TEXT3] COLLATE Latin1_General_CI_AS AS [UserText3],
[WOR_USER_TEXT4] COLLATE Latin1_General_CI_AS AS [UserText4],
[WOR_USER_TEXT5] COLLATE Latin1_General_CI_AS AS [UserText5],
[WOR_USER_NUM1] AS [UserNum1],
[WOR_USER_NUM2] AS [UserNum2],
[WOR_USER_NUM3] AS [UserNum3],
[WOR_USER_NUM4] AS [UserNum4],
[WOR_USER_NUM5] AS [UserNum5],
[WOR_USER_CHECK1] AS [UserCheck1],
[WOR_USER_CHECK2] AS [UserCheck2],
[WOR_USER_CHECK3] AS [UserCheck3],
[WOR_USER_CHECK4] AS [UserCheck4],
[WOR_USER_CHECK5] AS [UserCheck5],
[WOR_ECO_NUMBER] AS [ECONumber]
FROM
	[ASC_LIVE].[dbo].[ASC_WOR_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Orders]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_Orders] as
SELECT 
	[COR_UNIQUE]					AS [ID],
    [COR_SOURCE_IND]				AS [SourceID],
    [COR_CREATED]					AS [CreatedOn],
    [COR_UPDATED]					AS [ModifiedOn],
    [COR_PART_ONLY]		COLLATE Latin1_General_CI_AS			AS [Part],
    [COR_PART_REV]		COLLATE Latin1_General_CI_AS			AS [PartRev],
    [COR_OUR_NUMBER]	COLLATE Latin1_General_CI_AS			AS [OrderRef],
    [COR_SUB]						AS [Sequence],
    [COR_OUR_NUMBER_N]				AS [OrderNum],
    [COR_CUSTOMER_CODE]	COLLATE Latin1_General_CI_AS			AS [CustomerCode],
    [COR_CUSTOMER_DUE]				AS [CustomerDue],
    [COR_CUSTOMER_ORDER]	COLLATE Latin1_General_CI_AS		AS [CustomerOrderRef],
    [COR_QTY_ORDERED]				AS [QuantityOrdered],
    [COR_QTY_DELIVERED]				AS [QuantityDelivered],
    [COR_ORDER_WHEN]				AS [OrderDateWhen],
    [COR_EXPECTED_DATE]				AS [ExpectedDueDate],
    [COR_MSC_FLAG]		COLLATE Latin1_General_CI_AS			AS [B2BMasterSched],
    [COR_PRICE_PER]					AS [FinalPrice],
    [COR_ORDER_STATUS]	COLLATE Latin1_General_CI_AS			AS [Status],
    [COR_MS]			COLLATE Latin1_General_CI_AS			AS [MasterSched],
    [COR_QTY_ALLOCATED]				AS [QuantityAllocated],
    [COR_QTY_INVOICED]				AS [QuantityInvoiced],
    [COR_PRIORITY]					AS [OrderPriority],
    [COR_THIS_DVY_QTY]				AS [QuantityOnLastDel],
    [COR_DSP_STAT]		COLLATE Latin1_General_CI_AS			AS [DespatchedStatus],
    [COR_NARR]			COLLATE Latin1_General_CI_AS			AS [ShortNote1],
    [COR_NARR_ACT]		COLLATE Latin1_General_CI_AS			AS [ShortNote2],
    [COR_PAY_TERMS]		COLLATE Latin1_General_CI_AS			AS [PaymentTerms],
    [COR_ALT_DVY]		COLLATE Latin1_General_CI_AS			AS [AltDelAdd],
    [COR_NARR_CARR]		COLLATE Latin1_General_CI_AS			AS [ShortNote3],
    [COR_DSP_NOTE]		COLLATE Latin1_General_CI_AS			AS [PicknoteNo],
    [COR_ORIG_PRICE]				AS [OriginalPrice],
    [COR_DISC_PRICE]				AS [DiscountedPrice],
    [COR_DISC_CODE]		COLLATE Latin1_General_CI_AS			AS [DiscountCode],
    [COR_FOREIGN_PRICE]				AS [ForeignPrice],
    [COR_CURRENCY]		COLLATE Latin1_General_CI_AS			AS [Currency],
    [COR_COLOUR]		COLLATE Latin1_General_CI_AS			AS [ColourCode],
	[COR_WO]			COLLATE Latin1_General_CI_AS			AS [WorksOrderNo],
    [COR_ORDER_TYPE]	COLLATE Latin1_General_CI_AS			AS [OrderType],
    [COR_TAX_CODE]		COLLATE Latin1_General_CI_AS			AS [VATCode],
    [COR_ANAL_FIELD1]	COLLATE Latin1_General_CI_AS			AS [Analysis1],
    [COR_ANAL_FIELD2]	COLLATE Latin1_General_CI_AS			AS [Analysis2],
    [COR_ANAL_FIELD3]	COLLATE Latin1_General_CI_AS			AS [Analysis3],
    [COR_ANAL_FIELD4]	COLLATE Latin1_General_CI_AS			AS [Analysis4],
    [COR_ANAL_FIELD5]	COLLATE Latin1_General_CI_AS			AS [Analysis5],
    [COR_ANAL_FIELD6]	COLLATE Latin1_General_CI_AS			AS [Analysis6],
    [COR_ANAL_FIELD7]	COLLATE Latin1_General_CI_AS			AS [Analysis7],
    [COR_ANAL_FIELD8]	COLLATE Latin1_General_CI_AS			AS [Analysis8],
    [COR_ANAL_FIELD9]	COLLATE Latin1_General_CI_AS			AS [Analysis9],
    [COR_ANAL_FIELD10]	COLLATE Latin1_General_CI_AS			AS [Analysis10],
    [COR_DUPLICATE]		COLLATE Latin1_General_CI_AS			AS [Duplicate],
    [COR_ACCOUNT]		COLLATE Latin1_General_CI_AS			AS [SalesAccount],
    [COR_INITIALS1]		COLLATE Latin1_General_CI_AS			AS [CommissionInitial1],
    [COR_PERCENT1]					AS [CommissionPercent1],
	[COR_INITIALS2]		COLLATE Latin1_General_CI_AS			AS [CommissionInitial2],
    [COR_PERCENT2]					AS [CommissionPercent2],
	[COR_INITIALS3]		COLLATE Latin1_General_CI_AS			AS [CommissionInitial3],
    [COR_PERCENT3]					AS [CommissionPercent3],
    [COR_ORDER_DISC]				AS [OrderDiscountPercent],
    [COR_ORDER_STATUS_2]	COLLATE Latin1_General_CI_AS		AS [Status2],
    [COR_PRO_FORMA]			COLLATE Latin1_General_CI_AS		AS [ProForma],
    [COR_APPLY_WL_DISC]		COLLATE Latin1_General_CI_AS		AS [OrderDiscountApply],
    [COR_WL_DISC_CODE]		COLLATE Latin1_General_CI_AS		AS [OrderDiscountCode],
    [COR_QTY_APPLIED]				AS [AppliedForQuantity],
    [COR_PICKED_FLAG]		COLLATE Latin1_General_CI_AS		AS [PicknotePrinted],
    [COR_QTY_PREV_APP]				AS [PrevAppliedForQuantity],
    [COR_QTY_CONSIGNED]				AS [QuantityConsigned],
    [COR_JOB]				COLLATE Latin1_General_CI_AS		AS [JobRef],
    [COR_QTY_ENTERED]				AS [QuantityEntered],
    [COR_UOM_ENTERED]		COLLATE Latin1_General_CI_AS		AS [UoM],
    [COR_ENTERED_BY]		COLLATE Latin1_General_CI_AS		AS [OrderEnteredBy],
    [COR_SETT_DISC]					AS [SettlementDiscPercent],
    [COR_MANUAL_SETT]		COLLATE Latin1_General_CI_AS		AS [SettlementDiscOverride],
    [COR_SETT_DISC_DAYS]			AS [SettlementDays],
    [COR_LINE_TYPE]			COLLATE Latin1_General_CI_AS		AS [LineType],
    [COR_ORIG_PRICE_PER]			AS [OrigPricePer],
    [COR_DISC_PRICE_PER]			AS [DiscPricePer],
    [COR_FORN_PRI_PER]				AS [FornPricePer],
    [COR_PRICE_PER_PER]				AS [PricePerPer],
    [COR_PRICE_SOURCE]		COLLATE Latin1_General_CI_AS		AS [PriceSource],
    [COR_ALLOC_STATUS]		COLLATE Latin1_General_CI_AS		AS [AllocStatus],
    [COR_PR_LIST]			COLLATE Latin1_General_CI_AS		AS [PRList],
    [COR_FIXED_EXRATE_FLAG]	COLLATE Latin1_General_CI_AS		AS [FixedExRate],
    [COR_EXCHANGE_RATE]				AS [ExchangeRate],
    [COR_PO]				COLLATE Latin1_General_CI_AS		AS [PO],
    [COR_PCK_PICK_NO]				AS [PckPickNo],
    [COR_PCK_PRINT_WHEN]			AS [PckPrintWhen],
    [COR_USER_DEF_DISC_FLAG] COLLATE Latin1_General_CI_AS		AS [UDefDisc],
    [COR_DUTY]						AS [Duty],
    [COR_NO_DUTY_REASON]	COLLATE Latin1_General_CI_AS		AS [DutyReason],
    [COR_DUTY_HOW_PAID]				AS [DutyHowPaid],
    [COR_DUTY_CUS_DEFERMENT]		AS [DutyCusDeferment],
    [COR_TIED_PART_ONLY]	COLLATE Latin1_General_CI_AS		AS [TiedPart],
    [COR_TIED_PART_REV]		COLLATE Latin1_General_CI_AS		AS [TiedPartRev],
    [COR_TIED_SUB]					AS [TiedSequence],
    [COR_DISC_PERCENT]				AS [DiscPercent],
    [COR_QTY_PARA_1]				AS [QtyPara1],
    [COR_QTY_PARA_OP_1]		COLLATE Latin1_General_CI_AS		AS [QtyParaOp1],
    [COR_QTY_PARA_2]				AS [QtyPara2],
    [COR_QTY_PARA_OP_2]		COLLATE Latin1_General_CI_AS		AS [QtyParaOp2],
    [COR_QTY_PARA_3]				AS [QtyPara3],
    [COR_ORDER_DATE]				AS [OrderDate],
    [COR_BASE_COST]					AS [BaseCost],
    [COR_BASE_COST_PER]				AS [BaseCostPer],
    [COR_BASE_COST_CURRENCY]	COLLATE Latin1_General_CI_AS	AS [BaseCostCurrency],
    [COR_BASE_COST_FOREIGN]			AS [BaseCostForeign],
    [COR_BASE_COST_FOREIGN_PER]		AS [BaseCostForeignPer],
    [COR_BASE_COST_SOURCE]		COLLATE Latin1_General_CI_AS	AS [BaseCostSource],
    [COR_BASE_COST_REF]			COLLATE Latin1_General_CI_AS	AS [BaseCostRef],
    [COR_BASE_COST_SUP]			COLLATE Latin1_General_CI_AS	AS [BaseCostSup],
    [COR_BUFFER_STOCK]			COLLATE Latin1_General_CI_AS	AS [BufferStock],
    [COR_SCHEDULE_NUMBER]			AS [ScheduleNumber],
    [COR_FIXED_ALLOC]			COLLATE Latin1_General_CI_AS	AS [FixedAlloc],
    [COR_QTY_PICKED]				AS [QuantityPicked],
    [COR_PROCESS_STATUS]			AS [ProcessStatus],
    [COR_SECURITY_LEVEL]			AS [SecurityLevel],
    [COR_USER_CREATED]			COLLATE Latin1_General_CI_AS	AS [UserCreated],
    [COR_USER_UPDATED]			COLLATE Latin1_General_CI_AS	AS [UserUpdated],
    [COR_CREDIT_CARD_STATUS]		AS [CreditCardStatus],
    [COR_USER_STATUS1]			COLLATE Latin1_General_CI_AS	AS [UserStatus1],
    [COR_USER_DATE1]				AS [UserDate10],
    [COR_DESPATCH_ALONE]			AS [DespatchAlone],
    [COR_FIX_FINAL_PRICE]		COLLATE Latin1_General_CI_AS	AS [FixFinalPrice],
    [COR_LINE_NUM]					AS [LineNum],
    [COR_SOURCE_WH]				COLLATE Latin1_General_CI_AS	AS [SourceWH],
    [COR_PROJECT]				COLLATE Latin1_General_CI_AS	AS [Project],
    [COR_COST_CENTRE]			COLLATE Latin1_General_CI_AS	AS [CostCentre],
    [COR_EDI_SUP_ID_ALLOC]		COLLATE Latin1_General_CI_AS	AS [EDISupIDAlloc],
    [COR_EDI_CUS_MEASURE_IND]	COLLATE Latin1_General_CI_AS	AS [EDICusMeasureInd],
    [COR_EDI_COST_PRICE]			AS [EDICostPrice],
    [COR_EDI_COST_MEASURE_IND]	COLLATE Latin1_General_CI_AS	AS [EDICostMeasureInd],
    [COR_KIT_ITEM_IND]			COLLATE Latin1_General_CI_AS	AS [KitItemInd],
    [COR_PARENT_PART_ONLY]		COLLATE Latin1_General_CI_AS	AS [ParentPart],
    [COR_PARENT_PART_REV]		COLLATE Latin1_General_CI_AS	AS [ParentPartRev],
    [COR_PARENT_UNIQUE]				AS [ParentID],
    [COR_NO_INTRASTAT]				AS [NoIntrastat],
    [COR_PALLET_QTY]				AS [PalletQuantity],
    [COR_USER_DATE_1]				AS [UserDate1],
	[COR_USER_DATE_2]				AS [UserDate2],
	[COR_USER_DATE_3]				AS [UserDate3],
	[COR_USER_DATE_4]				AS [UserDate4],
	[COR_USER_DATE_5]				AS [UserDate5],
    [COR_USER_TEXT1]			COLLATE Latin1_General_CI_AS	AS [UserText1],
	[COR_USER_TEXT2]			COLLATE Latin1_General_CI_AS	AS [UserText2],
	[COR_USER_TEXT3]			COLLATE Latin1_General_CI_AS	AS [UserText3],
	[COR_USER_TEXT4]			COLLATE Latin1_General_CI_AS	AS [UserText4],
	[COR_USER_TEXT5]			COLLATE Latin1_General_CI_AS	AS [UserText5],
	[COR_USER_NUM1]					AS [UserNum1],
	[COR_USER_NUM2]					AS [UserNum2],
	[COR_USER_NUM3]					AS [UserNum3],
	[COR_USER_NUM4]					AS [UserNum4],
	[COR_USER_NUM5]					AS [UserNum5],
    [COR_USER_CHECK1]				AS [UserCheck1],
	[COR_USER_CHECK2]				AS [UserCheck2],
	[COR_USER_CHECK3]				AS [UserCheck3],
	[COR_USER_CHECK4]				AS [UserCheck4],
	[COR_USER_CHECK5]				AS [UserCheck5],
    [COR_GM_ACCOUNTNO]				AS [GMAccountNo],
    [COR_GM_USER]					AS [GMUser],
    [COR_GM_OPP_ID]					AS [GMOppID],
    [COR_GM_FORECAST_ID]			AS [GMForecastID],
    [COR_GM_CREATE_FORECAST]		AS [GMCreateForecast],
    [COR_GM_LOOKUP_KEY]				AS [GMLookupKey],
    [COR_UPDATE_STATUS]				AS [UpdateStatus],
    [COR_DUEDATE_TYPE]				AS [DueDateType],
    [COR_DUE_DAYS]					AS [DueDays],
    [COR_FULL_SHIP_ONLY]			AS [FullShipOnly],
    [COR_SHIP_WHOLE_ORDER_ONLY]		AS [ShipWholeOrderOnly],
    [COR_PHANTOM_QTY]				AS [PhantomQty],
    [COR_QTY_RECEIVED]				AS [QtyReceived],
    [COR_SM_CONTRACT]			COLLATE Latin1_General_CI_AS	AS [SMContract],
    [COR_WARRANTY_UNIQUE]			AS [WarrantyUnique],
    [COR_WARRANTY_FLAG]				AS [WarrantyFlag],
    [COR_SM_PROCESS_STATUS]			AS [SMProcessStatus],
    [COR_SALEINS]					AS [SaleIns],
    [COR_SALEINS_LINK]				AS [SaleInsLink],
    [COR_DUTY_FLAG]					AS [DutyFlag],
    [COR_ORIGIN]				COLLATE Latin1_General_CI_AS	AS [Origin],
    [COR_ORIGIN_REFERENCE]		COLLATE Latin1_General_CI_AS	AS [OriginReference],
    [COR_PO_SUB]					AS [POSub],
    [COR_LAST_PRICE]				AS [LastPrice],
    [COR_LAST_PRICE_PER]			AS [LastPricePer]
FROM 
	[ASC_LIVE].[dbo].[ASC_COR_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_OutstandingWO_2Days]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ASC_LIVE_Rep_OutstandingWO_2Days] AS
SELECT 
	W.[WorksOrderNo],
	W.[Part],
	ISNULL(O.[CustomerCode],'')						AS [Customer],
	ISNULL(CONVERT(VARCHAR(13),O.[OrderNum]),'')	AS [SalesOrderNo],
	P.[Description1] + ' ' + P.[Description2]		AS [Description],
	W.[OriginalQty],
	P.[UoM],
	CONVERT(DATE,W.[CreatedOn])						AS [Created],
	CONVERT(DATE,W.[DueDate])						AS [WODueDate],
	ISNULL(O.[OrderEnteredBy],'')					AS [EnteredBy],
	CONVERT(DATE,CASE ISNULL(O.[ExpectedDueDate],'')	
		WHEN '' THEN W.[DueDate] 
		ELSE O.[ExpectedDueDate]
	END)											AS [DueDate]
FROM 
				[vw_ASC_LIVE_WorksOrders]	W
INNER JOIN		[vw_ASC_LIVE_Parts]			P	ON	P.[Part]			= W.[Part]
LEFT OUTER JOIN	[vw_ASC_LIVE_Orders]		O	ON	O.[Part]			= W.[Part]
												AND	O.[OrderRef]		= W.[SalesOrder]
												AND O.[QuantityOrdered]	= W.[OriginalQty]
WHERE
	W.[Status] <> 'C'
AND CONVERT(DATE,W.[CreatedOn]) BETWEEN CONVERT(DATE,DATEADD(d,-1,SYSDATETIME())) AND CONVERT(DATE,SYSDATETIME())
GO
/****** Object:  Table [dbo].[Tb_PrinterLog]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PrinterLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[EventRecID] [int] NOT NULL,
	[LnkUserID_By] [int] NOT NULL,
	[LnkAssetID_From] [int] NOT NULL,
	[LnkAssetID_To] [int] NOT NULL,
	[PrintTime] [datetime] NOT NULL,
	[Pages] [int] NOT NULL,
	[Note] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tb_PrinterLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_BSMTypes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_AR_BSMTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_AR_BSMTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_BSMs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_AR_BSMs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[BSMTypeID] [int] NOT NULL,
	[Brand] [varchar](100) NOT NULL,
	[Series] [varchar](100) NULL,
	[Model] [varchar](100) NULL,
	[Comment] [varchar](500) NULL,
	[Show_Dell_ESC] [bit] NOT NULL,
	[Show_Dell_PPID] [bit] NOT NULL,
	[Show_Dell_ST] [bit] NOT NULL,
	[Show_EID] [bit] NOT NULL,
	[Show_HasDongle] [bit] NOT NULL,
	[Show_IMEI_1] [bit] NOT NULL,
	[Show_IMEI_2] [bit] NOT NULL,
	[Show_LabelPrinter] [bit] NOT NULL,
	[Show_MAC] [bit] NOT NULL,
	[Show_ModelRef] [bit] NOT NULL,
	[Show_Name] [bit] NOT NULL,
	[Show_OS] [bit] NOT NULL,
	[Show_PrinterName] [bit] NOT NULL,
	[Show_SIM] [bit] NOT NULL,
	[Tool_ADDisabled] [bit] NOT NULL,
	[Tool_C$Share] [bit] NOT NULL,
	[Tool_OnlineStatus] [bit] NOT NULL,
	[Tool_DellSupport] [bit] NOT NULL,
	[Tool_Website] [bit] NOT NULL,
 CONSTRAINT [PK_Tb_AR_BSMs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_Suppliers]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_AR_Suppliers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[SCSupRef] [varchar](10) NOT NULL,
	[Name] [varchar](100) NULL,
	[Website] [varchar](100) NULL,
	[AccMgr] [varchar](100) NULL,
	[AccMgr_Email] [varchar](100) NULL,
	[AccMgr_Tel] [varchar](100) NULL,
	[AccRef] [varchar](100) NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_AR_Suppliers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_Statuses]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_AR_Statuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_AR_Statuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_Users]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_HICS_Rep_Users] as 
select 
	U.*,
	--ISNULL(UM.[ID],'') AS [Manager_ID],
	ISNULL(UM.[FullName],'') AS [Manager_FullName],
	ISNULL(POA.[FullName],'') AS [POApprover_FullName]
from 
				[vw_HICS_Users] U
LEFT OUTER JOIN	[vw_HICS_Users] UM  ON UM.[ID] = U.[Manager] 
LEFT OUTER JOIN	[vw_HICS_Users] POA ON POA.[ID] = U.[POApprover] 
GO
/****** Object:  Table [dbo].[Tb_OSs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_OSs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Developer] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_OSs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SIMs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SIMs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[SIM] [varchar](19) NOT NULL,
	[Mobile] [varchar](13) NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Note] [varchar](512) NOT NULL,
 CONSTRAINT [PK_Tb_SIMs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_AR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[LnkARID] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[LnkLocationID] [int] NOT NULL,
	[LnkBSMID] [int] NOT NULL,
	[SerialRef] [varchar](25) NULL,
	[PurchasedOn] [date] NOT NULL,
	[LnkSupplierID] [int] NOT NULL,
	[OrderRef] [varchar](20) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[WarrantyExpiry] [date] NULL,
	[LnkUserID] [int] NULL,
	[LnkStatusID] [int] NOT NULL,
	[StatusNote] [varchar](500) NULL,
	[Comment] [varchar](500) NULL,
	[Dell_ESC] [varchar](11) NOT NULL,
	[Dell_PPID] [varchar](30) NOT NULL,
	[Dell_ST] [varchar](7) NOT NULL,
	[EID] [varchar](32) NOT NULL,
	[HasDongle] [bit] NOT NULL,
	[IMEI_1] [varchar](15) NOT NULL,
	[IMEI_2] [varchar](15) NOT NULL,
	[LabelPrinter] [bit] NOT NULL,
	[MAC] [varchar](50) NOT NULL,
	[ModelRef] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LnkOSID] [int] NOT NULL,
	[PrinterName] [varchar](50) NOT NULL,
	[LnkSIMID] [int] NOT NULL,
	[ADDisabled] [bit] NULL,
	[ADGUID] [varchar](50) NULL,
 CONSTRAINT [PK_Tb_AR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_Shares]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_AR_Shares](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[LnkARID] [int] NOT NULL,
	[LnkAssetID] [int] NOT NULL,
 CONSTRAINT [PK_Tb_AR_Shares] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Countries]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Countries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[2Letter] [varchar](2) NOT NULL,
	[3Letter] [varchar](3) NOT NULL,
	[Numeric] [int] NOT NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_Countries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Addresses]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Addresses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[ShortCode] [varchar](2) NOT NULL,
	[AddLine1] [varchar](100) NOT NULL,
	[AddLine2] [varchar](100) NULL,
	[AddLine3] [varchar](100) NULL,
	[Town] [varchar](100) NULL,
	[County] [varchar](100) NULL,
	[Postcode] [varchar](100) NULL,
	[Country] [int] NULL,
	[Latitude] [decimal](25, 21) NULL,
	[Longitude] [decimal](25, 21) NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Locations]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Locations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[AddressID] [int] NOT NULL,
	[ShortCode] [varchar](2) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Latitude] [decimal](25, 21) NULL,
	[Longitude] [decimal](25, 21) NULL,
	[ParentID] [int] NOT NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_Locations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_Locations]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[vw_HICS_Rep_Locations] as
/*
SELECT
	L1.[ID],
	L1.[ParentID],
	L1.[Enabled],
	L1.[AddressID],
	A.[ShortCode]	AS [AddressShortCode],
	A.[AddLine1] + 
	CASE ISNULL(A.[AddLine2],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[AddLine2],'') END +
	CASE ISNULL(A.[AddLine3],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[AddLine3],'') END +
	CASE ISNULL(A.[Town],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[Town],'') END +
	CASE ISNULL(A.[County],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[County],'') END +
	CASE ISNULL(A.[Postcode],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[Postcode],'') END +
	CASE ISNULL(C.[2Letter],'') WHEN '' THEN '' ELSE ', ' + ISNULL(C.[2Letter],'') END AS [Address],
	L1.[ShortCode],
	L1.[Name],
	ISNULL(L1.[Latitude],0) AS [Latitude],
	ISNULL(L1.[Longitude],0) AS [Longitude],
	ISNULL(L1.[Comment],'')	AS [Comment],
	CASE ISNULL(L5.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	CASE ISNULL(L4.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	CASE ISNULL(L3.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	CASE ISNULL(L2.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	1 AS [Depth],
	COUNT(AR.[ID]) AS [Assets],
	A.[ShortCode] + ISNULL(L5.[ShortCode],'') + ISNULL(L4.[ShortCode],'') + ISNULL(L3.[ShortCode],'') + ISNULL(L2.[ShortCode],'') + ISNULL(L1.[ShortCode],'') AS [FullShortCode],
	CASE ISNULL(L5.[Name],'') WHEN '' THEN '' ELSE ISNULL(L5.[Name],'') + ', ' END +
	CASE ISNULL(L4.[Name],'') WHEN '' THEN '' ELSE ISNULL(L4.[Name],'') + ', ' END +
	CASE ISNULL(L3.[Name],'') WHEN '' THEN '' ELSE ISNULL(L3.[Name],'') + ', ' END +
	CASE ISNULL(L2.[Name],'') WHEN '' THEN '' ELSE ISNULL(L2.[Name],'') + ', ' END +
	ISNULL(L1.[Name],'') AS [FullName]
FROM 
				[Tb_Locations]	L1
LEFT OUTER JOIN	[Tb_Locations]	L2	ON L1.[ParentID] = L2.[ID]
LEFT OUTER JOIN	[Tb_Locations]	L3	ON L2.[ParentID] = L3.[ID]
LEFT OUTER JOIN	[Tb_Locations]	L4	ON L3.[ParentID] = L4.[ID]
LEFT OUTER JOIN	[Tb_Locations]	L5	ON L4.[ParentID] = L5.[ID]
LEFT OUTER JOIN [Tb_Addresses]	A	ON L1.[AddressID] = A.[ID]
LEFT OUTER JOIN [Tb_Countries]	C	ON A.[Country] = C.[ID]
LEFT OUTER JOIN [Tb_AR]			AR	ON AR.[LnkLocationID] = L1.[ID]
WHERE 
	L1.[Deleted] = 0
AND (A.[Deleted] = 0 OR A.[Deleted] IS NULL)
AND (AR.[Deleted] = 0 OR AR.[Deleted] IS NULL)
GROUP BY
	L1.[ID],
	L1.[ParentID],
	L1.[Enabled],
	L1.[AddressID],
	A.[ShortCode],
	A.[AddLine1] + 
	CASE ISNULL(A.[AddLine2],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[AddLine2],'') END +
	CASE ISNULL(A.[AddLine3],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[AddLine3],'') END +
	CASE ISNULL(A.[Town],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[Town],'') END +
	CASE ISNULL(A.[County],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[County],'') END +
	CASE ISNULL(A.[Postcode],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[Postcode],'') END +
	CASE ISNULL(C.[2Letter],'') WHEN '' THEN '' ELSE ', ' + ISNULL(C.[2Letter],'') END,
	L1.[ShortCode],
	L1.[Name],
	ISNULL(L1.[Latitude],0),
	ISNULL(L1.[Longitude],0),
	ISNULL(L1.[Comment],''),
	CASE ISNULL(L5.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	CASE ISNULL(L4.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	CASE ISNULL(L3.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	CASE ISNULL(L2.[Name],'') WHEN '' THEN 0 ELSE 1 END + 1,
	A.[ShortCode] + ISNULL(L5.[ShortCode],'') + ISNULL(L4.[ShortCode],'') + ISNULL(L3.[ShortCode],'') + ISNULL(L2.[ShortCode],'') + ISNULL(L1.[ShortCode],''),
	CASE ISNULL(L5.[Name],'') WHEN '' THEN '' ELSE ISNULL(L5.[Name],'') + ', ' END +
	CASE ISNULL(L4.[Name],'') WHEN '' THEN '' ELSE ISNULL(L4.[Name],'') + ', ' END +
	CASE ISNULL(L3.[Name],'') WHEN '' THEN '' ELSE ISNULL(L3.[Name],'') + ', ' END +
	CASE ISNULL(L2.[Name],'') WHEN '' THEN '' ELSE ISNULL(L2.[Name],'') + ', ' END +
	ISNULL(L1.[Name],'')
*/
SELECT
	L1.[ID],
	L1.[ParentID],
	L1.[Enabled],
	L1.[AddressID],
	A.[ShortCode]	AS [AddressShortCode],
	A.[AddLine1] + 
	CASE ISNULL(A.[AddLine2],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[AddLine2],'') END +
	CASE ISNULL(A.[AddLine3],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[AddLine3],'') END +
	CASE ISNULL(A.[Town],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[Town],'') END +
	CASE ISNULL(A.[County],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[County],'') END +
	CASE ISNULL(A.[Postcode],'') WHEN '' THEN '' ELSE ', ' + ISNULL(A.[Postcode],'') END +
	CASE ISNULL(C.[2Letter],'') WHEN '' THEN '' ELSE ', ' + ISNULL(C.[2Letter],'') END AS [Address],
	L1.[ShortCode],
	L1.[Name],
	ISNULL(L1.[Latitude],0) AS [Latitude],
	ISNULL(L1.[Longitude],0) AS [Longitude],
	ISNULL(L1.[Comment],'')	AS [Comment],
	CASE ISNULL(L5.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	CASE ISNULL(L4.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	CASE ISNULL(L3.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	CASE ISNULL(L2.[Name],'') WHEN '' THEN 0 ELSE 1 END +
	1 AS [Depth],
	A.[ShortCode] + ISNULL(L5.[ShortCode],'') + ISNULL(L4.[ShortCode],'') + ISNULL(L3.[ShortCode],'') + ISNULL(L2.[ShortCode],'') + ISNULL(L1.[ShortCode],'') AS [FullShortCode],
	CASE ISNULL(L5.[Name],'') WHEN '' THEN '' ELSE ISNULL(L5.[Name],'') + ', ' END +
	CASE ISNULL(L4.[Name],'') WHEN '' THEN '' ELSE ISNULL(L4.[Name],'') + ', ' END +
	CASE ISNULL(L3.[Name],'') WHEN '' THEN '' ELSE ISNULL(L3.[Name],'') + ', ' END +
	CASE ISNULL(L2.[Name],'') WHEN '' THEN '' ELSE ISNULL(L2.[Name],'') + ', ' END +
	ISNULL(L1.[Name],'') AS [FullName]
FROM 
				[Tb_Locations]	L1
LEFT OUTER JOIN	[Tb_Locations]	L2	ON L1.[ParentID] = L2.[ID]
LEFT OUTER JOIN	[Tb_Locations]	L3	ON L2.[ParentID] = L3.[ID]
LEFT OUTER JOIN	[Tb_Locations]	L4	ON L3.[ParentID] = L4.[ID]
LEFT OUTER JOIN	[Tb_Locations]	L5	ON L4.[ParentID] = L5.[ID]
LEFT OUTER JOIN [Tb_Addresses]	A	ON L1.[AddressID] = A.[ID]
LEFT OUTER JOIN [Tb_Countries]	C	ON A.[Country] = C.[ID]
WHERE 
	L1.[Deleted] = 0
AND (A.[Deleted] = 0 OR A.[Deleted] IS NULL)
GO
/****** Object:  Table [dbo].[Tb_ARs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_ARs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Shortcode] [varchar](2) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_ARs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_AR]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_HICS_Rep_AR] as 
SELECT 
	AR.[ID],
	AR.[CreatedOn],
	AR.[CreatedBy],
	UC.[FullName]				AS [CreatedBy_FullName],
	AR.[ModifiedOn],
	AR.[ModifiedBy],
	UM.[FullName]				AS [ModifiedBy_FullName],
	AR.[Enabled],
	AR.[LnkARID]				AS [ARID],
	ARs.[Shortcode]				AS [AR_Shortcode],
	'No'						AS [SharedCopy],
	AR.[Number]					AS [Number],
	ARs.[Shortcode] + '-' + RIGHT('0000' + CONVERT(VARCHAR(10),AR.[Number]),4)	AS [Ref],
	L.[AddressID],
	L.[Address],
	L.[ID]						AS [LocationID],
	L.[FullName]				AS [Location],
	L.[FullShortCode]			AS [LocationShortcode],
	ISNULL(BSMT.[ID],0)			AS [TypeID],
	ISNULL(BSMT.[Name],0)		AS [Type],
	AR.[LnkBSMID]				AS [BSMID],
	BSM.[Brand]					AS [Brand],
	ISNULL(BSM.[Series],'')		AS [Series],
	ISNULL(BSM.[Model],'')		AS [Model],
	ISNULL(BSM.[Brand] + case ISNULL(BSM.[Series],'') WHEN '' THEN '' ELSE ', ' + BSM.[Series] END + case ISNULL(BSM.[Model],'') WHEN '' THEN '' ELSE ', ' + BSM.[Model] END,'') AS [BSM],
	ISNULL(AR.[SerialRef],'')	AS [SerialRef],
	AR.[PurchasedOn],
	AR.[LnkSupplierID]			AS [SupplierID],
	ISNULL(S.[SCSupRef],'')		AS [SupplyChainSupplier],
	CASE ISNULL(SCS.[Name],'')
		WHEN '' THEN ISNULL(S.[Name],'')
		ELSE SCS.[Name]
	END							AS [Supplier],
	ISNULL(AR.[OrderRef],'')	AS [OrderRef],
	AR.[Cost],
	AR.[WarrantyExpiry],
	ISNULL(AR.[LnkUserID],0)	AS [UserID],
	ISNULL(U.[FullName],'')		AS [User],
	AR.[LnkStatusID]			AS [StatusID],
	ST.[Name]					AS [Status],
	ISNULL(AR.[StatusNote],'')	AS [StatusComment],
	ISNULL(AR.[Comment],'')		AS [Comment],
	AR.[Dell_ESC]				AS [DellESC],
	AR.[Dell_PPID]				AS [DellPPID],
	AR.[Dell_ST]				AS [DellST],
	AR.[EID],
	AR.[HasDongle],
	AR.[IMEI_1],
	AR.[IMEI_2],
	AR.[LabelPrinter],
	AR.[MAC],
	AR.[ModelRef]				AS [AppleModelRef],
	AR.[Name]					AS [NetBIOSName],
	AR.[LnkOSID]				AS [OSID],
	CASE ISNULL(OS.[Developer],'')
		WHEN '' THEN ''
		ELSE 
			OS.[Developer] + 
			CASE OS.[Name] WHEN '' THEN '' ELSE (CASE OS.[Developer] WHEN '' THEN '' ELSE ', ' END) + OS.[Name] END +
			CASE OS.[Version] WHEN '' THEN '' ELSE (CASE OS.[Name] WHEN '' THEN (CASE OS.[Developer] WHEN '' THEN '' ELSE ', ' END) ELSE ', ' END) + ' (' + OS.[Version] + ')' END 
	END							AS [OS],
	AR.[PrinterName],
	AR.[LnkSIMID]				AS [SIMID],
	ISNULL(SIM.[SIM],'')		AS [SIM],
	ISNULL(SIM.[Mobile],'')		AS [SIMNumber],
	AR.[ADDisabled],
	AR.[ADGUID]
FROM 
				[Tb_AR]						AR
LEFT OUTER JOIN	[vw_HICS_Rep_Users]			UC		with (Nolock) 	ON	AR.[CreatedBy]		= UC.[ID] 
LEFT OUTER JOIN	[vw_HICS_Rep_Users]			UM		with (Nolock)	ON	AR.[ModifiedBy]		= UM.[ID]
LEFT OUTER JOIN [Tb_ARs]					ARs		with (Nolock)	ON	AR.[LnkARID]		= ARs.[ID]
LEFT OUTER JOIN [vw_HICS_Rep_Locations]		L		with (Nolock)	ON	AR.[LnkLocationID]	= L.[ID]
LEFT OUTER JOIN [Tb_AR_BSMs]				BSM		with (Nolock)	ON	AR.[LnkBSMID]		= BSM.[ID]
LEFT OUTER JOIN [Tb_AR_BSMTypes]			BSMT	with (Nolock)	ON	BSM.[BSMTypeID]		= BSMT.[ID]
LEFT OUTER JOIN [Tb_AR_Suppliers]			S		with (Nolock)	ON	AR.[LnkSupplierID]	= S.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_Suppliers1]	SCS		with (Nolock)	ON	S.[SCSupRef]		= SCS.[Code]
LEFT OUTER JOIN [vw_HICS_Rep_Users]			U		with (Nolock)	ON	AR.[LnkUserID]		= U.[ID]
LEFT OUTER JOIN [Tb_AR_Statuses]			St		with (Nolock)	ON	AR.[LnkStatusID]	= St.[ID]
LEFT OUTER JOIN [Tb_OSs]					OS		with (Nolock)	ON	AR.[LnkOSID]		= OS.[ID]
LEFT OUTER JOIN [Tb_SIMs]					SIM		with (Nolock)	ON	AR.[LnkSIMID]		= SIM.[ID]
WHERE 
	AR.[Deleted] = 0
UNION
SELECT 
	AR.[ID],
	AR.[CreatedOn],
	AR.[CreatedBy],
	UC.[FullName]				AS [CreatedBy_FullName],
	AR.[ModifiedOn],
	AR.[ModifiedBy],
	UM.[FullName]				AS [ModifiedBy_FullName],
	AR.[Enabled],
	ARSH.[LnkARID]				AS [ARID],
	ARs2.[Shortcode]			AS [AR_Shortcode],
	'Yes'						AS [SharedCopy],
	AR.[Number]					AS [Number],
	ARs.[Shortcode] + '-' + RIGHT('0000' + CONVERT(VARCHAR(10),AR.[Number]),4)	AS [Ref],
	L.[AddressID],
	L.[Address],
	L.[ID]						AS [LocationID],
	L.[FullName]				AS [Location],
	L.[FullShortCode]			AS [LocationShortcode],
	ISNULL(BSMT.[ID],0)			AS [TypeID],
	ISNULL(BSMT.[Name],0)		AS [Type],
	AR.[LnkBSMID]				AS [BSMID],
	BSM.[Brand]					AS [Brand],
	ISNULL(BSM.[Series],'')		AS [Series],
	ISNULL(BSM.[Model],'')		AS [Model],
	ISNULL(BSM.[Brand] + case ISNULL(BSM.[Series],'') WHEN '' THEN '' ELSE ', ' + BSM.[Series] END + case ISNULL(BSM.[Model],'') WHEN '' THEN '' ELSE ', ' + BSM.[Model] END,'') AS [BSM],
	ISNULL(AR.[SerialRef],'')	AS [SerialRef],
	AR.[PurchasedOn],
	AR.[LnkSupplierID]			AS [SupplierID],
	ISNULL(S.[SCSupRef],'')		AS [SupplyChainSupplier],
	CASE ISNULL(SCS.[Name],'')
		WHEN '' THEN ISNULL(S.[Name],'')
		ELSE SCS.[Name]
	END							AS [Supplier],
	ISNULL(AR.[OrderRef],'')	AS [OrderRef],
	AR.[Cost],
	AR.[WarrantyExpiry],
	ISNULL(AR.[LnkUserID],0)	AS [UserID],
	ISNULL(U.[FullName],'')		AS [User],
	AR.[LnkStatusID]			AS [StatusID],
	ST.[Name]					AS [Status],
	ISNULL(AR.[StatusNote],'')	AS [StatusComment],
	ISNULL(AR.[Comment],'')		AS [Comment],
	AR.[Dell_ESC]				AS [DellESC],
	AR.[Dell_PPID]				AS [DellPPID],
	AR.[Dell_ST]				AS [DellST],
	AR.[EID],
	AR.[HasDongle],
	AR.[IMEI_1],
	AR.[IMEI_2],
	AR.[LabelPrinter],
	AR.[MAC],
	AR.[ModelRef]				AS [AppleModelRef],
	AR.[Name]					AS [NetBIOSName],
	AR.[LnkOSID]				AS [OSID],
	CASE ISNULL(OS.[Developer],'')
		WHEN '' THEN ''
		ELSE 
			OS.[Developer] + 
			CASE OS.[Name] WHEN '' THEN '' ELSE (CASE OS.[Developer] WHEN '' THEN '' ELSE ', ' END) + OS.[Name] END +
			CASE OS.[Version] WHEN '' THEN '' ELSE (CASE OS.[Name] WHEN '' THEN (CASE OS.[Developer] WHEN '' THEN '' ELSE ', ' END) ELSE ', ' END) + ' (' + OS.[Version] + ')' END 
	END							AS [OS],
	AR.[PrinterName],
	AR.[LnkSIMID]				AS [SIMID],
	ISNULL(SIM.[SIM],'')		AS [SIM],
	ISNULL(SIM.[Mobile],'')		AS [SIMNumber],
	AR.[ADDisabled],
	AR.[ADGUID]
FROM 
				[Tb_AR_Shares]				ARSH
LEFT OUTER JOIN	[Tb_AR]						AR		with (Nolock) 	ON	ARSH.[LnkAssetID]	= AR.[ID]
LEFT OUTER JOIN	[vw_HICS_Rep_Users]			UC		with (Nolock) 	ON	AR.[CreatedBy]		= UC.[ID] 
LEFT OUTER JOIN	[vw_HICS_Rep_Users]			UM		with (Nolock)	ON	AR.[ModifiedBy]		= UM.[ID]
LEFT OUTER JOIN [Tb_ARs]					ARs		with (Nolock)	ON	AR.[LnkARID]		= ARs.[ID]
LEFT OUTER JOIN [Tb_ARs]					ARs2	with (Nolock)	ON	ARSH.[LnkARID]		= ARs2.[ID]
LEFT OUTER JOIN [vw_HICS_Rep_Locations]		L		with (Nolock)	ON	AR.[LnkLocationID]	= L.[ID]
LEFT OUTER JOIN [Tb_AR_BSMs]				BSM		with (Nolock)	ON	AR.[LnkBSMID]		= BSM.[ID]
LEFT OUTER JOIN [Tb_AR_BSMTypes]			BSMT	with (Nolock)	ON	BSM.[BSMTypeID]		= BSMT.[ID]
LEFT OUTER JOIN [Tb_AR_Suppliers]			S		with (Nolock)	ON	AR.[LnkSupplierID]	= S.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_Suppliers1]	SCS		with (Nolock)	ON	S.[SCSupRef]		= SCS.[Code]
LEFT OUTER JOIN [vw_HICS_Rep_Users]			U		with (Nolock)	ON	AR.[LnkUserID]		= U.[ID]
LEFT OUTER JOIN [Tb_AR_Statuses]			St		with (Nolock)	ON	AR.[LnkStatusID]	= St.[ID]
LEFT OUTER JOIN [Tb_OSs]					OS		with (Nolock)	ON	AR.[LnkOSID]		= OS.[ID]
LEFT OUTER JOIN [Tb_SIMs]					SIM		with (Nolock)	ON	AR.[LnkSIMID]		= SIM.[ID]
WHERE 
	ARSH.[Deleted] = 0	
AND	AR.[Deleted] = 0
GO
/****** Object:  View [dbo].[vw_HICS_Rep_PrintSummary]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE View [dbo].[vw_HICS_Rep_PrintSummary] as
SELECT 
	T1.[Month],
	MAX(T1.[Labels])	AS [Labels],
	MAX(T1.[Pages])		AS [Pages]
FROM
	(
	SELECT 
		DATEADD(MM,-T1.[Offset],DATEADD(DD,-(DATEPART(DD,SYSDATETIME())-1), CONVERT(DATE,sysdatetime()))) AS [Month],
		0 AS [Labels],
		0 AS [Pages]
	FROM 
		(SELECT * FROM (VALUES(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12)) T2([Offset])) T1	
	UNION ALL
	select 
		DATEADD(DD,-(DATEPART(DD,P.[PrintTime])-1),CONVERT(DATE,P.[PrintTime]))		AS [Month],
		0								AS [Labels],
		SUM(P.[Pages])					AS [Pages]
	from 
					[Tb_PrinterLog] P WITH (NOLOCK)
	LEFT OUTER JOIN [vw_HICS_Rep_AR]		A ON P.[LnkAssetID_To] = A.[ID] 
	WHERE 
		A.[LabelPrinter] = 0 
	GROUP BY 
		DATEADD(DD,-(DATEPART(DD,P.[PrintTime])-1),CONVERT(DATE,P.[PrintTime]))
	UNION ALL
	select 
		DATEADD(DD,-(DATEPART(DD,P.[PrintTime])-1),CONVERT(DATE,P.[PrintTime]))		AS [Month],
		SUM(P.[Pages])					AS [Labels],
		0								AS [Pages]
	from 
					[Tb_PrinterLog] P WITH (NOLOCK)
	LEFT OUTER JOIN [vw_HICS_Rep_AR]		A ON P.[LnkAssetID_To] = A.[ID] 
	WHERE 
		A.[LabelPrinter] = 1
	GROUP BY 
		DATEADD(DD,-(DATEPART(DD,P.[PrintTime])-1),CONVERT(DATE,P.[PrintTime]))) T1
WHERE
	T1.[Month] <> DATEADD(DD,-(DATEPART(DD,sysdatetime())-1),CONVERT(DATE,sysdatetime()))
GROUP BY
	T1.[Month]

GO
/****** Object:  View [dbo].[vw_HICS_Rep_ReportUsage]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vw_HICS_Rep_ReportUsage] as
SELECT
	lower(T2.[Name])	AS [Name],
	T2.[First],
	T2.[Last],
	ISNULL((SELECT [Fullname] FROM [vw_HICS_Users] WHERE [ID] = T2.[LastBy]),'') AS [LastBy],
	T2.[LastBy] AS [LastBy_ID],
	DATEDIFF(d,T2.[First],SYSDATETIME()) AS [DaysAge],
	DATEDIFF(d,T2.[Last],SYSDATETIME()) AS [DaysLastUsed],
	T2.[Count] AS [Runs],
	CASE DATEDIFF(d,T2.[First],SYSDATETIME())
		WHEN 0 THEN T2.[Count] 
		ELSE T2.[Count] / CONVERT(INT,ROUND(DATEDIFF(d,T2.[First],SYSDATETIME()) * (1 - 0.285714),0)) 
	END AS [AvgRunsPerDay],
	CONVERT(DECIMAL(10,2),ROUND(T2.[TotalDuration] / T2.[Count],2)) AS [AvgRuntime]
FROM 
	(SELECT
		T1.[Name],
		(SELECT MIN([CreatedOn]) FROM [vw_HICS_Monitor_Usage] WHERE [Name] = T1.[Name]) AS [First],
		(SELECT MAX([CreatedOn]) FROM [vw_HICS_Monitor_Usage] WHERE [Name] = T1.[Name]) AS [Last],
		(SELECT [CreatedBy] FROM [vw_HICS_Monitor_Usage] WHERE ID = (SELECT MAX([ID]) FROM [Tb_Monitor_Usage] WHERE [Name] = T1.[Name])) AS [LastBy],
		(SELECT COUNT([ID]) FROM [vw_HICS_Monitor_Usage] WHERE [Name] = T1.[Name]) AS [Count],
		(SELECT SUM([Duration]) FROM [vw_HICS_Monitor_Usage] WHERE [Name] = T1.[Name]) AS [TotalDuration]
	FROM
		(SELECT DISTINCT 
			[Name]
		FROM
			[vw_HICS_Monitor_Usage]
		WHERE 
			[Name] like '%_Rep_%') T1) T2
GO
/****** Object:  View [dbo].[vw_HICS_Rep_PrintMonthly]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_HICS_Rep_PrintMonthly] as 
select 
	DATEADD(DD,-(DATEPART(DD,P.[PrintTime])-1),CONVERT(DATE,P.[PrintTime])) AS [Month],
	A.[PrinterName],
	A.[LabelPrinter],
	SUM(P.[Pages])	AS [Pages]
FROM 
				[Tb_PrinterLog] P WITH (NOLOCK)
LEFT OUTER JOIN	[vw_HICS_Rep_AR] A ON A.[ID] = P.[LnkAssetID_To]
GROUP BY
	DATEADD(DD,-(DATEPART(DD,P.[PrintTime])-1),CONVERT(DATE,P.[PrintTime])),
	A.[PrinterName],
	A.[LabelPrinter]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_PurchaseOrders]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vw_ASC_LIVE_PurchaseOrders] as
SELECT 
	[POR_UNIQUE] AS [ID],
[POR_SOURCE_IND] AS [SourceID],
[POR_CREATED] AS [CreatedOn],
[POR_UPDATED] AS [ModifiedOn],
[POR_NUMBER] COLLATE Latin1_General_CI_AS AS [OrderNumber],
[POR_HEAD] COLLATE Latin1_General_CI_AS AS [Head],
[POR_PART_ONLY] COLLATE Latin1_General_CI_AS AS [Part],
[POR_PART_REV] COLLATE Latin1_General_CI_AS AS [PartRev],
[POR_SUB] AS [Sequence],
[POR_SUP_CODE] COLLATE Latin1_General_CI_AS AS [Supplier],
[POR_QTY_ORDERED] AS [QuantityOrdered],
[POR_QTY_DELIVERED] AS [QuantityDelivered],
[POR_QTY_REJECTED] AS [QuantityRejected],
[POR_ORDER_DATE] AS [OrderDate],
[POR_C1] COLLATE Latin1_General_CI_AS AS [Comments1],
[POR_C2] COLLATE Latin1_General_CI_AS AS [Comments2],
[POR_UOM] COLLATE Latin1_General_CI_AS AS [UoM],
[POR_CONF] COLLATE Latin1_General_CI_AS AS [Confirmation],
[POR_VAL] AS [Value],
[POR_PER] AS [Per],
[POR_CAT] COLLATE Latin1_General_CI_AS AS [Status],
[POR_DUE_DATE] AS [DueDate],
[POR_ACK_DUE_DATE] AS [SupDueDate],
[POR_TYPE] COLLATE Latin1_General_CI_AS AS [Type],
[POR_PRINTED] COLLATE Latin1_General_CI_AS AS [Printed],
[POR_EXTRA_TEXT] COLLATE Latin1_General_CI_AS AS [HasExtraText],
[POR_COST_WO] COLLATE Latin1_General_CI_AS AS [JobNumber],
[POR_SUP_REF] COLLATE Latin1_General_CI_AS AS [SupplierPart],
[POR_QTY_INVOICED] AS [QuantityInvoiced],
[POR_SC_STATUS] COLLATE Latin1_General_CI_AS AS [HeldStatus],
[POR_KIT_REF] COLLATE Latin1_General_CI_AS AS [KitRef],
[POR_CURR_CODE] COLLATE Latin1_General_CI_AS AS [Currency],
[POR_FORN_PRICE] AS [FornPricePer],
[POR_FORN_PRI_PER] AS [FornPricePerPer],
[POR_TYPE_CODE] COLLATE Latin1_General_CI_AS AS [TypeCode],
[POR_TAX_CODE] COLLATE Latin1_General_CI_AS AS [TaxCode],
[POR_ANAL_FIELD1] COLLATE Latin1_General_CI_AS AS [AnalysisField1],
[POR_ANAL_FIELD2] COLLATE Latin1_General_CI_AS AS [AnalysisField2],
[POR_ANAL_FIELD3] COLLATE Latin1_General_CI_AS AS [AnalysisField3],
[POR_ANAL_FIELD4] COLLATE Latin1_General_CI_AS AS [AnalysisField4],
[POR_ANAL_FIELD5] COLLATE Latin1_General_CI_AS AS [AnalysisField5],
[POR_ANAL_FIELD6] COLLATE Latin1_General_CI_AS AS [AnalysisField6],
[POR_ANAL_FIELD7] COLLATE Latin1_General_CI_AS AS [AnalysisField7],
[POR_ANAL_FIELD8] COLLATE Latin1_General_CI_AS AS [AnalysisField8],
[POR_ANAL_FIELD9] COLLATE Latin1_General_CI_AS AS [AnalysisField9],
[POR_ANAL_FIELD10] COLLATE Latin1_General_CI_AS AS [AnalysisField10],
[POR_NAME] COLLATE Latin1_General_CI_AS AS [Name],
[POR_LATEST_DUE_DATE] AS [LatestDueDate],
[POR_ACCOUNT] COLLATE Latin1_General_CI_AS AS [Account],
[POR_PRINT_SPEC_FLAG] COLLATE Latin1_General_CI_AS AS [PrintSpecificationFlag],
[POR_PEG_FLAG] COLLATE Latin1_General_CI_AS AS [PegFlag],
[POR_LINE_TYPE] COLLATE Latin1_General_CI_AS AS [LineType],
[POR_LINE_NO] AS [LineNo],
[POR_SRC_ORDER_NO] COLLATE Latin1_General_CI_AS AS [SourceOrderNum],
[POR_PRICE_SOURCE] COLLATE Latin1_General_CI_AS AS [PriceSource],
[POR_PAY_TERMS] COLLATE Latin1_General_CI_AS AS [PaymentTerms],
[POR_FIXED_EXRATE] COLLATE Latin1_General_CI_AS AS [FixedExrate],
[POR_EXCH_RATE] AS [ExchangeRate],
[POR_SO_NO] COLLATE Latin1_General_CI_AS AS [SalesOrderNum],
[POR_UOO_QTY_ORD_CALC] AS [UoOQtyOrdCalc],
[POR_UOO_QTY_ORDERED] AS [UoOQtyOrdered],
[POR_UOO_QTY_DELIVERED] AS [UoOQtyDelivered],
[POR_UOO_QTY_REJECTED] AS [UoOQtyRejected],
[POR_UOO_QTY_INVOICED] AS [UoOQtyInvoiced],
[POR_UOP] COLLATE Latin1_General_CI_AS AS [UoP],
[POR_UOP_PRICE] AS [UoPPrice],
[POR_UOP_PRICE_PER] AS [UoPPricePer],
[POR_COST] AS [Cost],
[POR_OP] AS [OperationToCostTo],
[POR_LINE_NUM] AS [LineNum],
[POR_DEST_WH] COLLATE Latin1_General_CI_AS AS [DestinationWarehouse],
[POR_DEST_BIN] COLLATE Latin1_General_CI_AS AS [DestinationBin],
[POR_PROJECT] COLLATE Latin1_General_CI_AS AS [Project],
[POR_COST_CENTRE] COLLATE Latin1_General_CI_AS AS [CostCentre],
[POR_LND_PERC_1] AS [LndPerc1],
[POR_LND_PERC_2] AS [LndPerc2],
[POR_LND_VALUE_1] AS [LndValue1],
[POR_LND_VALUE_2] AS [LndValue2],
[POR_AUTH_NAME] COLLATE Latin1_General_CI_AS AS [AuthName],
[POR_AUTH_DATE] AS [AuthDate],
[POR_SO_NO_SUB] AS [SoNoSequence],
[POR_BUDGET_HOLDER] COLLATE Latin1_General_CI_AS AS [BudgetHolder],
[POR_ORIG_QTY_ORDERED] AS [OriginalQuantityOrdered],
[POR_DUEDATE_TYPE] AS [DueDateType],
[POR_DUE_DAYS] AS [DueDays],
[POR_ORIGIN] COLLATE Latin1_General_CI_AS AS [Origin],
[POR_ENTERED_BY] COLLATE Latin1_General_CI_AS AS [EnteredBy],
[POR_NOTIFY_RECEIPT] AS [NotifyReceipt],
[POR_MSC_UNIQUE] AS [MscUnique],
[POR_USER_DATE_1] AS [UserDate1],
[POR_USER_DATE_2] AS [UserDate2],
[POR_USER_DATE_3] AS [UserDate3],
[POR_USER_DATE_4] AS [UserDate4],
[POR_USER_DATE_5] AS [UserDate5],
[POR_USER_TEXT1] COLLATE Latin1_General_CI_AS AS [UserText1],
[POR_USER_TEXT2] COLLATE Latin1_General_CI_AS AS [UserText2],
[POR_USER_TEXT3] COLLATE Latin1_General_CI_AS AS [UserText3],
[POR_USER_TEXT4] COLLATE Latin1_General_CI_AS AS [UserText4],
[POR_USER_TEXT5] COLLATE Latin1_General_CI_AS AS [UserText5],
[POR_USER_NUM1] AS [UserNum1],
[POR_USER_NUM2] AS [UserNum2],
[POR_USER_NUM3] AS [UserNum3],
[POR_USER_NUM4] AS [UserNum4],
[POR_USER_NUM5] AS [UserNum5],
[POR_USER_CHECK1] AS [UserCheck1],
[POR_USER_CHECK2] AS [UserCheck2],
[POR_USER_CHECK3] AS [UserCheck3],
[POR_USER_CHECK4] AS [UserCheck4],
[POR_USER_CHECK5] AS [UserCheck5]
FROM 
	[ASC_LIVE].[dbo].[ASC_POR_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_History]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE view [dbo].[vw_ASC_LIVE_History] as 
SELECT
	H.[HIS_UNIQUE]				AS [ID],
	H.[HIS_SOURCE_IND]			AS [SourceID],
	H.[HIS_CREATED]				AS [CreatedOn],
	H.[HIS_UPDATED]				AS [ModifiedOn],
	H.[HIS_PART_ONLY]		COLLATE Latin1_General_CI_AS	AS [Part],
	H.[HIS_PART_REV]		COLLATE Latin1_General_CI_AS	AS [PartRev],
	H.[HIS_REC]					AS [RecordNum],
	H.[HIS_TYPE]			COLLATE Latin1_General_CI_AS	AS [ActionTypeCode],
	CASE
		WHEN H.[HIS_TYPE] IN ('CA','CC','CD','CN','CR','MS','PF','PK','SI','SS') THEN 'Sales'
		WHEN H.[HIS_TYPE] IN ('GJ','GR','GS','IN','PA','PD','PI','PO','PS') THEN 'Purchasing'
		WHEN H.[HIS_TYPE] IN ('SA','SD','SO') THEN 'Purchasing: Subcontract orders'
		WHEN H.[HIS_TYPE] IN ('AD','IC','IS','LC','RE','RG','SP','ST','WC','WM') THEN 'Stock'
		WHEN H.[HIS_TYPE] IN ('KB','KC','KI','KJ','KP','KR','WD','WO') THEN 'Works'
		ELSE 'UNKNOWN'
	END							AS [ActionType],
	CASE H.[HIS_TYPE]
		--Sales
		WHEN 'CA' THEN 'Customer order item added'
		WHEN 'CC' THEN 'Customer order item changed'
		WHEN 'CD' THEN 'Confirm sales despatch'
		WHEN 'CN' THEN 'Credit Note - Financial transactions'
		WHEN 'CR' THEN 'Customer order item removed'
		WHEN 'MS' THEN 'Missing sales'
		WHEN 'PF' THEN 'Pro-forma invoice'
		WHEN 'PK' THEN 'Confirm pick note'
		WHEN 'SI' THEN 'Sales invoice'
		WHEN 'SS' THEN 'Change in order status'
		
		--Purchasing
		WHEN 'GJ' THEN 'Goods rejected'
		WHEN 'GR' THEN 'Goods accepted to store'
		WHEN 'GS' THEN 'Goods received on site'
		WHEN 'IN' THEN 'Goods rejected after inspection'
		WHEN 'PA' THEN 'Purchase order amended'
		WHEN 'PD' THEN 'Purchase order deleted'
		WHEN 'PI' THEN 'Purchase invoice'
		WHEN 'PO' THEN 'Purchase order added'
		WHEN 'PS' THEN 'Change in order status'
		
		--Purchasing: Subcontract orders
		WHEN 'SA' THEN 'Subcontract order amended'
		WHEN 'SD' THEN 'Subcontract order deleted'
		WHEN 'SO' THEN 'subcontract order added'
		
		--Stock
		WHEN 'AD' THEN 'Adjust stock'
		WHEN 'IC' THEN 'Cost roll-up'
		WHEN 'IS' THEN 'Issue stock'
		WHEN 'LC' THEN 'Lot cost change'
		WHEN 'RE' THEN 'Return to stock or associated with a credit note'
		WHEN 'RG' THEN 'Re-graded'
		WHEN 'SP' THEN 'Split lots'
		WHEN 'ST' THEN 'Stock taking'
		WHEN 'WC' THEN 'Warehouse cleardown'
		WHEN 'WM' THEN 'Movement order'
		
		--Works
		WHEN 'KB' THEN 'Book top level from kit'
		WHEN 'KC' THEN 'Kit cancelled'
		WHEN 'KI' THEN 'Kit issue'
		WHEN 'KJ' THEN 'Record top level rejection from kit'
		WHEN 'KP' THEN 'Repair'
		WHEN 'KR' THEN 'Kit returned to stores'
		WHEN 'WD' THEN 'Works order delete'
		WHEN 'WO' THEN 'Works order add'
		
		ELSE 'UNKNOWN'
	END							AS [ActionDescription],
	H.[HIS_QTY]					AS [Quantity],
	H.[HIS_PHYS]				AS [PhysicalAfter],
	H.[HIS_COMMENTS]		COLLATE Latin1_General_CI_AS	AS [Comments],
	H.[HIS_REASON]			COLLATE Latin1_General_CI_AS	AS [Reason],
	H.[HIS_ACTIONED]		COLLATE Latin1_General_CI_AS	AS [UpdatedBy],
	H.[HIS_WO_PO]			COLLATE Latin1_General_CI_AS	AS [WorksOrderNo],
	H.[HIS_DN_RQ]			COLLATE Latin1_General_CI_AS	AS [DeliveryNote],
	H.[HIS_PO_SUB]				AS [POSequence],
	H.[HIS_DATE]				AS [Date],
	H.[HIS_NUMERIC]				AS [ValueAtStdorLatest],
	H.[HIS_ORDER_TYPE]		COLLATE Latin1_General_CI_AS	AS [OrderType],
	H.[HIS_ALT_ACTIONED]	COLLATE Latin1_General_CI_AS	AS [ActionedBy],
	H.[HIS_USER_ID]			COLLATE Latin1_General_CI_AS	AS [User],
	H.[HIS_ANAL_CODES1]		COLLATE Latin1_General_CI_AS	AS [AnalysisCode1],
	H.[HIS_ANAL_CODES2]		COLLATE Latin1_General_CI_AS	AS [AnalysisCode2],
	H.[HIS_ANAL_CODES3]		COLLATE Latin1_General_CI_AS	AS [AnalysisCode3],
	H.[HIS_ANAL_CODES4]		COLLATE Latin1_General_CI_AS	AS [AnalysisCode4],
	H.[HIS_ANAL_CODES5]		COLLATE Latin1_General_CI_AS	AS [AnalysisCode5],
	H.[HIS_ANAL_CODES6]		COLLATE Latin1_General_CI_AS	AS [AnalysisCode6],
	H.[HIS_ANAL_CODES7]		COLLATE Latin1_General_CI_AS	AS [AnalysisCode7],
	H.[HIS_ANAL_CODES8]		COLLATE Latin1_General_CI_AS	AS [AnalysisCode8],
	H.[HIS_ANAL_CODES9]		COLLATE Latin1_General_CI_AS	AS [AnalysisCode9],
	H.[HIS_ANAL_CODES10]	COLLATE Latin1_General_CI_AS	AS [AnalysisCode10],
	H.[HIS_NEW_COMMENTS]	COLLATE Latin1_General_CI_AS	AS [Comment],
	H.[HIS_FIN_PERIOD]			AS [FinancialPeriod],
	H.[HIS_FIN_YEAR_A]		COLLATE Latin1_General_CI_AS	AS [FinancialYearA],
	H.[HIS_FIN_YEAR_N]			AS [FinancialYearN],
	H.[HIS_HIS_LINK]			AS [LotUsageLink],
	H.[HIS_ACC_TYPE]			AS [AccountType],
	H.[HIS_ACC_LINK]			AS [AccountLink]
FROM 
				[ASC_LIVE].[dbo].[ASC_HIS_TBL]	H  WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_ClosedPOsWithOutstandingQty]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[vw_ASC_LIVE_Rep_ClosedPOsWithOutstandingQty] AS
SELECT 
	P.[OrderNumber],
	P.[CreatedOn],
	P.[DueDate],
	P.[Part],
	P.[Supplier],
	P.[QuantityOrdered],
	P.[QuantityDelivered],
	ISNULL(P.[Comments1],'') + ' ' + ISNULL(P.[Comments2],'')	AS [Comment],
	H.[User]
FROM 
				[vw_ASC_LIVE_PurchaseOrders]	P
INNER JOIN		[vw_ASC_LIVE_History]			H	ON	P.[OrderNumber]			= H.[WorksOrderNo]
WHERE
	P.[Status] = 'C'
AND H.[ActionTypeCode] = 'GR'
AND P.[QuantityDelivered] < P.[QuantityOrdered]
AND LEFT(P.[Part],1) NOT IN ('E','K','S')
AND P.[DueDate] >= CONVERT(DATE,DATEADD(d,-7,SYSDATETIME()))
AND LEFT(P.[OrderNumber],5) <> '99999'
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_ReverseDespatchedOrders_7Days]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[vw_ASC_LIVE_Rep_ReverseDespatchedOrders_7Days] AS
SELECT 
	H.[Part],
	H.[ActionTypeCode],
	H.[Quantity],
	H.[WorksOrderNo],
	H.[DeliveryNote],
	H.[User],
	H.[OrderType],
	H.[Date]
FROM 
	[vw_ASC_LIVE_History]	H
WHERE
	H.[ActionTypeCode] = 'CD'
AND H.[DeliveryNote] <> ''
AND H.[Date] between CONVERT(DATE,DATEADD(d,-7,SYSDATETIME())) AND CONVERT(DATE,SYSDATETIME())
AND LEFT(H.[Part],1) = 'F'
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Kit]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vw_ASC_LIVE_Kit] AS
SELECT 
	[KIT_UNIQUE]			AS [ID],
	[KIT_SOURCE_IND]		AS [SourceID],
	[KIT_CREATED]			AS [CreatedOn],
	[KIT_UPDATED]			AS [ModifiedOn],
	[KIT_WO]			COLLATE Latin1_General_CI_AS	AS [WONo],
	[KIT_PART_ONLY]		COLLATE Latin1_General_CI_AS	AS [Part],
	[KIT_PART_REV]		COLLATE Latin1_General_CI_AS	AS [PartRev],
	[KIT_WC]			COLLATE Latin1_General_CI_AS	AS [WorkCentre],
	[KIT_REF]			COLLATE Latin1_General_CI_AS	AS [Reference],
	[KIT_ITEM]				AS [Item],
	[KIT_QTY]				AS [Qty],
	[KIT_QTY_KITTED]		AS [QtyKitted],
	[KIT_QTY_PICKED]		AS [QtyPicked],
	[KIT_PARENT_ONLY]	COLLATE Latin1_General_CI_AS	AS [ParentPart],
	[KIT_PARENT_REV]	COLLATE Latin1_General_CI_AS	AS [ParentPartRev],
	[KIT_DUE_DATE]			AS [WODueDate],
	[KIT_SHORT_MARK]	COLLATE Latin1_General_CI_AS	AS [ShortMark],
	[KIT_STATUS]		COLLATE Latin1_General_CI_AS	AS [Status],
	[KIT_PB_STATUS]		COLLATE Latin1_General_CI_AS	AS [ProdBillStatus],
	[KIT_PHANT_PARENT_ONLY] COLLATE Latin1_General_CI_AS AS [PhantomParentPart],
	[KIT_PHANT_PARENT_REV]	COLLATE Latin1_General_CI_AS AS [PhantomParentPartRev],
	[KIT_ADD_LOCAL_VALUE]	AS [LocalValue],
	[KIT_ADD_FOREIGN_VALUE] AS [ForeignValue],
	[KIT_ADD_DESC]		COLLATE Latin1_General_CI_AS	AS [Description],
	[KIT_FIXED]				AS [Fixed],
	[KIT_DEST_WH]		COLLATE Latin1_General_CI_AS	AS [DestinationWarehouse],
	[KIT_DEST_BIN]		COLLATE Latin1_General_CI_AS	AS [DestinationBin],
	[KIT_ANAL_1]		COLLATE Latin1_General_CI_AS	AS [AnalysisField1],
	[KIT_ANAL_2]		COLLATE Latin1_General_CI_AS	AS [AnalysisField2],
	[KIT_ANAL_3]		COLLATE Latin1_General_CI_AS	AS [AnalysisField3],
	[KIT_ANAL_4]		COLLATE Latin1_General_CI_AS	AS [AnalysisField4],
	[KIT_ANAL_5]		COLLATE Latin1_General_CI_AS	AS [AnalysisField5],
	[KIT_ANAL_6]		COLLATE Latin1_General_CI_AS	AS [AnalysisField6],
	[KIT_ANAL_7]		COLLATE Latin1_General_CI_AS	AS [AnalysisField7],
	[KIT_ANAL_8]		COLLATE Latin1_General_CI_AS	AS [AnalysisField8],
	[KIT_ANAL_9]		COLLATE Latin1_General_CI_AS	AS [AnalysisField9],
	[KIT_ANAL_0]		COLLATE Latin1_General_CI_AS	AS [AnalysisField0],
	[KIT_COMMENTS_1]	COLLATE Latin1_General_CI_AS	AS [Comment1],
	[KIT_COMMENTS_2]	COLLATE Latin1_General_CI_AS	AS [Comment2],
	[KIT_VAL_ISSUED]		AS [ValueIssued],
	[KIT_QTY_OS]			AS [QuantityOutstanding],
	[KIT_VAL_OS]			AS [ValueOutstanding],
	[KIT_QTY_BOOKED]		AS [QuantityBooked],
	[KIT_VAL_BOOKED]		AS [ValueBooked],
	[KIT_QTY_REJECTED]		AS [QtyRejected],
	[KIT_VAL_REJECTED]		AS [ValRejected]
FROM 
	[ASC_LIVE].[dbo].[ASC_KIT_TBL] WITH (NOLOCK)
--WHERE
--	[KIT_CREATED] > dateadd(yy,-5,getdate())
-- The 5 year clause which was there to improve report effiency was removed as there are some works 
-- orders with a due date 12 years from now, its unlikely this report will be here then, but if the
-- principal lives on then that item would not show up as it would be older than 5 years
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_WOOutOfStep]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ASC_LIVE_Rep_WOOutOfStep] AS
SELECT 
	K.[WONo],
	P.[Drawing],
	W.[Part],
	CASE
		WHEN SUM(K.[QtyKitted]) > 0 AND MAX(W.[QtyMadeToDate]) = 0 THEN 'Issue, no receipt'
		WHEN SUM(K.[QtyKitted]) = 0 AND MAX(W.[QtyMadeToDate]) > 0 THEN 'Receipt, no issue'
		ELSE ''
	END						AS [Type],
	SUM(K.[QtyKitted])		AS [TotalIssued],
	W.[OriginalQty],
	W.[CreatedOn],
	MAX(W.[QtyMadeToDate])	AS [TotalReceived],
	H.[User]
FROM 
				[vw_ASC_LIVE_WorksOrders]	W
INNER JOIN		[vw_ASC_LIVE_History]		H	ON H.[WorksOrderNo] = W.[WorksOrderNo]
INNER JOIN		[vw_ASC_LIVE_Kit]			K	ON K.[WONo]			= W.[WorksOrderNo]
INNER JOIN		[vw_ASC_LIVE_Parts]			P	ON P.[Part]			= K.[ParentPart]
WHERE
	K.[Status] <> 'M'
AND H.[ActionTypeCode] = 'WO'
AND W.[CreatedOn] > CONVERT(DATE,DATEADD(d,-2,SYSDATETIME()))
GROUP BY
	K.[WONo],
	P.[Drawing],
	W.[Part],
	W.[OriginalQty],
	W.[CreatedOn],
	H.[User]
HAVING 
	((SUM(K.[QtyKitted]) > 0 AND MAX(W.[QtyMadeToDate]) = 0)
	OR
	(SUM(K.[QtyKitted]) = 0 AND MAX(W.[QtyMadeToDate]) > 0))


GO
/****** Object:  View [dbo].[vw_HICS_Rep_CoA_SentRegister]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_HICS_Rep_CoA_SentRegister] as
SELECT        
	G.[ID],        
	CASE G.[SentBy]            
		WHEN '' THEN 'No'            
		ELSE         'Yes'        
	END										AS [Sent],       
	G.[SentOn]								AS [Sent On],       
	G.[SentBy]								AS [Sent By],       
	G.[CreatedOn]							AS [CoA Created On],       
	U.[FullName]							AS [CoA Created By],       
	ISNULL(C.[Code] + ': ' + C.[Name],'')   AS [Customer],       
	isnull(O.[CustomerOrderRef],'')			AS [Cus. Order Ref.],       
	G.[SalesOrderNo]						AS [SO No],       
	ISNULL(U2.[Fullname],'')				AS [SO Owner],       
	P.[Part] + ': ' + P.[Description1] + ' ' + P.[Description2]		AS [Part],       
	G.[MonographName]						AS [Monograph],       
	ISNULL(G.[SCBatchNo],'')				AS [SC Batch Ref.],       
	T.[BatchRef]							AS [CoA Batch Ref.],       
	G.[FileName]   
FROM                    
				[vw_HICS_CoA_Generations]	G    
LEFT OUTER JOIN [vw_HICS_Users]             U   ON  G.[CreatedBy]       = U.[ID]    
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]         P   ON  G.[Part]            = P.[Part]    
LEFT OUTER JOIN [vw_ASC_LIVE_Orders]		O	ON	G.[SalesOrderNo]	= O.[OrderNum]
												AND	P.[Part]			= O.[Part]   
LEFT OUTER JOIN [vw_ASC_LIVE_Customers]     C   ON  O.[CustomerCode]    = C.[Code]     
LEFT OUTER JOIN [vw_ASC_LIVE_Users]         U2  ON  O.[OrderEnteredBy]	= U2.[Code]     
LEFT OUTER JOIN [vw_HICS_CoA_Tests]         T   ON  G.[Test]            = T.[ID]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_Parts]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_Rep_Parts] AS 
SELECT
	P.[Part],
	P.[Description1],
	P.[Description2],
	P.[Description3],
	P.[AllocTolerance]	AS [Strength],
	P.[Analysis2]		AS [PackType],
	P.[ProductGroup],
	P.[AllocRule1]		AS [UNNum],
	P.[LotGroup],
	P.[ProcurementCode],
	P.[UoM],
	P.[CapacityUoM]
FROM
	[vw_ASC_LIVE_Parts] P
GO
/****** Object:  View [dbo].[vw_Matrix_Products]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_Matrix_Products] as
select 
	[ID],
	[Part]									AS [Product],
	[Description1] + ' '+ [Description2]	AS [ProductDesc],
	[Analysis10]							AS [ProductGroup],
	--[AllocTolerance]						AS [Strength]
	--convert(float,[AllocTolerance])			AS [Strength],
	/*
	Requested by Debby and Steph to use Analysis1 (called NOT USED), this takes out the percent sign and any spaces and only returns those with a numeric value in
	*/
	REPLACE(replace([Analysis1],' ',''),'%','') AS [Strength]
from 
	[vw_ASC_LIVE_Parts]
WHERE
	ISNUMERIC(REPLACE(replace([Analysis1],' ',''),'%','')) = 1
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_FCodeLinkData]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view 
[dbo].[vw_ASC_LIVE_Rep_FCodeLinkData]
AS
SELECT
	P.[Part],
	P.[Description1]			AS [Desc1],
	P.[Description2]			AS [Desc2],
	P.[Description3]			AS [Desc3],
	P.[AllocTolerance]			AS [Strength],
	B.[OwnedPart]				AS [LPartInBoM],
	P2.[Description1]			AS [LPartDesc1],
	P2.[Description2]			AS [LPartDesc2],
	P2.[Description3]			AS [LPartDesc3],
	P.[AllocRule1]				AS [UNNo],
	P.[LotGroup]				AS [LotAttributeGroup],
	P.[RRP]						AS [ConversionFactor]
FROM
				[vw_ASC_LIVE_Parts]	P
LEFT OUTER JOIN [vw_ASC_LIVE_BoMs]	B	ON P.[Part]				= B.[ParentPart] 
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]	P2	ON B.[OwnedPart]		= P2.[Part]
WHERE
	P.[ProcurementCode] <> '0'
AND LEFT(P.[Part] ,1) = 'F'
AND LEFT(B.[OwnedPart],1) = 'L'
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_CustomerStock_Received]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_Rep_CustomerStock_Received] as
SELECT 
	CONVERT(date,H.[Date])				AS [Date],
	ISNULL(A.[AnalysisCode],'')			AS [VariantCode],
	ISNULL(A.[AnalysisDescription],'')	AS [VariantDescription],
	P.[Part],
	P.[Description1] + case ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END AS [Description],
	H.[Quantity],
	H.[DeliveryNote],
	H.[WorksOrderNo]					AS [PONo],
	H.[ActionTypeCode]					AS [Action],
	H.[ActionDescription]				AS [ActionDescription]
FROM
				[vw_ASC_LIVE_Parts]				P
LEFT OUTER JOIN	[vw_ASC_LIVE_History]			H	ON	P.[Part] = H.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_AnalysisCodes]		A	ON	P.[Analysis3] = A.[AnalysisCode]
													AND A.[TypeCode]		= 'I'
													AND	A.[LabelCode]		= 3
WHERE
	H.[ActionTypeCode] in ('RE','GR')
AND NOT LEFT(P.[Part],1) IN ('E','F','R','S')
and CONVERT(date,H.[Date]) >= convert(date,'01/' +	CASE convert(varchar(2),MONTH(GETDATE()))
												WHEN '1' then 'Jan'
												WHEN '2' then 'Feb'
												WHEN '3' then 'Mar'
												WHEN '4' then 'Apr'
												WHEN '5' then 'May'
												WHEN '6' then 'Jun'
												WHEN '7' then 'Jul'
												WHEN '8' then 'Aug'
												WHEN '9' then 'Sep'
												WHEN '10' then 'Oct'
												WHEN '11' then 'Nov'
												WHEN '12' then 'Dec'												
											END + '/' + convert(varchar(4),year(getdate())))
and CONVERT(date,H.[Date]) <= convert(date,GETDATE())
GO
/****** Object:  Table [dbo].[Tb_SR_Nosings]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SR_Nosings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[SR] [int] NOT NULL,
	[Who] [int] NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_Tb_SR_Nosings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Warehouses]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vw_ASC_LIVE_Warehouses] as 
SELECT DISTINCT
	MIN(B.[WHB_CREATED])																AS [CreatedOn],
	MAX(B.[WHB_UPDATED])																AS [ModifiedOn],
	B.[WHB_WH]	COLLATE Latin1_General_CI_AS 											AS [Warehouse],
	ISNULL(LTRIM(RTRIM(LEFT(S.[SystemDescription],LEN(S.[SystemDescription])-2))),'')	AS [WarehouseDescription]
FROM 
				[ASC_LIVE].[dbo].[ASC_WHB_TBL]	B WITH (NOLOCK)
LEFT OUTER JOIN	[vw_ASC_LIVE_SystemCodes]		S	ON	B.[WHB_WH]	COLLATE Latin1_General_CI_AS 	= S.[SystemCode]
													AND	S.[TypeCode]	= 'W'
GROUP BY 
	B.[WHB_WH],
	ISNULL(LTRIM(RTRIM(LEFT(S.[SystemDescription],LEN(S.[SystemDescription])-2))),'')
GO
/****** Object:  Table [dbo].[Tb_SR_Tests]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SR_Tests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[SR] [int] NOT NULL,
	[Accepted] [bit] NULL,
	[AcceptedWho] [int] NULL,
	[Locked] [bit] NULL,
	[LockedOn] [datetime] NULL,
	[LockedBy] [int] NULL,
	[LockedWho] [int] NULL,
	[AcceptedViaMatrix] [bit] NOT NULL,
 CONSTRAINT [PK_Tb_SR_Tests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Cancelled] [bit] NOT NULL,
	[CancelledOn] [datetime] NULL,
	[CancelledBy] [int] NULL,
	[CancelledComment] [varchar](500) NULL,
	[Closed] [bit] NOT NULL,
	[ClosedOn] [datetime] NULL,
	[ClosedBy] [int] NULL,
	[Prefix] [int] NOT NULL,
	[SerialNo] [int] NOT NULL,
	[AdditionalRef] [varchar](10) NULL,
	[Sample] [int] NOT NULL,
	[Level1] [int] NULL,
	[Level2] [int] NULL,
	[Level3] [int] NULL,
	[Level4] [int] NULL,
	[Level5] [int] NULL,
	[TypeLink] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Product] [int] NOT NULL,
	[BondedState] [varchar](25) NULL,
	[Source] [int] NOT NULL,
	[Destination] [int] NOT NULL,
	[Comment] [varchar](500) NULL,
	[PreviousSerialRef] [int] NULL,
	[DerivativeOf] [int] NOT NULL,
	[SupersededBy] [int] NOT NULL,
 CONSTRAINT [PK_Tb_SR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Test_Results]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SR_Test_Results](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Who] [int] NOT NULL,
	[Test] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Result] [varchar](100) NULL,
 CONSTRAINT [PK_Tb_SR_Test_Results] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Lists]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SR_Lists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Type] [varchar](1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Tb_SR_Lists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_List_Items]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SR_List_Items](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[List] [int] NOT NULL,
	[Value] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tb_SR_List_Items] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Types]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SR_Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[Enabled] [bit] NOT NULL,
	[AppendNumber] [bit] NOT NULL,
	[Label] [varchar](255) NULL,
	[SourceVAT] [int] NOT NULL,
	[SourceCUS] [int] NOT NULL,
	[SourceSUP] [int] NOT NULL,
	[SourceWO] [bit] NOT NULL,
	[DestinationVAT] [int] NOT NULL,
	[DestinationCUS] [int] NOT NULL,
	[DestinationSUP] [int] NOT NULL,
	[DestinationWO] [bit] NOT NULL,
	[ReqTesting] [bit] NOT NULL,
	[CanSupersede] [bit] NOT NULL,
	[IncrementSerialNumber] [bit] NOT NULL,
	[GMP] [bit] NOT NULL,
	[AdditionalRef] [bit] NOT NULL,
	[SourcePO] [bit] NOT NULL,
	[DestinationPO] [bit] NOT NULL,
	[Version] [int] NOT NULL,
	[VersionParent] [int] NULL,
 CONSTRAINT [PK_Tb_SR_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_SR]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_HICS_Rep_SR] as
SELECT
	SR.[ID],
	SR.[CreatedOn],
	SR.[CreatedBy]						AS [CreatedById],
	UC.[FullName]						AS [CreatedBy],
	SR.[ModifiedOn],
	SR.[ModifiedBy]						AS [ModifiedById],
	UM.[FullName]						AS [ModifiedBy],
	SR.[Cancelled],
	SR.[CancelledOn],
	UCa.[FullName]						AS [CancelledBy],
	ISNULL(SR.[CancelledComment],'')	AS [CancelledComment],
	SR.[Closed],
	SR.[ClosedOn],
	UCl.[FullName]						AS [ClosedBy],
	CASE
		WHEN SR.[Closed] = 1 THEN 'Closed'
		WHEN SR.[Cancelled] = 1 THEN 'Cancelled'
		WHEN SR.[SupersededBy] <> 0 THEN 'Superseded'
		WHEN T.[ReqTesting] = 0 THEN 'Available'
		WHEN Te.[Locked] = 1 THEN CASE WHEN Te.[Accepted] = 1 THEN 'Available' ELSE 'Failed testing' END
		WHEN N.[Nosings] = 0 AND TR.[TestsAnswered] = 0 THEN 'To be tested'
		ELSE 'In testing'
	END									AS [Status],
	RIGHT('00' + CONVERT(VARCHAR(20),SR.[Prefix]),2) + '/' + RIGHT('0000' + CONVERT(VARCHAR(20),SR.[SerialNo]),4) + 
	CASE ISNULL(SR.[AdditionalRef],'') WHEN '' THEN '' ELSE '/' + SR.[AdditionalRef] END + '/' + RIGHT('000' + CONVERT(VARCHAR(20),SR.[Sample]),3) as [SerialRef],
	SR.[Prefix],
	sr.[SerialNo],
	SR.[AdditionalRef],
	SR.[Sample],
	SR.[Level1],
	SR.[Level2],
	SR.[Level3],
	SR.[Level4],
	SR.[Level5],
	RIGHT('00' + CONVERT(VARCHAR(20),SR.[Prefix]),2) + '/' + RIGHT('0000' + CONVERT(VARCHAR(20),SR.[SerialNo]),4) + CASE ISNULL(SR.[AdditionalRef],'') WHEN '' THEN '' ELSE '/' + SR.[AdditionalRef] END + '/' + RIGHT('000' + CONVERT(VARCHAR(10),SR.[Sample]),3) + 
	CASE SR.[Level1] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),SR.[Level1]),2) END +
	CASE SR.[Level2] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),SR.[Level2]),2) END + 
	CASE SR.[Level3] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),SR.[Level3]),2) END + 
	CASE SR.[Level4] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),SR.[Level4]),2) END + 
	CASE SR.[Level5] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),SR.[Level5]),2) END AS [SerialRefFull],
	SR.[TypeLink],
	SR.[Type],
	T.[Name]							AS [TypeDesc],
	SR.[Product]						AS [ProductID],
	P.[Part]							AS [Product],
	P.[Description1] + CASE LTRIM(RTRIM(P.[Description2])) WHEN '' THEN '' ELSE ' ' + LTRIM(RTRIM(P.[Description2])) END AS [ProductDesc],
	SR.[BondedState],
	SR.[Source]							AS [SourceID],
	CASE LS.[Type] 
		WHEN 'C' THEN 'Customer'
		WHEN 'P' THEN 'Purchase order'
		WHEN 'R' THEN 'Stock registry'
		WHEN 'S' THEN 'Supplier'
		WHEN 'W' THEN 'Works order'
		WHEN 'V' THEN 'VAT'
		ELSE 'None'
	END									AS [SourceType],
	CASE LS.[Type] 
		WHEN 'P' THEN ISNULL(SP.[OrderNumber],'PO Deleted')
		WHEN 'W' THEN ISNULL(SW.[WorksOrderNo],'WO Deleted')
		WHEN 'R' THEN ISNULL(RIGHT('00' + CONVERT(VARCHAR(20),SSR.[Prefix]),2) + '/' + RIGHT('0000' + CONVERT(VARCHAR(20),SSR.[SerialNo]),4) + CASE ISNULL(SR.[AdditionalRef],'') WHEN '' THEN '' ELSE '/' + SR.[AdditionalRef] END + '/' + RIGHT('000' + CONVERT(VARCHAR(10),SSR.[Sample]),3) + 
						CASE SSR.[Level1] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),SSR.[Level1]),2) END +
						CASE SSR.[Level2] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),SSR.[Level2]),2) END + 
						CASE SSR.[Level3] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),SSR.[Level3]),2) END + 
						CASE SSR.[Level4] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),SSR.[Level4]),2) END + 
						CASE SSR.[Level5] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),SSR.[Level5]),2) END,'')
		ELSE ISNULL(LIS.[Value],'')
	END									AS [Source],
	CASE LS.[Type] 
		WHEN 'C' THEN SC.[Name]
		WHEN 'P' THEN ISNULL(SP.[Part],'')
		WHEN 'R' THEN ''	--CONVERT(VARCHAR(20),SSR.[ID])
		WHEN 'S' THEN SS.[Name]
		WHEN 'V' THEN SV.[WarehouseDescription]
		WHEN 'W' THEN ISNULL(SW.[Part],'')
		ELSE ''
	END									AS [SourceDesc],
	SR.[Destination]					AS [DestinationID],
	CASE LD.[Type] 
		WHEN 'C' THEN 'Customer'
		WHEN 'P' THEN 'Purchase order'
		WHEN 'S' THEN 'Supplier'
		WHEN 'W' THEN 'Works order'
		WHEN 'V' THEN 'VAT'
		ELSE 'None'
	END									AS [DestinationType],
	CASE LD.[Type]
		WHEN 'P' THEN ISNULL(DP.[OrderNumber],'PO Deleted')
		WHEN 'W' THEN ISNULL(DW.[WorksOrderNo],'WO Deleted')
		ELSE ISNULL(LID.[Value],'')
	END									AS [Destination],
	CASE LD.[Type] 
		WHEN 'V' THEN DV.[WarehouseDescription]
		WHEN 'C' THEN DC.[Name]
		WHEN 'S' THEN DS.[Name]
		WHEN 'W' THEN ISNULL(DW.[Part],'')
		ELSE ''
	END									AS [DestinationDesc],
	SR.[PreviousSerialRef],
	ISNULL(RIGHT('00' + CONVERT(VARCHAR(20),PSR.[Prefix]),2) + '/' + RIGHT('0000' + CONVERT(VARCHAR(20),PSR.[SerialNo]),4) + CASE ISNULL(SR.[AdditionalRef],'') WHEN '' THEN '' ELSE '/' + SR.[AdditionalRef] END + '/' + RIGHT('000' + CONVERT(VARCHAR(10),PSR.[Sample]),3) + 
	CASE PSR.[Level1] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),PSR.[Level1]),2) END +
	CASE PSR.[Level2] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),PSR.[Level2]),2) END + 
	CASE PSR.[Level3] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),PSR.[Level3]),2) END + 
	CASE PSR.[Level4] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),PSR.[Level4]),2) END + 
	CASE PSR.[Level5] WHEN 0 THEN '' ELSE '/' + RIGHT('00' + CONVERT(VARCHAR(2),PSR.[Level5]),2) END,'')  AS [PreviousSerialRef_Ref],
	SR.[Comment],
	ISNULL(N.[Nosings],0)				AS [Nosings],
	ISNULL(TR2.[Tests],0)				AS [Tests],
	ISNULL(TR.[TestsAnswered],0)		AS [TestsAnswered],
	Te.[Accepted]						AS [Accepted], --This one should show null (tri state of not answered, true, or false.)
	ISNULL(Te.[Locked],0)				AS [Locked],
	Te.[LockedOn],
	UL.[FullName]						AS [LockedBy]
FROM
				[Tb_SR]						SR
LEFT OUTER JOIN	[vw_HICS_Rep_Users]			UC		ON	SR.[CreatedBy]			= UC.[ID]
LEFT OUTER JOIN	[vw_HICS_Rep_Users]			UM		ON	SR.[ModifiedBy]			= UM.[ID]
LEFT OUTER JOIN	[vw_HICS_Rep_Users]			UCa		ON	SR.[CancelledBy]		= UCa.[ID]
LEFT OUTER JOIN	[vw_HICS_Rep_Users]			UCl		ON	SR.[ClosedBy]			= UCl.[ID]
LEFT OUTER JOIN [Tb_SR_Types]				T		ON	SR.[Type]				= T.[ID]
LEFT OUTER JOIN [Tb_SR_Tests]				Te		ON	SR.[ID]					= Te.[SR]
LEFT OUTER JOIN	[vw_HICS_Rep_Users]			UL		ON	Te.[LockedBy]			= UL.[ID]
LEFT OUTER JOIN (SELECT [SR], COUNT([ID]) AS [Nosings] FROM [Tb_SR_Nosings] GROUP BY [SR])
											N		ON	SR.[ID]					= N.[SR]
LEFT OUTER JOIN (SELECT T.[SR], COUNT(TR.[ID]) AS [TestsAnswered] FROM [Tb_SR_Tests] T LEFT OUTER JOIN [Tb_SR_Test_Results] TR ON T.[ID] = TR.[Test] WHERE ISNULL(TR.[Result],'') <> '' GROUP BY T.[SR])
											TR		ON SR.[ID]					= TR.[SR]
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]			P		ON SR.[Product]				= P.[ID]
LEFT OUTER JOIN [Tb_SR_List_Items]			LIS		ON SR.[Source]				= LIS.[ID]
LEFT OUTER JOIN [Tb_SR_Lists]				LS		ON LIS.[List]				= LS.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_Customers]		SC		ON	LS.[Type]				= 'C'
													AND	LIS.[Value]				= SC.[Code]
LEFT OUTER JOIN [vw_ASC_LIVE_Suppliers1]	SS		ON	LS.[Type]				= 'S'
													AND	LIS.[Value]				= SS.[Code]
LEFT OUTER JOIN [vw_ASC_LIVE_Warehouses]	SV		ON	LS.[Type]				= 'V'
													AND	LIS.[Value] 			= SV.[Warehouse] 
LEFT OUTER JOIN [vw_ASC_LIVE_WorksOrders]	SW		ON	LS.[Type]				= 'W'
													AND	LIS.[Value] 			= CONVERT(VARCHAR(20),SW.[ID])
LEFT OUTER JOIN [vw_ASC_LIVE_PurchaseOrders] SP		ON	LS.[Type]				= 'P'
													AND	LIS.[Value] 			= CONVERT(VARCHAR(20),SP.[ID])
LEFT OUTER JOIN [Tb_SR]						SSR		ON	LS.[Type]				= 'R'
													AND	LIS.[Value] 			= CONVERT(VARCHAR(20),SSR.[ID])
LEFT OUTER JOIN [Tb_SR_List_Items]			LID		ON SR.[Destination]			= LID.[ID]
LEFT OUTER JOIN [Tb_SR_Lists]				LD		ON LID.[List]				= LD.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_Customers]		DC		ON	LD.[Type]				= 'C'
													AND	LID.[Value]				= DC.[Code]
LEFT OUTER JOIN [vw_ASC_LIVE_Suppliers1]	DS		ON	LD.[Type]				= 'S'
													AND	LID.[Value]				= DS.[Code]
LEFT OUTER JOIN [vw_ASC_LIVE_Warehouses]	DV		ON	LD.[Type]				= 'V'
													AND	LID.[Value] 			= DV.[Warehouse] 
LEFT OUTER JOIN [vw_ASC_LIVE_WorksOrders]	DW		ON	LD.[Type]				= 'W'
													AND	LID.[Value] 			= CONVERT(VARCHAR(20),DW.[ID])
LEFT OUTER JOIN [vw_ASC_LIVE_PurchaseOrders] DP		ON	LD.[Type]				= 'P'
													AND	LID.[Value] 			= CONVERT(VARCHAR(20),DP.[ID])
LEFT OUTER JOIN	[Tb_SR]						PSR		ON SR.[PreviousSerialRef]		= CONVERT(VARCHAR(20),PSR.[ID])
LEFT OUTER JOIN (SELECT T.[SR], COUNT(TR.[ID]) AS [Tests] FROM [Tb_SR_Tests] T LEFT OUTER JOIN [Tb_SR_Test_Results] TR ON T.[ID] = TR.[Test] GROUP BY T.[SR])
											TR2		ON SR.[ID]					= TR2.[SR]
WHERE
	SR.[Deleted] = 0

GO
/****** Object:  View [dbo].[vw_Matrix_StockRegister]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_Matrix_StockRegister] as
select 
	[ID],
	[TypeDesc],
	[SerialRefFull],
	[ProductID],
	CASE [SourceType]
		WHEN 'Works order' THEN 'WO:' + [Source]
		WHEN 'Purchase order' THEN 'PO:' + [Source]
		ELSE ''
	END					AS [WOPORef]
FROM 
	[vw_HICS_Rep_SR]
GO
/****** Object:  Table [dbo].[Tb_PPM_Jobs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PPM_Jobs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[LnkGroupID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Location] [varchar](255) NULL,
	[Freq] [int] NULL,
	[FreqValue] [int] NULL,
	[StartDate] [date] NULL,
	[ReqDocOnComp] [bit] NOT NULL,
 CONSTRAINT [PK_Tb_PPM_Jobs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_PPM_CompletedJobs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_HICS_Rep_PPM_CompletedJobs]
as
SELECT
	CJ.[Closed],
	CJ.[Due],
	CASE 
		WHEN CJ.[Closed] IS NULL THEN 'N\A'
		WHEN DATEDIFF(dd,CJ.[Due],CJ.[Closed]) > 0 THEN 'No'
		ELSE 'Yes'
	END																			AS [OnTime],
	M.[Name]																	AS [MachineName],
	J.[Name]																	AS [JobName],
	(SELECT COUNT([ID]) FROM [Tb_PPM_CompletedTasks] WHERE [LnkCJID] = CJ.[ID]) AS [Tasks],
	CJ.[Notes],
	M.[LnkGroupID]																AS [MachineGroupID]
FROM
				[Tb_PPM_CompletedJobs]	CJ
LEFT OUTER JOIN	[Tb_PPM_Jobs]			J	ON	CJ.[LnkJobID]		=	J.[ID]
LEFT OUTER JOIN	[Tb_PPM_Machines]		M	ON	J.[LnkMachineID]	=	M.[ID]
WHERE
	(CJ.[Closed] >= CONVERT(DATE,DATEADD(YYYY,-3,SYSDATETIME()))
OR CJ.[Closed] IS NULL)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Lots]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_ASC_LIVE_Lots] as
/*
SELECT 
	L.[LOT_CREATED]				AS [CreatedOn],
	L.[LOT_UPDATED]				AS [UpdatedOn],
	L.[LOT_PART_ONLY]			AS [Part],
	L.[LOT_WH]					AS [Warehouse],
	B.[WarehouseDescription]	AS [WarehouseDescription],
	L.[LOT_BIN_ONLY]			AS [Bin],
	B.[BinDescription]			AS [BinDescription],
	L.[LOT_TYPE]				AS [Type],
	L.[LOT_NUM]					AS [Number],
	L.[LOT_SUB]					AS [Sequence],
	L.[LOT_PHYSICAL]			AS [Quantity],
	L.[LOT_CUST_ALLOCS]			AS [QtyAllocated],
	L.[LOT_ALLOC_TO]			AS [QtyAllocatedTo],
	L.[LOT_SERIAL_NO]			AS [SerialNo],
	L.[LOT_DESC]				AS [Description],
	L.[LOT_STATUS]				AS [Status],
	L.[LOT_SOURCE_REF]			AS [SourceRef],
	L.[LOT_SOURCE_SUP]			AS [SourceSup],
	L.[LOT_COST_EACH]			AS [CostEach],
	L.[LOT_EXPIRY_DATE]			AS [ExpireyDate],
	L.[LOT_SUPP_REF]			AS [SuppRef],
	L.[LOT_PREV_WH]				AS [PrevWarehouse],
	B1.[WarehouseDescription]	AS [PrevWarehouseDescription],
	L.[LOT_PREV_BIN_ONLY]		AS [PrevBin],
	B1.[BinDescription]			AS [PrevBinDescrption],
	L.[LOT_BATCH_NO]			AS [BatchNo],
	L.[LOT_ORIG_SOURCE_REF]		AS [OriginalSourceRef],
	L.[LOT_SOURCE_UNIQUE] 
FROM
				[ASC_LIVE].[dbo].[ASC_LOT_TBL]	L WITH (NOLOCK)
LEFT OUTER JOIN	[vw_ASC_LIVE_Bins]				B	ON	L.[LOT_WH]				= B.[Warehouse]
													AND	L.[LOT_BIN_ONLY]		= B.[Bin]
LEFT OUTER JOIN	[vw_ASC_LIVE_Bins]				B1	ON	L.[LOT_PREV_WH]			= B1.[Warehouse]
													AND	L.[LOT_PREV_BIN_ONLY]	= B1.[Bin]
*/
SELECT 
	[LOT_UNIQUE] as [ID],
	[LOT_SOURCE_IND] as [SourceID],
	[LOT_CREATED] as [CreatedOn],
	--[LOT_UPDATED] as [ModifiedOn],
	[LOT_UPDATED] as [UpdatedOn],
	[LOT_PART_ONLY] COLLATE Latin1_General_CI_AS as [Part],
	[LOT_PART_REV] COLLATE Latin1_General_CI_AS as [PartRev],
	[LOT_WH] COLLATE Latin1_General_CI_AS as [Warehouse],
	[LOT_BIN_ONLY] COLLATE Latin1_General_CI_AS as [Bin],
	[LOT_TYPE] as [Type],
	[LOT_NUM] as [Number],
	[LOT_SUB] as [Sequence],
	--[LOT_PHYSICAL] as [Physical],
	[LOT_PHYSICAL] as [Quantity],
	[LOT_KIT_ALLOCATIONS] as [KitAllocations],
	--[LOT_CUST_ALLOCS] as [CustomerAllocations],
	[LOT_CUST_ALLOCS] as [QtyAllocated],
	--[LOT_ALLOC_TO] as [AllocatedTo],
	[LOT_ALLOC_TO] COLLATE Latin1_General_CI_AS as [QtyAllocatedTo],
	[LOT_SERIAL_NO] COLLATE Latin1_General_CI_AS as [SerialNo],
	[LOT_DESC] COLLATE Latin1_General_CI_AS as [Description],
	[LOT_STATUS] COLLATE Latin1_General_CI_AS as [Status],
	[LOT_SOURCE_REF] COLLATE Latin1_General_CI_AS as [SourceRef],
	[LOT_SOURCE_SUP] COLLATE Latin1_General_CI_AS as [SourceSup],
	[LOT_COST_EACH] as [CostEach],
	[LOT_COST_STAT] COLLATE Latin1_General_CI_AS as [CostStat],
	[LOT_EXPIRY_DATE] as [ExpiryDate],
	--[LOT_EXPIRY_DATE] as [ExpireyDate],
	[LOT_LAB_COST_EACH] as [LabCostEach],
	[LOT_ASSIGNED] COLLATE Latin1_General_CI_AS as [Assigned],
	[LOT_VALID_FLAG] COLLATE Latin1_General_CI_AS as [ValidFlag],
	[LOT_ALLOC_TO_SUB] as [AllocationToSub],
	[LOT_OHD_COST_EA] as [OHDCostEach],
	[LOT_OTHER_COST_EA] as [OtherCostEach],
	[LOT_PRIORITY] COLLATE Latin1_General_CI_AS as [Priority],
	[LOT_SUPP_REF] COLLATE Latin1_General_CI_AS as [SupplierRef],
	--[LOT_PREV_WH] as [PreviousWarehouse],
	[LOT_PREV_WH] COLLATE Latin1_General_CI_AS as [PrevWarehouse],
	--[LOT_PREV_BIN_ONLY] as [PreviousBin],
	[LOT_PREV_BIN_ONLY] COLLATE Latin1_General_CI_AS as [PrevBin],
	[LOT_SPCK_NUMBER] as [PicknoteNo],
	[LOT_BATCH_NO] COLLATE Latin1_General_CI_AS as [BatchNo],
	[LOT_LND_COST_1] as [LndCost1],
	[LOT_LND_COST_2] as [LndCost2],
	[LOT_REGRADED_FROM_PART_ONLY] COLLATE Latin1_General_CI_AS as [RegradedFromPart],
	[LOT_REGRADED_FROM_PART_REV] COLLATE Latin1_General_CI_AS as [RegradedFromPartRev],
	[LOT_REGRADED] COLLATE Latin1_General_CI_AS as [Regraded],
	[LOT_BOX_NUMBER] COLLATE Latin1_General_CI_AS as [BoxNo],
	[LOT_DUE_IN_QTY] as [DueInQty],
	[LOT_SEC_QTY] as [SecQty],
	[LOT_ORIG_SOURCE_REF] COLLATE Latin1_General_CI_AS as [OriginalSourceRef],
	[LOT_PALLET_REF] COLLATE Latin1_General_CI_AS as [PalletRef],
	[LOT_SOURCE_UNIQUE] as [SourceUnique],
	[LOT_CONDITION] COLLATE Latin1_General_CI_AS as [Condition],
	[LOT_OTHER_TYPE] as [OtherType]
FROM 
	[ASC_LIVE].[dbo].[ASC_LOT_TBL]	WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_CustomerStock_Levels]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_ASC_LIVE_Rep_CustomerStock_Levels] as
SELECT
	P.[Part],
	P.[Drawing],
	P.[Description1] + CASE ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END AS [Description],
	P.[UoM],
	P.[PhysicalStockLevel]								AS [StockPhysical],
	(P.[PhysicalStockLevel] - P.[StockAllocatedOnSOs])	AS [FreeStock],
	L.[Warehouse] AS [Warehouse],
	L.[Quantity],
	L.[SerialNo],
	ISNULL(convert(date,P.[LastIssued]),'') as [LastUsed],
	ISNULL(A.[AnalysisCode],'') AS [AnalysisCode]
FROM
				[vw_ASC_LIVE_Parts]				P
LEFT OUTER JOIN	[vw_ASC_LIVE_Lots]				L	ON	P.[Part]			= L.[Part]
LEFT OUTER JOIN	[vw_ASC_LIVE_AnalysisCodes]	A		ON	P.[Analysis3]	= A.[AnalysisCode]
													AND	A.[LabelCode]		= '3'
													AND A.[TypeCode]		= 'I'
WHERE
	P.[PhysicalStockLevel] > 0
AND LEFT(P.[Part],1) <> 'E'
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_UoMs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_UoMs] as
SELECT 
	U.[UOM_UNIQUE]			AS [ID],
	U.[UOM_SOURCE_IND]		AS [SourceID],
	U.[UOM_CREATED]			AS [CreatedOn],
	U.[UOM_UPDATED]			AS [ModifiedOn],
	U.[UOM_CUS]			COLLATE Latin1_General_CI_AS	AS [Customer],
	U.[UOM_PART_ONLY]	COLLATE Latin1_General_CI_AS	AS [Part],
	U.[UOM_PART_REV]	COLLATE Latin1_General_CI_AS	AS [PartRev],
	U.[UOM_FROM]		COLLATE Latin1_General_CI_AS	AS [From],
	U.[UOM_TO]			COLLATE Latin1_General_CI_AS	AS [To],
	U.[UOM_OPERATOR]	COLLATE Latin1_General_CI_AS	AS [Operator],
	U.[UOM_FACTOR]			AS [Factor]
FROM
	[ASC_LIVE].[dbo].[ASC_UOM_TBL] U WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Deliveries]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_Deliveries] as
SELECT 
	D.[DVY_UNIQUE]		AS [ID],
	D.[DVY_SOURCE_IND]	AS [SourceID],
	D.[DVY_CREATED]		AS [CreatedOn],
	D.[DVY_UPDATED]		AS [ModifiedOn],
	D.[DVY_VOUCHER]		AS [VoucherNo],
	D.[DVY_NO]			AS [DeliveryNo],
	D.[DVY_PO_NUM]		COLLATE Latin1_General_CI_AS AS [PONum],
	D.[DVY_ORDER_HEAD]	COLLATE Latin1_General_CI_AS AS [OrderHead],
	D.[DVY_PART_ONLY]	COLLATE Latin1_General_CI_AS AS [Part],
	D.[DVY_PART_REV]	COLLATE Latin1_General_CI_AS AS [PartRev],
	D.[DVY_ORDER_SUB]	AS [Sequence],
	D.[DVY_STATUS]		COLLATE Latin1_General_CI_AS AS [Status],
	D.[DVY_SUP]			COLLATE Latin1_General_CI_AS AS [Supplier],
	D.[DVY_DATE]		AS [Date],
	D.[DVY_TRANS_TYPE]	COLLATE Latin1_General_CI_AS AS [TransactionType],
	D.[DVY_QTY]			AS [Quantity],
	D.[DVY_PERIOD_CC]	AS [PeriodCentury],
	D.[DVY_PERIOD_YY]	AS [PeriodYear],
	D.[DVY_PERIOD_MM]	AS [PeriodMonth],
	D.[DVY_JOB]			COLLATE Latin1_General_CI_AS AS [Job],
	D.[DVY_SUP_REF]		COLLATE Latin1_General_CI_AS AS [SupplierRef],
	D.[DVY_VALUE]		AS [Value],
	D.[DVY_PO_TYPE]		COLLATE Latin1_General_CI_AS AS [POType],
	D.[DVY_CODE]		COLLATE Latin1_General_CI_AS AS [Code],
	D.[DVY_RECEIPT_TYPE] COLLATE Latin1_General_CI_AS	AS [ReceiptType],
	D.[DVY_DAYS_LATE]	AS [DaysLate],
	D.[DVY_DEL_NOTE]	COLLATE Latin1_General_CI_AS AS [Note],
	D.[DVY_PID_NUMBER]	AS [PIDNumber],
	D.[DVY_PID_NO]		AS [PIDNo],
	D.[DVY_QTY_INVOICED]	AS [QuantityInvoiced],
	D.[DVY_UOO]			COLLATE Latin1_General_CI_AS AS [UoO],
	D.[DVY_UOO_QTY]		AS [UoOQuantity],
	D.[DVY_HIS_UNIQUE]	AS [HISUnique],
	D.[DVY_NL_YEAR_N]	AS [NLYearN],
	D.[DVY_NL_YEAR_A]	COLLATE Latin1_General_CI_AS AS [NLYearA],
	D.[DVY_NL_PERIOD]	AS [NLPeriod],
	D.[DVY_COMMENTS]	COLLATE Latin1_General_CI_AS AS [Comments],
	D.[DVY_SUP_QTY]		AS [SupplierQuantity],
	D.[DVY_CALC_WEIGHT]	AS [CalculatedWeight],
	D.[DVY_ACT_WEIGHT]	AS [ActualWeight],
	D.[DVY_ACT_WEIGHT_UOM]	COLLATE Latin1_General_CI_AS AS [ActualWeightUoM],
	D.[DVY_PACKAGE_ID1]	COLLATE Latin1_General_CI_AS AS [PackageID1],
	D.[DVY_PACKAGE_ID2]	COLLATE Latin1_General_CI_AS AS [PackageID2],
	D.[DVY_HAULIER]		COLLATE Latin1_General_CI_AS AS [Haulier],
	D.[DVY_TEMPERATURE]	AS [Temperature],
	D.[DVY_SEAL_NO]		COLLATE Latin1_General_CI_AS AS [SealNo],
	D.[DVY_PARENT_NO]	AS [ParentNo],
	D.[DVY_NO_INVOICE_REQ]	AS [NoInvoiceReq],
	D.[DVY_SEC_QTY]		AS [SecQty],
	D.[DVY_RECEIPT_NO]	AS [ReceiptNo]
FROM
	[asc_LIVE].[dbo].[ASC_DVY_TBL] D WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_ShippingDetails]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_ShippingDetails] as
select 
	[PSMD_UNIQUE]			AS [ID],
	[PSMD_SOURCE_IND]		AS [SourceID],
	[PSMD_CREATED]			AS [CreatedOn],
	[PSMD_UPDATED]			AS [ModifiedOn],
	[PSMD_SHPM_NUMBER]		AS [ShippingNo],
	[PSMD_POR_NUMBER]	COLLATE Latin1_General_CI_AS	AS [PONum],
	[PSMD_POR_HEAD]		COLLATE Latin1_General_CI_AS	AS [POHead],
	[PSMD_POR_PART_ONLY] COLLATE Latin1_General_CI_AS	AS [Part],
	[PSMD_POR_PART_REV]	COLLATE Latin1_General_CI_AS	AS [PartRev],
	[PSMD_POR_SUB]			AS [Sequence]
FROM
	[ASC_LIVE].[dbo].[ASC_PO_SHIPMENT_DET] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_ShippingHeaders]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_ShippingHeaders] as
select 
	[PSMH_UNIQUE]			AS [ID],
	[PSMH_SOURCE_IND]		AS [SourceID],
	[PSMH_CREATED]			AS [CreatedOn],
	[PSMH_UPDATED]			AS [ModifiedOn],
	[PSMH_SHPM_NUMBER]		AS [ShippingNo],
	[PSMH_VESSEL_NAME]	COLLATE Latin1_General_CI_AS	AS [VesselName],
	[PSMH_CONTAINER_ID]	COLLATE Latin1_General_CI_AS	AS [ContainerID],
	[PSMH_AIRWAY_BILL_NO] COLLATE Latin1_General_CI_AS	AS [AirwayBillNo],
	[PSMH_BILL_OF_LADING] COLLATE Latin1_General_CI_AS	AS [BillOfLading],
	[PSMH_FROM_PORT]	COLLATE Latin1_General_CI_AS	AS [FromPort],
	[PSMH_TO_PORT]		COLLATE Latin1_General_CI_AS	AS [ToPort],			
	[PSMH_SUP_CODE_1]	COLLATE Latin1_General_CI_AS	AS [SupplierCode1],
	[PSMH_SUP_CODE_2]	COLLATE Latin1_General_CI_AS	AS [SupplierCode2],
	[PSMH_SUP_CODE_3]	COLLATE Latin1_General_CI_AS	AS [SuppluerCode3],
	[PSMH_DEPARTURE_DATE]	AS [DepatureDate],
	[PSMH_ETA_DATE]			AS [ETADate],
	[PSMH_ARRIVAL_DATE]		AS [ArrivalDate],
	[PSMH_DEMURRAGE_DATE]	AS [DemurrageDate],
	[PSMH_TRACK_REF]	COLLATE Latin1_General_CI_AS	AS [TrackRef],
	[PSMH_COMMENTS_1]	COLLATE Latin1_General_CI_AS	AS [Comments1],
	[PSMH_COMMENTS_2]	COLLATE Latin1_General_CI_AS	AS [Comments2],
	[PSMH_ANAL_FIELD_1]	COLLATE Latin1_General_CI_AS	AS [AnalysisField1],
	[PSMH_ANAL_FIELD_2]	COLLATE Latin1_General_CI_AS	AS [AnalysisField2],
	[PSMH_ANAL_FIELD_3]	COLLATE Latin1_General_CI_AS	AS [AnalysisField3],
	[PSMH_ANAL_FIELD_4]	COLLATE Latin1_General_CI_AS	AS [AnalysisField4],
	[PSMH_ANAL_FIELD_5]	COLLATE Latin1_General_CI_AS	AS [AnalysisField5],
	[PSMH_ANAL_FIELD_6]	COLLATE Latin1_General_CI_AS	AS [AnalysisField6],
	[PSMH_ANAL_FIELD_7]	COLLATE Latin1_General_CI_AS	AS [AnalysisField7],
	[PSMH_ANAL_FIELD_8]	COLLATE Latin1_General_CI_AS	AS [AnalysisField8],
	[PSMH_ANAL_FIELD_9]	COLLATE Latin1_General_CI_AS	AS [AnalysisField9],
	[PSMH_ANAL_FIELD_10] COLLATE Latin1_General_CI_AS	AS [AnalysisField10]
FROM
	[ASC_LIVE].[dbo].[ASC_PO_SHIPMENT_HDR] WITH (NOLOCK)

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_ExtraText]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_ExtraText] as
SELECT 
	[EXT_UNIQUE]			AS [ID],
    [EXT_SOURCE_IND]		AS [SourceID],
    [EXT_CREATED]			AS [CreatedOn],
    [EXT_UPDATED]			AS [ModifiedOn],
    [EXT_KEY_TYPE]		COLLATE Latin1_General_CI_AS	AS [KeyType],
    [EXT_FILE_REF]		COLLATE Latin1_General_CI_AS	AS [FileRef],
    [EXT_ITEM]			COLLATE Latin1_General_CI_AS	AS [Item],
    [EXT_ITEM_ROUTE]	COLLATE Latin1_General_CI_AS	AS [ItemRoute],
    [EXT_ITEM_2]		COLLATE Latin1_General_CI_AS	AS [Item2],
    [EXT_ITEM_3]		COLLATE Latin1_General_CI_AS	AS [Item3],
    [EXT_ITEM_4]		COLLATE Latin1_General_CI_AS	AS [Item4],
    [EXT_ITEM_5]		COLLATE Latin1_General_CI_AS	AS [Item5],
    [EXT_ITEM_6]		COLLATE Latin1_General_CI_AS	AS [Item6],
    [EXT_NUMBER]			AS [Number],
    [EXT_TEXT]			COLLATE Latin1_General_CI_AS	AS [Text],
    [EXT_ACTION_FLAG_1]	COLLATE Latin1_General_CI_AS	AS [ActionFlag1],
    [EXT_ACTION_FLAG_2]	COLLATE Latin1_General_CI_AS	AS [ActionFlag2],
	[EXT_ACTION_FLAG_3]	COLLATE Latin1_General_CI_AS	AS [ActionFlag3],
	[EXT_ACTION_FLAG_4]	COLLATE Latin1_General_CI_AS	AS [ActionFlag4],
	[EXT_ACTION_FLAG_5]	COLLATE Latin1_General_CI_AS	AS [ActionFlag5],
	[EXT_ACTION_FLAG_6]	COLLATE Latin1_General_CI_AS	AS [ActionFlag6],
	[EXT_ACTION_FLAG_7]	COLLATE Latin1_General_CI_AS	AS [ActionFlag7],
	[EXT_ACTION_FLAG_8]	COLLATE Latin1_General_CI_AS	AS [ActionFlag8],
	[EXT_ACTION_FLAG_9]	COLLATE Latin1_General_CI_AS	AS [ActionFlag9],
	[EXT_ACTION_FLAG_10] COLLATE Latin1_General_CI_AS	AS [ActionFlag10],
	[EXT_ACTION_FLAG_11] COLLATE Latin1_General_CI_AS	AS [ActionFlag11],
	[EXT_ACTION_FLAG_12] COLLATE Latin1_General_CI_AS	AS [ActionFlag12],
	[EXT_ACTION_FLAG_13] COLLATE Latin1_General_CI_AS	AS [ActionFlag13],
	[EXT_ACTION_FLAG_14] COLLATE Latin1_General_CI_AS	AS [ActionFlag14],
	[EXT_ACTION_FLAG_15] COLLATE Latin1_General_CI_AS	AS [ActionFlag15]	
FROM 
	[ASC_LIVE].[dbo].[ASC_EXT_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_PurchaseOrders]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_ASC_LIVE_Rep_PurchaseOrders] as
SELECT 
	CASE (select COUNT([ID]) from [vw_ASC_LIVE_ExtraText] where [KeyType] = 'PO' and [FileRef] = P.[OrderNumber] )
		WHEN 0 THEN 'No'
		ELSE 'Yes'
	END						AS [HeaderText],
	P.[OrderNumber],
	P.[Supplier]			AS [SupplierCode],
	S.[Name]				AS [SupplierName],
	P.[OrderDate],
	P.[Name]				AS [BuyerCode],
	SC.[SystemDescription]	AS [BuyerName],
	P.[Confirmation],
	P.[Currency],
	P.[TypeCode]			AS [OrderType],
	P.[Type]				AS [SubcontractItem],
	CASE (select COUNT([ID]) from [vw_ASC_LIVE_ExtraText] where [KeyType] = 'PO' AND [FileRef] = P.[OrderNumber] AND [Item] = P.[Part])
		WHEN 0 THEN 'No'
		ELSE 'Yes'
	END						AS [LineText],
	CASE (select COUNT([ID]) from [vw_ASC_LIVE_ExtraText] where [KeyType] = 'IT' AND [FileRef] = P.[Part])
		WHEN 0 THEN 'No'
		ELSE 'Yes'
	END						AS [ItemText],
	P.[Part],
	P.[PartRev]				AS [Revision],
	CASE P.[Status]
		WHEN 'C' THEN 0
		ELSE P.[QuantityOrdered] - P.[QuantityDelivered]
	END						AS [QuantityOutstanding(UoM)],
	P.[SupplierPart],
	P.[Comments1]			AS [Description1],
	P.[Comments2]			AS [Description2],
	Pa.[UoM],
	P.[QuantityOrdered]		AS [QuantityOrdered(UoM)],
	P.[QuantityDelivered]	AS [QuantityDelivered(UoM)],
	P.[QuantityRejected]	AS [QuantityRejected(UoM)],
	P.[QuantityInvoiced]	AS [QuantityInvoiced(UoM)],
	Pa.[UoO],
	CONVERT(DECIMAL(15,5),CASE P.[Status]
		WHEN 'C' THEN 0
		ELSE ROUND(	CASE 
						WHEN NOT U3.[Operator] IS NULL THEN
							CASE U3.[Operator]
								WHEN '*' THEN	(P.[QuantityOrdered] - P.[QuantityDelivered]) * U3.[Factor]
								ELSE			(P.[QuantityOrdered] - P.[QuantityDelivered]) / U3.[Factor]
							END
						WHEN NOT U2.[Operator] IS NULL THEN
							CASE U2.[Operator]
								WHEN '*' THEN	(P.[QuantityOrdered] - P.[QuantityDelivered]) * U2.[Factor]
								ELSE			(P.[QuantityOrdered] - P.[QuantityDelivered]) / U2.[Factor]
							END
						WHEN NOT U1.[Operator] IS NULL THEN
							CASE U1.[Operator]
								WHEN '*' THEN	(P.[QuantityOrdered] - P.[QuantityDelivered]) * U1.[Factor]
								ELSE			(P.[QuantityOrdered] - P.[QuantityDelivered]) / U1.[Factor]
							END
						WHEN NOT U0.[Operator] IS NULL THEN
							CASE U0.[Operator]
								WHEN '*' THEN	(P.[QuantityOrdered] - P.[QuantityDelivered]) * U0.[Factor]
								ELSE			(P.[QuantityOrdered] - P.[QuantityDelivered]) / U0.[Factor]
							END
						ELSE
							P.[QuantityOrdered] - P.[QuantityDelivered]
					End,5)

	END)						AS [QuantityOutstanding(UoO)],
	CONVERT(DECIMAL(15,5),ROUND(CASE 
		WHEN NOT U3.[Operator] IS NULL THEN
			CASE U3.[Operator]
				WHEN '*' THEN	P.[QuantityOrdered] * U3.[Factor]
				ELSE			P.[QuantityOrdered] / U3.[Factor]
			END
		WHEN NOT U2.[Operator] IS NULL THEN
			CASE U2.[Operator]
				WHEN '*' THEN	P.[QuantityOrdered] * U2.[Factor]
				ELSE			P.[QuantityOrdered] / U2.[Factor]
			END
		WHEN NOT U1.[Operator] IS NULL THEN
			CASE U1.[Operator]
				WHEN '*' THEN	P.[QuantityOrdered] * U1.[Factor]
				ELSE			P.[QuantityOrdered] / U1.[Factor]
			END
		WHEN NOT U0.[Operator] IS NULL THEN
			CASE U0.[Operator]
				WHEN '*' THEN	P.[QuantityOrdered] * U0.[Factor]
				ELSE			P.[QuantityOrdered] / U0.[Factor]
			END
		ELSE
			P.[QuantityOrdered]
	End,5))						AS [QuantityOrdered(UoO)],
	CONVERT(DECIMAL(15,5),ROUND(CASE 
		WHEN NOT U3.[Operator] IS NULL THEN
			CASE U3.[Operator]
				WHEN '*' THEN	P.[QuantityDelivered] * U3.[Factor]
				ELSE			P.[QuantityDelivered] / U3.[Factor]
			END
		WHEN NOT U2.[Operator] IS NULL THEN
			CASE U2.[Operator]
				WHEN '*' THEN	P.[QuantityDelivered] * U2.[Factor]
				ELSE			P.[QuantityDelivered] / U2.[Factor]
			END
		WHEN NOT U1.[Operator] IS NULL THEN
			CASE U1.[Operator]
				WHEN '*' THEN	P.[QuantityDelivered] * U1.[Factor]
				ELSE			P.[QuantityDelivered] / U1.[Factor]
			END
		WHEN NOT U0.[Operator] IS NULL THEN
			CASE U0.[Operator]
				WHEN '*' THEN	P.[QuantityDelivered] * U0.[Factor]
				ELSE			P.[QuantityDelivered] / U0.[Factor]
			END
		ELSE
			P.[QuantityDelivered]
	End,5))						AS [QuantityDelivered(UoO)],
	CONVERT(DECIMAL(15,5),ROUND(CASE 
		WHEN NOT U3.[Operator] IS NULL THEN
			CASE U3.[Operator]
				WHEN '*' THEN	P.[QuantityRejected] * U3.[Factor]
				ELSE			P.[QuantityRejected] / U3.[Factor]
			END
		WHEN NOT U2.[Operator] IS NULL THEN
			CASE U2.[Operator]
				WHEN '*' THEN	P.[QuantityRejected] * U2.[Factor]
				ELSE			P.[QuantityRejected] / U2.[Factor]
			END
		WHEN NOT U1.[Operator] IS NULL THEN
			CASE U1.[Operator]
				WHEN '*' THEN	P.[QuantityRejected] * U1.[Factor]
				ELSE			P.[QuantityRejected] / U1.[Factor]
			END
		WHEN NOT U0.[Operator] IS NULL THEN
			CASE U0.[Operator]
				WHEN '*' THEN	P.[QuantityRejected] * U0.[Factor]
				ELSE			P.[QuantityRejected] / U0.[Factor]
			END
		ELSE
			P.[QuantityRejected]
	End,5))						AS [QuantityRejected(UoO)],
	CONVERT(DECIMAL(15,5),ROUND(CASE 
		WHEN NOT U3.[Operator] IS NULL THEN
			CASE U3.[Operator]
				WHEN '*' THEN	P.[QuantityInvoiced] * U3.[Factor]
				ELSE			P.[QuantityInvoiced] / U3.[Factor]
			END
		WHEN NOT U2.[Operator] IS NULL THEN
			CASE U2.[Operator]
				WHEN '*' THEN	P.[QuantityInvoiced] * U2.[Factor]
				ELSE			P.[QuantityInvoiced] / U2.[Factor]
			END
		WHEN NOT U1.[Operator] IS NULL THEN
			CASE U1.[Operator]
				WHEN '*' THEN	P.[QuantityInvoiced] * U1.[Factor]
				ELSE			P.[QuantityInvoiced] / U1.[Factor]
			END
		WHEN NOT U0.[Operator] IS NULL THEN
			CASE U0.[Operator]
				WHEN '*' THEN	P.[QuantityInvoiced] * U0.[Factor]
				ELSE			P.[QuantityInvoiced] / U0.[Factor]
			END
		ELSE
			P.[QuantityInvoiced]
	End,5))						AS [QuantityInvoiced(UoO)],
	P.[Value]					AS [Cost],
	P.[Per]						AS [PricePer],
	P.[DueDate],
	P.[SupDueDate]				AS [AcknowledgedDueDate],
	D.[Date]					AS [DeliveryDate],
	D.[Note]					AS [DeliveryReference],
	DATEDIFF(DAY,CONVERT(DATE,sysdatetime()),CASE 
												WHEN P.[SupDueDate] IS NULL THEN P.[DueDate]
												ELSE P.[SupDueDate] 
											END) AS [Days],
	P.[Printed],
	P.[TaxCode],
	P.[FornPricePer],
	P.[FornPricePerPer],
	CASE P.[status]
		WHEN ' ' THEN 'R'
		ELSE P.[Status]
	END							AS [Status],
	P.[JobNumber]				AS [JobWO],
	P.[AnalysisField1]			AS [Analysis1],
	P.[AnalysisField2]			AS [Analysis2],
	P.[AnalysisField3]			AS [Analysis3],
	P.[AnalysisField4]			AS [Analysis4],
	P.[AnalysisField4]			AS [Analysis5],
	P.[AnalysisField6]			AS [Analysis6],
	P.[AnalysisField7]			AS [Analysis7],
	P.[AnalysisField8]			AS [Analysis8],
	P.[AnalysisField9]			AS [Analysis9],
	P.[AnalysisField10]			AS [Analysis10],
	P.[Account],
	P.[Project],
	P.[CostCentre],
	SD.[ShippingNo]				AS [ShipmentNumber],
	SH.[ContainerID]			AS [ContainerID]
FROM 
				[vw_ASC_LIVE_PurchaseOrders]	P
LEFT OUTER JOIN	[vw_ASC_LIVE_Suppliers1]		S	ON	P.[Supplier]	= S.[Code] COLLATE Latin1_General_CI_AS
LEFT OUTER JOIN [vw_ASC_LIVE_SystemCodes]		SC	ON	SC.[TypeCode]	= 'H'
													AND P.[Name]		= SC.[SystemCode]
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]				Pa	ON	P.[Part]		= Pa.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_UoMs]				U3	ON	U3.[From]		= Pa.[UoM]
													AND U3.[To]			= Pa.[UoO]
													AND U3.[Part]		= Pa.[Part]
													AND U3.[Customer]	= P.[Supplier]
LEFT OUTER JOIN [vw_ASC_LIVE_UoMs]				U2	ON	U2.[From]		= Pa.[UoM]
													AND U2.[To]			= Pa.[UoO]
													AND U2.[Part]		= Pa.[Part]
													AND U2.[Customer]	= ''
LEFT OUTER JOIN [vw_ASC_LIVE_UoMs]				U1	ON	U1.[From]		= Pa.[UoM]
													AND U1.[To]			= Pa.[UoO]
													AND U1.[Part]		= ''
													AND U1.[Customer]	= P.[Supplier]
LEFT OUTER JOIN [vw_ASC_LIVE_UoMs]				U0	ON	U0.[From]		= Pa.[UoM]
													AND U0.[To]			= Pa.[UoO]
													AND U1.[Part]		= ''
													AND U2.[Customer]	= ''
LEFT OUTER JOIN (SELECT
					D.[PONum],
					D.[Part],
					D.[TransactionType],
					D.[Date],
					D.[Note]
				FROM
					[vw_ASC_LIVE_Deliveries] D
				WHERE
					D.[ID] IN (SELECT	
									Min(D.[ID])
								FROM 
									[vw_ASC_LIVE_Deliveries] D
								GROUP BY
									D.[PONum],
									D.[Part],
									D.[TransactionType]))
												D	ON	P.[OrderNumber]	= D.[PONum]
													AND	P.[Part]		= D.[Part]
													AND D.[TransactionType]	='RE'
LEFT OUTER JOIN [vw_ASC_LIVE_ShippingDetails]	SD	ON	P.[OrderNumber]	= SD.PONum
													AND	P.[Part]		= SD.[Part]
LEFT OUTER JOIN	[vw_ASC_LIVE_ShippingHeaders]	SH	ON	SD.[ShippingNo]	= SH.[ShippingNo]



GO
/****** Object:  View [dbo].[vw_HICS_Rep_PPM_CompletedJobsByMonth]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_HICS_Rep_PPM_CompletedJobsByMonth] as 
SELECT 
	T2.[Due],
	T2.[MachineName],
	T2.[JobName],
	CONVERT(DECIMAL(10,2),CONVERT(DECIMAL(10,5),T2.[OnTime]) / CONVERT(DECIMAL(10,5),T2.[Jobs])) AS [OnTarget],
	T2.[MachineGroupID]
FROM
	(SELECT 
		T1.[Due],
		T1.[MachineName],
		T1.[JobName],
		COUNT(T1.[OnTime]) AS [Jobs],
		SUM(T1.[OnTime]) AS [OnTime],
		T1.[MachineGroupID]
	FROM
		(SELECT
			DATEADD(d,-(DAY(CJ.[Due])-1),CJ.[Due]) AS [Due],
			CASE 
				WHEN DATEDIFF(dd,CJ.[Due],CJ.[Closed]) > 0 THEN 0
				ELSE 1
			END																			AS [OnTime],
			M.[Name]																	AS [MachineName],
			J.[Name]																	AS [JobName],
			M.[LnkGroupID]																AS [MachineGroupID]
		FROM
						[Tb_PPM_CompletedJobs]	CJ
		LEFT OUTER JOIN	[Tb_PPM_Jobs]			J	ON	CJ.[LnkJobID]		=	J.[ID]
		LEFT OUTER JOIN	[Tb_PPM_Machines]		M	ON	J.[LnkMachineID]	=	M.[ID]
		WHERE
			CJ.[Closed] >= CONVERT(DATE,DATEADD(YYYY,-3,SYSDATETIME()))) T1
	GROUP BY 
		T1.[Due],
		T1.[MachineName],
		T1.[JobName],
		T1.[MachineGroupID]) T2
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_CustomerStock_KitShortage]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_Rep_CustomerStock_KitShortage] as
SELECT 
	K.[WONo],
	K.[WODueDate],
	P2.[Part],
	P2.[Description1] + CASE ISNULL(P2.[Description2],'') WHEN '' THEN '' ELSE ' ' + P2.[Description2] END AS [Description],
	P2.[Analysis3]						AS [PartVariant],
	P.[Part]							AS [ParentPart],
	P.[Description1] + CASE ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END AS [ParentDescription],
(K.[Qty] - K.[QtyKitted]) +
	(K.[Qty] - K.[QtyKitted]) * 
	CASE LEFT(K.[Part],1) 
		WHEN 'G' THEN 0.05 
		WHEN 'L' THEN 0.10 
		WHEN 'P' THEN 0.05 
		ELSE 0 
	END									AS [QtyNeeded],
	ISNULL(NQ.[QtyNotQuarantined],0)	AS [Physical],
	P2.[StockOnPOs] + P2.[StockOnWOs]	AS [DueIn]
FROM
				[vw_ASC_LIVE_Parts]				P
LEFT OUTER JOIN [vw_ASC_LIVE_Kit]				K	ON	P.[Part]			= K.[ParentPart]
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]				P2	ON	K.[Part]			= P2.[Part]
LEFT OUTER JOIN	(SELECT     
					L.[Part], 
					SUM(L.[Quantity])	AS [QtyNotQuarantined]
				FROM         
							[vw_ASC_LIVE_Lots]			L
				INNER JOIN	[vw_ASC_LIVE_SystemCodes] 	S	ON	S.[SystemCode] = L.[Warehouse]
				WHERE
					S.[EUMemberState] <> 'Y'
				AND S.[TypeCode] = 'W'
				GROUP BY 
					L.[part])					NQ	ON	NQ.[Part]			= P2.[Part]
WHERE
	LEFT(K.[WONo],8)	<> '** TRIAL'
AND	K.[Status]			<> 'M'
AND K.[ShortMark]		<> 'C'
AND CONVERT(DATE,K.[WODueDate]) >= CONVERT(DATE,DATEADD(d,-7,getdate()))
AND CONVERT(DATE,K.[WODueDate]) <= CONVERT(DATE,DATEADD(m,1,getdate()))
AND P2.[ProcurementCode] = 'O'
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_CustomerStock_Sub1_NotQ]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_Rep_CustomerStock_Sub1_NotQ] as
SELECT     
	L.[Part],
	S.[SystemCode], 
	SUM(L.[Quantity])	AS [QtyNotQuarantined]
FROM         
			[vw_ASC_LIVE_Lots]			L
INNER JOIN	[vw_ASC_LIVE_SystemCodes]	S	ON	S.[SystemCode] = L.[Warehouse]
WHERE
	S.[EUMemberState] <> 'Y'
AND S.[TypeCode] = 'W'
GROUP BY 
	L.[Part],
	S.[SystemCode]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_CustomerStock_Sub1_InQ]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_Rep_CustomerStock_Sub1_InQ] as
SELECT     
	L.[Part],
	S.[SystemCode], 
	SUM(L.[Quantity])	AS [QtyQuarantined]
FROM         
			[vw_ASC_LIVE_Lots]			L
INNER JOIN	[vw_ASC_LIVE_SystemCodes]	S	ON	S.[SystemCode] = L.[Warehouse]
WHERE
	S.[EUMemberState] = 'Y'
AND S.[TypeCode] = 'W'
GROUP BY 
	L.[Part],
	S.[SystemCode]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_ChivasStock]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_ASC_LIVE_Rep_ChivasStock] AS
SELECT 
	P.[Part]				AS [HaymanPart],
	P.[Drawing]				AS [ChivasPart],
	P.[PhysicalStockLevel]	AS [QtyCases],
	CASE 
		WHEN L.[Warehouse] IN ('RQ', 'WQ') THEN L.[Quantity]
		ELSE 0
	END						AS [Q-Flag],
	L.[Number]				AS [LotNumber],
	L.[SerialNo]			AS [SerialNo],
	P.[PhysicalStockLevel] -
	CASE 
		WHEN L.[Warehouse] IN ('RQ', 'WQ') THEN L.[Quantity]
		ELSE 0
	END					AS [FreeStock]
FROM 
				[vw_ASC_LIVE_Parts]	P
LEFT OUTER JOIN	[vw_ASC_LIVE_Lots]	L	ON	P.[Part] = L.[Part]
WHERE
	P.[Analysis3]			= '309'
AND	P.[ProcurementCode]		<> '0'
AND LEFT(P.[Part],1)		<> 'E'
AND NOT P.[Part]			IN ('F201091', 'P800832', 'P800617', 'P800774', 'L700269', 'L700242', 'R201090', 'P800276', 'P800265', 'P800348')
AND P.[PhysicalStockLevel]	<> 0
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_PartShortage]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_Rep_PartShortage] AS
SELECT 
	KIT.[WONo]												AS [WONumber],
	P.[Part]												AS [Part],
	P.[Description1] + CASE ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END AS [PartDesc],
	PP.[Part]												AS [ParentPart],
	PP.[Description1] + CASE ISNULL(PP.[Description2],'') WHEN '' THEN '' ELSE ' ' + PP.[Description2] END AS [ParentPartDesc],
	CAN.[AnalysisCode]										AS [ParentPartVariantCode],
	CAN.[AnalysisDescription]								AS [ParentPartVariantDescription],
	KIT.[WODueDate]											AS [DueDate],
	DATEDIFF(D,SYSDATETIME(),KIT.[WODueDate])				AS [DaysUntilDue],
	P.[PhysicalStockLevel]									AS [PartQuantityAvailable],
	P.[StockOnPOs] + P.[StockOnWOs]							AS [PartQuantityDueIn],
	TOTALS.[QtyRequired]									AS [PartQuantityRequired],
	TOTALS.[QtyAllocated]									AS [PartQuantityAllocated],
	(TOTALS.[QtyRequired] - TOTALS.[QtyAllocated])			AS [PartQuantityRemaining],
	P.[PhysicalStockLevel] - (TOTALS.[QtyRequired] - TOTALS.[QtyAllocated]) AS [PartShortage],
	KIT.[Qty]												AS [WOPartQuantityRequired],
	KIT.[QtyKitted]											AS [WOPartQuantityAllocated],
	(KIT.[Qty] - KIT.[QtyKitted])							AS [WOPartQuantityRemaining]
FROM 
				[vw_ASC_LIVE_Kit]				KIT
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]				P		ON	P.[Part] = KIT.[Part]
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]				PP		ON	PP.[Part] = KIT.[ParentPart]
LEFT OUTER JOIN (SELECT 
					KIT.[Part]								AS [Part],
					SUM(KIT.[Qty])							AS [QtyRequired],
					SUM(KIT.[QtyKitted])					AS [QtyAllocated]
				FROM 
					[vw_ASC_LIVE_Kit] KIT
				WHERE
					LEFT(KIT.[WONo],8) <> '** TRIAL'
				AND KIT.[Status] <> 'M'
				AND	KIT.[ShortMark] <> 'C'
				AND DATEDIFF(D,SYSDATETIME(),KIT.[WODueDate]) <= 10
				AND (KIT.[Qty] - KIT.[QtyKitted]) > 0
				AND LEFT(KIT.[ParentPart],1) = 'F'
				GROUP BY
					KIT.[Part])		TOTALS		ON	TOTALS.[Part] = KIT.[Part]
LEFT OUTER JOIN	[vw_ASC_LIVE_AnalysisCodes]	CAN	ON	CAN.[TypeCode] = 'I'
												AND	CAN.[LabelCode] = 3
												AND CAN.[AnalysisCode] = PP.[Analysis3]
WHERE
	LEFT(KIT.[WONo],8) <> '** TRIAL'
AND KIT.[Status] <> 'M'
AND	KIT.[ShortMark] <> 'C'
AND DATEDIFF(D,SYSDATETIME(),KIT.[WODueDate]) <= 10
AND (KIT.[Qty] - KIT.[QtyKitted]) > 0
AND LEFT(KIT.[ParentPart],1) = 'F'
AND (P.[PhysicalStockLevel] - (TOTALS.[QtyRequired] - TOTALS.[QtyAllocated])) < 0
AND P.[ProcurementCode] = 'O'


GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_PartShortage_ParentVariants]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  view [dbo].[vw_ASC_LIVE_Rep_PartShortage_ParentVariants] AS
SELECT DISTINCT 
	[ParentPartVariantCode]				AS [Code],
	[ParentPartVariantDescription]		AS [Description]
FROM
	[vw_ASC_LIVE_Rep_PartShortage]



GO
/****** Object:  View [dbo].[vw_HICS_Rep_CustomQueryUsage]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vw_HICS_Rep_CustomQueryUsage] as
SELECT
	T2.[Query],
	T2.[First],
	T2.[Last],
	ISNULL((SELECT [Fullname] FROM [vw_HICS_Users] WHERE [ID] = T2.[LastBy]),'') AS [LastBy],
	DATEDIFF(d,T2.[First],SYSDATETIME()) AS [DaysAge],
	DATEDIFF(d,T2.[Last],SYSDATETIME()) AS [DaysLastUsed],
	T2.[Count] AS [Runs],
	CASE DATEDIFF(d,T2.[First],SYSDATETIME())
		WHEN 0 THEN T2.[Count] 
		ELSE T2.[Count] / CONVERT(INT,ROUND(DATEDIFF(d,T2.[First],SYSDATETIME()) * (1 - 0.285714),0)) 
	END AS [AvgRunsPerDay],
	CONVERT(DECIMAL(10,2),ROUND(T2.[TotalDuration] / T2.[Count],2)) AS [AvgRuntime]
FROM 
	(SELECT
		T1.[Query],
		(SELECT MIN([CreatedOn]) FROM [vw_HICS_Monitor_Usage] WHERE [Query] = T1.[Query] AND [Name] = 'Custom') AS [First],
		(SELECT MAX([CreatedOn]) FROM [vw_HICS_Monitor_Usage] WHERE [Query] = T1.[Query] AND [Name] = 'Custom') AS [Last],
		(SELECT [CreatedBy] FROM [vw_HICS_Monitor_Usage] WHERE ID = (SELECT MAX([ID]) FROM [vw_HICS_Monitor_Usage] WHERE [Query] = T1.[Query] AND [Name] = 'Custom')) AS [LastBy],
		(SELECT COUNT([ID]) FROM [vw_HICS_Monitor_Usage] WHERE [Query] = T1.[Query] AND [Name] = 'Custom') AS [Count],
		(SELECT SUM([Duration]) FROM [vw_HICS_Monitor_Usage] WHERE [Query] = T1.[Query] AND [Name] = 'Custom') AS [TotalDuration]
	FROM
		(SELECT DISTINCT 
			[Query]
		FROM
			[vw_HICS_Monitor_Usage]
		WHERE 
			[Name] = 'Custom') T1) T2
GO
/****** Object:  Table [dbo].[Tb_SC_Order_Audit]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SC_Order_Audit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[QuantityOrdered] [decimal](15, 5) NULL,
	[DeliveryDate] [datetime] NULL,
	[ReqdDespatchDate] [datetime] NULL,
	[Delivered] [datetime] NULL,
 CONSTRAINT [PK_Tb_SC_Order_Audit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_OrderAudit]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vw_ASC_LIVE_Rep_OrderAudit] as
SELECT 
	ISNULL(C.[Code],'')		AS [Customer code],
	ISNULL(C.[Name],'')		AS [Customer name],
	O.[OrderNum]			AS [Order],
	O.[Sequence],
	O.[Part],
	RTRIM(ISNULL(P.[Description1],'') + ' ' + ISNULL(P.[Description2],'')) AS [Part description],
	A.[Type]				AS [TypeNo],
	CASE A.[Type]
		WHEN 1 THEN 'Initial'
		WHEN 2 THEN 'Amendment'
		WHEN 3 THEN 'Final'
	END		AS [Type],
	A.[CreatedOn]			AS [Change date],
	O.[OrderDate]			AS [Order date],
	A.[DeliveryDate]		AS [Delivery date],
	A.[ReqdDespatchDate]	AS [Reqd despatch date],
	A.[Delivered]			AS [Despatch date],
	A.[QuantityOrdered]		AS [Quantity ordered],
	CASE 
		WHEN A2.[OrderID] IS NULL THEN 1
		ELSE 0
	END						AS [Single entry]
FROM
				[Tb_SC_Order_Audit]		A
LEFT OUTER JOIN	[vw_ASC_LIVE_Orders]	O	ON	A.[OrderID]			= O.[ID]
LEFT OUTER JOIN	[vw_ASC_LIVE_Customers]	C	ON	O.[CustomerCode]	= C.[Code]
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]		P	ON	O.[Part]			= P.[Part]
LEFT OUTER JOIN (SELECT [OrderID] from [Tb_SC_Order_Audit] GROUP BY [OrderID] HAVING COUNT([OrderID]) > 1)		
										A2	ON	A.[OrderID]			= A2.[OrderID]
--WHERE
--	O.[OrderNum] = 476230
--ORDER BY 
--	O.[OrderNum],
--	O.[Part],
--	A.[Type]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_CoA_Generations]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_HICS_Rep_CoA_Generations] as 
SELECT 
	G.[ID],
	CASE G.[SentBy]
		WHEN '' THEN 'No'
		ELSE 'Yes'
	END												AS [Sent],
	G.[SentBy],
	G.[SentOn],
	G.[CreatedOn],
	U.[FullName]					 				AS [CoACreatedBy],
	U.[Email] 										AS [CoACreatedByEmail],
	C.[Code]										AS [Customer],
	C.[Name]										AS [CustomerName],
	O.[CustomerOrderRef]							AS [CustomerOrderRef],
	C.[CoAEmailTo]									AS [CustomerCoAEmailTo],
	O.[OrderNum]									AS [SONo],
	ISNULL(U2.[Fullname],'')						AS [SOOwner],
	U2.[Email]										AS [SOOwnerEmail],
	P.[Part]										AS [Part],
	P.[Description1] + ' ' + P.[Description2]		AS [PartDescription],
	G.[MonographName]								AS [Monograph],
	T.[BatchRef]									AS [CoABatchRef],
	G.[SCBatchNo],
	G.[TemplateName],
	G.[FileName],
	G.[Path]
FROM 
 				[vw_HICS_CoA_Generations]		G
LEFT OUTER JOIN	[vw_HICS_Users]					U	ON	G.[CreatedBy]			= U.[ID]
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]				P	ON	G.[Part]				= P.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_Orders]			O	ON	G.[SalesOrderNo]		= O.[OrderNum]
													AND P.[Part]				= O.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_Customers]			C	ON	O.[CustomerCode]		= C.[Code]				
LEFT OUTER JOIN [vw_ASC_LIVE_Users]				U2	ON	O.[OrderEnteredBy]		= U2.[Code]				
LEFT OUTER JOIN [vw_HICS_CoA_Tests]				T	ON	G.[Test]				= T.[ID]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_UsageMonitor]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_HICS_Rep_UsageMonitor] as
SELECT
	MU.[Type]		AS [Type],
	MU.[CreatedOn]	AS [RunOn],
	CASE ISNULL(U.[FullName],'')
		WHEN '' THEN 'Unknown (' + CONVERT(VARCHAR(5),MU.[CreatedBy]) + ')'
		ELSE U.[FullName]
	END 	AS [RunBy],
	MU.[Name]		AS [Item],
	MU.[Duration]
FROM
				[vw_HICS_Monitor_Usage] MU
LEFT OUTER JOIN	[vw_HICS_Users]			U	ON U.[ID] = MU.[CreatedBy]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_ReportUsage_Detail]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_HICS_Rep_ReportUsage_Detail] as
SELECT 
	MU.[CreatedOn]																	AS [RunAt],
	ISNULL(U.[FullName] ,'Unknown (' + CONVERT(varchar(5),MU.[CreatedBy]) + ')')	AS [RunBy],
	MU.[CreatedBy]																	AS [RunBy_ID],
	MU.[Name]																		AS [Report],
	MU.[Duration]																	AS [Duration]
FROM 
				[vw_HICS_Monitor_Usage]	MU
LEFT OUTER JOIN	[vw_HICS_Users]			U	ON U.[ID] = MU.[CreatedBy]
WHERE
	MU.[Name] LIKE '%_Rep_%'

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_AA_REP_AGED_DEBT_MP_VIEW]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_AA_REP_AGED_DEBT_MP_VIEW] as
SELECT 
	*
FROM 
	[ASC_LIVE].[dbo].[AA_REP_AGED_DEBT_MP_VIEW] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_ToBeInvoiced]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vw_ASC_LIVE_ToBeInvoiced] as
SELECT 
	[TBI_UNIQUE]			AS [ID],
	[TBI_SOURCE_IND]		AS [SourceID],
	[TBI_CREATED]			AS [CreatedOn],
	[TBI_UPDATED]			AS [ModifiedOn],
	[TBI_OUR]			COLLATE Latin1_General_CI_AS	AS [OrderRef],
	[TBI_PART_ONLY]		COLLATE Latin1_General_CI_AS	AS [Part],
	[TBI_PART_REV]		COLLATE Latin1_General_CI_AS	AS [PartRev],
	[TBI_SUB]				AS [Sequence],
	[TBI_NUM]				AS [Number],
	[TBI_QTY]				AS [Quantity],
	[TBI_STAT_JC]		COLLATE Latin1_General_CI_AS	AS [JCStatus],
	[TBI_STAT_AC]		COLLATE Latin1_General_CI_AS	AS [ACStatus],
	[TBI_STATUS]		COLLATE Latin1_General_CI_AS	AS [Status],
	[TBI_DATE]				AS [Date],
	[TBI_PRICE]				AS [Price],
	[TBI_CURRENCY]		COLLATE Latin1_General_CI_AS	AS [Currency],
	[TBI_FOREIGN_PRICE]		AS [ForeignPrice],
	[TBI_SALES_ORDER]	COLLATE Latin1_General_CI_AS	AS [SalesOrder],
	[TBI_LOT_TYPE]			AS [LotType],
	[TBI_LOT_NUM]			AS [LotNum],
	[TBI_SERIAL_NO]		COLLATE Latin1_General_CI_AS	AS [SerialNo],
	[TBI_LOT]			COLLATE Latin1_General_CI_AS	AS [Lot],
	[TBI_COST_OF_SALE]		AS [CostOfSale],
	[TBI_SOURCE]		COLLATE Latin1_General_CI_AS	AS [Source],
	[TBI_INVOICE_NO]		AS [InvoiceNum],
	[TBI_DELIVERY_NO]		AS [DesptachNum],
	[TBI_CUS]			COLLATE Latin1_General_CI_AS	AS [Customer],
	[TBI_CUS_TYPE]		COLLATE Latin1_General_CI_AS	AS [CustomerType],
	[TBI_INITIALS1]		COLLATE Latin1_General_CI_AS	AS [Initials1],
	[TBI_PERCENT1]			AS [Percent1],
	[TBI_INITIALS2]		COLLATE Latin1_General_CI_AS	AS [Initials2],
	[TBI_PERCENT2]			AS [Percent2],
	[TBI_INITIALS3]		COLLATE Latin1_General_CI_AS	AS [Initials3],
	[TBI_PERCENT3]			AS [Percent3],
	[TBI_PRO_FORMA]		COLLATE Latin1_General_CI_AS	AS [ProForma],
	[TBI_ANAL_FIELD1]	COLLATE Latin1_General_CI_AS	AS [Analysis1],
	[TBI_ANAL_FIELD2]	COLLATE Latin1_General_CI_AS	AS [Analysis2],
	[TBI_ANAL_FIELD3]	COLLATE Latin1_General_CI_AS	AS [Analysis3],
	[TBI_ANAL_FIELD4]	COLLATE Latin1_General_CI_AS	AS [Analysis4],
	[TBI_ANAL_FIELD5]	COLLATE Latin1_General_CI_AS	AS [Analysis5],
	[TBI_ANAL_FIELD6]	COLLATE Latin1_General_CI_AS	AS [Analysis6],
	[TBI_ANAL_FIELD7]	COLLATE Latin1_General_CI_AS	AS [Analysis7],
	[TBI_ANAL_FIELD8]	COLLATE Latin1_General_CI_AS	AS [Analysis8],
	[TBI_ANAL_FIELD9]	COLLATE Latin1_General_CI_AS	AS [Analysis9],
	[TBI_ANAL_FIELD10]	COLLATE Latin1_General_CI_AS	AS [Analysis10],
	[TBI_ORIG_PRICE]		AS [OriginalPrice],
	[TBI_INVOICE_DATE]		AS [InvoiceDate],
	[TBI_DELIVERY_DATE]		AS [DeliveryDate],
	[TBI_ACTUAL_COST]		AS [ActualCost],
	[TBI_QTY_APPLIED]		AS [QuantityApplied],
	[TBI_QTY_PREV_APP]		AS [QuantityPrevApp],
	[TBI_PREV_STATUS]	COLLATE Latin1_General_CI_AS	AS [PreviousStatus],
	[TBI_SETT_DISC]			AS [SettlementDiscount],
	[TBI_SETT_DISC_DAYS]	AS [SettlementDiscountDays],
	[TBI_ACTUAL_COST_LAB]	AS [ActualLabCost],
	[TBI_ACTUAL_COST_MAT]	AS [ActualMatCost],
	[TBI_ORIG_PRICE_PER]	AS [OriginalPricePer],
	[TBI_FOREIGN_PRICE_PER] AS [ForeignPricePer],
	[TBI_PRICE_PER]			AS [PricePer],
	[TBI_ORIG_INVOICE_NO]	AS [OrigInvoiceNo],
	[TBI_EXCHANGE_RATE]		AS [ExchangeRate],
	[TBI_DUTY_TYPE]			AS [DutyType],
	[TBI_SL_YEAR_N]			AS [SLYearN],
	[TBI_SL_YEAR_A]		COLLATE Latin1_General_CI_AS	AS [SLYearA],
	[TBI_SL_PERIOD]			AS [SLPeriod],
	[TBI_NL_PERIOD]			AS [NLPeriod],
	[TBI_W5_NUMBER]			AS [W5Num],
	[TBI_COMMENTS]		COLLATE Latin1_General_CI_AS	AS [Comments],
	[TBI_CALC_WEIGHT]		AS [CalculatedWeight],
	[TBI_ACT_WEIGHT]		AS [ActualWeight],
	[TBI_ACT_WEIGHT_UOM] COLLATE Latin1_General_CI_AS	AS [ActualWeightUoM],
	[TBI_PACKAGE_ID1]	COLLATE Latin1_General_CI_AS	AS [PackageID1],
	[TBI_PACKAGE_ID2]	COLLATE Latin1_General_CI_AS	AS [PackageID2],
	[TBI_CALC_VOLUME]		AS [CalcVolume],
	[TBI_ACT_VOLUME]		AS [ActVolume],
	[TBI_SPCK_UNIQUE]		AS [SpckUnique],
	[TBI_REV_DESP_INV]		AS [RevDespInv],
	[TBI_DEL_SET]		COLLATE Latin1_General_CI_AS	AS [DelSet],
	[TBI_SCPH_UNIQUE]		AS [ScphUnique],
	[TBI_HDR_CREDIT_REASON] AS [HdrCreditReason],
	[TBI_CREDIT_REASON]		AS [CreditReason]
FROM 
	[ASC_LIVE].[dbo].[ASC_TBI_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_AgedDebtorReport]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[vw_ASC_LIVE_Rep_AgedDebtorReport] as
SELECT 
	[Customer],
	[Customer Name],
	[Date],
	[Reference],
	[Order Number],
	[Currency],
	[Gross],
	[Due Date],
	[Balance (GBP)],
	[Balance (Curr.)],
	T2.[Age],
	CASE T2.[Age] WHEN 7 THEN 'Yes' ELSE ''	END AS '1st Notice',
	CASE T2.[Age] WHEN 14 THEN 'Yes' ELSE '' END AS '2nd Notice',
	CASE T2.[Age] WHEN 28 THEN 'Yes' ELSE '' END AS 'Final Notice'
FROM
	(SELECT DISTINCT
		T1.[CUCODE]											AS [Customer],
		T1.[CUNAME]											AS [Customer Name],
		T1.[ST_DATE]										AS [Date],
		T1.[ST_HEADER_REF]									AS [Reference],
		ISNULL(T2.[OrderRef],'')							AS [Order Number],
		T1.[ST_CURRENCYCODE]								AS [Currency],
		CONVERT(DECIMAL(15,2), T1.[ST_GROSS])				AS [Gross],
		T1.[ST_DUEDATE]										AS [Due Date],
		CONVERT(DECIMAL(15,2), SUM(T1.[S_AL_VALUE_HOME]))	AS [Balance (GBP)],
		CONVERT(DECIMAL(15,2), SUM(T1.[S_AL_VALUE_CURR]))	AS [Balance (Curr.)],
		CASE UPPER(DATENAME(dw,sysdatetime()))
			WHEN 'MONDAY' THEN	CASE 
									WHEN DATEDIFF(d,T1.[ST_DUEDATE],SYSDATETIME()) IN (7,8,9) THEN 7
									WHEN DATEDIFF(d,T1.[ST_DUEDATE],SYSDATETIME()) IN (14,15,16) THEN 14
									WHEN DATEDIFF(d,T1.[ST_DUEDATE],SYSDATETIME()) IN (28,29,30) THEN 28
									ELSE 0			
								 END
			ELSE CASE 
					WHEN DATEDIFF(d,T1.[ST_DUEDATE],SYSDATETIME()) IN (7,14,28) THEN DATEDIFF(d,T1.[ST_DUEDATE],SYSDATETIME())
					ELSE 0
				 END

		END													AS [Age]
	FROM 
					[vw_ASC_LIVE_AA_REP_AGED_DEBT_MP_VIEW]	T1
	LEFT OUTER JOIN	(SELECT DISTINCT [OrderRef], [InvoiceNum] FROM [vw_ASC_LIVE_ToBeInvoiced]) T2	ON T1.[ST_HEADER_REF] = T2.[InvoiceNum]
	WHERE 
		ST_TRANTYPE = 'INV'
	AND DATEDIFF(d,T1.[ST_DUEDATE],SYSDATETIME()) BETWEEN 7 AND 30
	AND T1.[CUBALANCE] <> 0
	GROUP BY
		T1.[CUCODE],
		T1.[CUNAME],
		T1.[ST_DATE],
		T1.[ST_HEADER_REF],
		ISNULL(T2.[OrderRef],''),
		T1.[ST_CURRENCYCODE],
		CONVERT(DECIMAL(15,2), T1.[ST_GROSS]),
		T1.[ST_DUEDATE],
		DATEDIFF(d,T1.[ST_DUEDATE],SYSDATETIME())) T2
WHERE
	T2.[Balance (GBP)] <> 0
AND T2.[Age] <> 0
GO
/****** Object:  Table [dbo].[Tb_VC_Vats]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_VC_Vats](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](512) NULL,
 CONSTRAINT [PK_Tb_VC_Vats] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_VC_Valves]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_VC_Valves](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Type] [int] NOT NULL,
	[LnkVatID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Position] [int] NOT NULL,
	[Description] [varchar](512) NULL,
 CONSTRAINT [PK_Tb_VC_Valves] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_VC_Valves]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_HICS_Rep_VC_Valves] as
SELECT
	VAL.[ID],
	VAL.[Enabled],
	CASE VAL.[Type]
		WHEN 0 THEN 'Valve'
		WHEN 1 THEN 'Top opening'
		WHEN 2 THEN 'Side opening'
		ELSE 'ERROR'
	END								AS [Type],
	VAL.[Name],
	VAL.[Position],
	VAT.[ID]						AS [VatID],
	VAT.[Name]						AS [VatName],
	CASE VAT.[Deleted] 
		WHEN 1 THEN 0
		ELSE VAT.[Enabled]
	END								AS [VatEnabled]
FROM
				[Tb_VC_Valves]	VAL
LEFT OUTER JOIN	[Tb_VC_Vats]	VAT ON VAT.[ID] = VAL.[LnkVatID]
WHERE
	VAL.[Deleted] = 0
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Customers1]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_Customers1] as
SELECT 
	[CUCODE]						AS [CustomerCode],
    [CUPHONE]						AS [Phone1],
    [CUPHONE2]						AS [Phone2],
    [CUFAX]							AS [Fax],
    [CUPROSCODE]					AS [ProsCode],
    [CUCONTACT]						AS [Contact],
    [CUSALUTE]						AS [Salute],
    [CU_PRO_CONDATE]				AS [ProConDate],
    [CU_EXPORT_CODE]				AS [ExportCode],
    [CU_COUNTRY_CODE]				AS [CountryCode],
    [CU_VAT_REG_NO]					AS [VATRegNo],
    [CU_EC_DELIVERY]				AS [ECDelivery],
    [CU_EC_T_NATURE]				AS [ECTNature],
    [CU_EC_T_MODE]					AS [ECTMode],
    [CUSORT]						AS [SortKey],
    [CUUSER1]						AS [UserSort1],
    [CUUSER2]						AS [UserSort2],
    [CUUSER3]						AS [UserSort3],
    [CUCURRENCYCODE]				AS [CurrencyCode],
    [CU_USERDATE1]					AS [UserDate1],
    [CU_USERDATE2]					AS [UserDate2],
    [CU_DATE_INV]					AS [DateInv],
    [CU_DATE_PAY]					AS [DatePay],
    [CU_USER_PUTIN]					AS [CreatedBy],
    [CU_DATE_PUTIN]					AS [CreatedOn],
    [CU_DATE_EDITED]				AS [ModfiedOn],
    [CU_USER_EDITED]				AS [ModfiedBy],
    [CU_MU_STATUS]					AS [MUStatus],
    [CU_TERMS_OPTION]				AS [TermsOption],
    [CU_DEL_CHARGE_C]				AS [DelChargeC],
    [CU_MIN_ORDR_C]					AS [MinOrderC],
    [CU_ANALYSIS]					AS [Analysis],
    [CU_TAX_CODE]					AS [TaxCode],
    [CU_BANK_ANALYS]				AS [BankAnalys],
    [CU_INV_LAYOUT]					AS [InvLayout],
    [CU_DEALERCODE]					AS [DealerCode],
    [CU_EMAIL]						AS [EMail],
    [CU_WEB_PASSWORD]				AS [WebPassword],
    [CU_SOURCE]						AS [Source],
    [CU_DOC_DESTINATION]			AS [DocDestination],
    [CU_TERMS_LINK]					AS [TermsLink],
    [CU_PAYMENT_PROMISED_DATE]		AS [PaymentPromisedDate],
    [CU_PAYMENT_PROMISED_CURRENCY]	AS [PaymentPromisedCurrency],
    [CU_COMPANY_REG_NUMBER]			AS [CompanyRegNumber],
    [CUNAME]						AS [Name],
    [CUADDRESS]						AS [Address],
    [CUPOSTCODE]					AS [Postcode],
    [CU_MULTI_CURR]					AS [MultiCurrency],
    [CUBALANCE]						AS [Balance],
    [CUBALANCE_C]					AS [BalanceC],
    [CUAGED_1]						AS [Aged1],
    [CUAGED_2]						AS [Aged2],
    [CUAGED_3]						AS [Aged3],
    [CUAGED_4]						AS [Aged4],
    [CUAGED_5]						AS [Aged5],
    [CUAGED_6]						AS [Aged6],
    [CUAGED_UNALLOC]				AS [AgedUnallocated],
    [CUUSED]						AS [Used],
    [CUTURNOVERPTD]					AS [TurnoverPTD],
    [CUTURNOVR_L1]					AS [TurnoverL1],
    [CUTURNOVR_L2]					AS [TurnoverL2],
    [CUTURNOVR_L3]					AS [TurnoverL3],
    [CUTURNOVR_L4]					AS [TurnoverL4],
    [CUTURNOVR_L5]					AS [TurnoverL5],
    [CUTURNOVR_L6]					AS [TurnoverL6],
    [CUTURNOVR_L7]					AS [TurnoverL7],
    [CUTURNOVR_L8]					AS [TurnoverL8],
    [CUTURNOVR_L9]					AS [TurnoverL9],
    [CUTURNOVR_L10]					AS [TurnoverL10],
    [CUTURNOVR_L11]					AS [TurnoverL11],
    [CUTURNOVR_L12]					AS [TurnoverL12],
    [CUTURNOVR_L13]					AS [TurnoverL13],
    [CUTURNOVR_C1]					AS [TurnoverC1],
    [CUTURNOVR_C2]					AS [TurnoverC2],
    [CUTURNOVR_C3]					AS [TurnoverC3],
    [CUTURNOVR_C4]					AS [TurnoverC4],
    [CUTURNOVR_C5]					AS [TurnoverC5],
    [CUTURNOVR_C6]					AS [TurnoverC6],
    [CUTURNOVR_C7]					AS [TurnoverC7],
    [CUTURNOVR_C8]					AS [TurnoverC8],
    [CUTURNOVR_C9]					AS [TurnoverC9],
    [CUTURNOVR_C10]					AS [TurnoverC10],
    [CUTURNOVR_C11]					AS [TurnoverC11],
    [CUTURNOVR_C12]					AS [TurnoverC12],
    [CUTURNOVR_C13]					AS [TurnoverC13],
    [CUTURNOVR_O1]					AS [TurnoverO1],
    [CUTURNOVR_O2]					AS [TurnoverO2],
    [CUTURNOVR_O3]					AS [TurnoverO3],
    [CUTURNOVR_O4]					AS [TurnoverO4],
    [CUTURNOVR_O5]					AS [TurnoverO5],
    [CUTURNOVR_O6]					AS [TurnoverO6],
    [CUTURNOVR_O7]					AS [TurnoverO7],
    [CUTURNOVR_O8]					AS [TurnoverO8],
    [CUTURNOVR_O9]					AS [TurnoverO9],
    [CUTURNOVR_O10]					AS [TurnoverO10],
    [CUTURNOVR_O11]					AS [TurnoverO11],
    [CUTURNOVR_O12]					AS [TurnoverO12],
    [CUTURNOVR_O13]					AS [TurnoverO13],
    [CUTURNOVERYTD]					AS [TurnoverYTD],
    [CUTURNOVR_L1_C]				AS [TurnoverL1C],
    [CUTURNOVR_L2_C]				AS [TurnoverL2C],
    [CUTURNOVR_L3_C]				AS [TurnoverL3C],
    [CUTURNOVR_L4_C]				AS [TurnoverL4C],
    [CUTURNOVR_L5_C]				AS [TurnoverL5C],
    [CUTURNOVR_L6_C]				AS [TurnoverL6C],
    [CUTURNOVR_L7_C]				AS [TurnoverL7C],
    [CUTURNOVR_L8_C]				AS [TurnoverL8C],
    [CUTURNOVR_L9_C]				AS [TurnoverL9C],
    [CUTURNOVR_L10_C]				AS [TurnoverL10C],
    [CUTURNOVR_L11_C]				AS [TurnoverL11C],
    [CUTURNOVR_L12_C]				AS [TurnoverL12C],
    [CUTURNOVR_L13_C]				AS [TurnoverL13C],
    [CUTURNOVR_C1_C]				AS [TurnoverC1C],
    [CUTURNOVR_C2_C]				AS [TurnoverC2C],
    [CUTURNOVR_C3_C]				AS [TurnoverC3C],
    [CUTURNOVR_C4_C]				AS [TurnoverC4C],
    [CUTURNOVR_C5_C]				AS [TurnoverC5C],
    [CUTURNOVR_C6_C]				AS [TurnoverC6C],
    [CUTURNOVR_C7_C]				AS [TurnoverC7C],
    [CUTURNOVR_C8_C]				AS [TurnoverC8C],
    [CUTURNOVR_C9_C]				AS [TurnoverC9C],
    [CUTURNOVR_C10_C]				AS [TurnoverC10C],
    [CUTURNOVR_C11_C]				AS [TurnoverC11C],
    [CUTURNOVR_C12_C]				AS [TurnoverC12C],
    [CUTURNOVR_C13_C]				AS [TurnoverC13C],
    [CUTURNOVR_O1_C]				AS [TurnoverO1C],
    [CUTURNOVR_O2_C]				AS [TurnoverO2C],
    [CUTURNOVR_O3_C]				AS [TurnoverO3C],
    [CUTURNOVR_O4_C]				AS [TurnoverO4C],
    [CUTURNOVR_O5_C]				AS [TurnoverO5C],
    [CUTURNOVR_O6_C]				AS [TurnoverO6C],
    [CUTURNOVR_O7_C]				AS [TurnoverO7C],
    [CUTURNOVR_O8_C]				AS [TurnoverO8C],
    [CUTURNOVR_O9_C]				AS [TurnoverO9C],
    [CUTURNOVR_O10_C]				AS [TurnoverO10C],
    [CUTURNOVR_O11_C]				AS [TurnoverO11C],
    [CUTURNOVR_O12_C]				AS [TurnoverO12C],
    [CUTURNOVR_O13_C]				AS [TurnoverO13C],
    [CUTURNOVR_YTD_C]				AS [TurnoverYTDC],
    [CUTURNOVR_PTD_C]				AS [TurnoverPTDC],
    [CU_COSTVAL_1]					AS [CostVal1],
    [CU_COSTVAL_2]					AS [CostVal2],
    [CU_COSTVAL_3]					AS [CostVal3],
    [CU_COSTVAL_4]					AS [CostVal4],
    [CU_COSTVAL_5]					AS [CostVal5],
    [CU_COSTVAL_6]					AS [CostVal6],
    [CU_COSTVAL_7]					AS [CostVal7],
    [CU_COSTVAL_8]					AS [CostVal8],
    [CU_COSTVAL_9]					AS [CostVal9],
    [CU_COSTVAL_10]					AS [CostVal10],
    [CU_COSTVAL_11]					AS [CostVal11],
    [CU_COSTVAL_12]					AS [CostVal12],
    [CU_COSTVAL_13]					AS [CostVal13],
    [CU_SALEVAL_1]					AS [SaleVal1],
    [CU_SALEVAL_2]					AS [SaleVal2],
    [CU_SALEVAL_3]					AS [SaleVal3],
    [CU_SALEVAL_4]					AS [SaleVal4],
    [CU_SALEVAL_5]					AS [SaleVal5],
    [CU_SALEVAL_6]					AS [SaleVal6],
    [CU_SALEVAL_7]					AS [SaleVal7],
    [CU_SALEVAL_8]					AS [SaleVal8],
    [CU_SALEVAL_9]					AS [SaleVal9],
    [CU_SALEVAL_10]					AS [SaleVal10],
    [CU_COSTVAL_PTD]				AS [CostValPTD],
    [CU_COSTVAL_YTD]				AS [CostValYTD],
    [CU_SALEVAL_PTD]				AS [SaleValPTD],
    [CU_SALEVAL_YTD]				AS [SaleValYTD],
    [CU_COSTVALUE]					AS [CostValue],
    [CU_SALEVALUE]					AS [SaleValue],
    [CU_SALEVAL_11]					AS [SaleVal11],
    [CU_SALEVAL_12]					AS [SaleVal12],
    [CU_SALEVAL_13]					AS [SaleVal13],
    [CU_MULTIADD_FLG]				AS [MultiAddFlag],
    [CU_INV_ADD_CDE]				AS [InvAddCode],
    [CU_DEL_ADD_CDE]				AS [DelAddCode],
    [CU_STAT_ADD_CDE]				AS [StatAddCode],
    [CU_ON_STOP]					AS [OnStop],
    [CU_A_P_DAYS]					AS [APDays],
    [CU_PRICE_KEY]					AS [PriceKey],
    [CU_PRIMARY]					AS [Primary],
    [CU_ADDRESS_USER1]				AS [Town],
    [CU_ADDRESS_USER2]				AS [County],
    [CU_CURRENCY_CHANGED]			AS [CurrencyChanged],
    [CU_ACCOUNT_TYPE]				AS [AccountType],
    [CU_COUNTRY]					AS [Country],
    [CU_DO_NOT_USE]					AS [DoNotUse],
    [CU_CREDIT_CONTROLLER]			AS [CreditController],
    [CU_ANT_DAYS_FROM_DATES_OPT]	AS [AntDaysFromDatesOpt],
    [CU_PAYMENT_PROMISED]			AS [PaymentPromised],
    [CU_CURR_CREDIT_LIMIT]			AS [CurrCreditLimit]
FROM 
	[ASC_LIVE].[dbo].[SL_ACCOUNTS] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Customers2]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******	 Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_Customers2] as
SELECT	 
	[CU_CHAR1]						AS [Char1],
    [CU_CHAR2]						AS [Char2],
    [CU_CHAR3]						AS [Char3],
    [CU_CHAR4]						AS [Char4],
    [CU_DATE1]						AS [Date1],
    [CU_DATE2]						AS [Date2],
    [CU_USRCHAR1]					AS [UserChar1],
    [CU_USRCHAR2]					AS [UserChar2],
    [CU_USRCHAR3]					AS [UserChar3],
    [CU_USRCHAR4]					AS [UserChar4],
    [CU_USRDATE1]					AS [UserDate1],
    [CU_USRDATE2]					AS [UserDate2],
    [CUCODE2]						AS [CustomerCode],
    [CU_EDI_ANA]					AS [EDIAna],
    [CU_EDI_CUSTIDN]				AS [EDICustidn],
    [CU_LANG_CODE]					AS [Langcode],
    [CU_CONTACT_TITLE]				AS [ContactTitle],
    [CU_CONTACT_INITIALS]			AS [ContactInitials],
    [CU_CONTACT_SURNAME]			AS [ContactSurname],
    [CU_CONTACT_JOB]				AS [ContactJob],
    [CU_CONTACT_FIRSTNAME]			AS [ContactFirstName],
    [CU_ISDN_NUMBER]				AS [ISDNNumber],
    [CU_MOBILE_NUMBER]				AS [MobileNumber],
    [CU_BANK_SORT]					AS [BankSort],
    [CU_BANK_BACSREF]				AS [BankBACSRef],
    [CU_BANK_BANKNAME]				AS [BankName],
    [CU_USRCHAR5]					AS [UserChar5],
    [CU_USRCHAR6]					AS [UserChar6],
    [CU_USRDATE3]					AS [UserDate3],
    [CU_USRCHAR7]					AS [UserChar7],
    [CU_USRCHAR8]					AS [UserChar8],
    [CU_GROUP]						AS [Group],
    [CU_TAX_NOTIFY_TIME]			AS [TaxNotifyTime],
    [CU_CNF_XML_FORMAT]				AS [CNFXMLFormat],
    [CU_CNF_EMAIL_SUBJECT]			AS [CNFEmailSubject],
    [CU_CNF_EMAIL_MESSAGE]			AS [CNFEmailMessage],
    [CU_OUR_ACCOUNT_CODE]			AS [OurAccountCode],
    [CU_INV_XML_FORMAT]				AS [InvoiceXMLFormat],
    [CU_INV_EMAIL_SUBJECT]			AS [InvoiceEmailSubject],
    [CU_INV_EMAIL_MESSAGE]			AS [InvoiceEmailMessage],
    [CU_HEAD_OFFICE_CODE]			AS [HeadOfficeCode],
    [CU_IBAN_NO]					AS [IBANNo],
    [CU_PRIMARY_2]					AS [Primary2],
    [CU_FLAG1]						AS [Flag1],
    [CU_FLAG2]						AS [Flag2],
    [CU_NUM1]						AS [Num1],
    [CU_NUM2]						AS [Num2],
    [CU_USRFLAG1]					AS [UserFlag1],
    [CU_USRFLAG2]					AS [UserFlag2],
    [CU_USRNUM1]					AS [UserNum1],
    [CU_USRNUM2]					AS [UserNum2],
    [CU_EDI_FLAG]					AS [EDIFlag],
    [CU_EDI_TEMPLATE]				AS [EDITemplate],
    [CU_EDI_FLGN]					AS [EDIFLGN],
    [CU_CONTACT_COMPTYPE]			AS [ContactComptype],
    [CU_WEBSITE_ADDRESS]			AS [WebsiteAddress],
    [CU_BANK_AC_NO]					AS [BankACNo],
    [CU_BANK_AC_NAME]				AS [BankACName],
    [CU_USRFLAG3]					AS [UserFlag3],
    [CU_USRNUM3]					AS [UserNum3],
    [CU_LOG_UPDATED]				AS [LogUpdated],
    [CU_LEVEL]						AS [Level],
    [CU_CLOSING_DAYS]				AS [ClosingDays],
    [CU_DUE_DAYS_AFTER]				AS [DueDaysAfter],
    [CU_TAX_ROUNDING]				AS [TaxRounding],
    [CU_VALUEBORDER1]				AS [ValueBorder1],
    [CU_VALUEBORDER2]				AS [ValueBorder2],
    [CU_VALUEBORDER3]				AS [ValueBorder3],
    [CU_NOTEDATE1]					AS [NoteDate1],
    [CU_NOTEDATE2]					AS [NoteDate2],
    [CU_NOTEDATE3]					AS [NoteDate3],
    [CU_NOTERATE1]					AS [NoteRate1],
    [CU_NOTERATE2]					AS [NoteRate2],
    [CU_NOTERATE3]					AS [NoteRate3],
    [CU_STOCK_ALLOCATION_PRIORITY]	AS [StockAllocationPriority],
    [CU_HEAD_OFFICE]				AS [HeadOffice],
    [CU_HEAD_OFFICE_DEFINVADDR]		AS [HeadOfficeDefInvAddr],
    [CU_HEAD_OFFICE_DEFDELADDR]		AS [HeadOfficeDefDelAddr],
    [CU_DO_NOT_FAX]					AS [DoNotFax],
    [CU_DO_NOT_PHONE]				AS [DoNotPhone],
    [CU_SWIFT_CODE]					AS [SwiftCode]
FROM 
	[ASC_LIVE].[dbo].[SL_ACCOUNTS2] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Customers4]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_Customers4] as
SELECT 
	[CUS_UNIQUE]				AS [ID],
    [CUS_CREATED]				AS [CreatedOn],
    [CUS_SOURCE_IND]			AS [SourceID],
    [CUS_UPDATED]				AS [ModifiedOn],
    [CUS_CODE]			COLLATE Latin1_General_CI_AS		AS [CustomerCode],
    [CUS_SL_AD_CODE]			AS [AddCode],
    [CUS_TYPE_CODE]		COLLATE Latin1_General_CI_AS		AS [TypeCode],
    [CUS_CUSTOMER_AC]	COLLATE Latin1_General_CI_AS		AS [CustomerAC],
    [CUS_AREA_CODE]		COLLATE Latin1_General_CI_AS		AS [AreaCode],
    [CUS_PAY_TERMS]		COLLATE Latin1_General_CI_AS		AS [PayTerms],
    [CUS_ORD_LIMIT]				AS [OrderLimit],
    [CUS_PR_LIST]		COLLATE Latin1_General_CI_AS		AS [PRList],
    [CUS_ANAL_4]		COLLATE Latin1_General_CI_AS		AS [Analysis4],
    [CUS_ANAL_5]		COLLATE Latin1_General_CI_AS		AS [Analysis5],
    [CUS_ANAL_6]		COLLATE Latin1_General_CI_AS		AS [Analysis6],
    [CUS_ANAL_7]		COLLATE Latin1_General_CI_AS		AS [Analysis7],
    [CUS_ANAL_8]		COLLATE Latin1_General_CI_AS		AS [Analysis8],
    [CUS_ANAL_9]		COLLATE Latin1_General_CI_AS		AS [Analysis9],
    [CUS_SETTLEMENT_DISC]	COLLATE Latin1_General_CI_AS	AS [SettlementDiscount],
    [CUS_PRIORITY]		COLLATE Latin1_General_CI_AS		AS [Priority],
    [CUS_SUPPRESS_REVAL]	COLLATE Latin1_General_CI_AS	AS [SuppressReval],
    [CUS_PAY_METHOD]	COLLATE Latin1_General_CI_AS		AS [PayMethod],
    [CUS_TRANS_ROUTE]	COLLATE Latin1_General_CI_AS		AS [TransRoute],
    [CUS_TRANS_DROP]			AS [TransDrop],
    [CUS_SHORT_NAME]	COLLATE Latin1_General_CI_AS		AS [ShortName],
    [CUS_INV_CODE]		COLLATE Latin1_General_CI_AS		AS [InvCode],
    [CUS_AUTO_DISC]		COLLATE Latin1_General_CI_AS		AS [AutoDisc],
    [CUS_ENTER_T1]		COLLATE Latin1_General_CI_AS		AS [EnterT1],
    [CUS_ENTER_T2]		COLLATE Latin1_General_CI_AS		AS [EnterT2],
    [CUS_ENTER_T3]		COLLATE Latin1_General_CI_AS		AS [EnterT3],
    [CUS_ENTER_T4]		COLLATE Latin1_General_CI_AS		AS [EnterT4],
    [CUS_ENTER_T5]		COLLATE Latin1_General_CI_AS		AS [EnterT5],
    [CUS_ENTER_T6]		COLLATE Latin1_General_CI_AS		AS [EnterT6],
    [CUS_ENTER_T7]		COLLATE Latin1_General_CI_AS		AS [EnterT7],
    [CUS_ENTER_T8]		COLLATE Latin1_General_CI_AS		AS [EnterT8],
    [CUS_ENTER_T9]		COLLATE Latin1_General_CI_AS		AS [EnterT9],
    [CUS_ENTER_T10]		COLLATE Latin1_General_CI_AS		AS [EnterT10],
    [CUS_SUN_ADDRESS]	COLLATE Latin1_General_CI_AS		AS [SunAddress],
    [CUS_ORDER_TYPE]	COLLATE Latin1_General_CI_AS		AS [OrderType],
    [CUS_CONS_INV]		COLLATE Latin1_General_CI_AS		AS [ConsInv],
    [CUS_EXCL_AGED_DEBT_CHK] COLLATE Latin1_General_CI_AS	AS [ExcludeAgedDebtCheck],
    [CUS_CONS_CUS_REF_INV]	COLLATE Latin1_General_CI_AS	AS [ConsCusRefInv],
    [CUS_DEFERMENT_NO]	COLLATE Latin1_General_CI_AS		AS [DefermentNo],
    [CUS_ACTIVE]		COLLATE Latin1_General_CI_AS		AS [Active],
    [CUS_DEFERMENT_VAT]	COLLATE Latin1_General_CI_AS		AS [DeferementVAT],
    [CUS_EDI_OWN_LOC]	COLLATE Latin1_General_CI_AS		AS [EDIOwnLoc],
    [CUS_LEAD_TIME]				AS [LeadTime],
    [CUS_TS_CALL_FREQ]			AS [TSCallFreq],
    [CUS_TS_CALL_MON]			AS [TSCallMon],
    [CUS_TS_CALL_TUE]			AS [TSCallTue],
    [CUS_TS_CALL_WED]			AS [TSCallWed],
    [CUS_TS_CALL_THU]			AS [TSCallThu],
    [CUS_TS_CALL_FRI]			AS [TSCallFri],
    [CUS_TS_CALL_SAT]			AS [TSCallSat],
    [CUS_TS_CALL_SUN]			AS [TSCallSun],
    [CUS_TS_OPERATOR]		COLLATE Latin1_General_CI_AS	AS [TSOperator],
    [CUS_TEMPLATE_CODE]		COLLATE Latin1_General_CI_AS	AS [TemplateCode],
    [CUS_TRANS_ROUTE_MON]	COLLATE Latin1_General_CI_AS	AS [TransRouteMon],
    [CUS_TRANS_ROUTE_TUE]	COLLATE Latin1_General_CI_AS	AS [TransRouteTue],
    [CUS_TRANS_ROUTE_WED]	COLLATE Latin1_General_CI_AS	AS [TransRoutewed],
    [CUS_TRANS_ROUTE_THU]	COLLATE Latin1_General_CI_AS	AS [TransRouteThu],
    [CUS_TRANS_ROUTE_FRI]	COLLATE Latin1_General_CI_AS	AS [TransRouteFri],
    [CUS_TRANS_ROUTE_SAT]	COLLATE Latin1_General_CI_AS	AS [TransRouteSat],
    [CUS_TRANS_ROUTE_SUN]	COLLATE Latin1_General_CI_AS	AS [TransRouteSun],
    [CUS_TRANS_DROP_MON]		AS [TransDropMon],
    [CUS_TRANS_DROP_TUE]		AS [TransDropTue],
    [CUS_TRANS_DROP_WED]		AS [TransDropWed],
    [CUS_TRANS_DROP_THU]		AS [TransDropThu],
    [CUS_TRANS_DROP_FRI]		AS [TransDropFri],
    [CUS_TRANS_DROP_SAT]		AS [TransDropSat],
    [CUS_TRANS_DROP_SUN]		AS [TransDropSun],
    [CUS_FULL_SHIP_ONLY]		AS [FullShipOnly],
    [CUS_UPD_DEL]				AS [UPDDel],
    [CUS_PRICE_UPLIFT]			AS [PriceUplift]
FROM
	[ASC_LIVE].[dbo].[ASC_SL_ACCOUNTS] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_Customers]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_Rep_Customers] as
SELECT 
	C.[CreatedOn],
	C.[CreatedBy],
	C.[CreatedByFullname],
	C.[ModifiedOn],
	C.[ModifiedBy],
	C.[ModifiedByFullname],
	C.[Code],
	C.[Name],
	C.[AddressStreet],
	C.[AddressTown],
	C.[AddressCounty],
	C.[AddressCountry],
	C.[CountryCode],
	C.[CountryCodeDescription],
	C.[OnStop],
	C.[SortKey],
	C.[UserSort1],
	C.[UserSort2],
	C.[UserSort3],
	C.[Telephone],
	C.[Fax],
	C2.[WebsiteAddress],
	ISNULL(C2.[ContactTitle],'') + 
	CASE ISNULL(C2.[ContactInitials],'') WHEN '' THEN '' ELSE ' ' END + ISNULL(C2.[ContactInitials],'') + 
	CASE ISNULL(C2.[ContactSurname],'') WHEN '' THEN '' ELSE ' ' END + ISNULL(C2.[ContactSurname],'')		AS [ContactFullName],
	ISNULL(C2.[ContactTitle],'') AS [ContactTitle],
	ISNULL(C2.[ContactInitials],'') AS [ContactInitials],
	ISNULL(C2.[ContactFirstName],'') AS [ContactFirstName],
	ISNULL(C2.[ContactSurname],'') AS [ContactSurname],
	C2.[ContactJob],
	C1.[Salute],
	C2.[MobileNumber],
	C1.[EMail],
	C.[Currency],
	C.[MultiCurrency],
	C1.[AccountType],
	C.[SalesAnalysis],
	C1.[BankAnalys] AS [BankAnalysis],
	C.[VATCode],
	C.[ExportCode],
	C.[VATNumber],
	C.[EUDelivery],
	C.[EUTransaction],
	C.[EUTransport],
	C2.[ContactComptype] as [CompanyType],
	C2.[Langcode],
	C2.[StockAllocationPriority]	AS [OrderPriority],
	C2.[Level],
	C1.[DoNotUse]	AS [HideFromLists],
	C.[BankSortCode],
	C.[BankName],
	C.[BankAccNo],
	C.[BankAccName],
	C.[BankBACSRef],
	C.[IBAN],
	C2.[SwiftCode],
	C2.[ISDNNumber],
	C2.[EDICustidn]	AS [EDIDelivery],
	C2.[EDIAna]		AS [ANAEAN],
	C1.[WebPassword],
	C2.[OurAccountCode],
	C1.[DocDestination] AS [Documents],
	C.[Notes],
	C1.[DateInv]		AS [LastInvoice],
	C1.[DatePay]		AS [LastReceipt],
	C2.[UserChar1],
	C2.[UserChar2],
	C2.[UserChar3],
	C2.[UserChar4],
	C2.[UserChar5],
	C2.[UserChar6],
	C2.[UserChar7],
	C2.[UserChar8]		AS [CoAEmailTo],
	C2.[UserNum1],
	C2.[UserNum2],
	C2.[UserNum3],
	C2.[UserDate1],
	C2.[UserDate2],
	C2.[UserDate3],
	C2.[UserFlag1],
	C2.[UserFlag2],
	C2.[UserFlag3]		AS [PrefixWithFX],
	C4.[OrderType],
	C4.[PRList],
	C4.[TypeCode],
	C4.[OrderLimit],
	C4.[PayMethod],
	C4.[ExcludeAgedDebtCheck],
	C4.[ConsInv]		AS [ConsolidateInvoices],
	C4.[ConsCusRefInv]	AS [ConsolidateOrderByCusRef],
	C4.[FullShipOnly],
	C4.[PriceUplift],
	C4.[Analysis4]		AS [PackagingUserType],
	C4.[Analysis5]		AS [MarketSector],
	C4.[Analysis6]		AS [CommissionMarkup],
	C4.[Analysis7]		AS [AccountManager],
	C4.[Analysis8]		AS [Certification],
	C4.[Analysis9]		AS [DutyFreeReference],
	C4.[TSCallMon],
	C4.[TSCallTue],
	C4.[TSCallWed],
	C4.[TSCallThu],
	C4.[TSCallFri],
	C4.[TSCallSat],
	C4.[TSCallSun],
	C4.[LeadTime],
	C4.[TSCallFreq],
	C4.[TSOperator],
	C4.[TemplateCode],
	C4.[TransRoute],
	C4.[TransDrop],
	C4.[TransRouteMon],
	C4.[TransDropMon],
	C4.[TransRouteTue],
	C4.[TransDropTue],
	C4.[TransRoutewed],
	C4.[TransDropWed],
	C4.[TransRouteThu],
	C4.[TransDropThu],
	C4.[TransRouteFri],
	C4.[TransDropFri],
	C4.[TransRouteSat],
	C4.[TransDropSat],
	C4.[TransRouteSun],
	C4.[TransDropSun],
	C4.[DefermentNo],
	C4.[Active]				AS [IsDefermentActive],
	C4.[DeferementVAT]
FROM
				[vw_ASC_LIVE_Customers]		C
LEFT OUTER JOIN	[vw_ASC_LIVE_Customers1]	C1	ON C.[Code] = C1.[CustomerCode]
LEFT OUTER JOIN	[vw_ASC_LIVE_Customers2]	C2	ON C.[Code] = C2.[CustomerCode]
LEFT OUTER JOIN	[vw_ASC_LIVE_Customers4]	C4	ON C.[Code] = C4.[CustomerCode] COLLATE Latin1_General_CI_AS
GO
/****** Object:  View [dbo].[vw_WinWeigh_ScaleData]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_WinWeigh_ScaleData] as 
SELECT [ALIBI_1] AS [Alibi1],
[ALIBI_2] AS [Alibi2],
[HIDDENKEY] AS [ID],
[CUSTOMER] AS [Customer],
[CUSTOMER_DESC] AS [CustomerDesc],
[PRODUCT_DESC] AS [ProductDesc],
[VEHICLE_DESC] AS [VehicleDesc],
[FIELD_1] AS [Field1],
[FIELD_2] AS [Field2],
[FIELD_3] AS [Field3],
[FIELD_4] AS [Field4],
[FIELD_5] AS [Field5],
[FIELD_6] AS [Field6],
[FIELD_7] AS [Field7],
[IS_MERGED] AS [IsMerged],
[DATASYNCED] AS [DataSynced],
[Z_INCOMPLETE] AS [Zincomplete],
[TERMINAL_NO] AS [TerminalNo],
[WEIGHING_ID] AS [WeighingID],
[SEQNO_1] AS [SeqNo1],
[SEQNO_2] AS [SeqNo2],
[RECALL_CODE] AS [RecallCode],
[Z_REC_FLAG] AS [ZRecFlag],
[PRODUCT] AS [Product],
[RESULT] AS [Result],
[SCALE_1] AS [Scale1],
[SCALE_2] AS [Scale2],
[SCALE_STATUS] AS [ScaleStatus],
[SERIAL_1] AS [Serial1],
[SERIAL_2] AS [Serial2],
[NET_UNIT] AS [NetUnit],
[UNIT_1] AS [Unit1],
[UNIT_2] AS [Unit2],
[SCALE_A_UNIT_1] AS [ScaleAUnit1],
[SCALE_A_UNIT_2] AS [ScaleAUnit2],
[SCALE_B_UNIT_1] AS [ScaleBUnit1],
[SCALE_B_UNIT_2] AS [ScaleBUnit2],
[SCALE_C_UNIT_1] AS [ScaleCUnit1],
[SCALE_C_UNIT_2] AS [ScaleCUnit2],
[SCALE_D_UNIT_1] AS [ScaleDUnit1],
[SCALE_D_UNIT_2] AS [ScaleDUnit2],
[USERID] AS [UserID],
[VEHICLE] AS [Vehicle],
[WEIGHING_TYPE] AS [WeighingType],
[WEIGHT_1] AS [Weight1],
[WEIGHT_2] AS [Weight2],
[SCALE_D_WEIGHT_1] AS [ScaleDWeight1],
[SCALE_D_WEIGHT_2] AS [ScaleDWeight2],
[SCALE_C_WEIGHT_1] AS [ScaleCWeight1],
[SCALE_C_WEIGHT_2] AS [ScaleCWeight2],
[SCALE_B_WEIGHT_1] AS [ScaleBWeight1],
[SCALE_B_WEIGHT_2] AS [ScaleBWeight2],
[EXTRACTED_QUANTITY] AS [ExtractedQuantity],
[NET] AS [Net],
[SCALE_A_WEIGHT_1] AS [ScaleAWeight1],
[SCALE_A_WEIGHT_2] AS [ScaleAWeight2],
[NOTES] AS [Notes],
[TIMESTAMP_1] AS [Timestamp1],
[TIMESTAMP_2] AS [Timestamp2],
[DATASYNC] AS [DataSync],
[CHANGED] AS [Changed]
FROM 
[winweigh].[Flexpoint].[SCALE_DATA] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_WinWeigh_Rep_ScaleData]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_WinWeigh_Rep_ScaleData] as
SELECT
	ISNULL(WO.[Part],'')					AS [Part],
	ISNULL(P.[Description1],'') + CASE ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END AS [PartDescription],
	ISNULL(WO.[CustomerCode],'')			AS [Customer],
	ISNULL(C.[Name],'')						AS [CustomerName],
	SD.[ID]									AS [WeighID],
	CASE SD.[TerminalNo]
		WHEN 1 THEN 'Bonded'
		WHEN 2 THEN 'Non-Bonded'
		ELSE 'Unknown'
	END										AS [Scale],
	isnull(WO.[WorksOrderNo],'')			AS [WONumber],
	ISNULL(WO.[OriginalQty],0)						AS [WOQuantity],
	CONVERT(INT,isnull(WO.[SalesOrder],0))	AS [SONumber],
	SD.[SeqNo1]								AS [SeqNo],
	SD.[Timestamp1]							AS [DateTime],
	SD.[Weight1]							AS [Weight],
	(SELECT SUM([Weight1]) FROM [vw_WinWeigh_ScaleData] WHERE [Field1] = SD.[Field1] AND [SeqNo1] <= SD.[SeqNo1] AND [Timestamp1] <= SD.[Timestamp1]) AS [RolledWeight],
	ISNULL(SD.[Notes],'')					AS [Note]
FROM
				[vw_WinWeigh_ScaleData]		SD
LEFT OUTER JOIN	[vw_ASC_LIVE_WorksOrders]	WO	ON	WO.[WorksOrderNo]	= CONVERT(VARCHAR(10),CONVERT(INT,ISNULL(SD.[Field1],0)))	COLLATE Latin1_General_CI_AS
LEFT OUTER JOIN	[vw_ASC_LIVE_Customers]		C	ON	C.[Code]			= WO.[CustomerCode] COLLATE Latin1_General_CI_AS
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]			P	ON	P.[Part]			= WO.[Part]
WHERE
	ISNUMERIC(SD.[Field1]) = 1
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_StockHistory]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ASC_LIVE_Rep_StockHistory] as
SELECT
	[Part],
	[ActionTypeCode]		AS [Type],
	[ActionType]			AS [TypeArea],
	[ActionDescription]		AS [TypeDesc],
	[Quantity],
	[PhysicalAfter]			AS [Balance],
	[WorksOrderNo]			AS [WO_PO_SO],
	[DeliveryNote]			AS [DespatchReq],
	[Date],
	[ValueAtStdorLatest]	AS [TransactionValue],
	[Reason],
	[ActionedBy],
	[User],
	[Comment]				AS [AdjustmentComments],
	[OrderType]
FROM 
	[vw_ASC_LIVE_History]
GO
/****** Object:  Table [dbo].[Tb_CoA_Questions]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_CoA_Questions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ParentID] [int] NULL,
	[MasterParentID] [int] NULL,
	[Name] [varchar](255) NOT NULL,
	[Notes] [varchar](255) NULL,
	[Specification] [varchar](255) NOT NULL,
	[Encoded] [varchar](255) NOT NULL,
	[Redundant] [bit] NOT NULL,
 CONSTRAINT [PK_Tb_CoA_Questions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_CoA_Questions]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  VIEW [dbo].[vw_HICS_CoA_Questions] AS
SELECT
	Q.[ID],
    Q.[CreatedOn],
	U1.[FullName]				AS [CreatedBy],
    Q.[ModifiedOn],
    U2.[FullName]				AS [ModifiedBy],
    Q.[Enabled],
    Q.[Name],
    Q.[Notes],
    Q.[Specification],
    Q.[Encoded],
    Q.[Redundant]
  FROM 
				[Tb_CoA_Questions]	Q WITH (NOLOCK)
LEFT OUTER JOIN [vw_HICS_Users]		U1	ON	Q.[CreatedBy]	= U1.[ID]
LEFT OUTER JOIN [vw_HICS_Users]		U2	ON	Q.[ModifiedBy]	= U2.[ID]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_OrderDelAdd]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_OrderDelAdd] as
SELECT 
	[CDL_UNIQUE]			AS [ID],
    [CDL_SOURCE_IND]		AS [SourceID],
    [CDL_CREATED]			AS [CreatedOn],
    [CDL_UPDATED]			AS [ModifiedOn],
    [CDL_OUR]			COLLATE Latin1_General_CI_AS	AS [OrderRef],
    [CDL_NAME]			COLLATE Latin1_General_CI_AS	AS [CustomerName],
    [CDL_ADD_1]			COLLATE Latin1_General_CI_AS	AS [AddLine1],
    [CDL_ADD_2]			COLLATE Latin1_General_CI_AS	AS [AddLine2],
    [CDL_ADD_3]			COLLATE Latin1_General_CI_AS	AS [AddLine3],
    [CDL_ADD_4]			COLLATE Latin1_General_CI_AS	AS [AddLine4],
    [CDL_DEL_TEL]		COLLATE Latin1_General_CI_AS	AS [Tel],
    [CDL_POSTCODE]		COLLATE Latin1_General_CI_AS	AS [Postcode],
    [CDL_DEL_CONT]		COLLATE Latin1_General_CI_AS	AS [DeliveryContact],
    [CDL_COUNTRY_CODE]	COLLATE Latin1_General_CI_AS	AS [CountryCode],
    [CDL_DEL_FAX]		COLLATE Latin1_General_CI_AS	AS [DeliveryFax],
    [CDL_WH_BIN]		COLLATE Latin1_General_CI_AS	AS [Bin],
    [CDL_CODE_1]		COLLATE Latin1_General_CI_AS	AS [Analysis1],
    [CDL_CODE_2]		COLLATE Latin1_General_CI_AS	AS [Analysis2],
    [CDL_CODE_3]		COLLATE Latin1_General_CI_AS	AS [Analysis3],
    [CDL_CODE_4]		COLLATE Latin1_General_CI_AS	AS [Analysis4],
    [CDL_CODE_5]		COLLATE Latin1_General_CI_AS	AS [Analysis5],
    [CDL_CODE_6]		COLLATE Latin1_General_CI_AS	AS [Analysis6],
    [CDL_CODE_7]		COLLATE Latin1_General_CI_AS	AS [Analysis7],
    [CDL_CODE_8]		COLLATE Latin1_General_CI_AS	AS [Analysis8],
    [CDL_CODE_9]		COLLATE Latin1_General_CI_AS	AS [Analysis9],
    [CDL_CODE_10]		COLLATE Latin1_General_CI_AS	AS [Analysis10],
    [CDL_CONTACT_NAME]	COLLATE Latin1_General_CI_AS	AS [ContactName],
    [CDL_CONTACT_EMAIL]	COLLATE Latin1_General_CI_AS	AS [ContactEmail],
    [CDL_CONTACT_TEL]	COLLATE Latin1_General_CI_AS	AS [DeliveryTel],
    [CDL_CONTACT_FAX]	COLLATE Latin1_General_CI_AS	AS [ContactFax],
    [CDL_TRANS_ROUTE]	COLLATE Latin1_General_CI_AS	AS [TransportCode],
    [CDL_TRANS_DROP]		AS [TransportDrop],
    [CDL_AD_CON_CODE]		AS [AddressConCode],
    [CDL_COUNTRY]		COLLATE Latin1_General_CI_AS	AS [Country],
    [CDL_DOCK_CODE]			AS [DockCode]
FROM 
	[ASC_LIVE].[dbo].[ASC_CDL_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_EDI]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ASC_LIVE_Rep_EDI] as 
SELECT
	T3.[TransportJobID],
	T3.[CustomerOrderRef],
	T3.[OrderNum],
	T3.[CollectionDate],
	T3.[CustomerName],
	T3.[AddLine1],
	T3.[AddLine3],
	T3.[AddLine4],
	T3.[Postcode],
	T3.[CountryCode],
	T3.[DeliveryDate],
	T3.[ONorBy],
	T3.[QuantityType]	AS [Type],
	SUM(T3.[Quantity])	AS [Quantity],
	SUM(T3.[Weight])	AS [Weight],
	T3.[Product],
	T3.[TD],
	T3.[TD_Time],
	T3.[TailLift],
	T3.[TFPAD],
	T3.[TFHC1],
	T3.[AddressConCode],
	(SELECT COUNT(W.[ID]) FROM [Tb_WEDI_Sends] W WHERE W.[OrderNumber] = T3.[OrderNum]) AS [TimesSent],
	(SELECT MAX(W.[CreatedOn]) FROM [Tb_WEDI_Sends] W WHERE W.[OrderNumber] = T3.[OrderNum]) AS [LastSent]
FROM
	(SELECT
		CONVERT(VARCHAR(10),T2.[OrderNum]) + '0' +
		CASE T2.[QuantityType]
			WHEN 'PALLETS' THEN '1'
			WHEN 'DRUMS' THEN '2'
			WHEN 'CANS' THEN '4'
			WHEN 'IBCS' THEN '5'
			WHEN 'CASES' THEN '6'
			ELSE '9'
		END AS [TransportJobID],
		T2.[CustomerOrderRef],
		T2.[OrderNum],
		convert(varchar(4),year(T2.[ExpectedDueDate])) + '-' + right('00' + convert(varchar(2),month(T2.[ExpectedDueDate])),2) + '-' + right('00' + convert(varchar(2),day(T2.[ExpectedDueDate])),2) as [CollectionDate],
		T2.[CustomerName],
		T2.[AddLine1],
		T2.[AddLine3],
		T2.[AddLine4],
		T2.[Postcode],
		T2.[CountryCode],
		convert(varchar(4),year(T2.[CustomerDue])) + '-' + right('00' + convert(varchar(2),month(T2.[CustomerDue])),2) + '-' + right('00' + convert(varchar(2),day(T2.[CustomerDue])),2) as [DeliveryDate],
		T2.[Analysis6] AS [ONorBY],
		T2.[QuantityType],
		T2.[Quantity],
		T2.[Weight],
		T2.[Hazardous],
		CASE
			WHEN T2.[Hazardous] = 1 THEN CONVERT(varchar(50),FLOOR(ISNULL(NULLIF(LTRIM(RTRIM(T2.[UNNO])),''),0))) + '_' + CONVERT(varchar(50),CONVERT(DECIMAL(10,2),ROUND(T2.[QuantityOrdered],2))) + '-' + CONVERT(VARCHAR(50),T2.[UoM])
			ELSE ''
		END AS [Product],
		T2.[TD],
		T2.[TD_Time],
		T2.[TailLift],
		T2.[TFPAD],
		T2.[TFHC1],
		T2.[AddressConCode]
	FROM
		(SELECT 
			T1.[OrderNum],
			CASE
				WHEN T1.[Analysis2] IN ('CANS','CASES','C25') AND T1.[QuantityDelivered] < 5 THEN 'PARCELS'
				WHEN T1.[Analysis2] IN ('CANS','CASES','C25') AND T1.[QuantityDelivered] < 5 AND T1.[Weight] < 500 THEN 'HALF PALLETS'
				WHEN T1.[Analysis2] IN ('MIXED PALLETS','PALLETISED','NO OVERHANG','BAGS ON DRUM','DRUMS') THEN 'PALLETS'
				WHEN T1.[Analysis2] = '' THEN 'UNSPECIFIED'
				ELSE T1.[Analysis2] 
			END [QuantityType],
			CEILING(CASE 
				WHEN T1.[Analysis2] IN ('CANS','CASES') AND T1.[Weight] < 200 THEN T1.[Outstanding]
				WHEN T1.[Analysis2] IN ('CANS','CASES') AND T1.[Weight] >= 200 THEN CASE 
																						WHEN T1.[QuantityPerPallet] > 0 THEN T1.[Outstanding] / T1.[QuantityPerPallet]
																						ELSE T1.[Outstanding]
																					END
				WHEN T1.[Analysis2] IN ('MIXED PALLETS') THEN	CASE 
																	WHEN T1.[QuantityPerPallet] > 0 THEN T1.[Outstanding] / T1.[QuantityPerPallet]
																	ELSE T1.[Outstanding]
																END
				WHEN T1.[Analysis2] IN ('PALLETISED') THEN	CASE 
																WHEN T1.[QuantityPerPallet] > 0 THEN T1.[Outstanding] / T1.[QuantityPerPallet]
																ELSE T1.[Outstanding]
															END
				WHEN T1.[Analysis2] IN ('BAGS ON DRUM') THEN 0
				WHEN T1.[QuantityPerPallet] > 0 THEN T1.[Outstanding] / T1.[QuantityPerPallet]
				ELSE T1.[Outstanding]
			END) AS [Quantity],
			T1.[CustomerOrderRef],
			T1.[ExpectedDueDate],
			T1.[CustomerName],
			T1.[AddLine1],
			T1.[AddLine3],
			T1.[AddLine4],
			T1.[Postcode],
			T1.[CountryCode],
			T1.[CustomerDue],
			T1.[Analysis6],
			CONVERT(INT,ROUND(T1.[Weight],0)) AS [Weight],
			T1.[Hazardous],
			T1.[UNNO],
			T1.[QuantityOrdered],
			T1.[UoM],
			T1.[TD],
			T1.[TD_Time],
			T1.[TailLift],
			T1.[TFPAD],
			CASE T1.[Hazardous]
				WHEN 1 THEN 'yes'
				ELSE 'no'
			END AS [TFHC1],
			T1.[AddressConCode]
		FROM
			(SELECT
				O.[OrderNum],
				(O.[QuantityOrdered] - O.[QuantityDelivered]) AS [Outstanding],
				(O.[QuantityOrdered] - O.[QuantityDelivered]) * 
				(CASE P.[WeightPer]
					WHEN 0 THEN P.[Weight]
					ELSE P.[Weight] / P.[WeightPer]
				END) AS [Weight],
				O.[Analysis2],
				O.[QuantityDelivered],
				O.[CustomerOrderRef],
				O.[ExpectedDueDate],
				D.[CustomerName],
				D.[AddLine1],
				D.[AddLine3],
				D.[AddLine4],
				D.[Postcode],
				D.[CountryCode],
				O.[CustomerDue],
				O.[Analysis6],
				P.[QuantityPerPallet],
				CASE 
					WHEN CONVERT(INT,ISNULL(P.[AllocRule2],0)) IN (1,2,3,4) THEN 1
					ELSE 0
				END AS [Hazardous],
				P.[AllocRule1] AS [UNNO],
				O.[QuantityOrdered],
				P.[UoM],
				CASE ISNULL(LTRIM(RTRIM(O.[Analysis10])),'')
					WHEN '' THEN 'no'
					ELSE 'yes'
				END AS [TD],
				ISNULL(LTRIM(RTRIM(O.[Analysis10])),'') AS [TD_Time],
				CASE
					WHEN D.[TransportCode] = '' AND C4.[TransRoute] = 'TFTL' THEN 'yes'
					WHEN D.[TransportCode] = 'TFTL' THEN 'yes'
					ELSE 'no'
				END AS [TailLift],
				CASE C4.[Analysis5] 
					WHEN 'Y' Then 'yes'
					ELSE 'no'
				END AS [TFPAD],
				D.[AddressConCode]
			FROM 
							[vw_ASC_LIVE_Orders]		O
			LEFT OUTER JOIN [vw_ASC_LIVE_Parts]			P	ON P.[Part] = O.[Part]
			LEFT OUTER JOIN	[vw_ASC_LIVE_SystemCodes]	SC	ON SC.[SystemCode] = P.[SalesUoM]
			LEFT OUTER JOIN [vw_ASC_LIVE_OrderDelAdd]	D	ON D.[OrderRef] = O.[OrderRef]
			LEFT OUTER JOIN [vw_ASC_LIVE_Customers]		C	ON C.[Code] = O.[CustomerCode] collate Latin1_General_CI_AS
			LEFT OUTER JOIN [vw_ASC_LIVE_Customers4]	C4	ON C4.[CustomerCode] = O.[CustomerCode]
			WHERE 
				O.[OrderType] NOT IN ('ST','ZP')
			AND O.[Status] NOT IN ('C','H')
			AND LEFT(O.[Part],1) IN ('D','F','G','L','P')
			AND O.[Analysis2] <> 'OTHER HAULIER'
			AND O.[CustomerDue] > '01/Jan/2015'
			AND O.[Analysis7] = 'NEW'
			AND LTRIM(RTRIM(SC.[TypeCode])) = 'Y'
			AND CASE D.[TransportCode]
					WHEN '' THEN LEFT(C4.[TransRoute],2)
					ELSE LEFT(D.[TransportCode],2)
				END = 'TF'
			AND (O.[QuantityOrdered] - O.[QuantityDelivered]) > 0
			) T1) T2 ) T3
GROUP  BY
	T3.[TransportJobID],
	T3.[CustomerOrderRef],
	T3.[OrderNum],
	T3.[CollectionDate],
	T3.[CustomerName],
	T3.[AddLine1],
	T3.[AddLine3],
	T3.[AddLine4],
	T3.[Postcode],
	T3.[CountryCode],
	T3.[DeliveryDate],
	T3.[ONorBy],
	T3.[QuantityType],
	T3.[Product],
	T3.[TD],
	T3.[TD_Time],
	T3.[TailLift],
	T3.[TFPAD],
	T3.[TFHC1],
	T3.[AddressConCode]
GO
/****** Object:  Table [dbo].[Tb_CoA_TestAnswers]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_CoA_TestAnswers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkTestID] [int] NOT NULL,
	[LnkQuestionID] [int] NOT NULL,
	[Result] [varchar](512) NULL,
	[Passed] [bit] NOT NULL,
 CONSTRAINT [PK_Tb_CoA_TestAnswers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_CoA_TestAnswers]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vw_HICS_CoA_TestAnswers] AS
SELECT 
	TA.[ID],
    TA.[CreatedOn],
    U1.[FullName]		AS [CreatedBy],
    TA.[ModifiedOn],
    U2.[FullName]		AS [ModifiedBy],
    TA.[LnkTestID],
    TA.[LnkQuestionID],
    TA.[Result],
    TA.[Passed]
 FROM 
				[Tb_CoA_TestAnswers]	TA WITH (NOLOCK)
LEFT OUTER JOIN [vw_HICS_Users]			U1	ON	TA.[CreatedBy]	= U1.[ID]
LEFT OUTER JOIN [vw_HICS_Users]			U2	ON	TA.[ModifiedBy]	= U2.[ID]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_ChivaStock]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_Rep_ChivaStock] as
SELECT distinct
P.[Part] AS [HaymanPart],
P.[Drawing] AS [ChivasPart],
P.[PhysicalStockLevel] AS [QtyCases],
SUM(CASE
WHEN L.[Warehouse] IN ('RQ', 'WQ') THEN L.[Quantity]
ELSE 0
END) AS [QFlag],
P.[PhysicalStockLevel] -
SUM(CASE
WHEN L.[Warehouse] IN ('RQ', 'WQ') THEN L.[Quantity]
ELSE 0
END) AS [FreeStock]
FROM
[vw_ASC_LIVE_Parts] P
LEFT OUTER JOIN [vw_ASC_LIVE_Lots] L ON P.[Part] = L.[Part]
WHERE
P.[Analysis3] = '309'
AND P.[ProcurementCode] <> '0'
AND LEFT(P.[Part],1) <> 'E'
AND NOT P.[Part] IN ('F201091', 'P800832', 'P800617', 'P800774', 'L700269', 'L700242', 'R201090', 'P800276', 'P800265', 'P800348')
AND P.[PhysicalStockLevel] <> 0
GROUP BY
P.[Part],
P.[Drawing],
P.[PhysicalStockLevel]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_CoA_QuestionAnswers]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_HICS_Rep_CoA_QuestionAnswers] as
SELECT 
	Q.[Name]			AS [Question],
	Q.[Specification],
	TA.[ModifiedOn]		AS [ResultDateTime],
	TA.[Result],
	TA.[Passed]			AS [ResultPassed]
FROM 
				vw_HICS_CoA_Questions	Q
LEFT OUTER JOIN	vw_HICS_CoA_TestAnswers	TA	ON Q.[ID]	= TA.[LnkQuestionID]
WHERE
	NOT NULLIF(TA.[Result],'') IS NULL


GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Attributes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vw_ASC_LIVE_Attributes] as
SELECT 
	[ATR_UNIQUE]			AS [ID],
	[ATR_SOURCE_IND]		AS [SourceID],
	[ATR_CREATED]			AS [CreatedOn],
	[ATR_UPDATED]			AS [ModifiedOn],
	[ATR_ATY_LINK_TYPE]		AS [LinkType],
	[ATR_OWNER]	COLLATE Latin1_General_CI_AS			AS [Owner],
	[ATR_ATY_CODE]	COLLATE Latin1_General_CI_AS		AS [Code],
	[ATR_SEQ]				AS [CodeSequence],
	[ATR_GROUP]	COLLATE Latin1_General_CI_AS			AS [Group],
	[ATR_TEXT]	COLLATE Latin1_General_CI_AS			AS [Text],
	[ATR_VALUE]				AS [Value],
	[ATR_DATE]				AS [Date],
	[ATR_PRECISION]			AS [Precision],
	[ATR_UOM]	COLLATE Latin1_General_CI_AS			AS [UoM],
	[ATR_MANDATORY]	COLLATE Latin1_General_CI_AS		AS [Mandatory],
	[ATR_PRINT_FLAG]	COLLATE Latin1_General_CI_AS	AS [PrintFlag],
	[ATR_OUT_RANGE_FLAG] COLLATE Latin1_General_CI_AS	AS [OutOfRange],
	[ATR_SERIAL_NO]	COLLATE Latin1_General_CI_AS		AS [SerialNo],
	[ATR_PART_NUM]	COLLATE Latin1_General_CI_AS		AS [Part],
	[ATR_PART_REV]	COLLATE Latin1_General_CI_AS		AS [PartRev],
	[ATR_LOT]				AS [Lot],
	[ATR_LOT_SUB]			AS [LotSequence],
	[ATR_SPEC_ID]	COLLATE Latin1_General_CI_AS		AS [SpecificationID]
  FROM 
	[ASC_LIVE].[dbo].[ASC_ATR_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_VATForm2]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_ASC_LIVE_Rep_VATForm2] as
SELECT DISTINCT
	L.[Warehouse]												AS [Warehouse],
	L.[SerialNo]												AS [SerialNo],
	L.[Part],
	P.[Description1]+' '+P.[Description2]						AS [Description],
	MAX(L.[Quantity])											AS [Quantity],
	SUM(CASE A.[Code]	WHEN 'BULK'		THEN A.[Value]	END)	AS [Bulk],
	MAX(CASE A.[Code]	WHEN 'STRENGTH' THEN A.[Value]	END)	AS [Strength],
	MAX(CASE A.[Code]	WHEN 'TCF'		THEN A.[Value]	END)	AS [TCF]
FROM
				vw_ASC_LIVE_Lots		L
LEFT OUTER JOIN	vw_ASC_LIVE_Attributes	A	ON	L.[Number]	= A.[Lot] 
											AND	L.[Part]	= A.[Part]
LEFT OUTER JOIN vw_ASC_LIVE_Parts		P	ON	L.[Part]	= P.[Part]
WHERE
	L.[Warehouse] <> ''
GROUP BY
	L.[Warehouse],
	L.[SerialNo],
	L.[Part],
	P.[Description1]+' '+P.[Description2]
GO
/****** Object:  Table [dbo].[Tb_TransportData]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_TransportData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[SentOn] [datetime] NULL,
	[Filename] [varchar](255) NOT NULL,
	[OrderNum] [varchar](10) NOT NULL,
	[Part] [varchar](10) NOT NULL,
	[Customer Ref] [varchar](250) NOT NULL,
	[Collection Date] [varchar](10) NOT NULL,
	[Collection Name] [varchar](250) NOT NULL,
	[Collection Addr 1] [varchar](250) NOT NULL,
	[Collection Addr 2] [varchar](250) NOT NULL,
	[Collection Addr 3] [varchar](250) NOT NULL,
	[Collection Town] [varchar](250) NOT NULL,
	[Collection County] [varchar](250) NOT NULL,
	[Collection Country] [varchar](250) NOT NULL,
	[Collection PostCode] [varchar](250) NOT NULL,
	[Collection Contact] [varchar](250) NOT NULL,
	[Collection Telephone] [varchar](250) NOT NULL,
	[Collection Time] [varchar](5) NOT NULL,
	[Collection Notes] [varchar](250) NOT NULL,
	[Delivery Date] [varchar](10) NOT NULL,
	[Delivery Name] [varchar](250) NOT NULL,
	[Delivery Address 1] [varchar](250) NOT NULL,
	[Delivery Address 2] [varchar](250) NOT NULL,
	[Delivery Address 3] [varchar](250) NOT NULL,
	[Delivery Town] [varchar](250) NOT NULL,
	[Delivery County] [varchar](250) NOT NULL,
	[Delivery Country] [varchar](250) NOT NULL,
	[Delivery PostCode] [varchar](250) NOT NULL,
	[Delivery Contact] [varchar](250) NOT NULL,
	[Del Phone] [varchar](250) NOT NULL,
	[Del Mobile] [varchar](250) NOT NULL,
	[Del Time] [varchar](5) NOT NULL,
	[Del Notes] [varchar](250) NOT NULL,
	[Cust Paperwork] [varchar](3) NOT NULL,
	[Service Code] [varchar](250) NOT NULL,
	[Surcharges] [varchar](250) NOT NULL,
	[Pallet Type A] [varchar](250) NOT NULL,
	[Type A Quantity] [varchar](250) NOT NULL,
	[Type A Weight] [varchar](250) NOT NULL,
	[Pallet Type B] [varchar](250) NOT NULL,
	[Type B Quantity] [varchar](250) NOT NULL,
	[Pallet Type B Weight] [varchar](250) NOT NULL,
	[Pallet Type C] [varchar](250) NOT NULL,
	[Type C Quantity] [varchar](250) NOT NULL,
	[Pallet Type C Weight] [varchar](250) NOT NULL,
	[Goods Desc] [varchar](250) NOT NULL,
	[UN No.] [varchar](4) NOT NULL,
	[Del Email] [varchar](250) NOT NULL,
	[Volume] [varchar](250) NOT NULL,
	[Job Type] [varchar](250) NOT NULL,
	[Haz Tunnel Code] [varchar](3) NOT NULL,
	[Haz Packin] [varchar](250) NOT NULL,
	[Haz Weigh] [varchar](250) NOT NULL,
	[Haz Quantity] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Tb_TransportData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_TransportData]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_HICS_Rep_TransportData] as 
SELECT TOP 100 PERCENT 
	'"' + T1.[Account Code] + '"' AS [Account Code],
	'"' + T1.[Customer Ref] + '"' AS [Customer Ref],
	'"' + T1.[Collection Date] + '"' AS [Collection Date],
	'"' + T1.[Collection Name] + '"' AS [Collection Name],
	'"' + T1.[Collection Addr 1] + '"' AS [Collection Addr 1],
	'"' + T1.[Collection Addr 2] + '"' AS [Collection Addr 2],
	'"' + T1.[Collection Addr 3] + '"' AS [Collection Addr 3],
	'"' + T1.[Collection Town] + '"' AS [Collection Town],
	'"' + T1.[Collection County] + '"' AS [Collection County],
	'"' + T1.[Collection Country] + '"' AS [Collection Country],
	'"' + T1.[Collection PostCode] + '"' AS [Collection PostCode],
	'"' + T1.[Collection Contact] + '"' AS [Collection Contact],
	'"' + T1.[Collection Telephone] + '"' AS [Collection Telephone],
	'"' + T1.[Collection Time] + '"' AS [Collection Time],
	'"' + T1.[Collection Notes] + '"' AS [Collection Notes],
	'"' + T1.[Delivery Date] + '"' AS [Delivery Date],
	'"' + T1.[Delivery Name] + '"' AS [Delivery Name],
	'"' + T1.[Delivery Address 1] + '"' AS [Delivery Address 1],
	'"' + T1.[Delivery Address 2] + '"' AS [Delivery Address 2],
	'"' + T1.[Delivery Address 3] + '"' AS [Delivery Address 3],
	'"' + T1.[Delivery Town] + '"' AS [Delivery Town],
	'"' + T1.[Delivery County] + '"' AS [Delivery County],
	'"' + T1.[Delivery Country] + '"' AS [Delivery Country],
	'"' + T1.[Delivery PostCode] + '"' AS [Delivery PostCode],
	'"' + T1.[Delivery Contact] + '"' AS [Delivery Contact],
	'"' + T1.[Del Phone] + '"' AS [Del Phone],
	'"' + T1.[Del Mobile] + '"' AS [Del Mobile],
	'"' + T1.[Del Time] + '"' AS [Del Time],
	'"' + T1.[Del Notes] + '"' AS [Del Notes],
	'"' + T1.[Cust Paperwork] + '"' AS [Cust Paperwork],
	'"' + T1.[Service Code] + '"' AS [Service Code],
	'"' + T1.[Surcharges] + '"' AS [Surcharges],
	'"' + T1.[Pallet Type A] + '"' AS [Pallet Type A],
	'"' + T1.[Type A Quantity] + '"' AS [Type A Quantity],
	'"' + T1.[Type A Weight] + '"' AS [Type A Weight],
	'"' + T1.[Pallet Type B] + '"' AS [Pallet Type B],
	'"' + T1.[Type B Quantity] + '"' AS [Type B Quantity],
	'"' + T1.[Pallet Type B Weight] + '"' AS [Pallet Type B Weight],
	'"' + T1.[Pallet Type C] + '"' AS [Pallet Type C],
	'"' + T1.[Type C Quantity] + '"' AS [Type C Quantity],
	'"' + T1.[Pallet Type C Weight] + '"' AS [Pallet Type C Weight],
	'"' + T1.[Goods Desc] + '"' AS [Goods Desc],
	'"' + T1.[UN No.] + '"' AS [UN No.],
	'"' + T1.[Del Email] + '"' AS [Del Email],
	'"' + T1.[Volume] + '"' AS [Volume],
	'"' + T1.[Job Type] + '"' AS [Job Type],
	'"' + T1.[Haz Tunnel Code] + '"' AS [Haz Tunnel Code],
	'"' + T1.[Haz Packin] + '"' AS [Haz Packin],
	'"' + T1.[Haz Weigh] + '"' AS [Haz Weigh],
	'"' + T1.[Haz Quantity] + '"' AS [Haz Quantity]
FROM
	(SELECT
		0 AS [ID],
		'Account Code'				AS [Account Code],
		'Customer Ref'				AS [Customer Ref],
		'Collection Date'			AS [Collection Date],
		'Collection Name'			AS [Collection Name],
		'Collection Addr 1'			AS [Collection Addr 1],
		'Collection Addr 2'			AS [Collection Addr 2],
		'Collection Addr 3'			AS [Collection Addr 3],
		'Collection Town'			AS [Collection Town],
		'Collection County'			AS [Collection County],
		'Collection Country'		AS [Collection Country],
		'Collection PostCode'		AS [Collection PostCode],
		'Collection Contact'		AS [Collection Contact],
		'Collection Telephone'		AS [Collection Telephone],
		'Collection Time'			AS [Collection Time],
		'Collection Notes'			AS [Collection Notes],
		'Delivery Date'				AS [Delivery Date],
		'Delivery Name'				AS [Delivery Name],
		'Delivery Address 1'		AS [Delivery Address 1],
		'Delivery Address 2'		AS [Delivery Address 2],
		'Delivery Address 3'		AS [Delivery Address 3],
		'Delivery Town'				AS [Delivery Town],
		'Delivery County'			AS [Delivery County],
		'Delivery Country'			AS [Delivery Country],
		'Delivery PostCode'			AS [Delivery PostCode],
		'Delivery Contact'			AS [Delivery Contact],
		'Del Phone'					AS [Del Phone],
		'Del Mobile'				AS [Del Mobile],
		'Del Time'					AS [Del Time],
		'Del Notes'					AS [Del Notes],
		'Cust Paperwork'			AS [Cust Paperwork],
		'Service Code'				AS [Service Code],
		'Surcharges'				AS [Surcharges],
		'Pallet Type A'				AS [Pallet Type A],
		'Type A Quantity'			AS [Type A Quantity],
		'Type A Weight'				AS [Type A Weight],
		'Pallet Type B'				AS [Pallet Type B],
		'Type B Quantity'			AS [Type B Quantity],
		'Pallet Type B Weight'		AS [Pallet Type B Weight],
		'Pallet Type C'				AS [Pallet Type C],
		'Type C Quantity'			AS [Type C Quantity],
		'Pallet Type C Weight'		AS [Pallet Type C Weight],
		'Goods Desc'				AS [Goods Desc],
		'UN No.'					AS [UN No.],
		'Del Email'					AS [Del Email],
		'Volume'					AS [Volume],
		'Job Type'					AS [Job Type],
		'Haz Tunnel Code'			AS [Haz Tunnel Code],
		'Haz Packin'				AS [Haz Packin],
		'Haz Weigh'					AS [Haz Weigh],
		'Haz Quantity'				AS [Haz Quantity]
	UNION
	SELECT
		[ID],
		'HAY001'				AS [Account Code],
		[Customer Ref],
		[Collection Date],
		[Collection Name],
		[Collection Addr 1],
		[Collection Addr 2],
		[Collection Addr 3],
		[Collection Town],
		[Collection County],
		[Collection Country],
		[Collection PostCode],
		[Collection Contact],
		[Collection Telephone],
		[Collection Time],
		[Collection Notes],
		[Delivery Date],
		[Delivery Name],
		[Delivery Address 1],
		[Delivery Address 2],
		[Delivery Address 3],
		[Delivery Town],
		[Delivery County],
		[Delivery Country],
		[Delivery PostCode],
		[Delivery Contact],
		[Del Phone],
		[Del Mobile],
		[Del Time],
		[Del Notes],
		[Cust Paperwork],
		[Service Code],
		[Surcharges],
		[Pallet Type A],
		[Type A Quantity],
		[Type A Weight],
		[Pallet Type B],
		[Type B Quantity],
		[Pallet Type B Weight],
		[Pallet Type C],
		[Type C Quantity],
		[Pallet Type C Weight],
		[Goods Desc],
		[UN No.],
		[Del Email],
		[Volume],
		[Job Type],
		[Haz Tunnel Code],
		[Haz Packin],
		[Haz Weigh],
		[Haz Quantity]
	FROM
		[Tb_TransportData] WITH (NOLOCK)
	WHERE
		[SentOn] IS NULL) T1
ORDER BY 
	T1.[ID]
GO
/****** Object:  Table [dbo].[Tb_CoA_PartMaps]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_CoA_PartMaps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkProductID] [int] NOT NULL,
	[ShelfLife] [int] NOT NULL,
 CONSTRAINT [PK_Tb_CoA_PartMaps] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_CoA_PartMaps_Naming]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_CoA_PartMaps_Naming](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkProductID] [int] NOT NULL,
	[LnkCustomer] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Tb_CoA_PartMaps_Naming] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_CoA_PartMap]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vw_HICS_Rep_CoA_PartMap] as
SELECT
	T1.[LnkProductID] AS [ProductID],
	P.[Part] + CASE P.[Description1] 
				WHEN '' THEN ''
				ELSE ': ' + LTRIM(RTRIM(P.[Description1] + ' ' + P.[Description2]))
			   END AS [Part],
	T1.[ShelfLife],
	T1.[Namings]
FROM
	(select 
		PM.[LnkProductID],
		CONVERT(VARCHAR(10),PM.[ShelfLife]) AS [ShelfLife],
		CASE (SELECT COUNT([ID]) FROM [Tb_CoA_PartMaps_Naming] WHERE [LnkProductID] = PM.[LnkProductID] AND [Deleted] = 0)
			WHEN 0 THEN 'No'
			ELSE 'Yes'
		END AS [Namings],
		'No' AS [HasSL]
	from 
		[Tb_CoA_PartMaps]	PM WITH (NOLOCK)
	UNION
	select 
		PMN.[LnkProductID],
		'' [ShelfLife],
		'Yes' [Namings],
		CASE (SELECT COUNT([ID]) FROM [Tb_CoA_PartMaps] WHERE [LnkProductID] = PMN.[LnkProductID])
			WHEN 0 THEN 'No'
			ELSE 'Yes'
		END AS [HasSL]
	from 
					[Tb_CoA_PartMaps_Naming]	PMN WITH (NOLOCK)
	WHERE
		PMN.[Deleted] = 0)					T1
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]			P ON P.[ID] = T1.[LnkProductID]
WHERE
	T1.[HasSL] = 'No'
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_WorksOrdersPrints]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[vw_ASC_LIVE_WorksOrdersPrints] AS
SELECT 
	[PNW_UNIQUE]										AS [ID],
	[PNW_SOURCE_IND]									AS [SourceID],
	[PNW_CREATED]										AS [CreatedOn],
	[PNW_UPDATED]										AS [ModifiedOn],
	[PNW_USER_SLOT_NO]									AS [UserSlotNo],
	[PNW_WO_NUMBER]		COLLATE Latin1_General_CI_AS	AS [WoNumber],
	[PNW_DUE_DATE]										AS [DueDate],
	[PNW_USER]			COLLATE Latin1_General_CI_AS	AS [User]
FROM 
	[ASC_LIVE].[dbo].[ASC_PNW_TBL] WITH (NOLOCK)
GO
/****** Object:  Table [dbo].[Tb_SupplyChain_Links]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SupplyChain_Links](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkUserID] [int] NOT NULL,
	[LnkSYS_PEOPLE_PP_CODE] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Tb_SupplyChain_Links] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_SupplyChainUserLinks]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_HICS_SupplyChainUserLinks] as 
select 
	ID,
	CreatedOn,
	CreatedBy,
	LnkUserID,
	LnkSYS_PEOPLE_PP_CODE
from 
Tb_SupplyChain_Links WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_ProductionCardData]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_Rep_ProductionCardData]
as
select 
	WO.[WorksOrderNo]												AS [WONum],
	WOP.[UserSlotNo]												AS [UserSlot],
	U.[FullName]													AS [Who],
	'\\asc01\Files\Parts\' + P_WO.[part] + '\PC_Logo.png'			AS [PC_Logo],
	WO.[Part]														AS [WOPart],
	RTRIM(P_WO.[Description1] + ' ' + P_WO.[Description2])			AS [WO_Part],
	(select MAX([Part]) from [vw_ASC_LIVE_Kit] where [WorksOrderNo] = WO.[WorksOrderNo] AND LEFT([Part],1) = 'B' ) AS [Spirit],
	P_WO.[AllocTolerance]											AS [WO_Strength],
	P_WO.[Analysis2] + CASE 
								WHEN LTRIM(RTRIM(ISNULL(AC.[AnalysisDescription],''))) = '' THEN ''
								ELSE ': ' + LTRIM(RTRIM(ISNULL(AC.[AnalysisDescription],'')))
							  END									AS [PackType],
	P_WO.[EANCode]													AS [UnitBarcode],
	P_WO.[PartBardcode]												AS [GroupedBarcode]
FROM 
				[vw_ASC_LIVE_WorksOrdersPrints]		WOP		
LEFT OUTER JOIN	[vw_ASC_LIVE_WorksOrders]			WO		ON	WOP.[WoNumber]		= WO.[WorksOrderNo]
LEFT OUTER JOIN [vw_HICS_SupplyChainUserLinks]		SCUL	ON	WOP.[User]			= SCUL.[LnkSYS_PEOPLE_PP_CODE]
LEFT OUTER JOIN	[vw_HICS_Users]						U		ON	SCUL.LnkUserID		= U.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]					P_WO	ON	WO.[Part]			= P_WO.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_AnalysisCodes]			AC		ON  P_WO.[Analysis2]	= AC.[AnalysisCode]
															AND	AC.[TypeCode]		= 'I'
															AND AC.[LabelCode]		= 2
WHERE 
	NOT WO.[WorksOrderNo] IS NULL
	
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_AA_NL_ENQUIRY_SIMPLE_VIEW]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vw_ASC_LIVE_AA_NL_ENQUIRY_SIMPLE_VIEW]
 AS
SELECT [DET_PRIMARY]
      ,[PRIMARY]
      ,[DET_BATCH_REF]
      ,[DET_SUB_LEDGER]
      ,[DET_DATE]
      ,[DET_NOM_PERSORT]
      ,[DET_HEADER_REF]
      ,[DET_CURR_CODE]
      ,[DET_HEADER_KEY]
      ,[DET_BATCH_FLAG]
      ,[DET_RECUR_FLAG]
      ,[DET_CURR_RATE]
      ,[DET_JNL_LINEREF]
      ,[DET_ORIGIN]
      ,[DET_TYPE]
      ,[DET_NOM_PERIOD]
      ,[DET_NOM_YEAR]
      ,[DET_USER_PUTIN]
      ,[DET_DATE_PUTIN]
      ,[DET_VAT_RULES]
      ,[DET_NOMINALDR]
      ,[DET_NOMINALCR]
      ,[DET_NOMINALVAT]
      ,[DET_ACCOUNT]
      ,[DET_ANALYSIS]
      ,[DET_COSTCENTRE]
      ,[DET_COSTHEADER]
      ,[DET_GROSS]
      ,[DET_VAT]
      ,[DET_NETT]
      ,[DET_CURR_TAX]
      ,[DET_CURR_NETT]
      ,[DET_ANALTYPE]
      ,[DET_CHEQUE_PAYEE]
      ,[DET_TRI_RATE1]
      ,[DET_TRI_RATE2]
      ,[DET_DESCRIPTION]
      ,[DET_GROSS_BASE2]
      ,[DET_RECON_REF]
      ,[DET_PL_INTERNAL]
      ,[DET_TRI_RATECHNG1]
      ,[DET_TRI_RATECHNG2]
      ,[DET_CURR_RTEFLG]
      ,[DET_ORDER_LINK]
      ,[DET_RECONCILED]
      ,[DET_STOCK_CODE]
      ,[DET_PRICE_CODE]
      ,[HOME_DEBIT]
      ,[CURRENCY_DEBIT]
      ,[BASE2_DEBIT]
      ,[HOME_CREDIT]
      ,[CURRENCY_CREDIT]
      ,[BASE2_CREDIT]
      ,[DET_INCOME]
      ,[DET_EXPENSES]
      ,[NOMINAL_TYPE]
      ,[NCODE]
      ,[NNAME]
      ,[NCURRENCYCODE]
      ,[NTYPE]
      ,[NCATEGORYCODE1]
      ,[NCATEGORYCODE2]
      ,[NCATEGORYCODE3]
      ,[NCATEGORYCODE4]
      ,[NCATEGORYCODE5]
      ,[NCATEGORYCODE6]
      ,[NCATEGORYCODE7]
      ,[NCATEGORYCODE8]
      ,[NMAJORHEADCODE]
      ,[N_EXCLUDE_TRNREP]
      ,[DET_QUANTITY]
      ,[DET_DIMENSION1]
      ,[DET_DIMENSION2]
      ,[DET_DIMENSION3]
      ,[N_DO_NOT_USE]
      ,[DET_AUDIT_NUMBER]
      ,[DET_HEADER_NO]
      ,[NBALANCE]
      ,[NBALANCE_C]
      ,[DET_HEADER_SL_LINK]
      ,[DET_HEADER_PL_LINK]
      ,[DET_HEADER_NL_LINK]
      ,[DET_HEADER_LINK]
      ,[USER_SORT1]
      ,[USER_SORT2]
      ,[USER_SORT3]
      ,[NAME]
      ,[ACCOUNT_PRIMARY]
      ,[DET_LEDGER]
      ,[N_PRIMARY]
      ,[OrderNumber]
      ,[CUCODE]
      ,[CUNAME]
      ,[SUCODE]
      ,[SUNAME]
      ,[DET_RM_REVERSE_FLAG]
      ,[DET_POSTING_NO]
  FROM [ASC_LIVE].[dbo].[AA_NL_ENQUIRY_SIMPLE_VIEW] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_AA_NL_TRANSACTION_DETAIL_SIMPLE_VIEW]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vw_ASC_LIVE_AA_NL_TRANSACTION_DETAIL_SIMPLE_VIEW]
 AS 
SELECT [PRIMARY]
      ,[HEADER_PRIMARY]
      ,[DET_AUDIT_NUMBER]
      ,[HOME_DEBIT]
      ,[HOME_CREDIT]
      ,[CURRENCY_DEBIT]
      ,[CURRENCY_CREDIT]
      ,[BASE2_DEBIT]
      ,[BASE2_CREDIT]
      ,[DET_PRIMARY]
      ,[DET_ORIGIN]
      ,[DET_ANALYSIS]
      ,[ANALYSIS_PRIMARY]
      ,[ANALYSIS_NAME]
      ,[DET_ANALTYPE]
      ,[ORDER_ACCOUNT]
      ,[ORDER_ACCOUNT_NAME]
      ,[DELIVERY_ACCOUNT]
      ,[DELIVERY_ACCOUNT_NAME]
      ,[INVOICE_ACCOUNT]
      ,[INVOICE_ACCOUNT_NAME]
      ,[NOMINALDR]
      ,[NOMINALDR_NAME]
      ,[NOMINALCR]
      ,[NOMINALCR_NAME]
      ,[NOMINALVAT]
      ,[NOMINALVAT_NAME]
      ,[DET_VATCODE]
      ,[DET_COSTHEADER]
      ,[PROJECT_NAME]
      ,[CH_PRIMARY]
      ,[DET_COSTCENTRE]
      ,[COSTCENTRE_NAME]
      ,[CC_PRIMARY]
      ,[DET_CHEQUE_PAYEE]
      ,[STOCK_ANALYSIS]
      ,[STOCK_ANALYSIS_NAME]
      ,[STOCK_NOMINALDR]
      ,[STOCK_NOMINALDR_NAME]
      ,[STOCK_NOMINALCR]
      ,[STOCK_NOMINALCR_NAME]
      ,[DET_STOCK_PRICE_CODE]
      ,[STOCK_PRICE_DESCRIPTION]
      ,[DET_COSTPRICE]
      ,[DET_QUANTITY]
      ,[DET_JNL_LINEREF]
      ,[DET_DESCRIPTION]
      ,[DET_DATE]
      ,[DET_HEADER_KEY]
      ,[DET_NOM_PERSORT]
      ,[NCODE]
      ,[DET_HEADER_LINK]
      ,[DET_HEADER_SL_LINK]
      ,[DET_HEADER_PL_LINK]
      ,[DET_HEADER_NL_LINK]
      ,[DET_LEDGER]
      ,[MovementPrimary]
      ,[STK_PRIMARY]
      ,[STK_NON_STOCK]
      ,[DET_CURR_CODE]
      ,[PROFILELEVEL]
      ,[DET_ORDER_LINK]
      ,[DET_STOCK_CODE]
      ,[DET_PRICE_CODE]
  FROM [ASC_LIVE].[dbo].[AA_NL_TRANSACTION_DETAIL_SIMPLE_VIEW] WITH (NOLOCK)
  --WHERE
	--[DET_DATE] >= CAST('01/Apr/' + CAST((YEAR(sysdatetime())-2) AS VARCHAR(4)) AS datetime)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_NominalTransactions]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_Rep_NominalTransactions] as
SELECT * FROM (
SELECT 
	T1.[Nominal],
	T1.[Nominal Name],
	T1.[Date],
	T1.[Period],
	T1.[Year],
	T1.[Origin],	
	T1.[Type],
	T1.[Batched],
	T1.[Reference],
	T1.[Header],
	T1.[GBP Debit],
	T1.[GBP Credit],
	T1.[Supplier],
	T1.[Supplier Name],
	T1.[Customer],
	T1.[Customer Name],
	T.[DET_ANALYSIS]		AS [Analysis Code],
	T.[HOME_DEBIT]			AS [GBP Debit (Item)],
	T.[HOME_CREDIT]			AS [GBP Credit (Item)],
	T.[DET_DESCRIPTION]		AS [Detail],
	T.[DET_AUDIT_NUMBER]	AS [AuditNo]
FROM
	(SELECT
		N.[NCODE]								AS [Nominal],
		N.[NNAME]								AS [Nominal Name],
		--MAX(N.[DET_DATE])						AS [Date],
		N.[DET_DATE]							AS [Date],
		MAX(N.[DET_NOM_PERIOD])					AS [Period],
		MAX(N.[DET_NOM_YEAR])					AS [Year],
		MAX(N.[DET_ORIGIN])						AS [Origin],	
		CASE MAX(N.[DET_TYPE])
			WHEN 'CRN' THEN 'Credit Note'
			WHEN 'INV' THEN 'Invoice'
			WHEN 'JNL' THEN 'Journal'
			WHEN 'VJL' THEN 'VAT Journal'
			ELSE MAX(N.[DET_TYPE])
		END										AS [Type],
		CASE CAST(MAX(N.[DET_BATCH_FLAG]) as bit)
			WHEN 0 THEN ''
			ELSE 'Yes'
		END										AS [Batched],
		MAX(N.[DET_HEADER_REF])					AS [Reference],
		MAX(N.[DET_HEADER_LINK])				AS [Header],
		SUM(N.[HOME_DEBIT])						AS [GBP Debit],
		SUM(N.[HOME_CREDIT])					AS [GBP Credit],
		MAX(N.[SUCODE])							AS [Supplier],
		MAX(N.[SUNAME])							AS [Supplier Name],
		MAX(N.[CUCODE])							AS [Customer],
		MAX(N.[CUNAME])							AS [Customer Name],
		MAX(N.[DET_NOM_PERSORT])				AS [DET_NOM_PERSORT]
	FROM 
		[vw_ASC_LIVE_AA_NL_ENQUIRY_SIMPLE_VIEW]	N
	WHERE 
		N.[DET_BATCH_FLAG] = 0
	AND NOT (N.[DET_BATCH_FLAG] = 1 AND N.[DET_RECUR_FLAG] = 1) 
	AND NOT (N.[DET_HEADER_KEY] IS NULL AND N.[DET_BATCH_FLAG] = 0)
	AND NOT (N.[DET_GROSS] = 0 AND N.[DET_VAT] = 0 AND N.[DET_GROSS_BASE2] = 0 AND (N.[DET_CURR_NETT] + N.[DET_CURR_TAX]) = 0 AND (N.[DET_QUANTITY] = 0 OR N.[NOMINAL_TYPE] = 2))
	--AND N.[DET_DATE] >= CAST('01/Apr/' + CAST((YEAR(sysdatetime())-2) AS VARCHAR(4)) AS datetime)
	GROUP BY
		N.[NCODE],
		N.[NNAME],
		N.[NOMINAL_TYPE],
		N.[DET_DATE],
		N.[DET_HEADER_KEY],
		N.[DET_NOM_PERSORT]) T1
LEFT OUTER JOIN	[VW_ASC_LIVE_AA_NL_TRANSACTION_DETAIL_SIMPLE_VIEW]	T	ON	T.[DET_HEADER_LINK]			= T1.[Header]
																		AND	T.[NCODE]					= T1.[Nominal]
																		AND T.[DET_DATE]				= T1.[Date]
																		AND T.[DET_NOM_PERSORT]			= T1.[DET_NOM_PERSORT]
 WHERE
	(T1.[Origin] = 'P' AND T.[DET_HEADER_PL_LINK] IS NOT NULL)
	OR
	(T1.[Origin] = 'N' AND T.[DET_HEADER_NL_LINK] IS NOT NULL)
	OR
	(T1.[Origin] = 'S' AND T.[DET_HEADER_SL_LINK] IS NOT NULL)
) T2
GO
/****** Object:  Table [dbo].[Tb_Cap_Import]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Cap_Import](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Item] [varchar](255) NOT NULL,
	[PDFFound] [datetime] NOT NULL,
	[XMLFound] [datetime] NULL,
	[XMLSent] [datetime] NULL,
	[XMLGone] [datetime] NULL,
	[PIREntryFound] [datetime] NULL,
	[PDFSent] [datetime] NULL,
	[PDFGone] [datetime] NULL,
	[Type] [varchar](255) NULL,
 CONSTRAINT [PK_Tb_Cap_Import] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_Capture_Import]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[vw_HICS_Rep_Capture_Import] as
SELECT
	[ID],
	[Item],
	[Type],
	[PDFFound],
	[XMLFound],
	[XMLSent],
	[XMLGone],
	[PIREntryFound],
	[PDFSent],
	[PDFGone]
FROM
	[Tb_Cap_Import] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_LotHistory]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_LotHistory] as
SELECT
[LTU_UNIQUE] AS [ID],
[LTU_SOURCE_IND] AS [SourceID],
[LTU_CREATED] AS [CreatedOn],
[LTU_UPDATED] AS [ModifiedOn],
[LTU_TYPE] AS [Type],
[LTU_LOT_NUM] AS [LotNo],
[LTU_SOURCE_TYPE] AS [SourceType],
[LTU_SRC_LOT_NUM] AS [SourceLotNo],
[LTU_SERIAL_NO] COLLATE Latin1_General_CI_AS AS [SerialNo],
[LTU_PART_ONLY] COLLATE Latin1_General_CI_AS AS [Part],
[LTU_PART_REV] COLLATE Latin1_General_CI_AS AS [PartRev],
[LTU_WH] COLLATE Latin1_General_CI_AS AS [Warehouse],
[LTU_BIN_ONLY] COLLATE Latin1_General_CI_AS AS [Bin],
[LTU_DATE] AS [Date],
[LTU_TYPE_REF] COLLATE Latin1_General_CI_AS AS [TypeRef],
[LTU_DEST_PART_ONLY] COLLATE Latin1_General_CI_AS AS [DestinationPart],
[LTU_DEST_PART_REV] COLLATE Latin1_General_CI_AS AS [DestinationPartRev],
[LTU_SOURCE_REF] COLLATE Latin1_General_CI_AS AS [SourceRef],
[LTU_SOURCE_SUP] COLLATE Latin1_General_CI_AS AS [SourceSup],
[LTU_QTY] AS [Quantity],
[LTU_DESC] COLLATE Latin1_General_CI_AS AS [Description],
[LTU_CUS_SUP] COLLATE Latin1_General_CI_AS AS [CusSup],
[LTU_STATUS] COLLATE Latin1_General_CI_AS AS [Status],
[LTU_BOM_WC] COLLATE Latin1_General_CI_AS AS [BoMWC],
[LTU_BOM_REF] COLLATE Latin1_General_CI_AS AS [BoMRef],
[LTU_HISTORY_REC] AS [HistoryRec],
[LTU_COST_EACH] AS [CostEach],
[LTU_LAB_COST_EA] AS [LabCostEach],
[LTU_OHD_COST_EA] AS [OHDCostEach],
[LTU_OTHER_COST_EA] AS [OtherCostEach],
[LTU_SUPP_REF] COLLATE Latin1_General_CI_AS AS [SupplierRef],
[LTU_CLEARED] COLLATE Latin1_General_CI_AS AS [Cleared],
[LTU_EXPIRY_DATE] AS [ExpiryDate],
[LTU_TYPE_REF_SUB] AS [TypeRefSub],
[LTU_FIN_PERIOD] AS [FinancialPeriod],
[LTU_FIN_YEAR_A] COLLATE Latin1_General_CI_AS AS [FinancialYearA],
[LTU_FIN_YEAR_N] AS [FinancialYearN],
[LTU_HIS_UNIQUE] AS [HistoryID],
[LTU_ORDER_TYPE] COLLATE Latin1_General_CI_AS AS [OrderType],
[LTU_SUB] AS [Sequence],
[LTU_PREV_WH] COLLATE Latin1_General_CI_AS AS [PreviousWarehouse],
[LTU_PREV_BIN] COLLATE Latin1_General_CI_AS AS [PreviousBin],
[LTU_BATCH_NO] COLLATE Latin1_General_CI_AS AS [BacthNo],
[LTU_BOM_ITEM] AS [BoMItem],
[LTU_HIS_LINK] AS [HistoryLink],
[LTU_SOURCE_PART_ONLY] COLLATE Latin1_General_CI_AS AS [SourcePart],
[LTU_SOURCE_PART_REV] COLLATE Latin1_General_CI_AS AS [SourcePartRev],
[LTU_LND_COST_1] AS [LNDCost1],
[LTU_LND_COST_2] AS [LNDCost2],
[LTU_BOX_NUMBER] COLLATE Latin1_General_CI_AS AS [BoxNumber],
[LTU_TRAN_ID] AS [TranID],
[LTU_DEST_SERIAL_NO] COLLATE Latin1_General_CI_AS AS [DestinationSerialNo],
[LTU_SEC_QTY] AS [SecQuantity],
[LTU_WO_BATCH] AS [WOBatch],
[LTU_PALLET_REF] COLLATE Latin1_General_CI_AS AS [PaelletRef],
[LTU_CONDITION] COLLATE Latin1_General_CI_AS AS [Condition],
[LTU_ECO_NUMBER] AS [ECONumber],
[LTU_ORIG_SOURCE_REF] COLLATE Latin1_General_CI_AS AS [OriginalSourceRef]
FROM
	[ASC_LIVE].[dbo].[ASC_LTU_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_ProductionReport24hr]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_Rep_ProductionReport24hr] as
select 
	CONVERT(DATE,H.[Date])						AS [Date],
	P.[Analysis3]								AS [VariantCode],
	P.[Drawing]									AS [OldCode],
	P.[Part],
	P.[Description1] + ' ' + P.[Description2]	AS [PartDesc],
	LTRIM(RTRIM(WO.[CustomerOrderRef]))			AS [CustomerOrderRef],
	H.[ActionType],
	CASE
		WHEN P.[QuantityPerPallet] = 0 THEN 0
		ELSE ABS(CEILING(LH.[Quantity] / P.[QuantityPerPallet]))
	END											AS [Pallets],
	CONVERT(INT,ABS(LH.[Quantity]))				AS [Quantity],
	CONVERT(INT,(ABS(LH.[Quantity]) * CASE CHARINDEX('X',P.[Analysis2]) 
							WHEN 0 THEN 0
							ELSE LEFT(P.[Analysis2],CHARINDEX('X',REPLACE(P.[Analysis2],' ',''))-1)
						END) / 12)				AS [Dozens],
	WO.[WorksOrderNo],
	LH.[SerialNo]								AS [Rotation],
	RTRIM(LTRIM(LH.[Description]))				AS [Comments],
	LH.[LotNo]
FROM
				[vw_ASC_LIVE_WorksOrders]	WO
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]			P	ON	WO.[Part] = P.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_History]		H	ON	WO.[WorksOrderNo] = H.[WorksOrderNo]
LEFT OUTER JOIN [vw_ASC_LIVE_AnalysisCodes]	SC	ON	SC.[TypeCode] = 'I'
												AND SC.[LabelCode] = '3'
												AND	P.[Analysis3] = SC.[AnalysisCode]
LEFT OUTER JOIN [vw_ASC_LIVE_LotHistory]	LH	ON	H.[LotUsageLink] = LH.[HistoryLink]
WHERE
	WO.[Status] = 'C'
AND CONVERT(DATE,WO.[CompletedDate]) >= DATEADD(DAY,-1,CONVERT(DATE,SYSDATETIME()))
AND LEFT(WO.[Part],1) = 'F'
AND H.[ActionTypeCode] IN ('KB','KR')
AND P.[Analysis3] IN ('307','309','384','418','388')

/*
From Emily Bill 20231024
307 McCormick
309 Chivas
384 Inverhouse
418 Adnams
388 AI Brands

Please add these 5 and if any more come on in the future, we will ask you to add them. Is that ok? ;)
*/

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_ProductionReport24hr_Data]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_ASC_LIVE_Rep_ProductionReport24hr_Data] as 
SELECT TOP 100 PERCENT 
	'"' + T1.[Date] + '"'				AS [Date],
	'"' + T1.[VariantCode] + '"'		AS [VariantCode],
	'"' + T1.[OldCode] + '"'			AS [OldCode],
	'"' + T1.[Part] + '"'				AS [Part],
	'"' + T1.[PartDesc] + '"'			AS [PartDesc],
	'"' + T1.[CustomerOrderRef] + '"'	AS [CustomerOrderRef],
	'"' + T1.[ActionType] + '"'			AS [ActionType],
	'"' + T1.[Pallets] + '"'			AS [Pallets],
	'"' + T1.[Quantity] + '"'			AS [Quantity],
	'"' + T1.[Dozens] + '"'				AS [Dozens],
	'"' + T1.[WorksOrderNo] + '"'		AS [WorksOrderNo],
	'"' + T1.[Rotation] + '"'			AS [Rotation],
	'"' + T1.[Comments] + '"'			AS [Comments],
	'"' + T1.[LotNo] + '"'				AS [LotNo]
FROM
	(SELECT
		0						AS [SortByThis],
		'Date'					AS [Date],
		'VariantCode'			AS [VariantCode],
		'OldCode'				AS [OldCode],
		'Part'					AS [Part],
		'PartDesc'				AS [PartDesc],
		'CustomerOrderRef'		AS [CustomerOrderRef],
		'ActionType'			AS [ActionType],
		'Pallets'				AS [Pallets],
		'Quantity'				AS [Quantity],
		'Dozens'				AS [Dozens],
		'WorksOrderNo'			AS [WorksOrderNo],
		'Rotation'				AS [Rotation],
		'Comments'				AS [Comments],
		'LotNo'					AS [LotNo]
	UNION
	SELECT
		1									AS [SortByThis],
		CONVERT(VARCHAR(50),[Date])			AS [Date],
		[VariantCode],
		[OldCode],
		[Part],
		[PartDesc],
		[CustomerOrderRef],
		[ActionType],
		CONVERT(VARCHAR(50),[Pallets])		AS [Pallets],
		CONVERT(VARCHAR(50),[Quantity])		AS [Quantity],
		CONVERT(VARCHAR(50),[Dozens])		AS [Dozens],
		CONVERT(VARCHAR(50),[WorksOrderNo]) AS [WorksOrderNo],
		[Rotation],
		[Comments],
		CONVERT(VARCHAR(50),[LotNo])		AS [LotNo]
	FROM
		[vw_ASC_LIVE_Rep_ProductionReport24hr] WITH (NOLOCK)) T1
ORDER BY 
	T1.[SortByThis],
	T1.[VariantCode],
	T1.[Part],
	T1.[Date],
	T1.[LotNo]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_WelchesEDI]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_Rep_WelchesEDI] as 
SELECT top 100 percent
	(T2.[OrderNum] * 100) +
	CASE T2.[QuantityType]
		WHEN 'PALLETS'		THEN 1
		WHEN 'DRUMS'		THEN 2
		WHEN 'CANS'			THEN 4
		WHEN 'IBCS'			THEN 5
		WHEN 'CASES'		THEN 6
		ELSE 9
	END																			AS [JobID],
	T2.[CustomerOrderRef],
	T2.[OrderNum],
	CONVERT(VARCHAR(4),YEAR(T2.[ExpectedDueDate])) + '-' +
	RIGHT('00' + CONVERT(VARCHAR(2),MONTH(T2.[ExpectedDueDate])),2) + '-' +
	RIGHT('00' + CONVERT(VARCHAR(2),DAY(T2.[ExpectedDueDate])),2) 				AS [Date],
	T2.[CustomerName],
	T2.[AddLine1],
	T2.[AddLine2],
	T2.[AddLine3],
	T2.[AddLine4],
	T2.[Postcode],
	T2.[CountryCode],
	CONVERT(VARCHAR(4),YEAR(T2.[CustomerDue])) + '-' +
	RIGHT('00' + CONVERT(VARCHAR(2),MONTH(T2.[CustomerDue])),2) + '-' +
	RIGHT('00' + CONVERT(VARCHAR(2),DAY(T2.[CustomerDue])),2) 				AS [DelDate],
	T2.[Analysis6],
	T2.[QuantityType],
	T2.[Outstanding],
	T2.[AddressConCode],
	T2.[Quantity],
	CONVERT(INT,ROUND(T2.[Weight],0)) AS [Weight],
	T2.[TFHC1],
	T2.[Analysis10],
	T2.[Product],
	T2.[TailLift],
	T2.[TFPad],
	T2.[TD],
	T2.[UNNO],
	T2.[HazClass],
	T2.[HazPackingGroup],
	T2.[HazTunnelCode],
	T2.[UNNoDesc],
	T2.[QuantityOrdered]
FROM
	(SELECT 
		T1.[OrderNum],
		CASE
			WHEN T1.[Analysis2] IN ('CANS','CASES','C25') AND T1.[QuantityDelivered] < 5						THEN 'PARCELS'
			WHEN T1.[Analysis2] IN ('CANS','CASES','C25') AND T1.[QuantityDelivered] > 4 AND T1.[Weight] < 500	THEN 'HALF PALLETS'
			WHEN T1.[Analysis2] IN ('MIXED PALLETS','PALLETISED','NO OVERHANG','BAGS ON DRUM','DRUMS')			THEN 'PALLETS'
			WHEN T1.[Analysis2] = ''																			THEN 'UNSPECIFIED'
			ELSE T1.[Analysis2]
		END												AS [QuantityType],
		T1.[CustomerOrderRef],
		T1.[ExpectedDueDate],
		T1.[CustomerName],
		T1.[AddLine1],
		T1.[AddLine2],
		T1.[AddLine3],
		T1.[AddLine4],
		T1.[Postcode],
		T1.[CountryCode],
		T1.[CustomerDue],
		T1.[Analysis6],
		T1.[Outstanding],
		T1.[AddressConCode],
		CASE
			WHEN	(T1.[Analysis2] in ('CANS','CASES') AND T1.[Weight] >= 200 AND T1.[QuantityPerPallet] > 0) OR
					(T1.[Analysis2]= 'MIXED PALLETS' AND T1.[QuantityPerPallet] > 0)								THEN T1.[Outstanding] / T1.[QuantityPerPallet]
			WHEN T1.[Analysis2] = 'BAGS ON DRUM'																	THEN 0 
			WHEN T1.[QuantityPerPallet] > 0																			THEN CEILING(T1.[Outstanding] / T1.[QuantityPerPallet])
			ELSE T1.[Outstanding]
		END												AS [Quantity],
		T1.[Weight],
		T1.[TFHC1],
		CASE T1.[TFHC1]
			WHEN 'YES' THEN T1.[UNNO] + '_' + CONVERT(VARCHAR(20),T1.[QuantityOrdered]) + '-' + T1.[UoM]
			ELSE ''
		END												AS [Product],
		T1.[Analysis10],
		T1.[TailLift],
		T1.[TFPad],
		T1.[TD],
		T1.[UNNO],
		CASE
			WHEN T1.[HazCode] IN (1,2,3,4) THEN 3
			ELSE ''
		END												AS [HazClass],
		CASE
			WHEN T1.[HazCode] IN (1,2,3) THEN 'II'
			WHEN T1.[HazCode] = 4 THEN 'III'
			ELSE ''
		END												AS [HazPackingGroup],
		CASE
			WHEN T1.[HazCode] IN (1,2,3,4) THEN 'D/E'
			ELSE ''
		END												AS [HazTunnelCode],
		CASE T1.[UNNO]
			WHEN '1170' THEN 'ETHANOL or ETHANOL SOLUTION'
			WHEN '1219' THEN 'ISOPROPANOL'
			WHEN '1230' THEN 'METHANOL'
			WHEN '3065' THEN	CASE 
									WHEN T1.[HazCode] IN (1,2,3) THEN 'ALCOHOLIC BEVERAGES, with more than 70% alcohol by volume'
									WHEN T1.[HazCode] = 4 THEN 'UN 3065 – ALCOHOLIC BEVERAGES, with more than 24% but not more than 70% alcohol by volume'
									ELSE ''
								END
			WHEN '1992' THEN 'FLAMMABLE LIQUID, TOXIC, N.O.S.'
			WHEN '2286' THEN 'PENTAMETHYLHEPTANE'
			ELSE ''
		END												AS [UNNoDesc],
		T1.[QuantityOrdered]
	FROM
		(SELECT
			O.[OrderNum],
			O.[QuantityOrdered] - O.[QuantityDelivered]		AS [Outstanding],
			(O.[QuantityOrdered] - O.[QuantityDelivered]) *
			CASE P.[WeightPer]
				WHEN 0 THEN  P.[Weight]
				ELSE (P.[Weight] / P.[WeightPer])
			END												AS [Weight],
			O.[Analysis2],
			O.[QuantityDelivered],
			O.[CustomerOrderRef],
			O.[ExpectedDueDate],
			ODA.[CustomerName],
			ODA.[AddLine1],
			ODA.[AddLine2],
			ODA.[AddLine3],
			ODA.[AddLine4],
			ODA.[Postcode],
			ODA.[CountryCode],
			O.[CustomerDue],
			O.[Analysis6],
			P.[AllocRule2],
			ODA.[AddressConCode],
			P.[QuantityPerPallet],
			CASE 
				WHEN P.[AllocRule2] IN (1,2,3,4) THEN 'yes'
				ELSE 'no'
			END													AS [TFHC1],
			CONVERT(VARCHAR(20),FLOOR(P.[AllocRule1]))			AS [UNNO],
			O.[QuantityOrdered],
			P.[UoM],
			O.[Analysis10],
			CASE
				WHEN	(ODA.[TransportCode] = '' AND C4.[TransRoute] = 'TFTL') OR	
						(ODA.[TransportCode] = 'TFTL')							THEN 'yes'
				ELSE 'no'

			END													AS [TailLift],
			CASE C4.[Analysis5]
				WHEN 'Y' THEN 'yes'
				ELSE 'no'

			END													AS [TFPad],
			CASE 
				WHEN O.[Analysis10] > '' THEN 'yes'
				ELSE 'no'
			END													AS [TD],
			CONVERT(INT,FLOOR(P.[AllocRule2]))					AS [HazCode]
		FROM
						vw_ASC_LIVE_ORDERS			O
		LEFT OUTER JOIN	vw_ASC_LIVE_Customers4		C4	ON	O.[CustomerCode]	=	C4.[CustomerCode]
		LEFT OUTER JOIN	vw_ASC_LIVE_Parts			P	ON	O.[Part]			=	P.[Part]
		LEFT OUTER JOIN	vw_ASC_LIVE_ORDERDELADD		ODA	ON	O.[OrderRef]		=	ODA.[OrderRef]
		LEFT OUTER JOIN	vw_ASC_LIVE_SystemCodes		SC	ON	P.[SalesUoM]		=	SC.[SystemCode]
		WHERE
			--O.[ExpectedDueDate] <= CONVERT(DATE,CASE 
			--										WHEN CONVERT(TIME,sysdatetime()) < '08:00:00' THEN DATEADD(d,-1,sysdatetime())
			--										ELSE sysdatetime()
			--									END)
		--AND 
		NOT O.[OrderType] IN ('ST','ZP')
		AND NOT O.[Status] IN ('C','H')
		AND SC.[TypeCode] = 'Y'
		AND LEFT(O.[Part],1) IN ('D','F','G','L','P')
		AND O.[Analysis2] <> 'OTHER HAULIER'
		AND O.[CustomerDue] >= '01/Jan/2015'
		AND LEFT(CASE ISNULL(ODA.[TransportCode],'')
				WHEN '' THEN C4.[TransRoute]
				ELSE ODA.[TransportCode]
			END,2) = 'TF'
		AND O.[QuantityOrdered] - O.[QuantityDelivered] > 0
		AND O.[Analysis7] = 'NEW') T1) T2
	order by t2.[OrderNum]


GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_WelchesEDI_ET]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--{EXT_TBL.EXT_ACTION_FLAG_11} = "Y" and
--{EXT_TBL.EXT_KEY_TYPE} = "CU" and
--{EXT_TBL.EXT_ACTION_FLAG_2} = "Y" and
--{EXT_TBL.EXT_FILE_REF} = {?Pm-CDL_TBL.CDL_AD_CON_CODE}

CREATE view [dbo].[vw_ASC_LIVE_Rep_WelchesEDI_ET] as
SELECT top 100 percent
	[Number],
	[FileRef],
	[Text]
FROM
	[vw_ASC_LIVE_ExtraText] 
WHERE
	[ActionFlag11] = 'Y'
AND [KeyType] = 'CU'
AND [ActionFlag2] = 'Y'
order by [FileRef],[Number]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_SalesSummary]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_SalesSummary] as
SELECT
	[YEAR] AS [Year],
	[MONTH] AS [Month],
	[PERIOD] AS [Period],
	[PART] COLLATE Latin1_General_CI_AS AS [Part],
	[PRODUCT_GRP] COLLATE Latin1_General_CI_AS AS [ProductGroup],
	[CUSTOMER_CODE] COLLATE Latin1_General_CI_AS AS [CustomerCode],
	[CUSTOMER_NAME] AS [CustomerName],
	[UOM] COLLATE Latin1_General_CI_AS AS [UoM],
	[ACCOUNT_MANAGER] COLLATE Latin1_General_CI_AS AS [AccountManager],
	[QTY_INVOICED] AS [QuantityInvoiced],
	[QTY_BUDGET] AS [QuantityBudget],
	[INV_VALUE] AS [InvoiceValue],
	[BUDGET_VAL] AS [BudgetValue],
	[YTD_QTY] AS [YTDQuantity],
	[YTD_BUDGET_QTY] AS [YTDBudgetQuantity],
	[YTD_VALUE] AS [YTDValue],
	[YTD_BUDGET_VAL] AS [YTDBudgetValue],
	[VARIANT_CODE] COLLATE Latin1_General_CI_AS AS [VariantCode],
	[NOMINAL_CODE] COLLATE Latin1_General_CI_AS AS [NominalCode],
	[PACK_TYPE] COLLATE Latin1_General_CI_AS AS [PackType],
	[PD_CONTRIBUTION] AS [PDContribution],
	[YTD_CONTRIBUTION] AS [YTDContribution],
	[PD_BUDGET_CONTRIBUTION] AS [PDBudgetContribution],
	[YTD_BUDGET_CONTRIBUTION] AS [YTDBudgetContribution],
	[COST_VARIANCE] AS [CosyVariance],
	[BUSINESS_UNIT] COLLATE Latin1_General_CI_AS  AS [BusinessUnit],
	[BudgetAnalysis1] AS [BudgetAnalysis1],
	[BudgetAnalysis2] AS [BudgetAnalysis2],
	[BudgetAnalysis3] AS [BudgetAnalysis3],
	[BudgetAnalysis4] AS [BudgetAnalysis4],
	[BudgetAnalysis5] AS [BudgetAnalysis5],
	[BudgetAnalysis6] AS [BudgetAnalysis6],
	[BudgetAnalysis7] AS [BudgetAnalysis7],
	[BudgetAnalysis8] AS [BudgetAnalysis8],
	[BudgetAnalysis9] AS [BudgetAnalysis9],
	[BudgetAnalysis10] AS [BudgetAnalysis10]
FROM
	[ASC_LIVE].[dbo].[UDEF_SALES_SUMMARY_TBL] with (nolock)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_SalesBudgets]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_SalesBudgets] as
SELECT
	[SBU_UNIQUE] AS [ID],
[SBU_SOURCE_IND] AS [SourceID],
[SBU_CREATED] AS [CreatedOn],
[SBU_UPDATED] AS [UpdatedOn],
[SBU_BUDGET_REV] AS [BudgetRev],
[SBU_BUDGET_YEAR] COLLATE Latin1_General_CI_AS AS [BudgetYear],
[SBU_CUS_CODE] COLLATE Latin1_General_CI_AS AS [CustomerCode],
[SBU_PART_ONLY] COLLATE Latin1_General_CI_AS AS [Part],
[SBU_PART_REV] COLLATE Latin1_General_CI_AS AS [PartRev],
[SBU_PERIOD_1_QTY] AS [Period1Quantity],
[SBU_PERIOD_1_VALUE] AS [Period1Value],
[SBU_PERIOD_2_QTY] AS [Period2Quantity],
[SBU_PERIOD_2_VALUE] AS [Period2Value],
[SBU_PERIOD_3_QTY] AS [Period3Quantity],
[SBU_PERIOD_3_VALUE] AS [Period3Value],
[SBU_PERIOD_4_QTY] AS [Period4Quantity],
[SBU_PERIOD_4_VALUE] AS [Period4Value],
[SBU_PERIOD_5_QTY] AS [Period5Quantity],
[SBU_PERIOD_5_VALUE] AS [Period5Value],
[SBU_PERIOD_6_QTY] AS [Period6Quantity],
[SBU_PERIOD_6_VALUE] AS [Period6Value],
[SBU_PERIOD_7_QTY] AS [Period7Quantity],
[SBU_PERIOD_7_VALUE] AS [Period7Value],
[SBU_PERIOD_8_QTY] AS [Period8Quantity],
[SBU_PERIOD_8_VALUE] AS [Period8Value],
[SBU_PERIOD_9_QTY] AS [Period9Quantity],
[SBU_PERIOD_9_VALUE] AS [Period9Value],
[SBU_PERIOD_10_QTY] AS [Period10Quantity],
[SBU_PERIOD_10_VALUE] AS [Period10Value],
[SBU_PERIOD_11_QTY] AS [Period11Quantity],
[SBU_PERIOD_11_VALUE] AS [Period11Value],
[SBU_PERIOD_12_QTY] AS [Period12Quantity],
[SBU_PERIOD_12_VALUE] AS [Period12Value],
[SBU_PERIOD_13_QTY] AS [Period13Quantity],
[SBU_PERIOD_13_VALUE] AS [Period13Value],
[SBU_ANAL_FIELD_1] COLLATE Latin1_General_CI_AS AS [Analysis1],
[SBU_ANAL_FIELD_2] COLLATE Latin1_General_CI_AS AS [Analysis2],
[SBU_ANAL_FIELD_3] COLLATE Latin1_General_CI_AS AS [Analysis3],
[SBU_ANAL_FIELD_4] COLLATE Latin1_General_CI_AS AS [Analysis4],
[SBU_ANAL_FIELD_5] COLLATE Latin1_General_CI_AS AS [Analysis5],
[SBU_ANAL_FIELD_6] COLLATE Latin1_General_CI_AS AS [Analysis6],
[SBU_ANAL_FIELD_7] COLLATE Latin1_General_CI_AS AS [Analysis7],
[SBU_ANAL_FIELD_8] COLLATE Latin1_General_CI_AS AS [Analysis8],
[SBU_ANAL_FIELD_9] COLLATE Latin1_General_CI_AS AS [Analysis9],
[SBU_ANAL_FIELD_10] AS [Analysis10],
[SBU_OBSOLETE_FLAG] AS [ObsoleteFlag],
[SBU_USER_PUTIN] COLLATE Latin1_General_CI_AS AS [UserPutin],
[SBU_USER_EDITED] COLLATE Latin1_General_CI_AS AS [UserEdited],
[SBU_USER_SLOT_NO] AS [UserSlotNo]
FROM
	[ASC_LIVE].[dbo].[ASC_SBU_TBL] with (nolock)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_ActVsBudForGC]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_ASC_LIVE_Rep_ActVsBudForGC] as
SELECT
	T1.[CustomerCode],
	T1.[CustomerName],
	T1.[Sector],
	CONVERT(DECIMAL(10,2),ROUND(T1.[Actual],2)) AS [Actual],
	CONVERT(DECIMAL(10,2),ROUND(T1.[Budget],2)) AS [Budget],
	CONVERT(DECIMAL(10,2),ROUND(T1.[Actual]- T1.[Budget],2)) AS [Variance],
	CONVERT(DECIMAL(10,2),ROUND(T1.[YTDActual],2)) AS [YTDActual],
	CONVERT(DECIMAL(10,2),ROUND(T1.[YTDBudget],2)) AS [YTDBudget],
	CONVERT(DECIMAL(10,2),ROUND(T1.[YTDActual]- T1.[YTDBudget],2)) AS [YTDVariance]
FROM
	(SELECT
		SS.[CustomerCode],
		SS.[CustomerName],
		AC.[AnalysisDescription]	as [Sector],
		SUM(SS.[QuantityInvoiced] * CONVERT(DECIMAL(10,5),SB.[Analysis5])) AS [Actual],
		SUM(SS.[QuantityBudget] * CONVERT(DECIMAL(10,5),SB.[Analysis5])) AS [Budget],	
		SUM(SS.[YTDQuantity] * CONVERT(DECIMAL(10,5),SB.[Analysis5])) AS [YTDActual],
		SUM(SS.[YTDBudgetQuantity] * CONVERT(DECIMAL(10,5),SB.[Analysis5])) AS [YTDBudget]
	FROM
					[vw_ASC_LIVE_SalesSummary]	SS
	LEFT OUTER JOIN	[vw_ASC_LIVE_SalesBudgets]	SB	ON	SS.[Part] = SB.[Part]
													AND	SS.[CustomerCode] = SB.[CustomerCode]
	INNER JOIN		[vw_ASC_LIVE_Parts]			P	ON	SS.[Part] = P.[Part]
	LEFT OUTER JOIN [vw_ASC_LIVE_Customers4]	C4	ON	SS.[CustomerCode] = C4.[CustomerCode]
	LEFT OUTER JOIN	[vw_ASC_LIVE_AnalysisCodes]	AC	ON	C4.[Analysis5] = AC.[AnalysisCode]
													AND	AC.[LabelCode] = '5'
													AND AC.[TypeCode] = 'C'													
	WHERE
		LEFT(P.[Part],1) = 'F'
	AND LEFT (SS.[CustomerCode],1) = '1'
	AND SB.[BudgetYear] = CONVERT(INT,RIGHT(CONVERT(VARCHAR(4),year(sysdatetime()) + CASE WHEN MONTH(sysdatetime()) < 4 THEN 0 ELSE 1 END),2))
	AND SS.[Period] = MONTH(sysdatetime()) + CASE WHEN MONTH(sysdatetime()) < 4 THEN 9 ELSE -3 END 
	GROUP BY
		SS.[CustomerCode],
		SS.[CustomerName],
		AC.[AnalysisDescription]) T1
	
GO
/****** Object:  Table [dbo].[Tb_Log]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Computer] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Environment] [varchar](50) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Process] [varchar](50) NOT NULL,
	[Message] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Tb_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Log]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_HICS_Log] as

SELECT
	[ID],
	[CreatedOn],
	[CreatedBy],
	[Computer],
	[Source],
	[Environment],
	[Category],
	[Process],
	[Message]
FROM	
	Tb_Log WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_AnalysisHeaders]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_AnalysisHeaders] AS

SELECT 
	H.[CAH_UNIQUE]								AS [ID],
	H.[CAH_SOURCE_IND]							AS [SourceID],
	H.[CAH_CREATED]								AS [CreatedOn],
	H.[CAH_UPDATED]								AS [ModifiedOn],
	H.[CAH_TYPE] COLLATE Latin1_General_CI_AS	AS [TypeCode],
	H.[CAH_NUMBER]								AS [LabelCode],
	H.[CAH_DESC] COLLATE Latin1_General_CI_AS	AS [LabelDescription]
FROM 
	[ASC_LIVE].[dbo].[ASC_CAH_TBL] H	WITH (NOLOCK)									
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_AnalysisCodes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_Rep_AnalysisCodes] AS 
SELECT 
	AC.[ID],
	AC.[CreatedOn], 
	AC.[ModifiedOn],
	AC.[TypeCode],
	AC.[LabelCode],
	AH.[LabelDescription],
	AC.[AnalysisCode],
	AC.[AnalysisDescription]
FROM 
				[vw_ASC_LIVE_AnalysisCodes]		AC
LEFT OUTER JOIN	[vw_ASC_LIVE_AnalysisHeaders]	AH	ON	AC.[TypeCode] = AH.[TypeCode]
													AND	AC.[LabelCode] = AH.[LabelCode]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_AA_REP_AGED_DEBT_MP_VIEW]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ASC_LIVE_Rep_AA_REP_AGED_DEBT_MP_VIEW] as 
SELECT
	T1.[CUCODE],
	T1.[CUNAME],
	T1.[ST_DATE],
	T1.[ST_YEAR],
	T1.[ST_PERIODNUMBER],
	CONVERT(VARCHAR(3),T1.[ST_YEAR] + CONVERT(VARCHAR(2),T1.[ST_PERIODNUMBER])) AS [PERIOD],
	T1.[ST_TRANTYPE],
	T1.[ST_HEADER_REF],
	T1.[ST_GROSS],
	T1.[ST_DUEDATE],
	T1.[CUBALANCE],
	T1.[CUCURRENCYCODE],
	T1.[S_AL_FULLALLOC_PD],
	T1.[ST_AUDIT_NUMBER],
	T1.[S_AL_USER_ID],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 13 THEN T1.[ST_GROSS] ELSE 0 END AS [N13],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 12 THEN T1.[ST_GROSS] ELSE 0 END AS [N12],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 11 THEN T1.[ST_GROSS] ELSE 0 END AS [N11],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 10 THEN T1.[ST_GROSS] ELSE 0 END AS [N10],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 9 THEN T1.[ST_GROSS] ELSE 0 END AS [N9],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 8 THEN T1.[ST_GROSS] ELSE 0 END AS [N8],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 7 THEN T1.[ST_GROSS] ELSE 0 END AS [N7],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 6 THEN T1.[ST_GROSS] ELSE 0 END AS [N6],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 5 THEN T1.[ST_GROSS] ELSE 0 END AS [N5],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 4 THEN T1.[ST_GROSS] ELSE 0 END AS [N4],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 3 THEN T1.[ST_GROSS] ELSE 0 END AS [N3],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 2 THEN T1.[ST_GROSS] ELSE 0 END AS [N2],
	CASE WHEN T1.[ST_YEAR] = 'N' AND T1.[ST_PERIODNUMBER] = 1 THEN T1.[ST_GROSS] ELSE 0 END AS [N1],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 13 THEN T1.[ST_GROSS] ELSE 0 END AS [C13],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 12 THEN T1.[ST_GROSS] ELSE 0 END AS [C12],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 11 THEN T1.[ST_GROSS] ELSE 0 END AS [C11],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 10 THEN T1.[ST_GROSS] ELSE 0 END AS [C10],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 9 THEN T1.[ST_GROSS] ELSE 0 END AS [C9],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 8 THEN T1.[ST_GROSS] ELSE 0 END AS [C8],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 7 THEN T1.[ST_GROSS] ELSE 0 END AS [C7],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 6 THEN T1.[ST_GROSS] ELSE 0 END AS [C6],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 5 THEN T1.[ST_GROSS] ELSE 0 END AS [C5],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 4 THEN T1.[ST_GROSS] ELSE 0 END AS [C4],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 3 THEN T1.[ST_GROSS] ELSE 0 END AS [C3],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 2 THEN T1.[ST_GROSS] ELSE 0 END AS [C2],
	CASE WHEN T1.[ST_YEAR] = 'C' AND T1.[ST_PERIODNUMBER] = 1 THEN T1.[ST_GROSS] ELSE 0 END AS [C1],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 13 THEN T1.[ST_GROSS] ELSE 0 END AS [L13],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 12 THEN T1.[ST_GROSS] ELSE 0 END AS [L12],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 11 THEN T1.[ST_GROSS] ELSE 0 END AS [L11],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 10 THEN T1.[ST_GROSS] ELSE 0 END AS [L10],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 9 THEN T1.[ST_GROSS] ELSE 0 END AS [L9],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 8 THEN T1.[ST_GROSS] ELSE 0 END AS [L8],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 7 THEN T1.[ST_GROSS] ELSE 0 END AS [L7],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 6 THEN T1.[ST_GROSS] ELSE 0 END AS [L6],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 5 THEN T1.[ST_GROSS] ELSE 0 END AS [L5],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 4 THEN T1.[ST_GROSS] ELSE 0 END AS [L4],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 3 THEN T1.[ST_GROSS] ELSE 0 END AS [L3],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 2 THEN T1.[ST_GROSS] ELSE 0 END AS [L2],
	CASE WHEN T1.[ST_YEAR] = 'L' AND T1.[ST_PERIODNUMBER] = 1 THEN T1.[ST_GROSS] ELSE 0 END AS [L1],
	CASE WHEN T1.[ST_YEAR] = 'O' AND T1.[ST_PERIODNUMBER] = 13 THEN T1.[ST_GROSS] ELSE 0 END AS [O13],
	CASE WHEN T1.[ST_YEAR] = 'O' AND T1.[ST_PERIODNUMBER] = 12 THEN T1.[ST_GROSS] ELSE 0 END AS [O12],
	CASE WHEN T1.[ST_YEAR] = 'O' AND T1.[ST_PERIODNUMBER] = 11 THEN T1.[ST_GROSS] ELSE 0 END AS [O11],
	CASE WHEN T1.[ST_YEAR] = 'O' AND T1.[ST_PERIODNUMBER] <= 11 THEN T1.[ST_GROSS] ELSE 0 END AS [O10]
FROM
	[vw_asc_live_AA_REP_AGED_DEBT_MP_VIEW] T1
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_WarehouseTableCustom]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_WarehouseTableCustom] as
SELECT 
	[WarehouseRef] COLLATE Latin1_General_CI_AS AS [WarehouseRef],
    [Capacity],
    [Vat],
    [Report_WH],
    [Raw Material]
FROM 
	[ASC_LIVE].[dbo].[UDEF_WHS_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_Vats]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ASC_LIVE_Rep_Vats] AS
SELECT
	T2.[Warehouse],
	T2.[Vat],
	T2.[Capacity],
	T2.[LotGroup],
	T2.[Part],
	T2.[Description],
	T2.[Drawing],
	T2.[Lot],
	T2.[SerialNo],
	MAX(T2.[TCF])		AS [TCF],
	MAX(T2.[Strength])	AS [Strength],
	MAX(T2.[LOA])		AS [LOA],
	MAX(T2.[Bulk])		AS [Bulk]
FROM
	(SELECT 
		T1.[Warehouse],
		T1.[Vat],
		T1.[LotGroup],
		T1.[Part],
		T1.[Description],
		T1.[Drawing],
		T1.[Number]			AS [Lot],
		T1.[SerialNo],
		T1.[TCF],
		T1.[Strength],
		T1.[LOA],
		CONVERT(DECIMAL(15,2), CASE 
			WHEN T1.[LotGroup]	= ''		THEN T1.[LotQty]
			WHEN T1.[AtrCode]	= 'BULK'	THEN CASE T1.[Strength]
													WHEN 0 THEN T1.[LotQty]
													ELSE (T1.[LotQty] * 100) / T1.[Strength]
												 END
			WHEN T1.[AtrCode]	= 'LOA'		THEN T1.[LotQty] * T1.[PartCapacity]
			ELSE 0
		END)											AS [Bulk],
		T1.[Capacity]
	FROM
		(SELECT 
			L.[Warehouse],
			W.[VAT],
			P.[LotGroup],
			P.[Part],
			P.[Description1] + ' ' + P.[Description2]	AS [Description],
			P.[Drawing],
			L.[Number],
			L.[SerialNo],
			CONVERT(DECIMAL(15,2),CASE A.[Code]
				WHEN 'TCF' then A.[Value]
				else '0'
			END)										AS [TCF],
			CONVERT(DECIMAL(15,2),CASE A.[Code]
				WHEN 'STRENGTH' then A.[Value]
				else '0'
			END)										AS [Strength],
			CONVERT(DECIMAL(15,2),CASE 
				WHEN A.[Code] = 'LOA'	THEN A.[Value]
				WHEN A.[Code] = 'BULK'	THEN L.[Quantity]
				ELSE 0
			END)										AS [LOA],
			L.[Quantity]								AS [LotQty],
			A.[Code]									AS [AtrCode],
			P.[Capacity]								AS [PartCapacity],
			W.[Capacity]
		FROM 
						[vw_ASC_LIVE_Lots]					L
		LEFT OUTER JOIN	[vw_ASC_LIVE_Attributes]			A	ON	L.[Part]		= A.[Part]
																AND	L.[Number]		= A.[Lot]
																AND L.[Sequence]	= A.[LotSequence]
		LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]					P	ON	L.[Part]		= P.[Part]
		INNER JOIN		[vw_ASC_LIVE_WarehouseTableCustom]	W	ON	L.[Warehouse]	= W.[WarehouseRef]) T1) T2
WHERE
	NOT T2.[Part] IS NULL
GROUP BY
	T2.[Warehouse],
	T2.[Vat],
	T2.[Capacity],
	T2.[LotGroup],
	T2.[Part],
	T2.[Description],
	T2.[Drawing],
	T2.[Lot],
	T2.[SerialNo]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_CoA_TestResults]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_HICS_Rep_CoA_TestResults] as
SELECT
	P.[Part]									AS [Product],
	P.[Description1] + ' ' + P.[Description2]	AS [ProductDescription],
	Q.[Name]									AS [Question],
	Q.[Notes]									AS [QuestionNote],
	Q.[Specification]							AS [QuestionSpecification],
	Q.[Encoded]									AS [QuestionEncoded],
	CONVERT(DATE,A.[ModifiedOn])				AS [AnsweredOn],
	Q.[ModifiedBy]								AS [AnsweredBy],
	ISNULL(A.[Result],'')						AS [Answer],
	A.[Passed]									AS [Result],
	T.[LockedBy]								AS [LockedBy],
	T.[BatchRef]
FROM
				[vw_HICS_CoA_Questions]	Q
LEFT OUTER JOIN [Tb_CoA_TestAnswers]	A ON Q.[ID] = A.[LnkQuestionID]
LEFT OUTER JOIN [vw_HICS_CoA_Tests]		T ON T.[ID] = A.[LnkTestID]
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]		P ON P.[ID] = T.[ProductID]
WHERE
	T.[DisabledBy] IS NULL
AND NOT T.[LockedBy] IS NULL

GO
/****** Object:  View [dbo].[vw_HICS_Rep_SS_001]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[vw_HICS_Rep_SS_001] AS

SELECT 
	SS.[CUSTOMER_NAME],
	CASE 
		WHEN SS.[NOMINAL_CODE] NOT IN ('011','012') THEN 'N\A'
		WHEN LEFT(SS.[CUSTOMER_CODE],1) = 2 THEN 'UK'
		WHEN LEFT(SS.[CUSTOMER_CODE],1) = 3 THEN 'INT'
		ELSE 'ERROR'
	END														AS [CustomerType],
	SS.[PART],
	P.[Description1] + ' ' + P.[Description2]				AS [Description],
	AC.[AnalysisDescription]								AS [Variant],
	SS.[QTY_INVOICED]										AS [CM_QTY_INV],
	SS.[QTY_BUDGET]											AS [CM_QTY_BUD],
	SS.[QTY_INVOICED] - SS.[QTY_BUDGET]						AS [CM_QTY_VAR],
	SS.[PD_CONTRIBUTION]									AS [CM_GC_INV],
	SS.[PD_BUDGET_CONTRIBUTION]								AS [CM_GC_BUD],
	SS.[PD_CONTRIBUTION] - SS.[PD_BUDGET_CONTRIBUTION]		AS [CM_GC_VAR],
	SS.[INV_VALUE]											AS [CM_VAL_INV],
	SS.[BUDGET_VAL]											AS [CM_VAL_BUD],
	SS.[INV_VALUE] - SS.[BUDGET_VAL]						AS [CM_VAL_VAR],
	SS.[YTD_QTY]											AS [YTD_QTY_INV],
	SS.[YTD_BUDGET_QTY]										AS [YTD_QTY_BUD],
	SS.[YTD_QTY] - SS.[YTD_BUDGET_QTY]						AS [YTD_QTY_VAR],
	SS.[YTD_CONTRIBUTION]									AS [YTD_GC_INV],
	SS.[YTD_BUDGET_CONTRIBUTION]							AS [YTD_GC_BUD],
	SS.[YTD_CONTRIBUTION] - SS.[YTD_BUDGET_CONTRIBUTION]	AS [YTD_GC_VAR],
	SS.[YTD_VALUE]											AS [YTD_VAL_INV],
	SS.[YTD_BUDGET_VAL]										AS [YTD_VAL_BUD],
	SS.[YTD_VALUE] - SS.[YTD_BUDGET_VAL]					AS [YTD_VAL_VAR],
	SS.[NOMINAL_CODE]
FROM 
				[ASC_LIVE].[dbo].[UDEF_SALES_SUMMARY_TBL]	SS	WITH (NOLOCK)
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts] 						P	ON	SS.[PART]			= P.[Part] COLLATE Latin1_General_CI_AS
LEFT OUTER JOIN [vw_ASC_LIVE_AnalysisCodes]					AC	ON	P.[Analysis3]		= AC.[AnalysisCode]
																AND	AC.[TypeCode]		= 'I'
																AND AC.[LabelCode]		= '3'
--LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_CUS_TBL]				C WITH (NOLOCK)	ON SS.[CUSTOMER_CODE]	= C.[CUS_CODE]
WHERE
--	(LEFT(SS.[CUSTOMER_CODE],1) = '2' OR LEFT(SS.[CUSTOMER_CODE],2) = '35')
	((LEFT(SS.[CUSTOMER_CODE],1) = '2' AND LEFT(SS.[CUSTOMER_CODE],2) <> '25') OR LEFT(SS.[CUSTOMER_CODE],2) = '35')
AND	(
	(NOT (SS.[QTY_INVOICED] <> 0 AND SS.[INV_VALUE] = 0) AND NOT (SS.[YTD_QTY] <> 0 AND SS.[YTD_VALUE] = 0))
	OR
	(LEFT(SS.[CUSTOMER_CODE],1) = 2 AND SS.[NOMINAL_CODE] = '011' AND SS.[CUSTOMER_CODE] IN ('20374','20383'))
	)
AND SS.[MONTH] = DATEPART(MONTH, SYSDATETIME())
--AND SS.[VARIANT_CODE] NOT IN ('391','458')


GO
/****** Object:  View [dbo].[vw_HICS_CoA_PrintMap]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_HICS_CoA_PrintMap] as
SELECT 
	P.[ID],
    P.[CreatedOn],
    P.[CreatedBy],
	U.[FullName]	AS [CreatedBy_FullName],
    P.[LnkCustomer],
    P.[LnkProduct],
    P.[LnkMonographID],
    P.[Filename],
    P.[Deleted],
    P.[DeletedOn],
    P.[DeletedBy]
  FROM [HICSDEV].[dbo].[Tb_CoA_PrintMaps] P  WITH (NOLOCK)
  LEFT outer JOIN vw_HICS_Users U on P.[CreatedBy] = U.[ID]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_CoA_PrintMap]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_HICS_Rep_CoA_PrintMap] AS
SELECT 
	PM.[ID],
	CASE ISNULL(C.[Name],'')
		WHEN '' THEN '*'
		ELSE C.[code] + ': ' + C.[Name]
	END							AS [Customer],
	CASE ISNULL(P.[Part],'')
		WHEN '' THEN '*'
		ELSE P.[Part] + ': ' + P.[Description1] + ' ' + P.[Description2]
	END							AS [Part],
	CASE ISNULL(M.[Name],'')
		WHEN '' THEN '*'
		ELSE RIGHT('00000' + CONVERT(VARCHAR(5),M.[ID]),5) + ': ' + M.[Name]
	END							AS [Monograph],
	PM.[Filename]
FROM
				[vw_HICS_CoA_PrintMap]		PM
LEFT OUTER JOIN [vw_ASC_LIVE_Customers]		C	ON	PM.[LnkCustomer]	= C.[Code]
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]			P	ON	PM.[LnkProduct]		= P.[ID]
LEFT OUTER JOIN [vw_HICS_CoA_Monographs]	M	ON	PM.[LnkMonographID]	= M.[ID]
WHERE
	PM.[Deleted] = 0
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_VATForm]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_Rep_VATForm] as
SELECT DISTINCT
	L.[Warehouse],
	L.[SerialNo], 
	MAX(L.[Quantity]) AS [Quantity],
	SUM(CASE A.[Code]
		WHEN 'BULK' THEN A.[Value]
	END)		AS [Bulk],
	MAX(CASE A.[Code]
		WHEN 'STRENGTH' THEN A.[Value]
	END)		AS [Strength],
	MAX(CASE A.[Code]
		WHEN 'TCF' THEN A.[Value]
	END)		AS [TCF]
FROM
				vw_ASC_LIVE_Lots		L
LEFT OUTER JOIN	vw_ASC_LIVE_Attributes	A	ON	L.[Number] = A.[Lot] 
											AND	L.[Part] = A.[Part]
WHERE
	L.[Warehouse] <> ''
GROUP BY
	L.[Warehouse],
	L.[SerialNo]
GO
/****** Object:  Table [dbo].[Tb_ASC_Licences]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_ASC_Licences](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DTS] [datetime] NOT NULL,
	[ActiveUsers] [int] NOT NULL,
 CONSTRAINT [PK_Tb_ASC_Licences] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_ASCLicenceCheck]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_HICS_Rep_ASCLicenceCheck] as 


select * from [Tb_ASC_Licences] WITH (NOLOCK)
GO
/****** Object:  Table [dbo].[Tb_EPRs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_EPRs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Part] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[SubCategory] [int] NULL,
	[PackagingType] [int] NOT NULL,
	[Weight] [decimal](7, 3) NOT NULL,
	[RecycledContent] [decimal](7, 3) NOT NULL,
	[PackagingForImportedGoods] [bit] NOT NULL,
	[SiteWaste] [bit] NOT NULL,
	[PreviouslyUsedMaterial] [bit] NOT NULL,
	[MadeFromRecycled] [bit] NOT NULL,
	[Recyclable] [bit] NOT NULL,
	[Biodegradable] [bit] NOT NULL,
	[Reusable] [bit] NOT NULL,
 CONSTRAINT [PK_Tb_EPRs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_EPRs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_HICS_EPRs] as 
SELECT
	[ID],
	[CreatedOn],
	[CreatedBy],
	[ModifiedOn],
	[ModifiedBy],
	[Enabled],
	[Part],
	[Category],
	[SubCategory],
	[PackagingType],
	[Weight],
	[RecycledContent],
	[PackagingForImportedGoods],
	[SiteWaste],
	[PreviouslyUsedMaterial],
	[MadeFromRecycled],
	[Recyclable],
	[Biodegradable],
	[Reusable]
FROM
	[Tb_EPRs]
WHERE
	[Deleted] = 0
GO
/****** Object:  Table [dbo].[Tb_EPR_Categories]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_EPR_Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[LnkParentCategory] [int] NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Tb_EPR_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_EPR_PackagingTypes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_EPR_PackagingTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Tb_EPR_PackagingTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_EPRs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_HICS_Rep_EPRs] as 
SELECT
	E.[ID],
	E.[CreatedOn],
	E.[CreatedBy],
	E.[ModifiedOn],
	E.[ModifiedBy],
	E.[Enabled],
	E.[Part],
	P.[Part]						AS [PartName],
	E.[Category],
	C.[Name]						AS [CategoryName],
	E.[SubCategory],
	SC.[Name]						AS [SubCategoryName],
	E.[PackagingType],
	Pa.[Name]						AS [PackagingTypeName],
	E.[Weight],
	E.[RecycledContent],
	E.[PackagingForImportedGoods],
	E.[SiteWaste],
	E.[PreviouslyUsedMaterial],
	E.[MadeFromRecycled],
	E.[Recyclable],
	E.[Biodegradable],
	E.[Reusable]
FROM
				[Tb_EPRs]				E
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]		P	ON E.[Part]				= P.[ID]
LEFT OUTER JOIN	[Tb_EPR_Categories]		C	ON E.[Category]			= C.[ID]
LEFT OUTER JOIN	[Tb_EPR_Categories]		SC	ON E.[SubCategory]		= SC.[ID]
LEFT OUTER JOIN	[Tb_EPR_PackagingTypes]	Pa	ON E.[PackagingType]	= Pa.[ID]
WHERE
	E.[Deleted] = 0
GO
/****** Object:  View [dbo].[vw_ASC_PILOT_Users]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ASC_PILOT_Users] AS
SELECT 
	U.[USER_DATE_PUTIN]									AS [CreatedOn],
	ISNULL(U.[USER_DATE_EDITED],'')						AS [ModifiedOn],
	ISNULL(U.[USER_EDITED],'')							AS [ModifiedBy],
	P.[PP_CODE]											AS [Code],
	U.[USER_NAME]										AS [Username],
	P.[PP_TITLE]										AS [Title],
	P.[PP_FIRST_NAME]									AS [Forenames],
	P.[PP_SURNAME]										AS [Surname],
	CASE P.[PP_FIRST_NAME] + P.[PP_SURNAME]
		WHEN '' THEN U.[USER_NAME]
		ELSE P.[PP_SURNAME] + ', ' + P.[PP_FIRST_NAME]
	END													AS [Fullname],
	P.[PP_JOB_TITLE]									AS [JobTitle],
	ISNULL(P.[PP_EMAIL],'')								AS [Email],
	ISNULL(U.[DATE_IN] + U.[TIME_IN],'')				AS [LastLoggedIn],
	U.[USER_NUMBER_LOGONS]								AS [NumberOfLogons],
	U.[USER_PROFILE_CODE]								AS [SecurityProfile]
	,U.*
FROM
					[ASC_PILOT].[dbo].[SYS_PEOPLE]	P WITH (NOLOCK)
LEFT OUTER JOIN		[ASC_PILOT].[dbo].[SYS_USER]	U WITH (NOLOCK)	ON	P.[PP_CODE] = U.[USER_ID]

GO
/****** Object:  View [dbo].[vw_ASC_PILOT_SystemCodes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_ASC_PILOT_SystemCodes] AS
SELECT 
	
	C.[CDS_UNIQUE]					AS [ID],
	C.[CDS_SOURCE_IND]				AS [SourceID],
	C.[CDS_CREATED]					AS [CreatedOn],
	C.[CDS_UPDATED]					AS [ModifiedOn],
	C.[CDS_PK]						AS [TypeCode],
	CASE C.[CDS_PK]
		WHEN '4' THEN 'Downtime reason code'
		WHEN 'C' THEN 'Customer type'
		WHEN 'G' THEN 'Country code'
		WHEN 'I' THEN 'Rejection code'
		WHEN 'Q' THEN 'Question of Quality actions'
		WHEN 'R' THEN 'Sales Order Status Reason'
		WHEN 'V' THEN 'VAT Information'
		WHEN 'W' THEN 'Warehouse'
		WHEN 'Y' THEN 'UoM'
		ELSE 'Unknown (' + C.[CDS_PK] + ')'
	END								AS [TypeDescription],
	C.[CDS_TYPE]					AS [SystemCode],
	C.[CDS_TEXT]					AS [SystemDescription],
	C.[CDS_TEXT_1]					AS [SystemDescription1],
	C.[CDS_ABC_DAYS]				AS [ABCDays],
	C.[CDS_ABC_LAST_DATE]			AS [ABCLastDate],
	C.[CDS_ABC_NEXT_DATE]			AS [ABCNextDate],
	C.[CDS_CURR_CONVERSION]			AS [CurrencyConversion],
	C.[CDS_CURR_RATE]				AS [CurrencyRate],
	C.[CDS_CURR_ROUNDING]			AS [CurrencyRounding],
	C.[CDS_RECALC]					AS [Recalc],
	C.[CDS_INSP_TYPE]				AS [InspectionType],
	C.[CDS_INSP_REJ_TYPE]			AS [InspectionRejectionType],
	C.[CDS_PAY_CREDIT_DAYS]			AS [PayCreditDays],
	C.[CDS_PAY_CHARGED_AT]			AS [PayChargedAt],
	C.[CDS_PAY_CREDIT_MONTH]		AS [PayCreditMonth],
	C.[CDS_WH_CONS_LOTS]			AS [WHConsLots],
	C.[CDS_SET_DISC_PERC]			AS [SettlementDiscPerc],
	C.[CDS_SET_DISC_DAYS]			AS [SettlementDiscDays],
	C.[CDS_SET_OVER_VALUE]			AS [SettlementDiscOverVal],
	C.[CDS_MILEAGE_RATE]			AS [MileageRate],
	C.[CDS_DUTY_RATE]				AS [DutyRate],
	C.[CDS_DUTY_PER]				AS [DutyPer],
	C.[CDS_USE_AS_ACTUAL_COS]		AS [UseAsActualCos],
	C.[CDS_EU_MEMBER_STATE]			AS [EUMemberState],
	C.[CDS_EDI_MEASURE_IND]			AS [EDIMeasureInd],
	C.[CDS_LABOUR_QTY]				AS [LabourQty],
	C.[CDS_QOQ_TYPE]				AS [QoQType],
	C.[CDS_QOQ_ACTION_CODE]			AS [QoQActionCode]
FROM
	[ASC_PILOT].[dbo].[ASC_CDS_ASC] C WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_PILOT_Customers]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[vw_ASC_PILOT_Customers] AS
SELECT
	A1.[CU_DATE_PUTIN]			AS [CreatedOn],
	A1.[CU_USER_PUTIN]			AS [CreatedBy],
	ISNULL(U1.[Fullname],'')	AS [CreatedByFullname],
	A1.[CU_DATE_EDITED]			AS [ModifiedOn],
	A1.[CU_USER_EDITED]			AS [ModifiedBy],
	ISNULL(U2.[Fullname],'')	AS [ModifiedByFullname],
	A1.[CUCODE]					AS [Code],
	A1.[CUNAME]					AS [Name],
	A1.[CUADDRESS]				AS [AddressStreet],
	A1.[CU_ADDRESS_USER1]		AS [AddressTown],
	A1.[CU_ADDRESS_USER2]		AS [AddressCounty],
	A1.[CUPOSTCODE]				AS [AddressPostcode],
	A1.[CU_COUNTRY]				AS [AddressCountry],
	A1.[CU_COUNTRY_CODE]		AS [CountryCode],
	S1.[SystemDescription]		AS [CountryCodeDescription],
	A1.[CUPHONE]				AS [Telephone],
	A1.[CUFAX]					AS [Fax],
	A1.[CUCONTACT]				AS [ContactFullname],
	A2.[CU_CONTACT_TITLE]		AS [ContactTitle],
	A2.[CU_CONTACT_INITIALS]	AS [ContactInitials],
	A2.[CU_CONTACT_FIRSTNAME]	AS [ContactFirstName],
	A2.[CU_CONTACT_SURNAME]		AS [ContactSurname],
	A2.[CU_CONTACT_JOB]			AS [ContactJobTitle],
	A1.[CUSALUTE]				AS [ContactSalute],
	A2.[CU_MOBILE_NUMBER]		AS [ContactMobile],
	A1.[CU_EMAIL]				AS [ContactEmail],
	A1.[CU_EXPORT_CODE]			AS [ExportCode],
	CASE A1.[CU_EXPORT_CODE]
		WHEN 'U' THEN 'GB VAT'
		WHEN 'O' THEN 'Non-EU State'
		WHEN 'E' THEN 'EU State'
		ELSE 'Unknown (' + A1.[CU_EXPORT_CODE] + ')'
	END							AS [ExportCodeDescription],
	A1.[CU_VAT_REG_NO]			AS [VATNumber],
	A1.[CU_EC_DELIVERY]			AS [EUDelivery],
	A1.[CU_EC_T_NATURE]			AS [EUTransaction],
	A1.[CU_EC_T_MODE]			AS [EUTransport],
	A1.[CUSORT]					AS [SortKey],
	A1.[CUUSER1]				AS [UserSort1],
	A1.[CUUSER2]				AS [UserSort2],
	A1.[CUUSER3]				AS [UserSort3],
	A1.[CUCURRENCYCODE]			AS [Currency],
	A1.[CU_NOTES]				AS [Notes],
	A1.[CU_ANALYSIS]			AS [SalesAnalysis],
	A1.[CU_TAX_CODE]			AS [VATCode],
	S2.[SystemDescription]		AS [VATDescription],
	A1.[CU_SOURCE]				AS [Source],
	A1.[CU_TERMS_LINK]			AS [TermsLink],
	A1.[CU_MULTI_CURR]			AS [MultiCurrency],
	A1.[CU_MULTIADD_FLG]		AS [MultiAddFlg],
	A1.[CU_INV_ADD_CDE]			AS [InvoiceAddressCode],
	A1.[CU_DEL_ADD_CDE]			AS [DeliveryAddressCode],
	A1.[CU_ON_STOP]				AS [OnStop],
	A1.[CU_A_P_DAYS]			AS [APDays],
	A1.[CU_PRICE_KEY]			AS [PriceKey],
	A2.[CU_USRCHAR4]			AS [CoAEmailTo],
	A2.[CU_BANK_BANKNAME]		AS [BankName],
	A2.[CU_BANK_SORT]			AS [BankSortCode],
	A2.[CU_BANK_AC_NO]			AS [BankAccNo],
	A2.[CU_BANK_AC_NAME]		AS [BankAccName],
	A2.[CU_BANK_BACSREF]		AS [BankBACSRef],
	A2.[CU_IBAN_NO]				AS [IBAN],
	A2.[CU_OUR_ACCOUNT_CODE]	AS [OurAccCode]
FROM
				[ASC_PILOT].[dbo].[SL_ACCOUNTS]	A1 WITH (NOLOCK)
LEFT OUTER JOIN [ASC_PILOT].[dbo].[SL_ACCOUNTS2]	A2 WITH (NOLOCK)	ON	A1.[CUCODE]				= A2.[CUCODE2]
LEFT OUTER JOIN	[vw_ASC_PILOT_USERS]				U1	ON	A1.[CU_USER_PUTIN]		= U1.[Code]
LEFT OUTER JOIN	[vw_ASC_PILOT_USERS]				U2	ON	A1.[CU_USER_EDITED]		= U2.[Code]
LEFT OUTER JOIN [vw_ASC_PILOT_SystemCodes]		S1	ON	A1.[CU_COUNTRY_CODE]	= S1.[SystemCode]	COLLATE Latin1_General_CI_AS
													AND	S1.[TypeCode]			= 'G'
LEFT OUTER JOIN [vw_ASC_PILOT_SystemCodes]		S2	ON	A1.[CU_TAX_CODE]		= S2.[SystemCode]	COLLATE Latin1_General_CI_AS
													AND	S2.[TypeCode]			= 'V'


												
GO
/****** Object:  View [dbo].[vw_HICS_Rep_Log]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_HICS_Rep_Log] as
SELECT 
	L.[ID],
	L.[CreatedOn], 
	L.[CreatedBy],
	U.[FullName],
	L.[Computer],
	L.[Source],
	L.[Environment],
	L.[Category],
	L.[Process],
	L.[Message]
FROM 
				[vw_HICS_Log] L
LEFT OUTER JOIN [vw_HICS_Users] U ON L.[CreatedBy] = U.[ID]
WHERE 
	L.[CreatedOn] >= DATEADD(yy,-2,convert(date,sysdatetime()))


GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_BoMs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_Rep_BoMs] as
SELECT 
	BOM.[ParentPart]				AS [Parent Part],
	PMAP.[Description1]				AS [Parent Description1],
	PMAP.[Description2]				AS [Parent Description2],
	PMAP.[UoM]						AS [Parent UoM],
	PMAP.[RRP]						AS [Parent Conversion Factor],
	PMAP.[Capacity]					AS [Parent Capacity],
	PMAP.[CapacityPer]				AS [Parent Capacity Per],
	PMAP.[CapacityUoM]				AS [Parent Capacity UoM],
	PMAP.[Weight]					AS [Parent Weight],
	PMAP.[WeightPer]				AS [Parent Weight Per],
	PMAP.[WeightUoM]				AS [Parent Weight UoM],
	PMAP.[ShrinkagePercent]			AS [Parent Shrinkage],
	PMAP.[MaterialCost]				AS [Parent Std. Mat./Purch. Cost],
	PMAP.[MaterialCostPer]			AS [Parent Std. Mat./Purch. Cost Per Qty. of],
	PMAP.[ProcurementCode]			AS [Parent Procurement Code],
	CASE PMAP.[ProcurementCode]
		WHEN 'M' THEN 'Manufactured'
		WHEN 'P' THEN 'Purchased'
		WHEN 'S' THEN 'Sub-contractor'
		WHEN 'O' THEN 'Other'
		WHEN 'I' THEN 'Ignore for MRP purposes'
		WHEN '0' THEN 'Phantomised'
		ELSE 'UNKNOWN'
	END								AS [Parent Procurement Description],
	BOM.[OwnedPart]					AS [Child Part],
	PMAO.[Description1]				AS [Child Description1],
	PMAO.[Description2]				AS [Child Description2],
	PMAO.[UoM]						AS [Child UoM],
	PMAO.[RRP]						AS [Child Conversion Factor],
	PMAO.[Capacity]					AS [Child Capacity],
	PMAO.[CapacityPer]				AS [Child Capacity Per],
	PMAO.[CapacityUoM]				AS [Child Capacity UoM],
	PMAO.[Weight]					AS [Child Weight],
	PMAO.[WeightPer]				AS [Child Weight Per],
	PMAO.[WeightUoM]				AS [Child Weight UoM],
	PMAO.[ShrinkagePercent]			AS [Child Shrinkage],
	PMAO.[MaterialCost]				AS [Child Std. Mat./Purch. Cost],
	PMAO.[MaterialCostPer]			AS [Child Std. Mat./Purch. Cost Per Qty. of],
	PMAO.[ProcurementCode]			AS [Child Procurement Code],
	CASE PMAO.[ProcurementCode]					
		WHEN 'M' THEN 'Manufactured'
		WHEN 'P' THEN 'Purchased'
		WHEN 'S' THEN 'Sub-contractor'
		WHEN 'O' THEN 'Other'
		WHEN 'I' THEN 'Ignore for MRP purposes'
		WHEN '0' THEN 'Phantomised'
		ELSE 'UNKNOWN'
	END								AS [Child Procurement Description],
	BOM.[QtyUsed]					AS [BOM Quantity Used]
FROM 
					[vw_ASC_LIVE_BoMs]	BOM
	LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]	PMAP	ON BOM.[ParentPart]	= PMAP.[Part]
	LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]	PMAO	ON BOM.[OwnedPart]	= PMAO.[Part]
GO
/****** Object:  View [dbo].[vw_Matrix_ProductGroups]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vw_Matrix_ProductGroups] as
select 
	[ID],
	[AnalysisCode]							AS [Code],
	[AnalysisDescription]					AS [Description]
from 
	[vw_ASC_LIVE_AnalysisCodes] 
WHERE
	[TypeCode] = 'I' 
AND [LabelCode] = 0
GO
/****** Object:  View [dbo].[vw_HICS_Rep_AR_Suppliers]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  view [dbo].[vw_HICS_Rep_AR_Suppliers] as 
SELECT 
	T2.[Type],
	T2.[Brand],
	T2.[Series],
	T2.[Model],
	T2.[SupplierName],
	T2.[ActiveCount],
	CASE T2.[ActiveCount]
		WHEN 0 THEN 0 
		ELSE T2.[Total]/T2.[ActiveCount] 
	END		AS [AverageCost],
	T2.[LastPurchased],
	T2.[SupplierID] as [PurchasedFrom],
	T2.[SortKey]
FROM
	(SELECT
		T.[Name]		AS [Type],
		B.[Brand],
		B.[Series],
		B.[Model],
		CASE ISNULL(S.[Name],'')
			WHEN '' THEN C.[Name]
			ELSE S.[Name] 
		END				AS [SupplierName],

		(SELECT COUNT([ID]) FROM [vw_HICS_Rep_AR] WHERE [BSMID] = T1.[BSMID] AND [SupplierID] = T1.[SupplierID] AND [StatusID] = 2) AS [ActiveCount],
		ISNULL((SELECT SUM([Cost]) FROM [vw_HICS_Rep_AR] WHERE [BSMID] = T1.[BSMID] AND [SupplierID] = T1.[SupplierID] AND [StatusID] = 2),0) AS [Total],
		(SELECT MAX([PurchasedOn]) FROM [vw_HICS_Rep_AR] WHERE [BSMID] = T1.[BSMID] AND [SupplierID] = T1.[SupplierID] AND [StatusID] = 2) AS [LastPurchased],
		T1.[SupplierID],
		T1.[SortKey]
	FROM
		(SELECT DISTINCT
			A.[BSMID],
			A.[SupplierID],
			CASE A.[SupplierID]
				WHEN 0 then 1
				ELSE 0
			END							AS [SortKey]
		FROM
						[vw_HICS_Rep_AR]			A)				T1
	LEFT OUTER JOIN [Tb_AR_BSMs]				B	ON B.[ID] = T1.[BSMID]
	LEFT OUTER JOIN [Tb_AR_BSMTypes]			T	ON T.[ID] = B.[BSMTypeID]
	LEFT OUTER JOIN [Tb_AR_Suppliers]			C	ON C.[ID] = T1.[SupplierID]
	LEFT OUTER JOIN [vw_ASC_LIVE_Suppliers1]	S	ON S.[Code] = C.[SCSupRef]) T2

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_PartswithBoMs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_ASC_LIVE_Rep_PartswithBoMs] as
SELECT
	'Parent'	as [RecordType],
	CASE P.[ProcurementCode]
		WHEN '0' THEN 'Yes'
		ELSE 'No'
	END			AS [Phantomised],
	(SELECT COUNT(*) FROM [vw_ASC_LIVE_BoMs] WHERE [ParentPart] = P.[Part]) AS [ChildCount],
	P.[Part]	as [ParentPart],
	P.*
FROM
	[vw_ASC_LIVE_Parts] P
UNION ALL
SELECT
	'Child'			as [RecordType],
	CASE P.[ProcurementCode]
		WHEN '0' THEN 'Yes'
		ELSE 'No'
	END			AS [Phantomised],
	(SELECT COUNT(*) FROM [vw_ASC_LIVE_BoMs] WHERE [ParentPart] = P.[Part]) AS [ChildCount],
	B.[ParentPart]	as [ParentPart],
	P.*
FROM
				[vw_ASC_LIVE_BoMs]	B
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts] P	ON	P.[Part] = B.[OwnedPart]
GO
/****** Object:  View [dbo].[vw_Matrix_StockRegister_Types]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vw_Matrix_StockRegister_Types] as
select 
	[ID],
	[Name]									AS [Code],
	ISNULL([Description],'')				AS [Description]
from 
	[Tb_SR_Types] WITH (NOLOCK)
WHERE
	[Deleted] = 0 
AND [Enabled] = 1
GO
/****** Object:  View [dbo].[vw_HICS_Rep_AR_SupplierDetail]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_HICS_Rep_AR_SupplierDetail]
as
SELECT 
	A.[ID],
	CASE ISNULL(S.[Name],'')
		WHEN '' THEN A.[Name]
		ELSE S.[Name]
	END																					AS [Name],
	ISNULL(A.[AccRef],'')																AS [AccRef],
	ISNULL(A.[AccMgr],'')																AS [AccMgr],
	ISNULL(A.[AccMgr_Email],'')															AS [AccMgr_Email],
	ISNULL(A.[AccMgr_Tel],'')															AS [AccMgr_Tel],
	ISNULL(A.[Website],'')																AS [Website],
	(SELECT COUNT([ID]) FROM [vw_HICS_Rep_AR] WHERE [SupplierID] = A.[ID])				AS [Assets],
	ISNULL((SELECT SUM([Cost]) FROM [vw_HICS_Rep_AR] WHERE [SupplierID] = A.[ID]),0)	AS [Spend],
	ISNULL((SELECT SUM([Cost]) FROM [vw_HICS_Rep_AR] WHERE [SupplierID] = A.[ID] 
													AND	[PurchasedOn] >= CONVERT(DATE,DATEADD(dd,1,EOMONTH(SYSDATETIME(),-13))) 
													AND [PurchasedOn] <= CONVERT(DATE,EOMONTH(SYSDATETIME(),-1))),0) AS [YearsSpend]
FROM
				[Tb_AR_Suppliers] A
LEFT OUTER JOIN [vw_ASC_LIVE_Suppliers1] S ON A.[SCSupRef] = S.[Code]
WHERE
	A.[Deleted] = 0
--	A.[Enabled] = 1
GO
/****** Object:  View [dbo].[vw_HICS_Rep_AR_SupplierSpend]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_HICS_Rep_AR_SupplierSpend] as
SELECT
	C.[ID],
	T2.[Start],
	T2.[End],
	ISNULL((SELECT SUM([Cost]) FROM [vw_HICS_Rep_AR] WHERE [SupplierID] = C.[ID] AND [PurchasedOn] >= T2.[Start] AND [PurchasedOn] <= T2.[End]),0) as [Spend]
FROM
	[Tb_AR_Suppliers]	C
CROSS JOIN
(SELECT 
	CONVERT(DATE,DATEADD(dd,1,EOMONTH(SYSDATETIME(),-(T1.[Period]+1)))) AS [Start],
	CONVERT(DATE,EOMONTH(SYSDATETIME(),-T1.[Period])) AS [End]
FROM 
	(SELECT * FROM (VALUES(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12)) T2([Period])) T1) T2
WHERE
	C.[Deleted] = 0
--	C.[Enabled] = 1
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Rep_Attributes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_Rep_Attributes] as 
select 
	MIN([CreatedOn]) AS [Created],
	[Lot],
	[LotSequence],
	[Group],
	[SerialNo],
	[Part],
	MAX(CASE [Code] WHEN ' ' THEN [Value] ELSE 0 END) AS [Blank],
	MAX(CASE [Code] WHEN 'BRAND' THEN [Text] ELSE '' END) AS [Brand],
	MAX(CASE [Code] WHEN 'BULK' THEN [Value] ELSE 0 END) AS [BULK],
	MAX(CASE [Code] WHEN 'DUTY STAT' THEN [Text] ELSE '' END) AS [DUTY STAT],
	MAX(CASE [Code] WHEN 'EPC' THEN [Text] ELSE '' END) AS [EPC],
	MAX(CASE [Code] WHEN 'LOA' THEN [Value] ELSE 0 END) AS [LOA],
	MAX(CASE [Code] WHEN 'LOA-FX' THEN [Value] ELSE 0 END) AS [LOA-FX],
	MAX(CASE [Code] WHEN 'PACKKIND' THEN [Text] ELSE '' END) AS [PACKKIND],
	MAX(CASE [Code] WHEN 'STRENGTH' THEN [Value] ELSE 0 END) AS [STRENGTH],
	MAX(CASE [Code] WHEN 'TCF' THEN [Value] ELSE 0 END) AS [TCF],
	MAX(CASE [Code] WHEN 'VK-GLASS' THEN [Value] ELSE 0 END) AS [VK-GLASS],
	MAX(CASE [Code] WHEN 'VK-OTHER' THEN [Value] ELSE 0 END) AS [VL-OTHER],
	MAX(CASE [Code] WHEN 'VK-PAPER' THEN [Value] ELSE 0 END) AS [VK-PAPER],
	MAX(CASE [Code] WHEN 'VK-PLASTIC' THEN [Value] ELSE 0 END) AS [VK-PLASTIC]
from 
	vw_ASC_LIVE_Attributes
--WHERE
--	CreatedOn > dateadd(year,-1,getdate())
group by 
	[Lot],
	[LotSequence],
	[Group],
	[SerialNo],
	[Part]
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Audit]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_ASC_LIVE_Audit] as
SELECT 
[AUD_UNIQUE] AS [ID],
[AUD_SOURCE_IND] AS [SourceID],
[AUD_CREATED] AS [CreatedOn],
[AUD_UPDATED] AS [ModifiedOn],
[AUD_REC_TYPE] COLLATE Latin1_General_CI_AS AS [RecordType],
[AUD_WHEN] AS [When],
[AUD_SUB] AS [Sequence],
[AUD_USER] COLLATE Latin1_General_CI_AS AS [User],
[AUD_TYPE] COLLATE Latin1_General_CI_AS AS [Type],
[AUD_FILE] COLLATE Latin1_General_CI_AS AS [Filepath],
[AUD_FIELD] COLLATE Latin1_General_CI_AS AS [Field],
[AUD_OLD_VALUE] COLLATE Latin1_General_CI_AS AS [OldValue],
[AUD_NEW_VALUE] COLLATE Latin1_General_CI_AS AS [NewValue],
[AUD_OPTION] COLLATE Latin1_General_CI_AS AS [Option]
FROM	
	[ASC_LIVE].[dbo].[ASC_AUD_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_BoMAudit]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[vw_ASC_LIVE_BoMAudit] as
SELECT
	[BOH_UNIQUE]			AS [ID],
	[BOH_SOURCE_IND]		AS [SourceID],
	[BOH_CREATED]			AS [CreatedOn],
	[BOH_UPDATED]			AS [ModifiedOn],
	[BOH_PARENT_ONLY]	COLLATE Latin1_General_CI_AS	AS [Parent],
	[BOH_PARENT_REV]	COLLATE Latin1_General_CI_AS	AS [ParentRev],
	[BOH_DATE]				AS [When],
	[BOH_SUB]				AS [Sequence],
	[BOH_USED_PART_ONLY] COLLATE Latin1_General_CI_AS	AS [Part],
	[BOH_USED_PART_REV]	 COLLATE Latin1_General_CI_AS	AS [PartRev],
	[BOH_ACTION]		COLLATE Latin1_General_CI_AS	AS [Type],
	[BOH_QTY]				AS [Quantity],
	[BOH_FACTOR]			AS [Factor],
	[BOH_USER_ID]	COLLATE Latin1_General_CI_AS		AS [USer]
FROM 
	[ASC_LIVE].[dbo].[ASC_BOH_TBL]	 WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_CusAdd1]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_CusAdd1] as
SELECT 
	[AD_ACC_CODE]					AS [CustomerCode],
    [AD_CON_CODE]					AS [AddressCode],
    [AD_HOME_PHONE]					AS [HomePhone],
    [AD_EXTENSION]					AS [Extension],
    [AD_PHONE]						AS [Phone],
    [AD_FAX]						AS [Fax],
    [AD_MOBILE]						AS [Mobile],
    [AD_E_MAIL]						AS [EMail],
    [AD_CONTACT]					AS [Contact],
    [AD_CONT_SALUTE]				AS [ContSalute],
    [AD_PROSPECT]					AS [Prospect],
    [AD_NOTE]						AS [Note],
    [AD_CON_TITLE]					AS [ContactTitle],
    [AD_CON_INITIALS]				AS [ContactInitials],
    [AD_CON_SURNAME]				AS [ContactSurname],
    [AD_CON_JOB]					AS [ContactJobTitle],
    [AD_CON_FNAME]					AS [ContactForenames],
    [AD_DEALERCODE]					AS [DealerCode],
    [AD_USERTEXT1]					AS [UserText1],
    [AD_USERTEXT2]					AS [UserText2],
    [AD_USERDATE1]					AS [UserDate1],
    [AD_EDITED_TIME]				AS [Editedtime],
    [AD_RECALL_TIME]				AS [Recalltime],
    [AD_USER_EDITED]				AS [EditedBy],
    [AD_USER_PUTIN]					AS [CreatedBy],
    [AD_DATE_PUTIN]					AS [CreatedOn],
    [AD_DATE_EDITED]				AS [ModifiedOn],
    [AD_USERTEXT3]					AS [UserText3],
	[AD_USERTEXT4]					AS [UserText4],
	[AD_USERTEXT5]					AS [UserText5],
	[AD_USERTEXT6]					AS [UserText6],
    [AD_USERDATE2]					AS [UserDate2],
    [AD_USERDATE3]					AS [UserDate3],
    [AD_USERTEXT7]					AS [UserText7],
    [AD_USERTEXT8]					AS [UserText8],
    [AD_USERTEXT9]					AS [UserText9],
    [AD_USERTEXT10]					AS [UserText10],
    [AD_USER_ALOC]					AS [UserAlloc],
    [AD_ANALYSIS]					AS [Analysis],
    [AD_GROUP]						AS [Group],
    [AD_DLR_NOTIFICATION_DATE]		AS [DlrNotificationDate],
    [AD_CNT_NOTIFICATION_DATE]		AS [CntNotificationDate],
    [AD_SOURCE]						AS [Source],
    [AD_CC_EMAIL]					AS [CCEmail],
    [AD_COUNTRY_CODE]				AS [CountryCode],
    [AD_EXPORT_CODE]				AS [ExportCode],
    [AD_BRANCH_ID]					AS [BranchID],
    [AD_VAT_REG_NO]					AS [VATRegNo],
    [AD_EC_DELIVERY]				AS [ECDelivery],
    [AD_EC_T_NATURE]				AS [ECTNature],
    [AD_EC_T_MODE]					AS [ECTMode],
    [AD_DATE_ALLOCATED]				AS [DateAllocated],
    [AD_DELIVERY_ROUTE]				AS [DeliveryRoute],
    [AD_CODE]						AS [Code],
    [AD_ADDRESS]					AS [Address],
    [AD_POSTCODE]					AS [Postcode],
    [AD_INV_ADDRESS]				AS [InvAddress],
    [AD_DEL_ADDRESS]				AS [DelAddress],
    [AD_STAT_ADDRESS]				AS [StatAddress],
    [AD_ACCOUNTNAME]				AS [AccountName],
    [AD_USERNUM1]					AS [UserNum1],
    [AD_USERFLAG1]					AS [UserFlag1],
	[AD_USERFLAG2]					AS [UserFlag2],
	[AD_USERFLAG3]					AS [UserFlag3],
	[AD_USERFLAG4]					AS [UserFlag4],
    [SL_AD_PRIMARY]					AS [Primary],
    [AD_USERNUM2]					AS [UserNum2],
    [AD_USERNUM3]					AS [UserNum3],
    [AD_ADDRESS_USER1]				AS [AddressUser1],
    [AD_ADDRESS_USER2]				AS [AddressUser2],
    [AD_LEVEL]						AS [AdLevel],
    [AD_DEL_ADDRESS_2]				AS [DelAddress2],
    [AD_DLR_NOTIFICATION]			AS [DlrNotification],
    [AD_CNT_NOTIFICATION]			AS [CntNotification],
    [AD_COUNTRY]					AS [Country],
    [AD_DO_NOT_USE]					AS [DoNotUse],
    [AD_USED_FLAG]					AS [Used],
    [AD_DO_NOT_EMAIL]				AS [DoNotEMail],
    [AD_CONTACTCHAR1]				AS [ContactChar1],
	[AD_CONTACTCHAR2]				AS [ContactChar2],
	[AD_CONTACTCHAR3]				AS [ContactChar3],
	[AD_CONTACTCHAR4]				AS [ContactChar4],
	[AD_CONTACTCHAR5]				AS [ContactChar5],
	[AD_CONTACTCHAR6]				AS [ContactChar6],
	[AD_CONTACTCHAR7]				AS [ContactChar7],
	[AD_CONTACTCHAR8]				AS [ContactChar8],
	[AD_CONTACTCHAR9]				AS [ContactChar9],
	[AD_CONTACTCHAR10]				AS [ContactChar10],
	[AD_CONTACTCHAR11]				AS [ContactChar11],
	[AD_CONTACTCHAR12]				AS [ContactChar12],
    [AD_CONTACTDATE1]				AS [ContactDate1],
	[AD_CONTACTDATE2]				AS [ContactDate2],
	[AD_CONTACTDATE3]				AS [ContactDate3],
	[AD_CONTACTDATE4]				AS [ContactDate4],
	[AD_CONTACTDATE5]				AS [ContactDate5],
	[AD_CONTACTDATE6]				AS [ContactDate6],
	[AD_CONTACTDATE7]				AS [ContactDate7],
	[AD_CONTACTDATE8]				AS [ContactDate8],
	[AD_CONTACTDATE9]				AS [ContactDate9],
	[AD_CONTACTFLAG1]				AS [ContactFlag1],
	[AD_CONTACTFLAG2]				AS [ContactFlag2],
	[AD_CONTACTFLAG3]				AS [ContactFlag3],
	[AD_CONTACTFLAG4]				AS [ContactFlag4],
	[AD_CONTACTFLAG5]				AS [ContactFlag5],
	[AD_CONTACTNUM1]				AS [ContactNum1],
	[AD_CONTACTNUM2]				AS [ContactNum2],
	[AD_CONTACTNUM3]				AS [ContactNum3],
	[AD_CONTACTNUM4]				AS [ContactNum4],
	[AD_CONTACTNUM5]				AS [ContactNum5],
    [AD_POSTCODE_SEARCH]			AS [PostcodeSearch]
FROM 
	[ASC_LIVE].[dbo].[SL_ADDRESSES] WITH (NOLOCK)
  
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_CusAdd2]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_CusAdd2] as
SELECT 
	[AD_CHAR1]				AS [Char1],
	[AD_CHAR2]				AS [Char2],
	[AD_CHAR3]				AS [Char3],
	[AD_CHAR4]				AS [Char4],
    [AD_DATE1]				AS [Date1],
    [AD_DATE2]				AS [Date2],
    [AD_USRCHAR1]			AS [UserChar1],
    [AD_USRCHAR2]			AS [UserChar2],
    [AD_USRCHAR3]			AS [UserChar3],
    [AD_USRCHAR4]			AS [UserChar4],
    [AD_USRDATE1]			AS [UserDate1],
    [AD_USRDATE2]			AS [UserDate2],
    [AD_CON_CODE2]			AS [AddressCode],
    [AD_ANA_NUMBER]			AS [ANANumber],
    [AD_USRCHAR5]			AS [UserChar5],
	[AD_USRCHAR6]			AS [UserChar6],
	[AD_USRCHAR7]			AS [UserChar7],
	[AD_USRCHAR8]			AS [UserChar8],
    [AD_USRDATE3]			AS [UserDate3],
    [AD_PRIMARY_2]			AS [Primary2],
    [AD_FLAG1]				AS [Flag1],
    [AD_FLAG2]				AS [Flag2],
    [AD_NUM1]				AS [Num1],
    [AD_NUM2]				AS [Num2],
    [AD_USRFLAG1]			AS [UserFlag1],
    [AD_USRFLAG2]			AS [UserFlag2],
    [AD_USRNUM1]			AS [UserNum1],
    [AD_USRNUM2]			AS [UserNum2],
    [AD_LOG_UPDATED]		AS [LogUpdated],
    [AD_USRFLAG3]			AS [UserFlag3],
    [AD_USRNUM3]			AS [UserNum3]
FROM 
	[ASC_LIVE].[dbo].[SL_ADDRESSES2] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_CusAdd3]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_CusAdd3] as
SELECT 
	[AD_PRIMARY_3]			AS [Primary3],
    [AD3_USRCHAR1]			AS [UserChar1],
	[AD3_USRCHAR2]			AS [UserChar2],
	[AD3_USRCHAR3]			AS [UserChar3],
	[AD3_USRCHAR4]			AS [UserChar4],
	[AD3_USRCHAR5]			AS [UserChar5],
	[AD3_USRCHAR6]			AS [UserChar6],
	[AD3_USRCHAR7]			AS [UserChar7],
	[AD3_USRCHAR8]			AS [UserChar8],
	[AD3_USRCHAR9]			AS [UserChar9],
	[AD3_USRCHAR10]			AS [UserChar10],
	[AD3_USRCHAR11]			AS [UserChar11],
	[AD3_USRCHAR12]			AS [UserChar12],
    [AD3_USRDATE1]			AS [UserDate1],
	[AD3_USRDATE2]			AS [UserDate2],
	[AD3_USRDATE3]			AS [UserDate3],
	[AD3_USRDATE4]			AS [UserDate4],
	[AD3_USRDATE5]			AS [UserDate5],
	[AD3_USRDATE6]			AS [UserDate6],
	[AD3_USRDATE7]			AS [UserDate7],
	[AD3_USRDATE8]			AS [UserDate8],
	[AD3_USRDATE9]			AS [UserDate9],
    [AD3_USRNUM1]			AS [UserNum1],
	[AD3_USRNUM2]			AS [UserNum2],
	[AD3_USRNUM3]			AS [UserNum3],
	[AD3_USRNUM4]			AS [UserNum4],
	[AD3_USRNUM5]			AS [UserNum5],
    [AD3_USRFLAG1]			AS [UserFlag1],
	[AD3_USRFLAG2]			AS [UserFlag2],
	[AD3_USRFLAG3]			AS [UserFlag3],
	[AD3_USRFLAG4]			AS [UserFlag4],
    [AD3_USRFLAG5]			AS [UserFlag5],
    [AD3_USRTIME1]			AS [UserTime1]
FROM 
	[ASC_LIVE].[dbo].[SL_ADDRESSES3] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_CusAdd4]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_CusAdd4] as
SELECT
	A1.[CUSAD_UNIQUE]				AS [ID],
    A1.[CUSAD_CREATED]				AS [CreatedOn],
    A1.[CUSAD_SOURCE_IND]			AS [SourceID],
    A1.[CUSAD_UPDATED]				AS [ModifiedOn],
    A1.[CUSAD_CODE]			COLLATE Latin1_General_CI_AS		AS [CustomerCode],
    A1.[CUSAD_SL_AD_CODE]			AS [AddressCode],
    A1.[CUSAD_SUB]					AS [Sub],
    CASE A1.[CUSAD_DEL_CODE] 
		WHEN '' THEN 
			A1.[CUSAD_CODE]  +
			CASE A1.[CUSAD_SL_AD_CODE] 
				WHEN 1 THEN ''
				ELSE CONVERT(VARCHAR(10),A2.[SL_AD_PRIMARY])
			END
		ELSE A1.[CUSAD_DEL_CODE] 
	END COLLATE Latin1_General_CI_AS							AS [DelCode],
    A1.[CUSAD_DEL_NAME]	COLLATE Latin1_General_CI_AS		AS [DelName],
    A1.[CUSAD_ANAL_1]	COLLATE Latin1_General_CI_AS			AS [Analysis1],
	A1.[CUSAD_ANAL_2]	COLLATE Latin1_General_CI_AS			AS [Analysis2],
	A1.[CUSAD_ANAL_3]	COLLATE Latin1_General_CI_AS			AS [Analysis3],
	A1.[CUSAD_ANAL_4]	COLLATE Latin1_General_CI_AS			AS [Analysis4],
	A1.[CUSAD_ANAL_5]	COLLATE Latin1_General_CI_AS			AS [Analysis5],
	A1.[CUSAD_ANAL_6]	COLLATE Latin1_General_CI_AS			AS [Analysis6],
	A1.[CUSAD_ANAL_7]	COLLATE Latin1_General_CI_AS			AS [Analysis7],
	A1.[CUSAD_ANAL_8]	COLLATE Latin1_General_CI_AS			AS [Analysis8],
	A1.[CUSAD_ANAL_9]	COLLATE Latin1_General_CI_AS			AS [Analysis9],
	A1.[CUSAD_ANAL_10]	COLLATE Latin1_General_CI_AS			AS [Analysis10],
    A1.[CUSAD_EDI_OWN_LOC]	COLLATE Latin1_General_CI_AS		AS [EDIOwnLoc],
    A1.[CUSAD_EDI_EAN_LOC]	COLLATE Latin1_General_CI_AS		AS [EDIEANLoc],
    A1.[CUSAD_TAX]					AS [Tax],
    A1.[CUSAD_WEB_ADD]		COLLATE Latin1_General_CI_AS		AS [Website],
    A1.[CUSAD_TRANS_ROUTE]	COLLATE Latin1_General_CI_AS		AS [TransportRoute],
    A1.[CUSAD_TRANS_DROP]			AS [TransportDrop],
    A1.[CUSAD_LEAD_TIME]			AS [LeadTime],
    A1.[CUSAD_TS_CALL_FREQ]		AS [CallFreq],
    A1.[CUSAD_TS_CALL_MON]			AS [TSCallMon],
	A1.[CUSAD_TS_CALL_TUE]			AS [TSCallTue],
    A1.[CUSAD_TS_CALL_WED]			AS [TSCallWed],
    A1.[CUSAD_TS_CALL_THU]			AS [TSCallThu],
    A1.[CUSAD_TS_CALL_FRI]			AS [TSCallFri],
    A1.[CUSAD_TS_CALL_SAT]			AS [TSCallSat],
    A1.[CUSAD_TS_CALL_SUN]			AS [TSCallSun],
    A1.[CUSAD_TS_OPERATOR]		COLLATE Latin1_General_CI_AS	AS [TSOperator],
    A1.[CUSAD_TEMPLATE_CODE]	COLLATE Latin1_General_CI_AS	AS [TemplateCode],
    A1.[CUSAD_TRANS_ROUTE_MON]	COLLATE Latin1_General_CI_AS	AS [TransRouteMon],
    A1.[CUSAD_TRANS_ROUTE_TUE]	COLLATE Latin1_General_CI_AS	AS [TransRouteTue],
    A1.[CUSAD_TRANS_ROUTE_WED]	COLLATE Latin1_General_CI_AS	AS [TransRouteWed],
    A1.[CUSAD_TRANS_ROUTE_THU]	COLLATE Latin1_General_CI_AS	AS [TransRouteThu],
    A1.[CUSAD_TRANS_ROUTE_FRI]	COLLATE Latin1_General_CI_AS	AS [TransRouteFri],
    A1.[CUSAD_TRANS_ROUTE_SAT]	COLLATE Latin1_General_CI_AS	AS [TransRouteSat],
    A1.[CUSAD_TRANS_ROUTE_SUN]	COLLATE Latin1_General_CI_AS	AS [TransRouteSun],
    A1.[CUSAD_TRANS_DROP_MON]		AS [TransDropMon],
    A1.[CUSAD_TRANS_DROP_TUE]		AS [TransDropTue],
    A1.[CUSAD_TRANS_DROP_WED]		AS [TransDropWed],
    A1.[CUSAD_TRANS_DROP_THU]		AS [TransDropThu],
    A1.[CUSAD_TRANS_DROP_FRI]		AS [TransDropFri],
    A1.[CUSAD_TRANS_DROP_SAT]		AS [TransDropSat],
    A1.[CUSAD_TRANS_DROP_SUN]		AS [TransDropSun]
FROM 
				[ASC_LIVE].[dbo].[ASC_SL_ADDRESSES] A1   WITH (NOLOCK)
LEFT OUTER JOIN	[ASC_LIVE].[dbo].[SL_ADDRESSES]		A2	 WITH (NOLOCK) ON	A1.[CUSAD_CODE]			= A2.[AD_ACC_CODE] COLLATE Latin1_General_CI_AS
																		AND	A1.[CUSAD_SL_AD_CODE]	= A2.[AD_CODE] 
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_CustomerNotes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_CustomerNotes] as 
select 
	A.[CUCODE]		AS [CustomerCode],
	A.[CU_NOTES]	AS [Notes]
from 
	[ASC_LIVE].[dbo].[SL_ACCOUNTS] A WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Customers3]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_Customers3] as
SELECT 
	[CU_PRIMARY_3]		AS [Primary3],
    [CU3_USRCHAR1]		AS [UserChar1],
    [CU3_USRCHAR2]		AS [UserChar2],
    [CU3_USRCHAR3]		AS [UserChar3],
    [CU3_USRCHAR4]		AS [UserChar4],
    [CU3_USRCHAR5]		AS [UserChar5],
    [CU3_USRCHAR6]		AS [UserChar6],
    [CU3_USRCHAR7]		AS [UserChar7],
    [CU3_USRCHAR8]		AS [UserChar8],
    [CU3_USRCHAR9]		AS [UserChar9],
    [CU3_USRCHAR10]		AS [UserChar10],
    [CU3_USRCHAR11]		AS [UserChar11],
    [CU3_USRCHAR12]		AS [UserChar12],
    [CU3_USRCHAR13]		AS [UserChar13],
    [CU3_USRCHAR14]		AS [UserChar14],
    [CU3_USRDATE1]		AS [UserDate1],
    [CU3_USRDATE2]		AS [UserDate2],
    [CU3_USRDATE3]		AS [UserDate3],
    [CU3_USRDATE4]		AS [UserDate4],
    [CU3_USRDATE5]		AS [UserDate5],
    [CU3_USRDATE6]		AS [UserDate6],
    [CU3_USRDATE7]		AS [UserDate7],
    [CU3_USRNUM1]		AS [UserNum1],
    [CU3_USRNUM2]		AS [UserNum2],
    [CU3_USRNUM3]		AS [UserNum3],
    [CU3_USRNUM4]		AS [UserNum4],
    [CU3_USRNUM5]		AS [UserNum5]
FROM 
	[ASC_LIVE].[dbo].[SL_ACCOUNTS3] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_CustomerTerms]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_CustomerTerms] as
SELECT
	[SLT_PRIMARY] AS [ID],
	[SLT_CODE] AS [Code],
	[SLT_DESCRIPTION] AS [Description],
	[SLT_TERMS] AS [Terms],
	[SLT_DELIVERY_METHOD] AS [DeliveryMethod],
	[SLT_USER_PUTIN] AS [CreatedBy],
	[SLT_DATE_PUTIN] AS [CreatedOn],
	[SLT_USER_EDITED] AS [ModifiedBy],
	[SLT_DATE_EDITED] AS [ModifiedOn],
	[SLT_SOURCE] AS [Source],
	[SLT_CREDIT_CONTROLLER] AS [CreditController],
	[SLT_TOTAL_DISC] AS [TotalDiscount],
	[SLT_LINE_DISC] AS [LineDiscount],
	[SLT_CREDIT_LIMIT] AS [CreditLimit],
	[SLT_SETT_DISC_1] AS [SettDiscount1],
	[SLT_SETT_DAYS_1] AS [SettDays1],
	[SLT_SETT_DISC_2] AS [SettDiscount2],
	[SLT_SETT_DAYS_2] AS [SettDays2],
	[SLT_DELIVERY_CHARGE] AS [DeliveryCharge],
	[SLT_DELIVERY_CHARGE_PCNT] AS [DeliveryChargePercent],
	[SLT_MIN_ORDER] AS [MinOrder],
	[SLT_DUEDATE_TYPE] AS [DueDateType],
	[SLT_DUE_DAYS] AS [DueDays],
	[SLT_NORMAL_DAYS] AS [NormalDays],
	[SLT_URGENT_DAYS] AS [UrgentDays],
	[SLT_DEFAULT_TERMS] AS [DefaultTerms],
	[SLT_TEMPLATE_TERMS] AS [TemplateTerms]	
FROM 
  		 		[ASC_LIVE].[dbo].[SL_TERMS]	 WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Despatches]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_Despatches] as
SELECT 
[SDSP_UNIQUE] AS [ID],
[SDSP_SOURCE_IND] AS [SourceID],
[SDSP_CREATED] AS [CreatedOn],
[SDSP_UPDATED] AS [UpdatedOn],
[SDSP_NUMBER] AS [Number],
[SDSP_SCSG_UNIQUE] AS [SCSGUnique],
[SDSP_STATUS] AS [Status],
[SDSP_COMMENTS] COLLATE Latin1_General_CI_AS AS [Comments],
[SDSP_NUMBER_OF_PACKETS] AS [NumberOfPackets],
[SDSP_NUMBER_OF_PALLETS] AS [NumberOfPallets],
[SDSP_PALLET_TYPE] COLLATE Latin1_General_CI_AS AS [PalletType],
[SDSP_TOTAL_WEIGHT] AS [TotalWeight],
[SDSP_TOTAL_VOLUME] AS [TotalVolume],
[SDSP_CARRIER] COLLATE Latin1_General_CI_AS AS [Carrier],
[SDSP_CARRIER_CONSIGNMENT_NO] COLLATE Latin1_General_CI_AS AS [CarrierConsignmentNo],
[SDSP_VEHICLE_REG] COLLATE Latin1_General_CI_AS AS [VehicleReg],
[SDSP_DRIVER] COLLATE Latin1_General_CI_AS AS [Driver],
[SDSP_DATE_TIME_DEP] AS [DateTimeDep],
[SDSP_DATE_TIME_ARR] AS [DateTimeArr],
[SDSP_ANAL_FIELD_1] COLLATE Latin1_General_CI_AS AS [AnalysisField1],
[SDSP_ANAL_FIELD_2] COLLATE Latin1_General_CI_AS AS [AnalysisField2],
[SDSP_ANAL_FIELD_3] COLLATE Latin1_General_CI_AS AS [AnalysisField3],
[SDSP_ANAL_FIELD_4] COLLATE Latin1_General_CI_AS AS [AnalysisField4],
[SDSP_ANAL_FIELD_5] COLLATE Latin1_General_CI_AS AS [AnalysisField5],
[SDSP_ANAL_FIELD_6] COLLATE Latin1_General_CI_AS AS [AnalysisField6],
[SDSP_ANAL_FIELD_7] COLLATE Latin1_General_CI_AS AS [AnalysisField7],
[SDSP_ANAL_FIELD_8] COLLATE Latin1_General_CI_AS AS [AnalysisField8],
[SDSP_ANAL_FIELD_9] COLLATE Latin1_General_CI_AS AS [AnalysisField9],
[SDSP_ANAL_FIELD_10] COLLATE Latin1_General_CI_AS AS [AnalysisField10],
[SDSP_USER_CREATED] COLLATE Latin1_General_CI_AS AS [UserCreated],
[SDSP_USER_UPDATED] COLLATE Latin1_General_CI_AS AS [UserUpdated]
FROM
	[asc_live].[dbo].[ASC_SO_DESPATCH] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Documents]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vw_ASC_LIVE_Documents] as
SELECT
[FLO_UNIQUE] AS [ID],
[FLO_SOURCE_IND] AS [SourceID],
[FLO_CREATED] AS [CreatedOn],
[FLO_UPDATED] AS [ModifiedOn],
[FLO_KEY_TYPE] COLLATE Latin1_General_CI_AS AS [Type],
[FLO_FILE_REF] COLLATE Latin1_General_CI_AS  AS [Ref],
[FLO_ITEM] COLLATE Latin1_General_CI_AS  AS [Item],
[FLO_ITEM_ROUTE] COLLATE Latin1_General_CI_AS  AS [ItemRoute],
[FLO_ITEM_2] COLLATE Latin1_General_CI_AS  AS [Item2],
[FLO_ITEM_3] COLLATE Latin1_General_CI_AS  AS [Item3],
[FLO_ITEM_4] COLLATE Latin1_General_CI_AS  AS [Item4],
[FLO_ITEM_5] COLLATE Latin1_General_CI_AS  AS [Item5],
[FLO_ITEM_6] COLLATE Latin1_General_CI_AS  AS [Item6],
[FLO_CATEGORY_TYPE] COLLATE Latin1_General_CI_AS  AS [Category],
[FLO_SUB] AS [Sequence],
[FLO_COMMAND] COLLATE Latin1_General_CI_AS  AS [Command],
[FLO_FILE_PATH] COLLATE Latin1_General_CI_AS  AS [Filepath],
[FLO_DESC] COLLATE Latin1_General_CI_AS  AS [Description]

FROM
	[ASC_LIVE].[dbo].[ASC_FLO_TBL] with (nolock)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_GroupAttribHeaders]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_GroupAttribHeaders] as
select 
	[GAH_UNIQUE]		AS [ID],
	[GAH_SOURCE_IND]	AS [SourceID],
	[GAH_CREATED]		AS [CreatedOn],
	[GAH_UPDATED]		AS [ModifiedOn],
	[GAH_CODE]		COLLATE Latin1_General_CI_AS	AS [Code],
	[GAH_REC_TYPE]		AS [LinkType],
	[GAH_DESC]		COLLATE Latin1_General_CI_AS	AS [Description]
from 
	[asc_live].[dbo].[ASC_GAH_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_GroupAttriDetails]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_GroupAttriDetails] as
select 
	[GAD_UNIQUE] AS [ID],
[GAD_SOURCE_IND] AS [SourceID],
[GAD_CREATED] AS [CreatedOn],
[GAD_UPDATED] AS [ModifiedOn],
[GAD_CODE] COLLATE Latin1_General_CI_AS AS [GroupCode],
[GAD_REC_TYPE] AS [LinkType],
[GAD_SEQ] AS [GroupSequence],
[GAD_ATY_CODE] COLLATE Latin1_General_CI_AS AS [AttribCode],
[GAD_SUB] AS [AttribSequence],
[GAD_TEXT] COLLATE Latin1_General_CI_AS AS [Description],
[GAD_FROM_VALUE] AS [FromValue],
[GAD_FROM_DATE] AS [FromDate],
[GAD_TO_VALUE] AS [ToValue],
[GAD_TO_DATE] AS [ToDate],
[GAD_PRECISION] AS [Precision],
[GAD_UOM] COLLATE Latin1_General_CI_AS AS [UoM],
[GAD_MANDATORY] COLLATE Latin1_General_CI_AS AS [Mandatory],
[GAD_PRINT_FLAG] COLLATE Latin1_General_CI_AS AS [PrintFlag],
[GAD_SET_DEFAULT] COLLATE Latin1_General_CI_AS AS [SetDefault],
[GAD_LIST_CODE] COLLATE Latin1_General_CI_AS AS [ListCode],
[GAD_CALC_CODE] COLLATE Latin1_General_CI_AS AS [CalcCode],
[GAD_AUTO_REFRESH] COLLATE Latin1_General_CI_AS AS [AutoRefresh],
[GAD_USER_OVERRIDE] COLLATE Latin1_General_CI_AS AS [UserOverride]
from 
	[asc_live].[dbo].[ASC_GAD_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Invoices]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_ASC_LIVE_Invoices] as
SELECT 
[INV_UNIQUE] AS [ID],
[INV_SOURCE_IND] AS [SourceID],
[INV_CREATED] AS [CreatedOn],
[INV_UPDATED] AS [ModifiedOn],
[INV_INVOICE_NO] AS [SINumber],
[INV_TYPE] COLLATE Latin1_General_CI_AS AS [Type],
[INV_REC_NO] AS [RecNo],
[INV_REC_TYPE] COLLATE Latin1_General_CI_AS AS [RecType],
[INV_INVOICE_DATE] AS [InvoiceDate],
[INV_ORDER_NO] COLLATE Latin1_General_CI_AS AS [SONumber],
[INV_DOC_TYPE] COLLATE Latin1_General_CI_AS AS [DocType],
[INV_CUS] COLLATE Latin1_General_CI_AS AS [Customer],
[INV_ORDER_TYPE] COLLATE Latin1_General_CI_AS AS [OrderType],
[INV_CURRENCY] COLLATE Latin1_General_CI_AS AS [Currency],
[INV_CURR_RATE] AS [CurrRate],
[INV_CURR_CONVERSION] COLLATE Latin1_General_CI_AS AS [CurrConversion],
[INV_WHOLE_DISC_CODE] COLLATE Latin1_General_CI_AS AS [WholeDiscCode],
[INV_WHOLE_DISC_PERCENT] AS [WholeDiscPercent],
[INV_PAY_TERMS] COLLATE Latin1_General_CI_AS AS [PayTerms],
[INV_SETT_DISC_PERCENT] AS [SettDiscPercent],
[INV_SETT_DISC_DAYS] AS [SettDiscDays],
[INV_SETT_BY_DATE] AS [SettByDate],
[INV_CREATED_DATE] AS [CreatedDate],
[INV_CREATED_BY] COLLATE Latin1_General_CI_AS AS [CreatedBy],
[INV_OUR] COLLATE Latin1_General_CI_AS AS [SONumber2],
[INV_PART_ONLY] COLLATE Latin1_General_CI_AS AS [Part],
[INV_PART_REV] COLLATE Latin1_General_CI_AS AS [PartRev],
[INV_SUB] AS [Sequence],
[INV_NUM] AS [Number],
[INV_QTY] AS [Quantity],
[INV_VAT_CODE] COLLATE Latin1_General_CI_AS AS [VATCode],
[INV_VAT_PERCENT] AS [VATPercent],
[INV_DISC_CODE] COLLATE Latin1_General_CI_AS AS [DiscCode],
[INV_DISC_PERCENT] AS [DiscPercent],
[INV_COMM_INITIALS_1] COLLATE Latin1_General_CI_AS AS [CommInitials1],
[INV_COMM_PERCENT_1] AS [CommPercent1],
[INV_COMM_VALUE_1] AS [CommValue1],
[INV_COMM_VAL_H_1] AS [CommValueH1],
[INV_COMM_INITIALS_2] COLLATE Latin1_General_CI_AS AS [CommInitials2],
[INV_COMM_PERCENT_2] AS [CommPercent2],
[INV_COMM_VALUE_2] AS [CommValue2],
[INV_COMM_VAL_H_2] AS [CommValueH2],
[INV_COMM_INITIALS_3] COLLATE Latin1_General_CI_AS AS [CommInitials3],
[INV_COMM_PERCENT_3] AS [CommPercent3],
[INV_COMM_VALUE_3] AS [CommValue3],
[INV_COMM_VAL_H_3] AS [CommValueH3],
[INV_BASE_PRICE] AS [BasePrice],
[INV_DISC_PRICE] AS [DiscPrice],
[INV_NETT_PRICE] AS [NettPrice],
[INV_NETT_PRI_H] AS [NettPriceH],
[INV_BASE_PRICE_PER] AS [BasePricePer],
[INV_DISC_PRICE_PER] AS [DiscPricePer],
[INV_NETT_PRICE_PER] AS [NettPricePer],
[INV_NETT_PRI_H_PER] AS [NettPriceHPer],
[INV_DISCOUNT_VALUE] AS [DiscountValue],
[INV_INCLUDE_WHOLE_DISC] COLLATE Latin1_General_CI_AS AS [IncludeWholeDiscount],
[INV_DESPATCH_NO] AS [DespatchNo],
[INV_PREV_BASE_VALUE] AS [PrevBaseValue],
[INV_PREV_DISC_VALUE] AS [PrevDiscValue],
[INV_PREV_FINAL_VALUE] AS [PrevFinalValue],
[INV_UOM_PRICE] AS [UoMPrice],
[INV_PRICING_UOM] COLLATE Latin1_General_CI_AS AS [PricingUoM],
[INV_QTY_ENTERED] AS [QuantityEntered],
[INV_UOM_ENTERED] COLLATE Latin1_General_CI_AS AS [UoMEntered],
[INV_DVY_SALES_UOM] AS [DvySalesUoM],
[INV_THIS_INV_SALES_UOM] AS [ThisInvoiceSalesUoM],
[INV_EXTRA_DESC_1] COLLATE Latin1_General_CI_AS AS [ExtraDesc1],
[INV_EXTRA_DESC_2] COLLATE Latin1_General_CI_AS AS [ExtraDesc2],
[INV_BASE_VALUE] AS [BaseValue],
[INV_DISC_VALUE] AS [DiscValue],
[INV_NETT_VALUE] AS [NettValue],
[INV_NETT_VAL_H] AS [NettValueH],
[INV_VAT_VALUE] AS [VATValue],
[INV_VAT_VAL_H] AS [VATValueH],
[INV_GROSS_VALUE] AS [GrossValue],
[INV_GROSS_VAL_H] AS [GrossValueH],
[INV_SETT_DISC_VALUE] AS [SettDiscValue],
[INV_SETT_DISC_VAL_H] AS [SettDiscValueH],
[INV_WHOLE_DISC_VALUE] AS [WholeDiscValue],
[INV_WEIGHT] AS [Weight],
[INV_X_VAT_CODE_1] COLLATE Latin1_General_CI_AS AS [XVATCode1],
[INV_X_VAT_PERC_1] AS [XVATPerc1],
[INV_X_VATABLE_1] AS [XVatable1],
[INV_X_VATABLE_H_1] AS [XVatableH1],
[INV_X_VAT_VALUE_1] AS [XVATValue1],
[INV_X_VAT_VAL_H_1] AS [XVATValueH1],
[INV_X_VAT_CODE_2] COLLATE Latin1_General_CI_AS AS [XVATCode2],
[INV_X_VAT_PERC_2] AS [XVATPerc2],
[INV_X_VATABLE_2] AS [XVatable2],
[INV_X_VATABLE_H_2] AS [XVatableH2],
[INV_X_VAT_VALUE_2] AS [XVATValue2],
[INV_X_VAT_VAL_H_2] AS [XVATValueH2],
[INV_X_VAT_CODE_3] COLLATE Latin1_General_CI_AS AS [XVATCode3],
[INV_X_VAT_PERC_3] AS [XVATPerc3],
[INV_X_VATABLE_3] AS [XVatable3],
[INV_X_VATABLE_H_3] AS [XVatableH3],
[INV_X_VAT_VALUE_3] AS [XVATValue3],
[INV_X_VAT_VAL_H_3] AS [XVATValueH3],
[INV_X_VAT_CODE_4] COLLATE Latin1_General_CI_AS AS [XVATCode4],
[INV_X_VAT_PERC_4] AS [XVATPerc4],
[INV_X_VATABLE_4] AS [XVatable4],
[INV_X_VATABLE_H_4] AS [XVatableH4],
[INV_X_VAT_VALUE_4] AS [XVATValue4],
[INV_X_VAT_VAL_H_4] AS [XVATValueH4],
[INV_X_VAT_CODE_5] COLLATE Latin1_General_CI_AS AS [XVATCode5],
[INV_X_VAT_PERC_5] AS [XVATPerc5],
[INV_X_VATABLE_5] AS [XVatable5],
[INV_X_VATABLE_H_5] AS [XVatableH5],
[INV_X_VAT_VALUE_5] AS [XVATValue5],
[INV_X_VAT_VAL_H_5] AS [XVATValueH5],
[INV_X_VAT_CODE_6] COLLATE Latin1_General_CI_AS AS [XVATCode6],
[INV_X_VAT_PERC_6] AS [XVATPerc6],
[INV_X_VATABLE_6] AS [XVatable6],
[INV_X_VATABLE_H_6] AS [XVatableH6],
[INV_X_VAT_VALUE_6] AS [XVATValue6],
[INV_X_VAT_VAL_H_6] AS [XVATValueH6],
[INV_X_COMM_INITIALS_1] COLLATE Latin1_General_CI_AS AS [XCommInitials1],
[INV_X_COMM_PERCENT_1] AS [XCommPercent1],
[INV_X_COMM_VALUE_1] AS [XCommValue1],
[INV_X_COMM_VAL_H_1] AS [XCommValueH1],
[INV_X_COMM_INITIALS_2] COLLATE Latin1_General_CI_AS AS [XCommInitials2],
[INV_X_COMM_PERCENT_2] AS [XCommPercent2],
[INV_X_COMM_VALUE_2] AS [XCommValue2],
[INV_X_COMM_VAL_H_2] AS [XCommValueH2],
[INV_X_COMM_INITIALS_3] COLLATE Latin1_General_CI_AS AS [XCommInitials3],
[INV_X_COMM_PERCENT_3] AS [XCommPercent3],
[INV_X_COMM_VALUE_3] AS [XCommValue3],
[INV_X_COMM_VAL_H_3] AS [XCommValueH3],
[INV_X_COMM_INITIALS_4] COLLATE Latin1_General_CI_AS AS [XCommInitials4],
[INV_X_COMM_PERCENT_4] AS [XCommPercent4],
[INV_X_COMM_VALUE_4] AS [XCommValue4],
[INV_X_COMM_VAL_H_4] AS [XCommValueH4],
[INV_X_COMM_INITIALS_5] COLLATE Latin1_General_CI_AS AS [XCommInitials5],
[INV_X_COMM_PERCENT_5] AS [XCommPercent5],
[INV_X_COMM_VALUE_5] AS [XCommValue5],
[INV_X_COMM_VAL_H_5] AS [XCommValueH5],
[INV_X_COMM_INITIALS_6] COLLATE Latin1_General_CI_AS AS [XCommInitials6],
[INV_X_COMM_PERCENT_6] AS [XCommPercent6],
[INV_X_COMM_VALUE_6] AS [XCommValue6],
[INV_X_COMM_VAL_H_6] AS [XCommValueH6],
[INV_SALES_ORDER] COLLATE Latin1_General_CI_AS AS [SalesOrder],
[INV_USER_SLOT_NO] AS [Slot],
[INV_CREDIT_REASON] AS [CreditReason],
[INV_DUEDATE_TYPE] AS [DueDateType],
[INV_DUE_DAYS] AS [DueDays],
[INV_SETT_NETT_VALUE] AS [SettNettValue],
[INV_SETT_NETT_VAL_H] AS [SettNettValueH],
[INV_SETT_VAT_VALUE] AS [SettVATValue],
[INV_SETT_VAT_VAL_H] AS [SettVATValueH],
[INV_SETT_GROSS_VALUE] AS [SettGrossValue],
[INV_SETT_GROSS_VAL_H] AS [SettGrossValueH],
[INV_VAT_TYPE] COLLATE Latin1_General_CI_AS AS [VATType],
[INV_REVERSE_VAT_VALUE] AS [ReverseVATValue],
[INV_REVERSE_VAT_VAL_H] AS [ReverseVATValueH],
[INV_SETT_REVERSE_VAT_VALUE] AS [SettReverseVATValue],
[INV_SETT_REVERSE_VAT_VAL_H] AS [SettReverseVATValueH],
[INV_X_VAT_TYPE_1] COLLATE Latin1_General_CI_AS AS [XVATType1],
[INV_X_REVERSE_VAT_VALUE_1] AS [XReverseVATValue1],
[INV_X_REVERSE_VAT_VAL_H_1] AS [XReverseVATValueH1],
[INV_X_VAT_TYPE_2] COLLATE Latin1_General_CI_AS AS [XVATType2],
[INV_X_REVERSE_VAT_VALUE_2] AS [XReverseVATValue2],
[INV_X_REVERSE_VAT_VAL_H_2] AS [XReverseVATValueH2],
[INV_X_VAT_TYPE_3] COLLATE Latin1_General_CI_AS AS [XVATType3],
[INV_X_REVERSE_VAT_VALUE_3] AS [XReverseVATValue3],
[INV_X_REVERSE_VAT_VAL_H_3] AS [XReverseVATValueH3],
[INV_X_VAT_TYPE_4] COLLATE Latin1_General_CI_AS AS [XVATType4],
[INV_X_REVERSE_VAT_VALUE_4] AS [XReverseVATValue4],
[INV_X_REVERSE_VAT_VAL_H_4] AS [XReverseVATValueH4],
[INV_X_VAT_TYPE_5] COLLATE Latin1_General_CI_AS AS [XVATType5],
[INV_X_REVERSE_VAT_VALUE_5] AS [XReverseVATValue5],
[INV_X_REVERSE_VAT_VAL_H_5] AS [XReverseVATValueH5],
[INV_X_VAT_TYPE_6] COLLATE Latin1_General_CI_AS AS [XVATType6],
[INV_X_REVERSE_VAT_VALUE_6] AS [XReverseVATValue6],
[INV_X_REVERSE_VAT_VAL_H_6] AS [XReverseVATValueH6]
FROM 
	[ASC_LIVE].[dbo].[ASC_INV_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Ledger]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_Ledger] as
SELECT 
	[DET_VATCODE] AS [VATCode],
[DET_LEDGER] AS [Ledger],
[DET_TYPE] AS [Type],
[DET_DESCRIPTION] AS [Description],
[DET_HEADER_REF] AS [HeaderRef],
[DET_JNL_LINEREF] AS [JournalLineRef],
[DET_DATE] AS [Date],
[DET_TAX_SORT] AS [TaxSort],
[DET_CURR_CODE] AS [CurrencyCode],
[DET_IMPEXP_CODE] AS [ImportExportCode],
[DET_COUNTRY_CDE] AS [CountryCode],
[DET_ECVAT_TYPE] AS [ECVATType],
[DET_YEAR] AS [Year],
[DET_NOM_YEAR] AS [NominalYear],
[DET_RECON_REF] AS [ReconRef],
[DET_USER_PUTIN] AS [UserPutIn],
[DET_DATE_PUTIN] AS [DatePutIn],
[DET_HEADER_KEY] AS [HeaderKey],
[DET_SERIALNO] AS [SerialNo],
[DET_STKSORTKEY1] AS [STKSortKey1],
[DET_PRICE_CODE] AS [PriceCode],
[DET_NOMINALDR] AS [NominalDR],
[DET_NOMINALCR] AS [NominalCR],
[DET_NOMINALVAT] AS [NominalVAT],
[DET_STOCK_CODE] AS [StockCode],
[DET_ACCOUNT] AS [Account],
[DET_ANALYSIS] AS [Analysis],
[DET_COSTHEADER] AS [CostHeader],
[DET_COSTCENTRE] AS [CostCentre],
[DET_ANALTYPE] AS [AnalysisType],
[DET_EC_T_NATURE] AS [ECTNature],
[DET_SUB_LEDGER] AS [SubLedger],
[DET_STKSORTKEY2] AS [STKSortKey2],
[DET_STKSORTKEY3] AS [STKSortKey3],
[DET_STKSORTKEY] AS [STKSortKey],
[DET_LANDED_COST] AS [LandedCost],
[DET_DIMENSION1] AS [Dimension1],
[DET_DIMENSION2] AS [Dimension2],
[DET_DIMENSION3] AS [Dimension3],
[DET_CHEQUE_PAYEE] AS [ChequePayee],
[DET_NLCONTRA] AS [NLContra],
[DET_HEADER_REF2] AS [HeaderRef2],
[DET_SLPL_PRIMARY] AS [SLPLPrimary],
[DET_SOURCE] AS [Source],
[DET_DELIVERY_ADDRESS] AS [DeliveryAddress],
[DET_MOVEMENT_LINK] AS [MovementLink],
[DET_NOM_YEAR_LINK] AS [NominalYearLink],
[DET_HEADER_PL_LINK] AS [HeaderPLLink],
[DET_HEADER_SL_LINK] AS [HeaderSLLink],
[DET_HEADER_NL_LINK] AS [HeaderNLLink],
[DET_AUDIT_NUMBER] AS [AuditNumber],
[DET_NETT] AS [Nett],
[DET_VAT] AS [VAT],
[DET_GROSS] AS [Gross],
[DET_UNALLOCATED] AS [Unallocated],
[DET_BATCH_FLAG] AS [BatchFlag],
[DET_RECUR_FLAG] AS [RecurFlag],
[DET_BATCH_REF] AS [BatchRef],
[DET_ARCHIVE_FLG] AS [ArchiveFlag],
[DET_ORIGIN] AS [Origin],
[DET_PL_INTERNAL] AS [PLInternal],
[DET_CURR_TAX] AS [CurrencyTAX],
[DET_TAX_WITHHLD] AS [TAXWitheld],
[DET_PL_ACQ_TAX] AS [PLACQTEX],
[DET_CURR_RATE] AS [CurrencyRate],
[DET_CURR_NETT] AS [CurrencyNett],
[DET_CURR_RTEFLG] AS [CurrencyRTEFlag],
[DET_CURR_UNALOC] AS [CurrencyUnallocated],
[DET_CURR_L_DISC] AS [CurrencyLDiscount],
[DET_CURR_T_DISC] AS [CurrencyTDiscount],
[DET_L_DISCOUNT] AS [Ldiscount],
[DET_T_DISCOUNT] AS [Tdiscount],
[DET_COSTPRICE] AS [CostPrice],
[DET_PERIOD_SORT] AS [PeriodSort],
[DET_PERIODNUMBR] AS [PeriodNumber],
[DET_RECONCILED] AS [Reconciled],
[DET_NOM_PERIOD] AS [NominalPeriod],
[DET_NOM_PERSORT] AS [NominalPerSort],
[DT_RECON_ORDER] AS [ReconOrder],
[DET_UNIT_PRICE] AS [UnitPrice],
[DET_QUANTITY] AS [Quantity],
[DET_UNT_PRICE_C] AS [UnitPriceC],
[DET_UNIT_QTY] AS [UnitQty],
[DET_USER_EDITED] AS [UserEdited],
[DET_BATCH_POSTD] AS [BactchPosted],
[DET_PRIMARY] AS [Primary],
[DET_SUB_AUDIT_NO] AS [SubAuditNo],
[DET_VAT_RULES] AS [VATRules],
[DET_VATNONDEDUCT] AS [VATNonDeductable],
[DET_NETT_BASE2] AS [NettBase2],
[DET_VAT_BASE2] AS [VATBase2],
[DET_GROSS_BASE2] AS [GrossBase2],
[DET_L_DISC_BASE2] AS [LDiscountBase2],
[DET_T_DISC_BASE2] AS [TDiscountBase2],
[DET_BASE2_RATE] AS [RateBase2],
[DET_TRI_RATE1] AS [TriRate1],
[DET_BASE2_RATECHNG] AS [RateCHNGBase2],
[DET_TRI_RATECHNG1] AS [TriRateCHNG1],
[DET_COSTPRICE_BASE2] AS [CostPriceBase2],
[DET_UNIT_PRICE_BASE2] AS [UnitPriceBase2],
[DET_TAX_WITHHLD_BASE2] AS [TAXWitheldBase2],
[DET_PL_ACQUISTN_BASE2] AS [PLAcquisitionBase2],
[DET_CURR_GROSS] AS [CurrGross],
[DET_TRI_RATE2] AS [TriRate2],
[DET_TRI_RATECHNG2] AS [TriRateCHNG2],
[DET_SRV_STATUS] AS [SrvStatus],
[DET_ORDER_LINK] AS [OrderLink],
[DET_VAT_RETURN_PRIMARY] AS [VATReturnPrimary],
[DET_POSTING_NO] AS [PostingNo],
[DET_REVERSE_STATUS] AS [ReverseStatus],
[DET_WIP_CST_DETAIL_LINK] AS [WIPCSTDetailLink],
[DET_UPDATE_EXTRA_WORK] AS [UpdateExtraWork],
[DET_QTY_CONVERSION_FACTOR] AS [QuantityConversionFactor],
[DET_RECON_DATE] AS [ReconDate],
[DET_RECON_USER] AS [ReconUser],
[DET_VAT_RATE] AS [VATRate],
[DET_RM_REVERSE_PRIMARY] AS [RMReversePrimary],
[DET_DELIVERY_REF] AS [DeliveryRef],
[DET_SETT_NET_1] AS [SettNet1],
[DET_SETT_NET_1_C] AS [SettNet1C],
[DET_SETT_NET_1_BASE2] AS [SettNet1Base2],
[DET_SETT_NET_2] AS [SettNet2],
[DET_SETT_NET_2_C] AS [SettNet2C],
[DET_SETT_NET_2_BASE2] AS [SettNet2Base2],
[DET_SETT_VAT_1] AS [SettVAT1],
[DET_SETT_VAT_1_C] AS [SettVAT1C],
[DET_SETT_VAT_1_BASE2] AS [SettVAT1Base2],
[DET_SETT_VAT_2] AS [SettVAT2],
[DET_SETT_VAT_2_C] AS [SettVAT2C],
[DET_SETT_VAT_2_BASE2] AS [SettVAT2Base2],
[DET_SETT_GROSS_1] AS [SettGross1],
[DET_SETT_GROSS_1_C] AS [SettGross1C],
[DET_SETT_GROSS_1_BASE2] AS [SettGross1Base2],
[DET_SETT_GROSS_2] AS [SettGross2],
[DET_SETT_GROSS_2_C] AS [SettGross2C],
[DET_SETT_GROSS_2_BASE2] AS [SettGross2Base2]
FROM 
	[ASC_LIVE].[dbo].[SL_PL_NL_DETAIL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_NominalCategories]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_NominalCategories] as

SELECT
	[NC_PRIMARY] AS [ID],
	[NL_CATEGORYNAME] AS [Name],
	[NL_SHORTNAME] AS [ShortName],
	[NL_CATEGORYNO] AS [Number],
	[NL_CATEGORY_SEQ] AS [Sequence],
	[NL_CAT_CODE1] AS [Code1],
	[NL_CAT_CODE2] AS [Code2],
	[NL_CAT_CODE3] AS [Code3],
	[NL_CAT_CODE4] AS [Code4],
	[NL_CAT_CODE5] AS [Code5],
	[NL_CAT_CODE6] AS [Code6],
	[NL_CAT_CODE7] AS [Code7],
	[NL_CAT_CODE8] AS [Code8],
	[NL_CAT_USED] AS [Used],
	[NL_CAT_SORTCODE] AS [SortCode],
	[NL_CAT_DRCR_TYPE] AS [DRCRType],
	[NL_CAT_TAXCODE_DR] AS [DRTaxCode],
	[NL_CAT_TAXCODE_CR] AS [CRTaxCode],
	[NL_CAT_MAJHED] AS [MajorHeading],
	[NL_LEVEL] AS [Level],
	[NL_GROUP] AS [Group]
FROM
	[asc_live].[dbo].[NL_CATEGORY] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_NominalHeadings]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_NominalHeadings] AS
SELECT
	[NL_MAJORNAME]		AS [Name],
    [NL_MAJORMARKER]	AS [Marker],
    [NL_MAJORLEVEL1]	AS [Level1],
    [NL_MAJORLEVEL2]	AS [Level2],
    [NL_MAJORLEVEL3]	AS [Level3],
    [NL_MAJORLINKACC]	AS [LinkAcc],
    [NL_MAJORCODE]		AS [Code],
    [NM_PRIMARY]		AS [Primary],
    [NL_MAJORSORTCODE]	AS [SortCode]
 FROM 
	[ASC_LIVE].[dbo].[NL_MAJORHEADING] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_OtherReferences]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_OtherReferences] as
SELECT
[CPT_UNIQUE]											AS [ID],
[CPT_SOURCE_IND]										AS [SourceID],
[CPT_CREATED]											AS [CreatedOn],
[CPT_UPDATED]											AS [UpdatedOn],
[CPT_PART_ONLY] COLLATE Latin1_General_CI_AS			AS [Part],
[CPT_PART_REV] COLLATE Latin1_General_CI_AS				AS [PartRev],
[CPT_TYPE] COLLATE Latin1_General_CI_AS					AS [Type],
[CPT_OTHER_CODE] COLLATE Latin1_General_CI_AS			AS [OtherCode],
[CPT_SUB]												AS [Sequence],
[CPT_OTHER_PART] COLLATE Latin1_General_CI_AS			AS [OtherPart],
[CPT_OTHER_PART_DESC_1] COLLATE Latin1_General_CI_AS	AS [OtherPartDesc1],
[CPT_OTHER_PART_DESC_2] COLLATE Latin1_General_CI_AS	AS [OtherPartDesc2],
[CPT_OTHER_PART_DESC_3] COLLATE Latin1_General_CI_AS	AS [OtherPartDesc3],
[CPT_OTHER_PART_DESC_4] COLLATE Latin1_General_CI_AS	AS [OtherPartDesc4],
[CPT_OTHER_PART_DESC_5] COLLATE Latin1_General_CI_AS	AS [OtherPartDesc5],
[CPT_UOM] COLLATE Latin1_General_CI_AS					AS [UoM],
[CPT_FACTOR]											AS [Factor],
[CPT_NUM_1] 											AS [Num1],
[CPT_NUM_2] 											AS [Num2],
[CPT_NUM_3] 											AS [Num3],
[CPT_NUM_4] 											AS [Num4],
[CPT_NUM_5] 											AS [Num5]
FROM
	[asc_live].[dbo].[ASC_CPT_TBL] with (nolock)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_PartAudit]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[vw_ASC_LIVE_PartAudit] as
SELECT
	[AUD_UNIQUE]			AS [ID],
	[AUD_SOURCE_IND]		AS [SourceID],
	[AUD_CREATED]			AS [CreatedOn],
	[AUD_UPDATED]			AS [ModifiedOn],
	[AUD_REC_TYPE]		COLLATE Latin1_General_CI_AS	AS [Part],
	[AUD_WHEN]				AS [When],
	[AUD_SUB]				AS [Sequence],
	[AUD_USER]			COLLATE Latin1_General_CI_AS	AS [User],
	[AUD_TYPE]			COLLATE Latin1_General_CI_AS	AS [Type],
	[AUD_FILE]			COLLATE Latin1_General_CI_AS	AS [File],
	case [AUD_FIELD] COLLATE Latin1_General_CI_AS when 'Min. selling price' then 'Nett weight' else [AUD_FIELD] COLLATE Latin1_General_CI_AS end AS Field,
	[AUD_OLD_VALUE]		COLLATE Latin1_General_CI_AS	AS [OldValue],
	[AUD_NEW_VALUE]		COLLATE Latin1_General_CI_AS	AS [NewValue],
	[AUD_OPTION]		COLLATE Latin1_General_CI_AS	AS [Option]
FROM 
	[ASC_LIVE].[dbo].[ASC_AUD_TBL]	 WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Picknotes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vw_ASC_LIVE_Picknotes] as
SELECT
	[SPCK_UNIQUE] AS [ID],
	[SPCK_SOURCE_IND] AS [SourceID],
	[SPCK_CREATED] AS [CreatedOn],
	[SPCK_UPDATED] AS [ModifiedOn],
	[SPCK_NUMBER] AS [Number],
	[SPCK_COR_UNIQUE] AS [OrderID],
	[SPCK_PICK_LOCATION_WH] COLLATE Latin1_General_CI_AS AS [PickWarehouse],
	[SPCK_PICK_LOCATION_BIN] COLLATE Latin1_General_CI_AS AS [PickBin],
	[SPCK_BULK_LOCATION_WH] COLLATE Latin1_General_CI_AS AS [BulkWarehouse],
	[SPCK_BULK_LOCATION_BIN] COLLATE Latin1_General_CI_AS AS [BulkBin],
	[SPCK_QTY] AS [Quantity],
	[SPCK_QTY_CONFIRMED] AS [QuantityConfirmed],
	[SPCK_QTY_DESPATCHED] AS [QuantityDesptached],
	[SPCK_STATUS] AS [Status],
	[SPCK_SDSP_UNIQUE] AS [SDSPID],
	[SPCK_SCSG_UNIQUE] AS [SCSGID],
	[SPCK_ANAL_FIELD_1] COLLATE Latin1_General_CI_AS AS [AnalysisField1],
	[SPCK_ANAL_FIELD_2] COLLATE Latin1_General_CI_AS AS [AnalysisField2],
	[SPCK_ANAL_FIELD_3] COLLATE Latin1_General_CI_AS AS [AnalysisField3],
	[SPCK_ANAL_FIELD_4] COLLATE Latin1_General_CI_AS AS [AnalysisField4],
	[SPCK_ANAL_FIELD_5] COLLATE Latin1_General_CI_AS AS [AnalysisField5],
	[SPCK_ANAL_FIELD_6] COLLATE Latin1_General_CI_AS AS [AnalysisField6],
	[SPCK_ANAL_FIELD_7] COLLATE Latin1_General_CI_AS AS [AnalysisField7],
	[SPCK_ANAL_FIELD_8] COLLATE Latin1_General_CI_AS AS [AnalysisField8],
	[SPCK_ANAL_FIELD_9] COLLATE Latin1_General_CI_AS AS [AnalysisField9],
	[SPCK_ANAL_FIELD_10] COLLATE Latin1_General_CI_AS AS [AnalysisField10],
	[SPCK_USER_CREATED] COLLATE Latin1_General_CI_AS AS [UserCreated],
	[SPCK_USER_UPDATED] COLLATE Latin1_General_CI_AS AS [UserUpdated],
	[SPCK_GROSS_WEIGHT] AS [GrossWeight],
	[SPCK_NETT_WEIGHT] AS [NettWeight],
	[SPCK_USER_SLOT_NO] AS [UserSlot],
	[SPCK_FILTER] AS [Filter],
	[SPCK_SELECTED] AS [Selected]
FROM 
  		 		[ASC_LIVE].[dbo].[ASC_SO_PICKNOTE]	 WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_PrintSalesInvoiceDetails]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ASC_LIVE_PrintSalesInvoiceDetails] as
SELECT 
	[PND_UNIQUE]		AS [ID],
	[PND_SOURCE_IND]	AS [SourceID],
	[PND_CREATED]		AS [CreatedOn],
	[PND_UPDATED]		AS [ModifiedOn],
	[PND_SLOT]			AS [Slot],
	[PND_SI_NUMBER]		AS [SINumber],
	[PND_REC_NO]		AS [RecNo],
	[PND_ORDER_NO]	COLLATE Latin1_General_CI_AS	AS [SONumber],
	[PND_QTY]			AS [Quantity]
FROM 
	[ASC_LIVE].[dbo].[ASC_PND_TBL] WITH (NOLOCK)

/*use asc_live
select * from INFORMATION_SCHEMA.COLUMNS  where COLUMN_NAME like '%SLOT%' and TABLE_NAME in (select table_name from INFORMATION_SCHEMA.TABLES where TABLE_TYPE = 'BASE TABLE') order by TABLE_NAME, COLUMN_NAME
use hics
*/

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_PrintSalesInvoiceGroup]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ASC_LIVE_PrintSalesInvoiceGroup] as
SELECT 
[PNG_UNIQUE] AS [ID],
[PNG_SOURCE_IND] AS [SourceID],
[PNG_CREATED] AS [CreatedOn],
[PNG_UPDATED] AS [ModifiedOn],
[PNG_SLOT] AS [Slot],
[PNG_SI_NUMBER] AS [SINumber],
[PNG_ORDER_NO] COLLATE Latin1_General_CI_AS AS [SONumber],
[PNG_SALES_ORDER] COLLATE Latin1_General_CI_AS AS [SalesOrder],
[PNG_BASE_VALUE] AS [BaseValue],
[PNG_DISC_VALUE] AS [DiscValue],
[PNG_NETT_VALUE] AS [NettValue],
[PNG_NETT_VAL_H] AS [NettValueH],
[PNG_VAT_VALUE] AS [VATValue],
[PNG_VAT_VAL_H] AS [VATValueH],
[PNG_GROSS_VALUE] AS [GrossValue],
[PNG_GROSS_VAL_H] AS [GrossValueH],
[PNG_WEIGHT] AS [Weight],
[PNG_SETT_DISC_VALUE] AS [SettDiscValue],
[PNG_SETT_DISC_VAL_H] AS [SettDiscValueH],
[PNG_WHOLE_DISC_VALUE] AS [WholeDiscValue],
[PNG_X_VAT_CODE_1] COLLATE Latin1_General_CI_AS AS [XVATCode1],
[PNG_X_VAT_PERCENT_1] AS [XVATPercent1],
[PNG_X_VAT_VATABLE_1] AS [XVATVatable1],
[PNG_X_VAT_VATABLE_H_1] AS [XVATVatableH1],
[PNG_X_VAT_VAL_1] AS [XVATValue1],
[PNG_X_VAT_VAL_H_1] AS [XVATValueH1],
[PNG_X_VAT_CODE_2] COLLATE Latin1_General_CI_AS AS [XVATCode2],
[PNG_X_VAT_PERCENT_2] AS [XVATPercent2],
[PNG_X_VAT_VATABLE_2] AS [XVATVatable2],
[PNG_X_VAT_VATABLE_H_2] AS [XVATVatableH2],
[PNG_X_VAT_VAL_2] AS [XVATValue2],
[PNG_X_VAT_VAL_H_2] AS [XVATValueH2],
[PNG_X_VAT_CODE_3] COLLATE Latin1_General_CI_AS AS [XVATCode3],
[PNG_X_VAT_PERCENT_3] AS [XVATPercent3],
[PNG_X_VAT_VATABLE_3] AS [XVATVatable3],
[PNG_X_VAT_VATABLE_H_3] AS [XVATVatableH3],
[PNG_X_VAT_VAL_3] AS [XVATValue3],
[PNG_X_VAT_VAL_H_3] AS [XVATValueH3],
[PNG_X_VAT_CODE_4] COLLATE Latin1_General_CI_AS AS [XVATCode4],
[PNG_X_VAT_PERCENT_4] AS [XVATPercent4],
[PNG_X_VAT_VATABLE_4] AS [XVATVatable4],
[PNG_X_VAT_VATABLE_H_4] AS [XVATVatableH4],
[PNG_X_VAT_VAL_4] AS [XVATValue4],
[PNG_X_VAT_VAL_H_4] AS [XVATValueH4],
[PNG_X_VAT_CODE_5] COLLATE Latin1_General_CI_AS AS [XVATCode5],
[PNG_X_VAT_PERCENT_5] AS [XVATPercent5],
[PNG_X_VAT_VATABLE_5] AS [XVATVatable5],
[PNG_X_VAT_VATABLE_H_5] AS [XVATVatableH5],
[PNG_X_VAT_VAL_5] AS [XVATValue5],
[PNG_X_VAT_VAL_H_5] AS [XVATValueH5],
[PNG_X_VAT_CODE_6] COLLATE Latin1_General_CI_AS AS [XVATCode6],
[PNG_X_VAT_PERCENT_6] AS [XVATPercent6],
[PNG_X_VAT_VATABLE_6] AS [XVATVatable6],
[PNG_X_VAT_VATABLE_H_6] AS [XVATVatableH6],
[PNG_X_VAT_VAL_6] AS [XVATValue6],
[PNG_X_VAT_VAL_H_6] AS [XVATValueH6],
[PNG_X_COMM_INITIALS_1] COLLATE Latin1_General_CI_AS AS [XCommInitials1],
[PNG_X_COMM_PERCENT_1] AS [XCommPercent1],
[PNG_X_COMM_VALUE_1] AS [XCommValue1],
[PNG_X_COMM_VAL_H_1] AS [XCommValueH1],
[PNG_X_COMM_INITIALS_2] COLLATE Latin1_General_CI_AS AS [XCommInitials2],
[PNG_X_COMM_PERCENT_2] AS [XCommPercent2],
[PNG_X_COMM_VALUE_2] AS [XCommValue2],
[PNG_X_COMM_VAL_H_2] AS [XCommValueH2],
[PNG_X_COMM_INITIALS_3] COLLATE Latin1_General_CI_AS AS [XCommInitials3],
[PNG_X_COMM_PERCENT_3] AS [XCommPercent3],
[PNG_X_COMM_VALUE_3] AS [XCommValue3],
[PNG_X_COMM_VAL_H_3] AS [XCommValueH3],
[PNG_X_COMM_INITIALS_4] COLLATE Latin1_General_CI_AS AS [XCommInitials4],
[PNG_X_COMM_PERCENT_4] AS [XCommPercent4],
[PNG_X_COMM_VALUE_4] AS [XCommValue4],
[PNG_X_COMM_VAL_H_4] AS [XCommValueH4],
[PNG_X_COMM_INITIALS_5] COLLATE Latin1_General_CI_AS AS [XCommInitials5],
[PNG_X_COMM_PERCENT_5] AS [XCommPercent5],
[PNG_X_COMM_VALUE_5] AS [XCommValue5],
[PNG_X_COMM_VAL_H_5] AS [XCommValueH5],
[PNG_X_COMM_INITIALS_6] COLLATE Latin1_General_CI_AS AS [XCommInitials6],
[PNG_X_COMM_PERCENT_6] AS [XCommPercent6],
[PNG_X_COMM_VALUE_6] AS [XCommValue6],
[PNG_X_COMM_VAL_H_6] AS [XCommValueH6],
[PNG_QTY] AS [Quantity],
[PNG_SETT_NETT_VALUE] AS [SettNettValue],
[PNG_SETT_NETT_VAL_H] AS [SettNettValueH],
[PNG_SETT_VAT_VALUE] AS [SettVatValue],
[PNG_SETT_VAT_VAL_H] AS [SettVatValueH],
[PNG_SETT_GROSS_VALUE] AS [SettGrossValue],
[PNG_SETT_GROSS_VAL_H] AS [SettGrossValueH],
[PNG_REVERSE_VAT_VALUE] AS [ReverseVATValue],
[PNG_REVERSE_VAT_VAL_H] AS [ReverseVATValueH],
[PNG_SETT_REVERSE_VAT_VALUE] AS [SettReverseVATValue],
[PNG_SETT_REVERSE_VAT_VAL_H] AS [SettReverseVATValueH],
[PNG_X_VAT_TYPE_1] COLLATE Latin1_General_CI_AS AS [XVATType1],
[PNG_X_REVERSE_VAT_VAL_1] AS [XReverseVATValue1],
[PNG_X_REVERSE_VAT_VAL_H_1] AS [XReverseVATValueH1],
[PNG_X_VAT_TYPE_2] COLLATE Latin1_General_CI_AS AS [XVATType2],
[PNG_X_REVERSE_VAT_VAL_2] AS [XReverseVATValue2],
[PNG_X_REVERSE_VAT_VAL_H_2] AS [XReverseVATValueH2],
[PNG_X_VAT_TYPE_3] COLLATE Latin1_General_CI_AS AS [XVATType3],
[PNG_X_REVERSE_VAT_VAL_3] AS [XReverseVATValue3],
[PNG_X_REVERSE_VAT_VAL_H_3] AS [XReverseVATValueH3],
[PNG_X_VAT_TYPE_4] COLLATE Latin1_General_CI_AS AS [XVATType4],
[PNG_X_REVERSE_VAT_VAL_4] AS [XReverseVATValue4],
[PNG_X_REVERSE_VAT_VAL_H_4] AS [XReverseVATValueH4],
[PNG_X_VAT_TYPE_5] COLLATE Latin1_General_CI_AS AS [XVATType5],
[PNG_X_REVERSE_VAT_VAL_5] AS [XReverseVATValue5],
[PNG_X_REVERSE_VAT_VAL_H_5] AS [XReverseVATValueH5],
[PNG_X_VAT_TYPE_6] COLLATE Latin1_General_CI_AS AS [XVATType6],
[PNG_X_REVERSE_VAT_VAL_6] AS [XReverseVATValue6],
[PNG_X_REVERSE_VAT_VAL_H_6] AS [XReverseVATValueH6]
FROM 
	[ASC_LIVE].[dbo].[ASC_PNG_TBL] WITH (NOLOCK)

/*use asc_live
select * from INFORMATION_SCHEMA.COLUMNS  where COLUMN_NAME like '%SLOT%' and TABLE_NAME in (select table_name from INFORMATION_SCHEMA.TABLES where TABLE_TYPE = 'BASE TABLE') order by TABLE_NAME, COLUMN_NAME
use hics
*/

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_PrintSalesInvoiceHeader]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ASC_LIVE_PrintSalesInvoiceHeader] as
SELECT 
[PNH_UNIQUE] AS [ID],
[PNH_SOURCE_IND] AS [SourceID],
[PNH_CREATED] AS [CreatedOn],
[PNH_UPDATED] AS [ModifiedOn],
[PNH_SLOT] AS [Slot],
[PNH_SI_NUMBER] AS [SINumber],
[PNH_DATABASE] COLLATE Latin1_General_CI_AS AS [Database],
[PNH_BASE_VALUE] AS [BaseValue],
[PNH_DISC_VALUE] AS [DiscValue],
[PNH_NETT_VALUE] AS [NettValue],
[PNH_NETT_VAL_H] AS [NettValueH],
[PNH_VAT_VALUE] AS [VATValue],
[PNH_VAT_VAL_H] AS [VATValueH],
[PNH_GROSS_VALUE] AS [GrossValue],
[PNH_GROSS_VAL_H] AS [GrossValueH],
[PNH_WEIGHT] AS [Weight],
[PNH_SETT_DISC_VALUE] AS [SettDiscValue],
[PNH_SETT_DISC_VAL_H] AS [SettDiscValueH],
[PNH_WHOLE_DISC_VALUE] AS [WholeDiscValue],
[PNH_X_VAT_CODE_1] COLLATE Latin1_General_CI_AS AS [XVATCode1],
[PNH_X_VAT_PERCENT_1] AS [XVATPercent1],
[PNH_X_VAT_VATABLE_1] AS [XVATVatable1],
[PNH_X_VAT_VATABLE_H_1] AS [XVATVatableH1],
[PNH_X_VAT_VAL_1] AS [XVATValue1],
[PNH_X_VAT_VAL_H_1] AS [XVATValueH1],
[PNH_X_VAT_CODE_2] COLLATE Latin1_General_CI_AS AS [XVATCode2],
[PNH_X_VAT_PERCENT_2] AS [XVATPercent2],
[PNH_X_VAT_VATABLE_2] AS [XVATVatable2],
[PNH_X_VAT_VATABLE_H_2] AS [XVATVatableH2],
[PNH_X_VAT_VAL_2] AS [XVATValue2],
[PNH_X_VAT_VAL_H_2] AS [XVATValueH2],
[PNH_X_VAT_CODE_3] COLLATE Latin1_General_CI_AS AS [XVATCode3],
[PNH_X_VAT_PERCENT_3] AS [XVATPercent3],
[PNH_X_VAT_VATABLE_3] AS [XVATVatable3],
[PNH_X_VAT_VATABLE_H_3] AS [XVATVatableH3],
[PNH_X_VAT_VAL_3] AS [XVATValue3],
[PNH_X_VAT_VAL_H_3] AS [XVATValueH3],
[PNH_X_VAT_CODE_4] COLLATE Latin1_General_CI_AS AS [XVATCode4],
[PNH_X_VAT_PERCENT_4] AS [XVATPercent4],
[PNH_X_VAT_VATABLE_4] AS [XVATVatable4],
[PNH_X_VAT_VATABLE_H_4] AS [XVATVatableH4],
[PNH_X_VAT_VAL_4] AS [XVATValue4],
[PNH_X_VAT_VAL_H_4] AS [XVATValueH4],
[PNH_X_VAT_CODE_5] COLLATE Latin1_General_CI_AS AS [XVATCode5],
[PNH_X_VAT_PERCENT_5] AS [XVATPercent5],
[PNH_X_VAT_VATABLE_5] AS [XVATVatable5],
[PNH_X_VAT_VATABLE_H_5] AS [XVATVatableH5],
[PNH_X_VAT_VAL_5] AS [XVATValue5],
[PNH_X_VAT_VAL_H_5] AS [XVATValueH5],
[PNH_X_VAT_CODE_6] COLLATE Latin1_General_CI_AS AS [XVATCode6],
[PNH_X_VAT_PERCENT_6] AS [XVATPercent6],
[PNH_X_VAT_VATABLE_6] AS [XVATVatable6],
[PNH_X_VAT_VATABLE_H_6] AS [XVATVatableH6],
[PNH_X_VAT_VAL_6] AS [XVATValue6],
[PNH_X_VAT_VAL_H_6] AS [XVATValueH6],
[PNH_X_COMM_INITIALS_1] COLLATE Latin1_General_CI_AS AS [XCommInitials1],
[PNH_X_COMM_PERCENT_1] AS [XCommPercent1],
[PNH_X_COMM_VALUE_1] AS [XCommValue1],
[PNH_X_COMM_VAL_H_1] AS [XCommValueH1],
[PNH_X_COMM_INITIALS_2] COLLATE Latin1_General_CI_AS AS [XCommInitials2],
[PNH_X_COMM_PERCENT_2] AS [XCommPercent2],
[PNH_X_COMM_VALUE_2] AS [XCommValue2],
[PNH_X_COMM_VAL_H_2] AS [XCommValueH2],
[PNH_X_COMM_INITIALS_3] COLLATE Latin1_General_CI_AS AS [XCommInitials3],
[PNH_X_COMM_PERCENT_3] AS [XCommPercent3],
[PNH_X_COMM_VALUE_3] AS [XCommValue3],
[PNH_X_COMM_VAL_H_3] AS [XCommValueH3],
[PNH_X_COMM_INITIALS_4] COLLATE Latin1_General_CI_AS AS [XCommInitials4],
[PNH_X_COMM_PERCENT_4] AS [XCommPercent4],
[PNH_X_COMM_VALUE_4] AS [XCommValue4],
[PNH_X_COMM_VAL_H_4] AS [XCommValueH4],
[PNH_X_COMM_INITIALS_5] COLLATE Latin1_General_CI_AS AS [XCommInitials5],
[PNH_X_COMM_PERCENT_5] AS [XCommPercent5],
[PNH_X_COMM_VALUE_5] AS [XCommValue5],
[PNH_X_COMM_VAL_H_5] AS [XCommValueH5],
[PNH_X_COMM_INITIALS_6] COLLATE Latin1_General_CI_AS AS [XCommInitials6],
[PNH_X_COMM_PERCENT_6] AS [XCommPercent6],
[PNH_X_COMM_VALUE_6] AS [XCommValue6],
[PNH_X_COMM_VAL_H_6] AS [XCommValueH6],
[PNH_QTY] AS [Quantity],
[PNH_SETT_NETT_VALUE] AS [SettNettValue],
[PNH_SETT_NETT_VAL_H] AS [SettNettValueH],
[PNH_SETT_VAT_VALUE] AS [SettVATValue],
[PNH_SETT_VAT_VAL_H] AS [SettVATValueH],
[PNH_SETT_GROSS_VALUE] AS [SettGrossValue],
[PNH_SETT_GROSS_VAL_H] AS [SettGrossValueH],
[PNH_REVERSE_VAT_VALUE] AS [ReverseVATValue],
[PNH_REVERSE_VAT_VAL_H] AS [ReverseVATValueH],
[PNH_SETT_REVERSE_VAT_VALUE] AS [SettReverseVATValue],
[PNH_SETT_REVERSE_VAT_VAL_H] AS [SettReverseVATValueH],
[PNH_X_VAT_TYPE_1] COLLATE Latin1_General_CI_AS AS [XVATType1],
[PNH_X_REVERSE_VAT_VAL_1] AS [XReverseVATValue1],
[PNH_X_REVERSE_VAT_VAL_H_1] AS [XReverseVATValueH1],
[PNH_X_VAT_TYPE_2] COLLATE Latin1_General_CI_AS AS [XVATType2],
[PNH_X_REVERSE_VAT_VAL_2] AS [XReverseVATValue2],
[PNH_X_REVERSE_VAT_VAL_H_2] AS [XReverseVATValueH2],
[PNH_X_VAT_TYPE_3] COLLATE Latin1_General_CI_AS AS [XVATType3],
[PNH_X_REVERSE_VAT_VAL_3] AS [XReverseVATValue3],
[PNH_X_REVERSE_VAT_VAL_H_3] AS [XReverseVATValueH3],
[PNH_X_VAT_TYPE_4] COLLATE Latin1_General_CI_AS AS [XVATType4],
[PNH_X_REVERSE_VAT_VAL_4] AS [XReverseVATValue4],
[PNH_X_REVERSE_VAT_VAL_H_4] AS [XReverseVATValueH4],
[PNH_X_VAT_TYPE_5] COLLATE Latin1_General_CI_AS AS [XVATType5],
[PNH_X_REVERSE_VAT_VAL_5] AS [XReverseVATValue5],
[PNH_X_REVERSE_VAT_VAL_H_5] AS [XReverseVATValueH5],
[PNH_X_VAT_TYPE_6] COLLATE Latin1_General_CI_AS AS [XVATType6],
[PNH_X_REVERSE_VAT_VAL_6] AS [XReverseVATValue6],
[PNH_X_REVERSE_VAT_VAL_H_6] AS [XReverseVATValueH6]
FROM 
	[ASC_LIVE].[dbo].[ASC_PNH_TBL] WITH (NOLOCK)

/*use asc_live
select * from INFORMATION_SCHEMA.COLUMNS  where COLUMN_NAME like '%SLOT%' and TABLE_NAME in (select table_name from INFORMATION_SCHEMA.TABLES where TABLE_TYPE = 'BASE TABLE') order by TABLE_NAME, COLUMN_NAME
use hics
*/

GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Quantity]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_ASC_LIVE_Quantity] as
SELECT	
	[QTY_UNIQUE] AS [ID],
	[QTY_SOURCE_IND] AS [SourceID],
	[QTY_CREATED] AS [CreatedOn],
	[QTY_UPDATED] AS [UpdatedOn],
	[QTY_NUMBER] AS [Number],
	[QTY_COUNT] AS [Count]
FROM
	[ASC_LIVE].[dbo].[ASC_QTY_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_SupplierItemCrossReference]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_ASC_LIVE_SupplierItemCrossReference] as 
SELECT
[VEN_UNIQUE] AS [ID],
[VEN_SOURCE_IND] AS [SourceID],
[VEN_CREATED] AS [CreatedOn],
[VEN_UPDATED] AS [ModifiedOn],
[VEN_PART_ONLY] COLLATE Latin1_General_CI_AS AS [Part],
[VEN_PART_REV] COLLATE Latin1_General_CI_AS AS [PartRev],
[VEN_CODE] COLLATE Latin1_General_CI_AS AS [Supplier],
[VEN_MANUF] COLLATE Latin1_General_CI_AS AS [Manfacturer],
[VEN_FROM_QTY] AS [QuantityFrom],
[VEN_TO_QTY] AS [QuantityTo],
[VEN_FROM_DATE] AS [EffectiveFrom],
[VEN_TO_DATE] AS [EffectiveTo],
[VEN_PART_CODE] COLLATE Latin1_General_CI_AS AS [PartCode],
[VEN_PART_REF_ONLY] COLLATE Latin1_General_CI_AS AS [SuppliersPart],
[VEN_PART_REF_REV] COLLATE Latin1_General_CI_AS AS [SuppliersPartRev],
[VEN_MANUF_PART_ONLY] COLLATE Latin1_General_CI_AS AS [ManfacturersPart],
[VEN_MANUF_PART_REV] COLLATE Latin1_General_CI_AS AS [ManfacturersPartRev],
[VEN_NOTE] COLLATE Latin1_General_CI_AS AS [Note],
[VEN_STATUS] COLLATE Latin1_General_CI_AS AS [Status],
[VEN_PRICE] AS [Price],
[VEN_PRICE_PER] AS [PricePer],
[VEN_DISCOUNT] AS [Discount],
[VEN_CURRENCY] COLLATE Latin1_General_CI_AS AS [Currency],
[VEN_OK] COLLATE Latin1_General_CI_AS AS [OK],
[VEN_DATE_CREATED] AS [CreatedDate],
[VEN_DATE_AMENDED] AS [ModifiedDate],
[VEN_UOM] COLLATE Latin1_General_CI_AS AS [UoM],
[VEN_RATING1] AS [Rating1],
[VEN_RATING2] AS [Rating2],
[VEN_RATING3] AS [Rating3],
[VEN_RATING4] AS [Rating4],
[VEN_RATING5] AS [Rating5],
[VEN_JOB] COLLATE Latin1_General_CI_AS AS [WorksOrder],
[VEN_UOP] COLLATE Latin1_General_CI_AS AS [UoP],
[VEN_UOP_PRICE] AS [UoPPrice],
[VEN_UOP_PRICE_PER] AS [UoPPricePer],
[VEN_ANY_CURR_FLAG] AS [AnyCurrency],
[VEN_LEAD] AS [LeadTime],
[VEN_APPROVED] AS [Approved]
FROM
	ASC_LIVE.dbo.ASC_VEN_TBL
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Suppliers2]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_Suppliers2] as
SELECT
[SU_CHAR1] AS [Char1],
[SU_CHAR2] AS [Char2],
[SU_CHAR3] AS [Char3],
[SU_CHAR4] AS [Char4],
[SU_DATE1] AS [Date1],
[SU_DATE2] AS [Date2],
[SU_USRCHAR1] AS [UserChar1],
[SU_USRCHAR2] AS [UserChar2],
[SU_USRCHAR3] AS [UserChar3],
[SU_USRCHAR4] AS [UserChar4],
[SU_USRDATE1] AS [UserDate1],
[SU_USRDATE2] AS [UsreDate2],
[SUCODE2] AS [Code2],
[SU_EDI_ANA] AS [EDIANA],
[SU_EDI_SUPPIDN] AS [EDISuppIDN],
[SU_LANG_CODE] AS [Langcode],
[SU_CONTACT_TITLE] AS [ContactTitle],
[SU_CONTACT_INITIALS] AS [ContactInitials],
[SU_CONTACT_SURNAME] AS [ContactSurname],
[SU_CONTACT_JOB] AS [ContactJobTitle],
[SU_CONTACT_FIRSTNAME] AS [ContactFirstName],
[SU_ISDN_NUMBER] AS [ISDNNo],
[SU_WEBSITE_ADDRESS] AS [Website],
[SU_MOBILE_NUMBER] AS [MobileNo],
[SU_USRCHAR5] AS [UserChar5],
[SU_USRCHAR6] AS [UserChar6],
[SU_USRDATE3] AS [UserDate3],
[SU_USRCHAR7] AS [UserChar7],
[SU_USRCHAR8] AS [UserChar8],
[SU_GROUP] AS [Group],
[SU_TAX_NOTIFY_TIME] AS [TAXNotifyTime],
[SU_BANK_BRANCH] AS [BankBranch],
[SU_XML_ORDER_FORMAT] AS [XMLOrderFormat],
[SU_EMAIL_SUBJECT] AS [EmailSubject],
[SU_EMAIL_MESSAGE] AS [EmailMessage],
[SU_OUR_ACCOUNT_CODE] AS [OurAccountCode],
[SU_IBAN_NO] AS [IBANNo],
[SU_IR_APPROVER_GROUP1_LINK] AS [IRApproverGroup1Link],
[SU_IR_APPROVER_GROUP2_LINK] AS [IRApproverGroup2Link],
[SU_IR_APPROVER_GROUP3_LINK] AS [IRApproverGroup3Link],
[SU_SWIFT_CODE] AS [SwiftCode],
[SU_PRIMARY_2] AS [Primary2],
[SU_FLAG1] AS [Flag1],
[SU_FLAG2] AS [Flag2],
[SU_NUM1] AS [Num1],
[SU_NUM2] AS [Num2],
[SU_USRFLAG1] AS [UserFlag1],
[SU_USRFLAG2] AS [UserFlag2],
[SU_USRNUM1] AS [UserNum1],
[SU_USRNUM2] AS [UserNum2],
[SU_EDI_FLAG] AS [EDIFlag],
[SU_EDI_TEMPLATE] AS [EDITemplate],
[SU_EDI_FLGN] AS [EDIFLGN],
[SU_CONTACT_COMPTYPE] AS [ContactComptype],
[SU_USRFLAG3] AS [UserFlag3],
[SU_USRNUM3] AS [UserNum3],
[SU_LEVEL] AS [Level],
[SU_IR_PL_APPROVER1] AS [IRPLApprover1],
[SU_IR_PL_APPROVER2] AS [IRPLApprover2],
[SU_IR_PL_APPROVER3] AS [IRPLApprover3],
[SU_IR_PL_APPROVER1_TYPE] AS [IRPLApprover1Type],
[SU_IR_PL_APPROVER2_TYPE] AS [IRPLApprover2Type],
[SU_IR_PL_APPROVER3_TYPE] AS [IRPLApprover3Type],
[SU_IR_POP_APPROVER1] AS [IRPOPApprover1],
[SU_IR_POP_APPROVER2] AS [IRPOPApprover2],
[SU_IR_POP_APPROVER3] AS [IRPOPApprover3],
[SU_IR_POP_APPROVER1_TYPE] AS [IRPOPApprover1Type],
[SU_IR_POP_APPROVER2_TYPE] AS [IRPOPApprover2Type],
[SU_IR_POP_APPROVER3_TYPE] AS [IRPOPApprover3Type],
[SU_CLOSING_DAYS] AS [ClosingDays],
[SU_DUE_DAYS_AFTER] AS [DueDaysAfter],
[SU_TAX_ROUNDING] AS [TaxRounding],
[SU_VALUEBORDER1] AS [ValueBorder1],
[SU_VALUEBORDER2] AS [ValueBorder2],
[SU_VALUEBORDER3] AS [ValueBorder3],
[SU_NOTEDATE1] AS [NoteDate1],
[SU_NOTEDATE2] AS [NoteDate2],
[SU_NOTEDATE3] AS [NoteDate3],
[SU_NOTERATE1] AS [NoteRate1],
[SU_NOTERATE2] AS [NoteRate2],
[SU_NOTERATE3] AS [NoteRate3],
[SU_PAYTYPE] AS [PayType],
[SU_BANK_TRNSFR_TYPE] AS [BankTransferType],
[SU_BANK_COMISSN_PAYER] AS [BankCommisonPayer],
[SU_BANK_AC_TYPE] AS [BankAccType],
[SU_BANK_COMISSN_FEE1] AS [BankCommisonFee1],
[SU_BANK_COMISSN_FEE2] AS [BankCommisonFee2],
[SU_BANK_COMISSN_FEE3] AS [BankCommisonFee3],
[SU_PAYMENT_METHOD] AS [PaymentMethod]
FROM
	[ASC_PILOT].[dbo].[PL_ACCOUNTS2] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_Suppliers3]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_LIVE_Suppliers3] as
SELECT
[SUP_UNIQUE] AS [ID],
[SUP_SOURCE_IND] AS [SourceID],
[SUP_CREATED] AS [CreatedOn],
[SUP_UPDATED] AS [ModifiedOn],
[SUP_CODE] COLLATE Latin1_General_CI_AS AS [Code],
[SUP_TELEX] COLLATE Latin1_General_CI_AS AS [Telex],
[SUP_CONTACT_2] COLLATE Latin1_General_CI_AS AS [Contact2],
[SUP_CONTACT_3] COLLATE Latin1_General_CI_AS AS [Contact3],
[SUP_ACCOUNT] COLLATE Latin1_General_CI_AS AS [Account],
[SUP_RATE_CODE_1] AS [RateCode1],
[SUP_RATE_CODE_2] AS [RateCode2],
[SUP_RATE_CODE_3] AS [RateCode3],
[SUP_RATE_CODE_4] AS [RateCode4],
[SUP_RATE_CODE_5] AS [RateCode5],
[SUP_BS5750] COLLATE Latin1_General_CI_AS AS [BS5750],
[SUP_UPDATE_STATUS] COLLATE Latin1_General_CI_AS AS [UpdteStatus],
[SUP_SUN_ACCOUNT] COLLATE Latin1_General_CI_AS AS [SunAccount],
[SUP_ANAL_FIELD4] COLLATE Latin1_General_CI_AS AS [Analysis4],
[SUP_ANAL_FIELD5] COLLATE Latin1_General_CI_AS AS [Analysis5],
[SUP_ANAL_FIELD6] COLLATE Latin1_General_CI_AS AS [Analysis6],
[SUP_ANAL_FIELD7] COLLATE Latin1_General_CI_AS AS [Analysis7],
[SUP_ANAL_FIELD8] COLLATE Latin1_General_CI_AS AS [Analysis8],
[SUP_ANAL_FIELD9] COLLATE Latin1_General_CI_AS AS [Analysis9],
[SUP_PRIORITY] COLLATE Latin1_General_CI_AS AS [Priority],
[SUP_PAY_METHOD] COLLATE Latin1_General_CI_AS AS [PaymentMethod],
[SUP_PAYMENT_DAYS] COLLATE Latin1_General_CI_AS AS [PaymentDays],
[SUP_SUPRS_REVAL] COLLATE Latin1_General_CI_AS AS [SuprsReval],
[SUP_TRANS_TO_ACCS] COLLATE Latin1_General_CI_AS AS [TransferToAccount],
[SUP_CIS_TYPE] COLLATE Latin1_General_CI_AS AS [CISType],
[SUP_CIS_NO] COLLATE Latin1_General_CI_AS AS [CISNo],
[SUP_CIS_DATE] AS [CISDate],
[SUP_ENTER_T1] COLLATE Latin1_General_CI_AS AS [EnterT1],
[SUP_ENTER_T2] COLLATE Latin1_General_CI_AS AS [EnterT2],
[SUP_ENTER_T3] COLLATE Latin1_General_CI_AS AS [EnterT3],
[SUP_ENTER_T4] COLLATE Latin1_General_CI_AS AS [EnterT4],
[SUP_ENTER_T5] COLLATE Latin1_General_CI_AS AS [EnterT5],
[SUP_ENTER_T6] COLLATE Latin1_General_CI_AS AS [EnterT6],
[SUP_ENTER_T7] COLLATE Latin1_General_CI_AS AS [EnterT7],
[SUP_ENTER_T8] COLLATE Latin1_General_CI_AS AS [EnterT8],
[SUP_ENTER_T9] COLLATE Latin1_General_CI_AS AS [EnterT9],
[SUP_ENTER_T10] COLLATE Latin1_General_CI_AS AS [EnterT10],
[SUP_SUN_ADDRESS] COLLATE Latin1_General_CI_AS AS [SunAddress],
[SUP_ORDER_TYPE] COLLATE Latin1_General_CI_AS AS [OrderType],
[SUP_NI_NUMBER] COLLATE Latin1_General_CI_AS AS [NINumber],
[SUP_DISPLAY_IN_MATRIX] AS [DisplayInMatrix],
[SUP_REBATE] AS [Rebate],
[SUP_REBATE_TURNOVER] AS [RebateTurnover],
[SUP_UNIQUE_TAX_REF] AS [UniqueTAXRef],
[SUP_COMPANY_REG_NO] COLLATE Latin1_General_CI_AS AS [CompanyRegNo],
[SUP_HMRC_REG_NAME] COLLATE Latin1_General_CI_AS AS [HMRCRegName],
[SUP_LAST_RETURN_DATE] AS [LastReturnDate],
[SUP_LAST_STAT_DED_DATE] AS [LastStatDedDate],
[SUP_HMRC_VERIFICATION_NO] COLLATE Latin1_General_CI_AS AS [HMRCVerificationNo],
[SUP_TAX_STATUS] AS [TAXStatus],
[SUP_HMRC_MATCHED] AS [HMRCMatched],
[SUP_ELEC_DVY_STAT_DED] AS [ElecDvyStatDed],
[SUP_EMAIL_ADD_STAT_DED] COLLATE Latin1_General_CI_AS AS [EmailAddStatDed],
[SUP_SUBC_FLAG] AS [SubcFlag],
[SUP_SUBC_TYPE] COLLATE Latin1_General_CI_AS AS [SubcType],
[SUP_PARTNERSHIP_LINK] COLLATE Latin1_General_CI_AS AS [PartnershipLink],
[SUP_LND_PERC_1] AS [LndPerc1],
[SUP_LND_PERC_2] AS [LndPerc2]
FROM
	[ASC_PILOT].[dbo].[ASC_PL_ACCOUNTS] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_SystemInfo1]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_ASC_LIVE_SystemInfo1] as
SELECT 
[COMPANY_NAME] AS [CompanyName],
[COMP_ADDRESS] AS [CompanyAddress],
[COMP_TELEPHONE] AS [CompanyTelephone],
[COMP_TELX] AS [CompanyTelx],
[COMP_FAX] AS [CompanyFax],
[COMP_VATNUMBER] AS [CompanyVATNumber],
[COMP_REGNUMBER] AS [CompanyRegNumber],
[COMP_BRANCHID] AS [CompanyBranchID],
[COMP_NOTES] AS [CompanyNotes],
[COMP_ADDRESS_USER1] AS [CompanyAddressUser1],
[COMP_ADDRESS_USER2] AS [CompanyAddressUser2],
[COMP_POSTCODE] AS [CompanyPostcode],
[COMP_FACTORING] AS [CompanyFactoring],
[COMP_INVSUB_TXT] AS [CompanyInvSubTxt],
[COMPANYDATANAME] AS [CompanyDataName],
[HOME_TAXNAME] AS [HomeTaxName],
[STK_USR_VALUATN] AS [StkUserValuation],
[STK_USR_QTY] AS [StkUserQty],
[STK_SNAP_DATE] AS [StkSnapDate],
[STK_LOC_COPY] AS [StkLocCopy],
[NOM_VAT_CNTRL] AS [NomVATControl],
[NOM_SUSPENSE] AS [NomSuspense],
[NOM_SALES] AS [NomSales],
[NOM_SALES_CNTRL] AS [NomSalesControl],
[NOM_SALES_DISC] AS [NomSalesDisc],
[NOM_MAIN_BANK] AS [NomMainBank],
[NOM_PURCHASE] AS [NomPurchase],
[NOM_PURCH_CNTRL] AS [NomPurchControl],
[NOM_PURCH_DISC] AS [NomPurchDisc],
[NOM_YEAR_UPDATE] AS [NomYearUpdate],
[HOME_COUNTRY] AS [HomeCountry],
[HOME_CURR_SYMBL] AS [HomeCurrSymbol],
[SPREDSHT_FORMAT] AS [SpreadsheetFormat],
[SL_AGEING_MTHD] AS [SLAgeingMethod],
[PL_AGEING_MTHD] AS [PLAgeingMethod],
[STK_DLRREP_KEY] AS [StkDlrrepKey],
[CF_PERTYPE] AS [CFPertype],
[PL_CHEQUE_NO] AS [PLChequeNo],
[PERIOD_END_OPTN] AS [PeriodEndOption],
[SALES_UPDTEYEAR] AS [SalesUpdateYear],
[PURCH_UPDTEYEAR] AS [PurchUpdateYear],
[CO_BANK_SORT] AS [CompanyBankSortCode],
[CO_BANK_AC_NO] AS [CompanyBankAccountNo],
[CO_BANK_AC_NAME] AS [CompanyBankAccountName],
[TERMS] AS [Terms],
[DELIV_METHOD] AS [DeliveryMethod],
[YEAR_START_DATE] AS [YearStartDate],
[PEND_UPDATE_STATUS] AS [PendUpdateStatus],
[DATE_CREATED] AS [DateCreated],
[PROGRAMTYPE] AS [ProgramType],
[NOM_FINDISC_C] AS [NomFindiscC],
[NOM_FINDISC_I] AS [NomFindiscI],
[NOM_PAYDIFF_C] AS [NomPaydiffC],
[NOM_PAYDIFF_I] AS [NomPaydiffI],
[NOM_BANKCOST] AS [NomBankCost],
[NOM_DIFFERENCE] AS [NomDifference],
[INVREG_ROUTE_MASK] AS [InvRegRouteMask],
[COMP_EMAIL] AS [CompanyEmail],
[COMP_COUNTRY] AS [CompanyCountry],
[STK_BARCODE_MAPPING] AS [StkBarcodeMapping],
[CUSTOM_DOCUMENT_FIELDS] AS [CustomDocumentFields],
[CO_IBAN_NO] AS [CompanyIBANNo],
[STK_BARCODE_FONT] AS [StkBarcodeFont],
[EU_START_DATE] AS [EUStartDate],
[CO_BANK_AC_BACSREF] AS [CompanyBankAcccountBACSRef],
[BACKGROUND_IMAGE_FILENAME] AS [BackgroundImageFilename],
[EXCLUDE_SA_TRANSFERS] AS [ExcludeSATransfers],
[ACCOUNT_FOR_CARBON] AS [AccountForCarbon],
[CARBON_BY_GROUP] AS [CarbonByGroup],
[CARBON_BY_DIVISION] AS [CarbonByDivision],
[CARBON_YEAR_PERIOD_FROM_DATE_OPTION] AS [CarbonYearPeriodFromDateOption],
[CUST_SORT_KEY_RESTRICTION] AS [CustSortKeyRestriction],
[CUST_USER_SORT1_RESTRICTION] AS [CustUserSort1Restriction],
[CUST_USER_SORT2_RESTRICTION] AS [CustUserSort2Restriction],
[CUST_USER_SORT3_RESTRICTION] AS [CustUserSort3Restriction],
[SL_USER_SORT1_RESTRICTION] AS [SLUserSort1Restriction],
[SL_USER_SORT2_RESTRICTION] AS [SLUserSort2Restriction],
[SL_USER_SORT3_RESTRICTION] AS [SlUserSort3Restriction],
[SUPP_SORT_KEY_RESTRICTION] AS [SuppSortKeyRestriction],
[SUPP_USER_SORT1_RESTRICTION] AS [SuppUserSort1Restriction],
[SUPP_USER_SORT2_RESTRICTION] AS [SuppUserSort2Restriction],
[SUPP_USER_SORT3_RESTRICTION] AS [SuppUserSort3Restriction],
[PL_USER_SORT1_RESTRICTION] AS [PLUserSort1Restriction],
[PL_USER_SORT2_RESTRICTION] AS [PLUserSort2Restriction],
[PL_USER_SORT3_RESTRICTION] AS [PLUserSort3Restriction],
[STK_SORT_KEY_RESTRICTION] AS [StkSortKeyRestriction],
[STK_USER_SORT1_RESTRICTION] AS [StkUserSort1Restriction],
[STK_USER_SORT2_RESTRICTION] AS [StkUserSort2Restriction],
[STK_USER_SORT3_RESTRICTION] AS [StkUserSort3Restriction],
[SYS_USE_DMS] AS [SysUseDMS],
[SYS_DMS_WEBSERVICE_URL] AS [SysDmsWebserviceUrl],
[SYS_DMS_WEBSITE_URL] AS [SysDmsWebsiteUrl],
[SYS_DATABASE_PASSWORD] AS [SysDatabasePassword],
[IR_QUERY_WHEN_QTY_INV_MORE_THAN_DEL] AS [IrQueryWhenQtyInvMoreThanDel],
[NL_USE_ADVANCED] AS [NLUseAdvanced],
[ANL_NOM_SEPARATOR] AS [ANLNomSeparator],
[ANL_NUMBER_OF_CAT_LEVELS] AS [ANLNumberOfCatLevels],
[ANL_CAT_DETAIL_LEVEL] AS [ANLCatDetailLevel],
[ANL_CAT_LEVEL1_SETUP] AS [ANLCatLevel1Setup],
[ANL_CAT_LEVEL2_SETUP] AS [ANLCatLevel2Setup],
[ANL_CAT_LEVEL3_SETUP] AS [ANLCatLevel3Setup],
[ANL_CAT_LEVEL4_SETUP] AS [ANLCatLevel4Setup],
[ANL_CAT_LEVEL5_SETUP] AS [ANLCatLevel5Setup],
[ANL_CAT_LEVEL6_SETUP] AS [ANLCatLevel6Setup],
[ANL_CAT_LEVEL7_SETUP] AS [ANLCatLevel7Setup],
[ANL_CAT_LEVEL8_SETUP] AS [ANLCatLevel8Setup],
[ANL_CAT_LEVEL1_ENTRY] AS [ANLCatLevel1Entry],
[ANL_CAT_LEVEL2_ENTRY] AS [ANLCatLevel2Entry],
[ANL_CAT_LEVEL3_ENTRY] AS [ANLCatLevel3Entry],
[ANL_CAT_LEVEL4_ENTRY] AS [ANLCatLevel4Entry],
[ANL_CAT_LEVEL5_ENTRY] AS [ANLCatLeve5lEntry],
[ANL_CAT_LEVEL6_ENTRY] AS [ANLCatLevel6Entry],
[ANL_CAT_LEVEL7_ENTRY] AS [ANLCatLevel7Entry],
[ANL_CAT_LEVEL8_ENTRY] AS [ANLCatLevel8Entry],
[ANL_CAT_LEVEL1_LENGTH] AS [ANLCatLevel1Length],
[ANL_CAT_LEVEL2_LENGTH] AS [ANLCatLevel2Length],
[ANL_CAT_LEVEL3_LENGTH] AS [ANLCatLevel3Length],
[ANL_CAT_LEVEL4_LENGTH] AS [ANLCatLevel4Length],
[ANL_CAT_LEVEL5_LENGTH] AS [ANLCatLevel5Length],
[ANL_CAT_LEVEL6_LENGTH] AS [ANLCatLevel6Length],
[ANL_CAT_LEVEL7_LENGTH] AS [ANLCatLevel7Length],
[ANL_CAT_LEVEL8_LENGTH] AS [ANLCatLevel8Length],
[YEAR_LABEL_AS_END_YEAR] AS [YearLabelAsEndYear],
[SUPP_USER_SORT4_RESTRICTION] AS [SuppUserSort4Restriction],
[DEFAULT_CARBON_INFO_VERSION] AS [DefaultCarbonInfoVersion],
[ANL_CONCATENATE_METHOD] AS [ANLConcatenateMethod],
[ECSL_REPORT_FREQUENCY] AS [EcslReportFrequency],
[ECSL_REPORT_FORMAT] AS [EcslReportFormat],
[ECSL_BY_DATE] AS [EcslByDate],
[COMP_COMMUNICATION_USERID] AS [CompCommunicationUserID],
[CST_RESORCE_UPD] AS [CstResorceUpd],
[STK_SNAP_FIFO] AS [StkSnapFIFO],
[STK_SNAP_AVERAG] AS [StkSnapAverage],
[STK_SNAP_LATEST] AS [StkSnapLatest],
[STK_NEGATIVE] AS [StkNegative],
[CST_DEF_TRNSTAT] AS [CstDefTrnstat],
[USE_PRE_PRINTED] AS [UsePrePrinted],
[HIDE_ADDRESS] AS [HideAddress],
[POP_ORDER_NO] AS [PopOrderNo],
[MULTI_PART_STAT] AS [MultiPartStat],
[SHOW_STOCK_CODE] AS [ShowStockCode],
[LEAV_BLANK_LINE] AS [LeaveBlankLine],
[INV_FULL_ORDER] AS [InvFullOrder],
[PREPRNT_HEADING] AS [PreprintHeading],
[ALLOCAT_REF] AS [AllocateRef],
[INC_ALLOC_MATCH] AS [IncAllocateMatch],
[PRINT_DELIV_ADD] AS [PrintDelivAdd],
[STATIONERY_OPTN] AS [StationeryOption],
[CST_DEF_RECSTAT] AS [CstDefRecstat],
[CST_HEADER_UPD] AS [CstHeaderUpd],
[PREPRINT_LINES] AS [PreprintLines],
[STK_AUTO_PRILST] AS [StkAutoPrilst],
[POP_GRN_NO] AS [PopGrnNo],
[POP_GRET_NO] AS [PopGretNo],
[P_BLANK_LINE] AS [PBlankLine],
[EC_VAT_INSTAL] AS [EcVatInstal],
[CASHVAT_INSTAL] AS [CashvatInstall],
[LOGON_INSTAL] AS [LogonInstall],
[MENUNAME] AS [MenuName],
[SHOW_SUP_STKCDE] AS [ShowSupStkcde],
[DO_NOT_PRNT_GRN] AS [DoNotPrntGrn],
[DO_NOT_PRNT_ORD] AS [DoNotPrntOrd],
[POP_SHOW_STKCDE] AS [PopShowStkcde],
[INV_SUB_OPTION] AS [InvSubOption],
[NEXT_JNL_NUMBR] AS [NextJnlNumber],
[NEXT_PL_NUMBR] AS [NextPLNumber],
[SL_PRINTED_INV] AS [SLPrintedInv],
[SL_PRINTED_CRN] AS [SLPrintedCrn],
[SL_PRINTED_PAY] AS [SLPrintedPay],
[SL_PRINTED_ADR] AS [SLPrintedAdr],
[SL_PRINTED_ACR] AS [SLPrintedAcr],
[SL_PRINTED_AUD] AS [SLPrintedAud],
[IN_PRINTED_INV] AS [InPrintedInv],
[IN_PRINTED_CRN] AS [InPrintedCrn],
[SL_AUDIT_COUNT] AS [SLAuditCount],
[SL_IGNORE_AUDIT] AS [SLIgnoreAudit],
[PL_PRINTED_INV] AS [PLPrintedInv],
[PL_PRINTED_CRN] AS [PLPrintedCrn],
[PL_PRINTED_PAY] AS [PLPrintedPay],
[PL_PRINTED_ADR] AS [PLPrintedAdr],
[PL_PRINTED_ACR] AS [PLPrintedAcr],
[PL_PRINTED_AUD] AS [PLPrintedAud],
[PL_AUDIT_COUNT] AS [LAuditCount],
[PL_IGNORE_AUDIT] AS [PLIgnoreAudit],
[AUTO_NUMBR_JNL] AS [AutoNumberJnl],
[AUTO_NUMBR_PL] AS [AutoNumberPl],
[NL_PRINTED_AUD] AS [NLPrintedAud],
[NL_AUDIT_COUNT] AS [NLAuditCount],
[SO_CONFM_NYPSEQ] AS [SoConfmNypseq],
[STK_PRINTED_MOV] AS [StkPrintedMov],
[CST_PRINTED_TRN] AS [CstPrintedTrn],
[SO_PRINTED_AUD] AS [SOPrintedAud],
[SO_AUDIT_COUNT] AS [SOAuditCount],
[PO_PRINTED_AUD] AS [POPrintedAud],
[PO_AUDIT_COUNT] AS [POAuditCount],
[SO_MAIL_NYPSEQ] AS [SOMailNypseq],
[SL_AGEING_DAYS1] AS [SLAgeingDays1],
[SL_AGEING_DAYS2] AS [SLAgeingDays2],
[SL_AGEING_DAYS3] AS [SLAgeingDays3],
[SL_AGEING_DAYS4] AS [SLAgeingDays4],
[PL_AGEING_DAYS1] AS [PLAgeingDays1],
[PL_AGEING_DAYS2] AS [PLAgeingDays2],
[PL_AGEING_DAYS3] AS [PLAgeingDays3],
[PL_AGEING_DAYS4] AS [PLAgeingDays4],
[NL_IGNORE_AUDIT] AS [NLIgnoreAudit],
[PL_REF_ON_REP] AS [PLRefOnRep],
[NO_OF_USERS_IN] AS [NoOfUsersIn],
[SL_BATCH_IN_USE] AS [SLBatchInUse],
[PL_BATCH_IN_USE] AS [PLBatchInUse],
[NL_BATCH_IN_USE] AS [NLBatchInUse],
[SYS_VAT_IN_USE] AS [SysVatInUse],
[SK_BATCH_IN_USE] AS [SkBatchInUse],
[SO_BATCH_IN_USE] AS [SOBatchInUse],
[PO_BATCH_IN_USE] AS [POBatchInUse],
[CT_BATCH_IN_USE] AS [CtBatchInUse],
[PL_CHEQS_IN_USE] AS [PLCheqsInUse],
[CF_BATCH_IN_USE] AS [CfBatchInUse],
[STK_MAT_STKOPT] AS [StkMatStkopt],
[STK_MAT_CUSTOPT] AS [StkMatCustopt],
[SOP_CSTPRC_OPT] AS [SopCstprcOpt],
[CHK_LOC_QTY] AS [ChkLocQty],
[USE_MAX_LIST] AS [UseMaxList],
[MAX_LIST_SIZE] AS [MaxListSize],
[CF_PERIODS] AS [CfPeriods],
[RTP_ORDER_NO] AS [RtpOrderNumber],
[RTP_ENTER_NO] AS [RtpEnterNumber],
[POP_ENTER_NO] AS [PopEnterNumber],
[PEND_LOOP_STATUS] AS [PendLoopStatus],
[SALES_PERIOD] AS [SalesPeriod],
[PURCHASE_PERIOD] AS [PurchasePeriod],
[NOMINAL_PERIOD] AS [NominalPeriod],
[SALES_UPDATENOM] AS [SalesUpdateNom],
[PURCH_UPDATENOM] AS [PurchUpdateNom],
[COSTING_PERIOD] AS [CostingPeriod],
[STOCK_PERIOD] AS [StockPeriod],
[AUTO_CUST_TAB] AS [AutoCustTab],
[AUTO_CUST_NOTES] AS [AutoCustNotes],
[AUTO_STK_NOTES] AS [AutoStkNotes],
[CST_UPLIFT_TYPE] AS [CstUpliftType],
[WIND_POS_OPTS] AS [WindPosOpts],
[WIND_STAGGER_H] AS [WindStaggerH],
[WIND_STAGGER_W] AS [WindStaggerW],
[AUTO_NUMBR_JOB] AS [AutoNumbrJob],
[AUTO_NUMBR_CUST] AS [AutoNumbrCust],
[NEXT_CUST_NUMBR] AS [NextCustNumber],
[CAPS_CUST_NAME] AS [CapsCustName],
[TAB_ACC_SEARCH] AS [TabAccSearch],
[TAB_STK_SEARCH] AS [TabStkSearch],
[NEXT_JOB_NUMBR] AS [NextJobNumber],
[LINE_DISCOUNT] AS [LineDiscount],
[TOTAL_DISCOUNT] AS [TotalDiscount],
[SETTLE_DISC_1] AS [SettleDisc1],
[SETTLE_DISC_2] AS [SettleDisc2],
[SETTLE_DAYS_1] AS [SettleDays1],
[SETTLE_DAYS_2] AS [SettleDays2],
[DELIV_CHG_FIXED] AS [DeliveryChargeFixed],
[DELIV_CHG_PRCNT] AS [DeliveryChargePercent],
[MIN_ORDER_VALUE] AS [MinOrderValue],
[DUE_DAYS] AS [DueDays],
[CREDIT_LIMIT] AS [CreditLimit],
[DUE_DATE_TYPE] AS [DueDateType],
[STARTING_DAY_OF_WEEK] AS [StartingDayOfWeek],
[SOP_SWTCH_DEF] AS [SopSwtchDef],
[NORMAL_DAYS] AS [NormalDays],
[URGENT_DAYS] AS [UrgentDays],
[P_NORMAL_DAYS] AS [PNormalDays],
[P_URGENT_DAYS] AS [PUrgentDays],
[CHEQUE_STATNRY] AS [ChequeStationary],
[SYS_PRIMARY] AS [SysPrimary],
[PRICE_DPS] AS [PriceDps],
[QUANTITY_DPS] AS [QuantityDps],
[VALUE_DPS] AS [ValueDps],
[VAT_DPS] AS [VATDps],
[STK_SNAP_WAPU] AS [StkSnapWapu],
[BACS_LAYOUT] AS [BACSLayout],
[PEND_STEP_SIZE] AS [PendStepSize],
[SOP_DELIVERY_NOTE_SUB_OPTION] AS [SopDeliveryNoteSubOption],
[CRM_DEALER_FIELD] AS [CrmDealerField],
[CRM_DLR_FIELD_PREFIX] AS [CrmDlrFieldPrefix],
[CRM_USE_PRODUCT_IN_PC_MATRIX] AS [CrmUseProductInPcMatrix],
[LABEL_RECORD_SPACING] AS [LabelRecordSpacing],
[LABEL_REPEAT_FACTOR] AS [LabelRepeatFactor],
[LABEL_LABEL_WIDTH] AS [LabelLabelWidth],
[LABEL_LEFT_MARGIN] AS [LabelLeftMargin],
[LABEL_TOP_MARGIN] AS [LabelTopMargin],
[LABEL_BOTTOM_MARGIN] AS [LabelBottomMargin],
[LABEL_UNITS] AS [LabelUnits],
[LABEL_LABELS_ACROSS] AS [LabelLabelsAcross],
[CO_BANK_REF] AS [CompanyBankRef],
[CO_BACS_REMIT_ADVICE] AS [CompanyBACSRemitAdvice],
[DO_NOT_PRINT_ORD_VIA_REQUESTS] AS [DoNotPrintOrdViaRequests],
[OS_ITEM_DELNOTE] AS [OsItemDelnote],
[CAPS_SUPP_NAME] AS [CapsSuppName],
[CALC_STOCK_LEVEL_FROM_SA] AS [CalcStockLevelFromSa],
[COMP_COMMUNICATION_PASSWORD] AS [CompCommunicationPassword],
[PL_USE_CHEQUE_PRINT_HISTORY] AS [PlUseChequePrintHistory]
	
FROM 
	[ASC_LIVE].[dbo].[SYS_DATAINFO] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_SystemPeople]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE View [dbo].[vw_ASC_LIVE_SystemPeople] as 
select 
[PP_PRIMARY] AS [ID],
[PP_CODE] AS [Code],
[PP_KNOWN_AS] AS [KnownAs],
[PP_TITLE] AS [Title],
[PP_INITIALS] AS [Initials],
[PP_FIRST_NAME] AS [Forenames],
[PP_SURNAME] AS [Surname],
[PP_SALUTE] AS [Salute],
[PP_JOB_TITLE] AS [JobTitle],
[PP_DEPARTMENT] AS [Department],
[PP_EMAIL] AS [Email],
[PP_MOBILE] AS [Mobile],
[PP_EXTENSION] AS [Extension],
[PP_USER_ID] AS [UserID],
[PP_RESP_TO_LINK] AS [RespToLink],
[PP_DATE_PUTIN] AS [CreatedOn],
[PP_USER_PUTIN] AS [CreatedBy],
[PP_DATE_EDITED] AS [ModifiedOn],
[PP_USER_EDITED] AS [ModifiedBy],
[PP_USRDATE1] AS [Date1],
[PP_USRDATE2] AS [Date2],
[PP_USRDATE3] AS [Daet3],
[PP_NOTES] AS [Notes],
[PP_ADDRESS] AS [Address],
[PP_ADDRESS_USER1] AS [AddressUser1],
[PP_ADDRESS_USER2] AS [AddressUser2],
[PP_POSTCODE] AS [Postcode],
[PP_COUNTRY] AS [Country],
[PP_PHONE] AS [Phone],
[PP_FAX] AS [Fax],
[PP_HOME_PHONE] AS [HomePhone],
[PP_WEBSITE_ADDRESS] AS [WebsiteAddress],
[PP_USRCHAR1] AS [Char1],
[PP_USRCHAR2] AS [Char2],
[PP_USRCHAR3] AS [Char3],
[PP_USRCHAR4] AS [Char4],
[PP_USRCHAR5] AS [Char5],
[PP_USRCHAR6] AS [Char6],
[PP_USRCHAR7] AS [Char7],
[PP_USRCHAR8] AS [Char8],
[PP_USRNUM1] AS [Num1],
[PP_USRNUM2] AS [Num2],
[PP_USRNUM3] AS [Num3],
[PP_USRFLAG1] AS [Flag1],
[PP_USRFLAG2] AS [Flag2],
[PP_USRFLAG3] AS [Flag3],
[PP_PROJECT_LEADER] AS [ProjectLeader],
[PP_DO_NOT_USE] AS [DoNotUse],
[PP_APPROVER_TYPE1] AS [ApproverType1],
[PP_APPROVER_TYPE2] AS [ApproverType2],
[PP_APPROVER_TYPE3] AS [ApproverType3],
[PP_BYPASS_APPROVAL] AS [BypassApproval],
[PP_LEAVER] AS [Leaver]

from 
	[ASC_LIVE].[dbo].[SYS_PEOPLE] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_LIVE_SystemVATControl]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ASC_LIVE_SystemVATControl] as 
SELECT
	[VAT_CODE] AS [Code],
[VAT_NAME] AS [Name],
[UPDATED_DATE] AS [ModifiedOn],
[UPDTE_USER] AS [UPDTEUser],
[UPDTE_FROM_YEAR] AS [UPDTEFromYear],
[UPDTE_TO_YEAR] AS [UPDTEToYear],
[EC_TYPE] AS [ECType],
[ESL_YEAR_FROM] AS [ESLFromYear],
[ESL_YEAR_TO] AS [ESLToYear],
[TAX_SORT_CODE] AS [TAXSortCode],
[VAT_DATE_PUTIN] AS [CreatedOn],
[VAT_USER_PUTIN] AS [CreatedBy],
[VAT_DATE_EDITED] AS [ModifiedOn2],
[VAT_USER_EDITED] AS [ModifiedOn2By],
[UPDTE_FROM_DATE] AS [UPDTEFromDate],
[UPDTE_TO_DATE] AS [UPDTEToDate],
[VAT_RATE] AS [Rate],
[VAT_NET_OUTPUT] AS [NetOutput],
[VAT_NET_INPUT] AS [NetInput],
[VAT_OUTPUT] AS [Output],
[VAT_INPUT] AS [Input],
[UPDTE_FROM_PER] AS [UPDTEFromPer],
[UPDTE_TO_PER] AS [UPDTEToPer],
[UPDTE_FIRST_SEQ] AS [UPDTEFirstSeq],
[UPDTE_LAST_SEQ] AS [UPDTELastSeq],
[VAT_EC_IMP_GDS] AS [ECImportGoods],
[VAT_EC_EXP_GDS] AS [ECExportGoods],
[VAT_EC_ACQUISIT] AS [ECAcquisition],
[VAT_EC_SUPPLIES] AS [ECSupplies],
[VAT_EC_VATACQS] AS [ECVATACQS],
[VAT_RULE_FLAG] AS [RuleFlag],
[ESL_PERD_FROM] AS [ESLFromPeriod],
[ESL_PERD_TO] AS [ESLToPeriod],
[CASHOUT_INV_BF] AS [CashoutInvBF],
[CASHOUT_VAT_BF] AS [CashoutVATBF],
[CASHOUT_VALUE] AS [CashoutValue],
[CASHOUT_VAT] AS [CashoutVAT],
[CASHIN_INV_BF] AS [CashinInvBF],
[CASHIN_VAT_BF] AS [CashinVATBF],
[CASHIN_VALUE] AS [CachinValue],
[CASHIN_VAT] AS [CacshinVAT],
[TAX_RATE1] AS [TAXRate1],
[TAX_RATE2] AS [TAXRate2],
[TAX_RATE3] AS [TAXRate3],
[TAX_RATE4] AS [TACRate4],
[TAX_RATE5] AS [TAXRate5],
[TAX_RATE6] AS [TAXRate6],
[VAT_PRIMARY] AS [Primary],
[VAT_SYSTEM] AS [System],
[VAT_TYPE] AS [Type],
[VAT_RULE_COUNT] AS [RuleCount],
[VAT_RATE_ICC] AS [RateICC]
FROM
	[ASC_LIVE].[dbo].[SYS_VATCONTROL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_PILOT_Orders]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_PILOT_Orders] as
SELECT 
	[COR_UNIQUE]					AS [ID],
    [COR_SOURCE_IND]				AS [SourceID],
    [COR_CREATED]					AS [CreatedOn],
    [COR_UPDATED]					AS [ModifiedOn],
    [COR_PART_ONLY]					AS [Part],
    [COR_PART_REV]					AS [PartRev],
    [COR_OUR_NUMBER]				AS [OrderRef],
    [COR_SUB]						AS [Sequence],
    [COR_OUR_NUMBER_N]				AS [OrderNum],
    [COR_CUSTOMER_CODE]				AS [CustomerCode],
    [COR_CUSTOMER_DUE]				AS [CustomerDue],
    [COR_CUSTOMER_ORDER]			AS [CustomerOrderRef],
    [COR_QTY_ORDERED]				AS [QuantityOrdered],
    [COR_QTY_DELIVERED]				AS [QuantityDelivered],
    [COR_ORDER_WHEN]				AS [OrderDateWhen],
    [COR_EXPECTED_DATE]				AS [ExpectedDueDate],
    [COR_MSC_FLAG]					AS [B2BMasterSched],
    [COR_PRICE_PER]					AS [FinalPrice],
    [COR_ORDER_STATUS]				AS [Status],
    [COR_MS]						AS [MasterSched],
    [COR_QTY_ALLOCATED]				AS [QuantityAllocated],
    [COR_QTY_INVOICED]				AS [QuantityInvoiced],
    [COR_PRIORITY]					AS [OrderPriority],
    [COR_THIS_DVY_QTY]				AS [QuantityOnLastDel],
    [COR_DSP_STAT]					AS [DespatchedStatus],
    [COR_NARR]						AS [ShortNote1],
    [COR_NARR_ACT]					AS [ShortNote2],
    [COR_PAY_TERMS]					AS [PaymentTerms],
    [COR_ALT_DVY]					AS [AltDelAdd],
    [COR_NARR_CARR]					AS [ShortNote3],
    [COR_DSP_NOTE]					AS [PicknoteNo],
    [COR_ORIG_PRICE]				AS [OriginalPrice],
    [COR_DISC_PRICE]				AS [DiscountedPrice],
    [COR_DISC_CODE]					AS [DiscountCode],
    [COR_FOREIGN_PRICE]				AS [ForeignPrice],
    [COR_CURRENCY]					AS [Currency],
    [COR_COLOUR]					AS [ColourCode],
	[COR_WO]						AS [WorksOrderNo],
    [COR_ORDER_TYPE]				AS [OrderType],
    [COR_TAX_CODE]					AS [VATCode],
    [COR_ANAL_FIELD1]				AS [Analysis1],
    [COR_ANAL_FIELD2]				AS [Analysis2],
    [COR_ANAL_FIELD3]				AS [Analysis3],
    [COR_ANAL_FIELD4]				AS [Analysis4],
    [COR_ANAL_FIELD5]				AS [Analysis5],
    [COR_ANAL_FIELD6]				AS [Analysis6],
    [COR_ANAL_FIELD7]				AS [Analysis7],
    [COR_ANAL_FIELD8]				AS [Analysis8],
    [COR_ANAL_FIELD9]				AS [Analysis9],
    [COR_ANAL_FIELD10]				AS [Analysis10],
    [COR_DUPLICATE]					AS [Duplicate],
    [COR_ACCOUNT]					AS [SalesAccount],
    [COR_INITIALS1]					AS [CommissionInitial1],
    [COR_PERCENT1]					AS [CommissionPercent1],
	[COR_INITIALS2]					AS [CommissionInitial2],
    [COR_PERCENT2]					AS [CommissionPercent2],
	[COR_INITIALS3]					AS [CommissionInitial3],
    [COR_PERCENT3]					AS [CommissionPercent3],
    [COR_ORDER_DISC]				AS [OrderDiscountPercent],
    [COR_ORDER_STATUS_2]			AS [Status2],
    [COR_PRO_FORMA]					AS [ProForma],
    [COR_APPLY_WL_DISC]				AS [OrderDiscountApply],
    [COR_WL_DISC_CODE]				AS [OrderDiscountCode],
    [COR_QTY_APPLIED]				AS [AppliedForQuantity],
    [COR_PICKED_FLAG]				AS [PicknotePrinted],
    [COR_QTY_PREV_APP]				AS [PrevAppliedForQuantity],
    [COR_QTY_CONSIGNED]				AS [QuantityConsigned],
    [COR_JOB]						AS [JobRef],
    [COR_QTY_ENTERED]				AS [QuantityEntered],
    [COR_UOM_ENTERED]				AS [UoM],
    [COR_ENTERED_BY]				AS [OrderEnteredBy],
    [COR_SETT_DISC]					AS [SettlementDiscPercent],
    [COR_MANUAL_SETT]				AS [SettlementDiscOverride],
    [COR_SETT_DISC_DAYS]			AS [SettlementDays],
    [COR_LINE_TYPE]					AS [LineType],
    [COR_ORIG_PRICE_PER]			AS [OrigPricePer],
    [COR_DISC_PRICE_PER]			AS [DiscPricePer],
    [COR_FORN_PRI_PER]				AS [FornPricePer],
    [COR_PRICE_PER_PER]				AS [PricePerPer],
    [COR_PRICE_SOURCE]				AS [PriceSource],
    [COR_ALLOC_STATUS]				AS [AllocStatus],
    [COR_PR_LIST]					AS [PRList],
    [COR_FIXED_EXRATE_FLAG]			AS [FixedExRate],
    [COR_EXCHANGE_RATE]				AS [ExchangeRate],
    [COR_PO]						AS [PO],
    [COR_PCK_PICK_NO]				AS [PckPickNo],
    [COR_PCK_PRINT_WHEN]			AS [PckPrintWhen],
    [COR_USER_DEF_DISC_FLAG]		AS [UDefDisc],
    [COR_DUTY]						AS [Duty],
    [COR_NO_DUTY_REASON]			AS [DutyReason],
    [COR_DUTY_HOW_PAID]				AS [DutyHowPaid],
    [COR_DUTY_CUS_DEFERMENT]		AS [DutyCusDeferment],
    [COR_TIED_PART_ONLY]			AS [TiedPart],
    [COR_TIED_PART_REV]				AS [TiedPartRev],
    [COR_TIED_SUB]					AS [TiedSequence],
    [COR_DISC_PERCENT]				AS [DiscPercent],
    [COR_QTY_PARA_1]				AS [QtyPara1],
    [COR_QTY_PARA_OP_1]				AS [QtyParaOp1],
    [COR_QTY_PARA_2]				AS [QtyPara2],
    [COR_QTY_PARA_OP_2]				AS [QtyParaOp2],
    [COR_QTY_PARA_3]				AS [QtyPara3],
    [COR_ORDER_DATE]				AS [OrderDate],
    [COR_BASE_COST]					AS [BaseCost],
    [COR_BASE_COST_PER]				AS [BaseCostPer],
    [COR_BASE_COST_CURRENCY]		AS [BaseCostCurrency],
    [COR_BASE_COST_FOREIGN]			AS [BaseCostForeign],
    [COR_BASE_COST_FOREIGN_PER]		AS [BaseCostForeignPer],
    [COR_BASE_COST_SOURCE]			AS [BaseCostSource],
    [COR_BASE_COST_REF]				AS [BaseCostRef],
    [COR_BASE_COST_SUP]				AS [BaseCostSup],
    [COR_BUFFER_STOCK]				AS [BufferStock],
    [COR_SCHEDULE_NUMBER]			AS [ScheduleNumber],
    [COR_FIXED_ALLOC]				AS [FixedAlloc],
    [COR_QTY_PICKED]				AS [QuantityPicked],
    [COR_PROCESS_STATUS]			AS [ProcessStatus],
    [COR_SECURITY_LEVEL]			AS [SecurityLevel],
    [COR_USER_CREATED]				AS [UserCreated],
    [COR_USER_UPDATED]				AS [UserUpdated],
    [COR_CREDIT_CARD_STATUS]		AS [CreditCardStatus],
    [COR_USER_STATUS1]				AS [UserStatus1],
    [COR_USER_DATE1]				AS [UserDate10],
    [COR_DESPATCH_ALONE]			AS [DespatchAlone],
    [COR_FIX_FINAL_PRICE]			AS [FixFinalPrice],
    [COR_LINE_NUM]					AS [LineNum],
    [COR_SOURCE_WH]					AS [SourceWH],
    [COR_PROJECT]					AS [Project],
    [COR_COST_CENTRE]				AS [CostCentre],
    [COR_EDI_SUP_ID_ALLOC]			AS [EDISupIDAlloc],
    [COR_EDI_CUS_MEASURE_IND]		AS [EDICusMeasureInd],
    [COR_EDI_COST_PRICE]			AS [EDICostPrice],
    [COR_EDI_COST_MEASURE_IND]		AS [EDICostMeasureInd],
    [COR_KIT_ITEM_IND]				AS [KitItemInd],
    [COR_PARENT_PART_ONLY]			AS [ParentPart],
    [COR_PARENT_PART_REV]			AS [ParentPartRev],
    [COR_PARENT_UNIQUE]				AS [ParentID],
    [COR_NO_INTRASTAT]				AS [NoIntrastat],
    [COR_PALLET_QTY]				AS [PalletQuantity],
    [COR_USER_DATE_1]				AS [UserDate1],
	[COR_USER_DATE_2]				AS [UserDate2],
	[COR_USER_DATE_3]				AS [UserDate3],
	[COR_USER_DATE_4]				AS [UserDate4],
	[COR_USER_DATE_5]				AS [UserDate5],
    [COR_USER_TEXT1]				AS [UserText1],
	[COR_USER_TEXT2]				AS [UserText2],
	[COR_USER_TEXT3]				AS [UserText3],
	[COR_USER_TEXT4]				AS [UserText4],
	[COR_USER_TEXT5]				AS [UserText5],
	[COR_USER_NUM1]					AS [UserNum1],
	[COR_USER_NUM2]					AS [UserNum2],
	[COR_USER_NUM3]					AS [UserNum3],
	[COR_USER_NUM4]					AS [UserNum4],
	[COR_USER_NUM5]					AS [UserNum5],
    [COR_USER_CHECK1]				AS [UserCheck1],
	[COR_USER_CHECK2]				AS [UserCheck2],
	[COR_USER_CHECK3]				AS [UserCheck3],
	[COR_USER_CHECK4]				AS [UserCheck4],
	[COR_USER_CHECK5]				AS [UserCheck5],
    [COR_GM_ACCOUNTNO]				AS [GMAccountNo],
    [COR_GM_USER]					AS [GMUser],
    [COR_GM_OPP_ID]					AS [GMOppID],
    [COR_GM_FORECAST_ID]			AS [GMForecastID],
    [COR_GM_CREATE_FORECAST]		AS [GMCreateForecast],
    [COR_GM_LOOKUP_KEY]				AS [GMLookupKey],
    [COR_UPDATE_STATUS]				AS [UpdateStatus],
    [COR_DUEDATE_TYPE]				AS [DueDateType],
    [COR_DUE_DAYS]					AS [DueDays],
    [COR_FULL_SHIP_ONLY]			AS [FullShipOnly],
    [COR_SHIP_WHOLE_ORDER_ONLY]		AS [ShipWholeOrderOnly],
    [COR_PHANTOM_QTY]				AS [PhantomQty],
    [COR_QTY_RECEIVED]				AS [QtyReceived],
    [COR_SM_CONTRACT]				AS [SMContract],
    [COR_WARRANTY_UNIQUE]			AS [WarrantyUnique],
    [COR_WARRANTY_FLAG]				AS [WarrantyFlag],
    [COR_SM_PROCESS_STATUS]			AS [SMProcessStatus],
    [COR_SALEINS]					AS [SaleIns],
    [COR_SALEINS_LINK]				AS [SaleInsLink],
    [COR_DUTY_FLAG]					AS [DutyFlag],
    [COR_ORIGIN]					AS [Origin],
    [COR_ORIGIN_REFERENCE]			AS [OriginReference],
    [COR_PO_SUB]					AS [POSub],
    [COR_LAST_PRICE]				AS [LastPrice],
    [COR_LAST_PRICE_PER]			AS [LastPricePer]
FROM 
	[ASC_PILOT].[dbo].[ASC_COR_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_PILOT_Parts]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[vw_ASC_PILOT_Parts] as
SELECT 
	[PMA_UNIQUE]						AS [ID],
    [PMA_SOURCE_IND]					AS [SourceID],
    [PMA_CREATED]						AS [CreatedOn],
    [PMA_UPDATED]						AS [ModifiedOn],
    [PMA_PART_ONLY]						AS [Part],
    [PMA_PART_REV]						AS [PartRev],
    [PMA_DESC]							AS [Description1],
    [PMA_DESC_1]						AS [Description2],
    [PMA_EXT]							AS [HasExtraText],
    [PMA_DRAWING]						AS [Drawing],
    [PMA_DRAWING_REV]					AS [DrawingRev],
    [PMA_PROC_CODE]						AS [ProcurementCode],
    [PMA_ABC_CODE]						AS [ABCCode],
    [PMA_WH]							AS [DefaultWarehouse],
    [PMA_BIN]							AS [DefaultBin],
    [PMA_UOM]							AS [UoM],
    [PMA_UOI]							AS [UoI],
    [PMA_UOO]							AS [UoO],
    [PMA_CONV_FACT]						AS [ConvFact],
    [PMA_CONV_FACT_1]					AS [ConvFact1],
    [PMA_PART_CODE]						AS [PartCode],
	[PMA_COST]							AS [RolledUpLabourCost],
    [PMA_COST_PER]						AS [LabourCostPer],
	[PMA_COST_MAT]						AS [MaterialCost],
    [PMA_COST_MAT_PER]					AS [MaterialCostPer],
    [PMA_SELL]							AS [SellingPrice],
    [PMA_SELL_PER]						AS [SellingPricePer],
    [PMA_MARGIN]						AS [Margin],
    [PMA_EFFECT_DATE_ON]				AS [StartDate],
    [PMA_MAN_LEAD]						AS [ManufacturingDays],
    [PMA_PUR_LEAD]						AS [PurchasingDays],
    [PMA_CRASH_LEAD]					AS [QuickestAssemblyDays],
    [PMA_EOQ]							AS [EOQ],
    [PMA_PRIME_SUP]						AS [PrimarySupplier],
    [PMA_SEC_SUP]						AS [SecondarySupplier],
    [PMA_MIN_ORDER]						AS [MinOrderQty],
    [PMA_MAX_ORDER]						AS [MaxOrderQty],
    [PMA_SAFETY]						AS [SafetyStockLevel],
    [PMA_MAX_STOCK]						AS [MaxStockLevel],
    [PMA_SHRINKAGE]						AS [ShrinkagePercent],
    [PMA_EFFECT_DATE_OFF]				AS [EndDate],
    [PMA_PHYSICAL]						AS [PhysicalStockLevel],
    [PMA_ORDERED]						AS [StockOnPOs],
    [PMA_ALLOCATED]						AS [StockOnKits],
    [PMA_DEMAND]						AS [Demand],
    [PMA_ON_SITE_QTY]					AS [StockRecievedNotAccepted],
    [PMA_USAGE_1]						AS [Usage1],
    [PMA_USAGE_2]						AS [Usage2],
    [PMA_MADE_IN_ORDERS]				AS [StockOnWOs],
    [PMA_CUST_ORDERS]					AS [OrderQuantity],
    [PMA_SUPPLIER_PART]					AS [PrimarySupPart],
    [PMA_LAST_PRICE_PER]				AS [LastPricePer],
    [PMA_LAST_UOO]						AS [LastUoO],
    [PMA_LABOUR_HOUR]					AS [LabourHours],
    [PMA_CUST_ALLOCS]					AS [StockAllocatedOnSOs],
    [PMA_VAT_IND]						AS [VATCode],
    [PMA_WAITING_INV]					AS [QuantityWaitingInvoice],
    [PMA_C_O_C_REQ]						AS [CoCRequired],
    [PMA_STOCK_USAGE1]					AS [StockUsage1],
	[PMA_STOCK_USAGE2]					AS [StockUsage2],
	[PMA_STOCK_USAGE3]					AS [StockUsage3],
	[PMA_STOCK_USAGE4]					AS [StockUsage4],
	[PMA_STOCK_USAGE5]					AS [StockUsage5],
	[PMA_STOCK_USAGE6]					AS [StockUsage6],
	[PMA_STOCK_USAGE7]					AS [StockUsage7],
	[PMA_STOCK_USAGE8]					AS [StockUsage8],
	[PMA_STOCK_USAGE9]					AS [StockUsage9],
	[PMA_STOCK_USAGE10]					AS [StockUsage10],
	[PMA_STOCK_USAGE11]					AS [StockUsage11],
	[PMA_STOCK_USAGE12]					AS [StockUsage12],
	[PMA_STOCK_USAGE13]					AS [StockUsage13],
	[PMA_HELD_ORDERED]					AS [HelOrders],
    [PMA_INSP_REQ]						AS [InspectionCode],
    [PMA_COST_CODE]						AS [CodeCode],
    [PMA_LAST_USED_DATE]				AS [LastIssued],
    [PMA_LAST_CHECK_DATE]				AS [LastChecked],
    [PMA_SALES_ACCOUNT]					AS [SalesAccountCode],
    [PMA_PURCH_ACCOUNT]					AS [PurchaseAccountCode],
    [PMA_OTHER_ACC_1]					AS [OtherAccountCode],
    [PMA_COMMODITY_CODE]				AS [CommodityCode],
    [PMA_ANAL_FIELD1]					AS [Analysis1],
    [PMA_ANAL_FIELD2]					AS [Analysis2],
    [PMA_ANAL_FIELD3]					AS [Analysis3],
    [PMA_ANAL_FIELD4]					AS [Analysis4],
    [PMA_ANAL_FIELD5]					AS [Analysis5],
    [PMA_ANAL_FIELD6]					AS [Analysis6],
    [PMA_ANAL_FIELD7]					AS [Analysis7],
    [PMA_ANAL_FIELD8]					AS [Analysis8],
    [PMA_ANAL_FIELD9]					AS [Analysis9],
    [PMA_ANAL_FIELD10]					AS [Analysis10],
    [PMA_SHELF_LIFE]					AS [ShelfLifeDays],
    [PMA_WEIGHT]						AS [Weight],
    [PMA_WEIGHT_PER]					AS [WeightPer],
    [PMA_CAPACITY]						AS [Capacity],
    [PMA_CAPACITY_PER]					AS [CapacityPer],
    [PMA_OTHER_FIELD]					AS [OtherField],
    [PMA_WEIGHT_UOM]					AS [WeightUoM],
    [PMA_CAPACITY_UOM]					AS [CapacityUoM],
    [PMA_AV_MATERIAL]					AS [AvgMatCost],
    [PMA_AV_MAT_PER]					AS [AvgMatCostPer],
    [PMA_AV_LABOUR]						AS [AvgLabourCost],
    [PMA_AV_LABOUR_PER]					AS [AvgLabourCostPer],
    [PMA_AV_SUB_C]						AS [AvgSubContCost],
    [PMA_AV_SUB_C_PER]					AS [AvgSubContCostPer],
    [PMA_AV_THIS_LABOUR]				AS [AvgThisLabour],
    [PMA_AV_THIS_LAB_PER]				AS [AvgThisLabourPer],
    [PMA_LAB_OHD_RATE]					AS [LabourOverheadRate],
    [PMA_MAT_OHD_RATE]					AS [MaterialOverheadRate],
    [PMA_PRODUCT_GROUP]					AS [ProductGroup],
	[PMA_LOT_GROUP]						AS [LotGroup],
    [PMA_WORKS_COST]					AS [WorksCost],
    [PMA_MAX_WHDISC]					AS [MaxWholeOrderDiscount],
    [PMA_ALT_PART_ONLY]					AS [AlternativePart],
    [PMA_ALT_PART_REV]					AS [AlternativePartRev],
    [PMA_ALT_PART_FACTOR]				AS [AlternativePartFactor],
    [PMA_OS_REASON_CODE]				AS [OutOfStockReasonCode],
    [PMA_PRICE_UOM]						AS [PricingUoM], 
    [PMA_SALES_UOM]						AS [SalesUoM],
    [PMA_NON_STOCK_ITEM]				AS [NonStockItem],
    [PMA_INCREMENT]						AS [Increment],
    [PMA_FOR_PART_ONLY]					AS [ForecasePart],
    [PMA_FOR_PART_REV]					AS [ForecastPartRev],
    [PMA_CREATE_MSC]					AS [CreateMastSchedule],
    [PMA_WEB_PART]						AS [WebPart],
    [PMA_CREATE_BTB_PO]					AS [CreateBTBPO],
    [PMA_ALLOC_TOLERANCE]				AS [AllocTolerance],
    [PMA_ALLOC_RULE_1]					AS [AllocRule1],
    [PMA_ALLOC_RULE_2]					AS [AllocRule2],
    [PMA_UOP]							AS [UoP],
    [PMA_CR_SHOP_SO_FULL]				AS [CRShopSOFull],
    [PMA_DUTY_CODE]						AS [DutyCode],
    [PMA_DUTYABLE_CONTENT]				AS [DutyableContent],
    [PMA_TIED_PART_ONLY]				AS [TiedPart],
    [PMA_TIED_PART_REV]					AS [TiedPartRev],
    [PMA_MIN_STOCK_DAYS]				AS [MinStockDays],
    [PMA_MIN_STOCK_USAGE_MONTHS]		AS [MonStockUsageMonths],
    [PMA_NO_PO_COST_UPDATE]				AS [NoPOCostUpdate],
    [PMA_USE_BATCH_LIFE_CYCLE_TRACKING]	AS [UseBatchLifecycleTracking],
    [PMA_ALLOW_BOM_IN_MRP]				AS [AllowBoMInMRP],
    [PMA_DESC_3]						AS [Description3],
    [PMA_PICK_WH]						AS [PickWarehouse],
    [PMA_PICK_BIN]						AS [PinkBin],
    [PMA_JBC_ACCOUNT]					AS [JBCAccount],
    [PMA_BAR_CODE]						AS [PartBardcode],
    [PMA_DEFAULT_LOT_QTY]				AS [DefaultLotQty],
    [PMA_OS_ECO]						AS [OSEco],
    [PMA_MIN_SELLING_PRICE]				AS [MinSellingPrice],
    [PMA_MIN_SELL_PER]					AS [MinSellingPricePer],
    [PMA_RRP]							AS [RRP],
    [PMA_RRP_PER]						AS [RRPPer],
    [PMA_ENFORCE_MIN_SELL]				AS [EnforceMinSellingPrice],
    [PMA_EAN_CODE]						AS [EANCode],
    [PMA_QTY_PER_PALLET]				AS [QuantityPerPallet],
    [PMA_PEG_OPTION]					AS [PEGOption],
    [PMA_APP_SALE]						AS [AppSale],
    [PMA_LONG_PART_NUMBER]				AS [LongPartNumber],
    [PMA_SO_INCREMENT]					AS [SOIncrement],
    [PMA_MIN_SO_QTY]					AS [MinSOQuantity],
    [PMA_RESTRICTED]					AS [Restricted],
    [PMA_REQ_PO_APPROVAL]				AS [ReqPOApproval],
    [PMA_MAT_BACKFLUSH]					AS [MaterialBackflush],
    [PMA_SEC_UOM]						AS [SecUoM],
    [PMA_SEC_ROUND]						AS [SecRound],
    [PMA_FULL_SHIP_ONLY]				AS [FullShipOnly],
    [PMA_PRO_RATA_PHANTOM]				AS [ProRataPhantom],
    [PMA_CREATE_BTB_WO]					AS [CreateBTBWO],
    [PMA_DELTA_PARTIAL_QTY]				AS [DeltaPartialQuantity],
    [PMA_WARRANTY_TRACKED]				AS [WarrantyTracked],
    [PMA_WARRANTY_TYPE]					AS [WarrantyType],
    [PMA_DELTA_HHT_ENABLED]				AS [DeltaHHTEnabled],
    [PMA_EXPIRY_DATE_VALIDATION]		AS [ExpiryDateValidation],
    [PMA_EXPIRY_DATE_TOLERANCE]			AS [ExpiryDateTolerance],
    [PMA_MRP_EXPIRY_DATE_CALC]			AS [MRPExpiryDateCalc],
    [PMA_CONSOLIDATION_DAYS]			AS [ConsolidationDays]
FROM 
	[ASC_PILOT].[dbo].[ASC_PMA_TBL] WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_ASC_PILOT_Picknotes]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vw_ASC_PILOT_Picknotes] as
SELECT
	[SPCK_UNIQUE] AS [ID],
	[SPCK_SOURCE_IND] AS [SourceID],
	[SPCK_CREATED] AS [CreatedOn],
	[SPCK_UPDATED] AS [ModifiedOn],
	[SPCK_NUMBER] AS [Number],
	[SPCK_COR_UNIQUE] AS [OrderID],
	[SPCK_PICK_LOCATION_WH] AS [PickWarehouse],
	[SPCK_PICK_LOCATION_BIN] AS [PickBin],
	[SPCK_BULK_LOCATION_WH] AS [BulkWarehouse],
	[SPCK_BULK_LOCATION_BIN] AS [BulkBin],
	[SPCK_QTY] AS [Quantity],
	[SPCK_QTY_CONFIRMED] AS [QuantityConfirmed],
	[SPCK_QTY_DESPATCHED] AS [QuantityDesptached],
	[SPCK_STATUS] AS [Status],
	[SPCK_SDSP_UNIQUE] AS [SDSPID],
	[SPCK_SCSG_UNIQUE] AS [SCSGID],
	[SPCK_ANAL_FIELD_1] AS [AnalysisField1],
	[SPCK_ANAL_FIELD_2] AS [AnalysisField2],
	[SPCK_ANAL_FIELD_3] AS [AnalysisField3],
	[SPCK_ANAL_FIELD_4] AS [AnalysisField4],
	[SPCK_ANAL_FIELD_5] AS [AnalysisField5],
	[SPCK_ANAL_FIELD_6] AS [AnalysisField6],
	[SPCK_ANAL_FIELD_7] AS [AnalysisField7],
	[SPCK_ANAL_FIELD_8] AS [AnalysisField8],
	[SPCK_ANAL_FIELD_9] AS [AnalysisField9],
	[SPCK_ANAL_FIELD_10] AS [AnalysisField10],
	[SPCK_USER_CREATED] AS [UserCreated],
	[SPCK_USER_UPDATED] AS [UserUpdated],
	[SPCK_GROSS_WEIGHT] AS [GrossWeight],
	[SPCK_NETT_WEIGHT] AS [NettWeight],
	[SPCK_USER_SLOT_NO] AS [UserSlot],
	[SPCK_FILTER] AS [Filter],
	[SPCK_SELECTED] AS [Selected]
FROM 
  		 		[ASC_PILOT].[dbo].[ASC_SO_PICKNOTE]	 WITH (NOLOCK)
GO
/****** Object:  View [dbo].[vw_GV_Companies]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from [GoldVision].[dbo].[DROPS]  order by SUMMARY
--select * from [GoldVision].[dbo].[DROPS_OPTIONS] where DR_ID = 'C1DBC21E-E131-4C6A-8E77-A3B50855B90C'


--select * from [GoldVision].[dbo].[ACCOUNTS] where AC_DELETED = 0

CREATE view [dbo].[vw_GV_Companies] as
SELECT 
	A.[AC_ID]			AS [ID],
	A.[CREATED_DATE]	AS [CreatedOn],
	A.[CREATED_BY]		AS [CreatedBy],
	A.[UPDATED_DATE]	AS [ModifiedOn],
	A.[UPDATED_BY]		AS [ModifiedBy],
	AG.[SUMMARY]		AS [SecurityGroup],
	A.[NAME]			AS [Name],
	A.[US_ID_SALES]		AS [AccountManager1],
	A.[US_ID_SUPPORT]	AS [AccountManager2],
	R.[SUMMARY]			AS [Relationship],
	I.[SUMMARY]			AS [IndustrySector],
	A.[ACC_ID_SALES]	AS [PrimaryContact],
	A.[ADDRESS_1]		AS [Address1],
	A.[ADDRESS_2]		AS [Address2],
	A.[ADDRESS_3]		AS [Address3],
	A.[TOWN]			AS [Town],
	A.[COUNTY]			AS [County],
	A.[POSTCODE]		AS [Postcode],
	A.[COUNTRY]			AS [Country],
	A.[PHONE_1]			AS [MainPhone],
	A.[FAX_1]			AS [MainFax],
	A.[WEB_SITE_1]		AS [Website],
	S.[SUMMARY]			AS [Source],
	A.[AC_UD1]			AS [HMRC_BondRef],
	A.[AC_UD1_DATE]		AS [HMRC_BondDate],
	A.[AC_UD1_NUMERIC]	AS [HMRC_BondVol],
	A.[AC_UD2]			AS [HMRC_DFSRef],
	A.[AC_UD2_DATE]		AS [HMRC_DFSDate],
	A.[AC_UD2_NUMERIC]	AS [HMRC_DFSVol],
	A.[AC_UD3]			AS [HMRC_TSDALicense],
	A.[AC_UD3_DATE]		AS [HMRC_TSDADate],
	A.[AC_UD3_NUMERIC]	AS [HMRC_TSDAVol],
	A.[AC_UD4]			AS [HMRC_IDALicense],
	A.[AC_UD4_DATE]		AS [HMRC_IDADate],
	A.[AC_UD4_NUMERIC]	AS [HMRC_IDAVol],
	A.[AC_UD5]			AS [HMRC_WHKeeperRef],
	A.[AC_UD5_DATE]		AS [HMRC_WHKeeperDate],
	A.[AC_UD6]			AS [HMRC_ExciseIDNo],
	A.[AC_UD6_DATE]		AS [HMRC_ExciseIDDate],
	ASup.[SUMMARY]		AS [Qual_ApprovedSupplier],
	A.[AC_UD9_DATE]		AS [Qual_ApprovedDate],
	A.[AC_UD10_DATE]	AS [Qual_ApproveRenewal],
	AM1.[SUMMARY]		AS [Qual_ApprovalMethod1],
	AM2.[SUMMARY]		AS [Qual_ApprovalMethod2],
	Rec1.[SUMMARY]		AS [Qual_Recall1],
	Rec2.[SUMMARY]		AS [Qual_Recall2],
	CMC.[SUMMARY]		AS [Qual_CMC],
	BCC.[SUMMARY]		AS [Qual_BCC],
	A.[AC_UD1_BIT]		AS [BB],
	A.[AC_UD2_BIT]		AS [BBInt],
	A.[AC_UD3_BIT]		AS [BD],
	A.[AC_UD4_BIT]		AS [BDInt],
	A.[AC_UD5_BIT]		AS [HD],
	A.[AC_UD6_BIT]		AS [HDInt],
	A.[AC_UD7_BIT]		AS [HSP],
	A.[AC_UD8_BIT]		AS [HSPInt],
	A.[AC_UD9_BIT]		AS [Duplicate],
	A.[AC_UD10_BIT]		AS [Kimia],
	A.[AC_DORMANT]		AS [Dormant],
	A.[EMAIL_DOMAINS]	AS [EmailDomains],
	A.[LINKEDIN_NAME]	AS [LinkedIn]

FROM
				[GoldVision].[dbo].[ACCOUNTS]			A
LEFT OUTER JOIN	[GoldVision].[dbo].[ACCOUNTS_GROUPS]	AG		ON	A.[ACG_ID]			= AG.[ACG_ID]
LEFT OUTER JOIN	[GoldVision].[dbo].[DROPS_OPTIONS]		R		ON	A.[TYPE_1]			= R.[DRO_ID]
																AND	R.[DR_ID]			= 'E14C73B1-BE41-42E4-9C16-51BCA940D165'
LEFT OUTER JOIN	[GoldVision].[dbo].[DROPS_OPTIONS]		I		ON	A.[TYPE_2]			= I.[DRO_ID]
																AND	I.[DR_ID]			= 'C1DBC21E-E131-4C6A-8E77-A3B50855B90C'
LEFT OUTER JOIN	[GoldVision].[dbo].[DROPS_OPTIONS]		S		ON	A.[SOURCE]			= S.[DRO_ID]
																AND	S.[DR_ID]			= '1193179D-8DE6-4701-9FFE-86A309EC2A23'
LEFT OUTER JOIN	[GoldVision].[dbo].[DROPS_OPTIONS]		ASup	ON	A.[AC_UD2_ID]		= ASup.[DRO_ID]
																AND	ASup.[DR_ID]		= '1DEBDA48-281C-476A-9568-626F520200C4'
LEFT OUTER JOIN	[GoldVision].[dbo].[DROPS_OPTIONS]		AM1		ON	A.[AC_UD1_ID]		= AM1.[DRO_ID]
																AND	AM1.[DR_ID]			= 'C96EFF05-BA34-47EA-8A05-532F822E8B2A'
LEFT OUTER JOIN	[GoldVision].[dbo].[DROPS_OPTIONS]		AM2		ON	A.[AC_UD1_ID]		= AM2.[DRO_ID]
																AND	AM2.[DR_ID]			= '56C4C7D3-A47E-4627-A766-D21D6F1BE637'
LEFT OUTER JOIN	[GoldVision].[dbo].[DROPS_OPTIONS]		Rec1	ON	A.[AC_UD4_ID]		= Rec1.[DRO_ID]
																AND	Rec1.[DR_ID]		= 'F5035820-198E-4870-B678-2C603055CBF7'
LEFT OUTER JOIN	[GoldVision].[dbo].[DROPS_OPTIONS]		Rec2	ON	A.[AC_UD5_ID]		= Rec2.[DRO_ID]
																AND	Rec2.[DR_ID]		= '01839A02-443B-4E84-9D00-EAA49F1F30FE'
LEFT OUTER JOIN	[GoldVision].[dbo].[DROPS_OPTIONS]		CMC		ON	A.[AC_UD6_ID]		= CMC.[DRO_ID]
																AND	CMC.[DR_ID]			= '82477998-22C3-4B01-A04A-B48D83A7C661'
LEFT OUTER JOIN	[GoldVision].[dbo].[DROPS_OPTIONS]		BCC		ON	A.[AC_UD7_ID]		= BCC.[DRO_ID]
																AND	BCC.[DR_ID]			= '06483593-2D1F-4880-A6E1-521E5946613F'
WHERE
	A.[AC_DELETED] = 0
GO
/****** Object:  View [dbo].[vw_GV_Correspondence]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select top 1 * from GoldVision.dbo.CORRESPONDENCE where year(date_sent) = 2019

--select * from GoldVision.dbo.ACCOUNTS where ac_id = '52d25c27-a6a8-4e97-964e-5ecd85f834ed'
--select * from GoldVision.dbo.ACCOUNTS_CONTACTS where acc_id = 'F7D58C2E-19C4-450C-9BF1-670248BFCAAF'
CREATE view [dbo].[vw_GV_Correspondence] as
SELECT
	C.[CO_ID]								AS [ID],
	C.[CO_REF]								AS [AccountID],
	CASE C.[PRIVATE]
		WHEN 0 THEN	C.[CO_ACC_ID]
		ELSE NULL
	END										AS [AccountContactID],
	CASE C.[PRIVATE]
		WHEN 0 THEN C.[DATE_SENT]
		ELSE CONVERT(DATE,C.[DATE_SENT])
	END										AS [SentOn],
	CASE C.[PRIVATE]
		WHEN 0 THEN	C.[RECIPIENT_ADDRESS]		
		ELSE ''								
	END										AS [To],
	CASE C.[PRIVATE]
		WHEN 0 THEN C.[SENDER_ADDRESS]
		ELSE ''
	END										AS [From],
	C.[PRIVATE]								AS [Private]
FROM 
	[GoldVision].[dbo].[CORRESPONDENCE] C
WHERE
	C.[CO_DELETED] = 0

GO
/****** Object:  View [dbo].[vw_MAT_Samples]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_MAT_Samples] as
select 
	[AuditNumber],
	[SampleCode],
	[AuditFlag],
	[BatchCode],
	[BatchPosition],
	[SampleStatus],
	[SubstanceCode],
	[SubstanceVersion],
	[SubmitterCode],
	[SubmitterVersion],
	[ResourceCode],
	[ResourceVersion],
	[RegisterDate],
	[RegisterTime],
	[RegisterUser],
	[ReceiveDate],
	[ReceiveTime],
	[ReceiveUser],
	[PreparedDate],
	[PreparedTime],
	[PreparedUser],
	[ApprovalDate],
	[ApprovalTime],
	[ApprovalUser],
	[ApprovalStatus],
	[ApprovalComment],
	[ReportedDate],
	[ReportedTime],
	[ReportedUser],
	[SampleText1],
	[SampleText2],
	[SampleText3],
	[SampleText4],
	[SampleText5],
	[SampleText6],
	[SampleText7],
	[SampleText8],
	[SampleText9],
	[SampleText10],
	[SampleText11],
	[SampleText12],
	[SampleText13],
	[SampleText14],
	[SampleText15],
	[SampleDate1],
	[SampleDate2],
	[SampleDate3],
	[SampleDate4],
	[SampleDate5],
	[SampleDate6],
	[SampleDate7],
	[SampleDate8],
	[SampleDate9],
	[SampleDate10],
	[SampleTime1],
	[SampleTime2],
	[SampleTime3],
	[SampleTime4],
	[SampleTime5],
	[SampleNum1],
	[SampleNum2],
	[SampleNum3],
	[SampleNum4],
	[SampleNum5],
	[SampleInt1],
	[SampleInt2],
	[SampleInt3],
	[SampleInt4],
	[SampleInt5],
	[ModifiedUser],
	[ModifiedTime],
	[ModifiedDate],
	[ModifiedReason],
	[ParentSampleCode],
	[AvailableDate],
	[TargetCompletionDate],
	[BookedCompletionDate],
	[RunsheetUnknownSampleCode],
	[RunsheetStandardSampleCode],
	[RunsheetQCParentSampleCode],
	[RunsheetUnknownTestCode],
	[RunsheetUnknownTestPosition],
	[RunsheetQCSampleType],
	[RunsheetQCSampleSubtype],
	[LocationName],
	[SamplePointName] 
from 
	[MATHGCDEVGROUP].[dbo].[Samples] WITH (NOLOCK)
GO
/****** Object:  Table [dbo].[Tb_AR_Audit]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_AR_Audit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[LnkARID] [int] NOT NULL,
	[ColumnName] [varchar](250) NOT NULL,
	[From_Value] [int] NULL,
	[From_Description] [varchar](max) NULL,
	[To_Value] [int] NULL,
	[To_Description] [varchar](max) NULL,
 CONSTRAINT [PK_Tb_AR_Audit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Arc_Log]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Arc_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkSessionID] [int] NOT NULL,
	[Path] [varchar](255) NOT NULL,
	[Size] [decimal](15, 2) NULL,
	[From] [datetime] NULL,
	[To] [datetime] NULL,
	[Success] [int] NULL,
	[Note] [varchar](1024) NULL,
 CONSTRAINT [PK_Tb_Arc_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Arc_Sessions]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Arc_Sessions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[FileCount] [int] NOT NULL,
	[TotalFileSize] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Tb_Arc_Sessions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ARs_Links]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_ARs_Links](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Item] [varchar](25) NOT NULL,
	[LnkARID] [int] NOT NULL,
	[LnkItemID] [int] NOT NULL,
 CONSTRAINT [PK_Tb_ARs_Links] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ARs_Users]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_ARs_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[LnkARID] [int] NOT NULL,
	[LnkUserID] [int] NOT NULL,
 CONSTRAINT [PK_Tb_ARs_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ASC_Licences2]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_ASC_Licences2](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DTS] [datetime] NOT NULL,
	[USER_ID] [nvarchar](50) NOT NULL,
	[USER_NAME] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tb_ASC_Licences2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ASCPPM_Imports]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_ASCPPM_Imports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkSessionID] [int] NOT NULL,
	[ExcelRowNo] [int] NOT NULL,
	[VEN_UNIQUE] [varchar](200) NULL,
	[VEN_PART_ONLY] [varchar](200) NULL,
	[VEN_CODE] [varchar](200) NULL,
	[VEN_MANUF] [varchar](200) NULL,
	[VEN_FROM_QTY] [varchar](200) NULL,
	[VEN_TO_QTY] [varchar](200) NULL,
	[VEN_FROM_DATE] [varchar](200) NULL,
	[VEN_TO_DATE] [varchar](200) NULL,
	[VEN_PART_CODE] [varchar](200) NULL,
	[VEN_PART_REF_ONLY] [varchar](200) NULL,
	[VEN_MANUF_PART_ONLY] [varchar](200) NULL,
	[VEN_NOTE] [varchar](200) NULL,
	[VEN_STATUS] [varchar](200) NULL,
	[VEN_PRICE] [varchar](200) NULL,
	[VEN_PRICE_PER] [varchar](200) NULL,
	[VEN_DISCOUNT] [varchar](200) NULL,
	[VEN_CURRENCY] [varchar](200) NULL,
	[VEN_OK] [varchar](200) NULL,
	[VEN_DATE_CREATED] [varchar](200) NULL,
	[VEN_DATE_AMENDED] [varchar](200) NULL,
	[VEN_UOM] [varchar](200) NULL,
	[VEN_RATING1] [varchar](200) NULL,
	[VEN_RATING2] [varchar](200) NULL,
	[VEN_RATING3] [varchar](200) NULL,
	[VEN_RATING4] [varchar](200) NULL,
	[VEN_RATING5] [varchar](200) NULL,
	[VEN_JOB] [varchar](200) NULL,
	[VEN_UOP] [varchar](200) NULL,
	[VEN_ANY_CURR_FLAG] [varchar](200) NULL,
	[VEN_LEAD] [varchar](200) NULL,
	[VEN_APPROVED] [varchar](200) NULL,
	[Status] [int] NOT NULL,
	[StatusInfo] [varchar](200) NULL,
 CONSTRAINT [PK_Tb_ASCPPM_Imports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ASCPPM_Sessions]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_ASCPPM_Sessions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Tb_ASCPPM_Sessions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_BU]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_BU](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkSessionID] [int] NOT NULL,
	[LnkStatusID] [int] NOT NULL,
	[Part] [varchar](16) NOT NULL,
	[SourceFile] [varchar](500) NOT NULL,
	[FileSize] [int] NOT NULL,
	[LnkDocID] [int] NULL,
	[SuccessfulReupload] [int] NOT NULL,
 CONSTRAINT [PK_Tb_BU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_BU_Sessions]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_BU_Sessions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkTypeID] [int] NOT NULL,
	[Finished] [bit] NOT NULL,
	[FinishedOn] [datetime] NULL,
 CONSTRAINT [PK_Tb_BU_Sessions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_BU_Status]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_BU_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ShortName] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](255) NULL,
 CONSTRAINT [PK_Tb_BU_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_BU_Types]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_BU_Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](255) NULL,
	[MaxSize] [int] NOT NULL,
	[MinHeight] [int] NOT NULL,
	[MinWidth] [int] NOT NULL,
	[MaxHeight] [int] NOT NULL,
	[MaxWidth] [int] NOT NULL,
	[EnforceSquare] [bit] NOT NULL,
	[FileName] [varchar](50) NOT NULL,
	[Overwrite] [bit] NOT NULL,
	[AllowBMPs] [bit] NOT NULL,
	[AllowDOCXs] [bit] NOT NULL,
	[AllowPDFs] [bit] NOT NULL,
	[AllowPNGs] [bit] NOT NULL,
	[AllowPPTXs] [bit] NOT NULL,
	[AllowJPGs] [bit] NOT NULL,
	[AllowTIFs] [bit] NOT NULL,
	[AllowXLSXs] [bit] NOT NULL,
	[CategoryType] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Tb_BU_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Cap_Import_Events]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Cap_Import_Events](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkFileID] [int] NOT NULL,
	[Item] [varchar](255) NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[Success] [bit] NOT NULL,
	[PIR_UNIQUE] [int] NULL,
	[ErrorCode] [int] NULL,
	[Error] [varchar](255) NULL,
	[Supplier] [varchar](10) NULL,
	[SupplierRef] [varchar](64) NULL,
	[Currency] [varchar](10) NULL,
	[Part] [varchar](10) NULL,
	[Order] [varchar](10) NULL,
	[Quantity] [decimal](15, 5) NULL,
	[QuantitySup] [decimal](15, 5) NULL,
	[Price] [decimal](15, 5) NULL,
	[Value] [decimal](15, 5) NULL,
	[VATCode] [varchar](10) NULL,
	[Event] [varchar](255) NULL,
 CONSTRAINT [PK_Tb_Cap_Import_Events] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Cap_Import_Events_Files]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Cap_Import_Events_Files](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[FilePath] [varchar](255) NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[FileDate] [date] NOT NULL,
	[LineCount] [int] NULL,
	[Processed] [datetime] NULL,
 CONSTRAINT [PK_Tb_Cap_Import_Events_Files] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_CoA_ProductsToMonographs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_CoA_ProductsToMonographs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkMonographID] [int] NOT NULL,
	[LnkProductID] [int] NOT NULL,
 CONSTRAINT [PK_Tb_CoA_ProductsToMonographs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_CoA_QuestionsToMonographs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_CoA_QuestionsToMonographs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkMonographID] [int] NOT NULL,
	[LnkQuestionID] [int] NOT NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_Tb_CoA_QuestionsToMonographs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Environments]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Environments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ShortName] [varchar](10) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Notes] [varchar](255) NULL,
	[ASC_DB_Server] [varchar](50) NULL,
	[ASC_DB_Instance] [varchar](50) NULL,
	[ASC_DB_Name] [varchar](50) NULL,
	[ASC_DB_User] [varchar](50) NOT NULL,
	[ASC_DB_Password] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Tb_Environments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ShortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Gold-Vision_COQuery]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Gold-Vision_COQuery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CO_ID] [uniqueidentifier] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Tb_Gold-Vision_COQuery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Gold-Vision_COQuery_Files]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Gold-Vision_COQuery_Files](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COA_ID] [uniqueidentifier] NOT NULL,
	[CO_ID] [uniqueidentifier] NOT NULL,
	[FileExists] [bit] NOT NULL,
	[FileSize(KB)] [decimal](15, 5) NOT NULL,
 CONSTRAINT [PK_Gold-Vision_COQuery_Files] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Gold-Vision_COQuery_Recip]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Gold-Vision_COQuery_Recip](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COR_ID] [uniqueidentifier] NOT NULL,
	[CO_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Gold-Vision_COQuery_Recip] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Gold-Vision_HostedDomains]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Gold-Vision_HostedDomains](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Domain] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_Tb_Job30_HostedDomains] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Gold-Vision_Links]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Gold-Vision_Links](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkUserID] [int] NOT NULL,
	[LnkUSERS_US_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Tb_Gold-Vision_Links] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_HICS_VersionInfo]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_HICS_VersionInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[TicketRef] [int] NULL,
	[Heading] [varchar](100) NOT NULL,
	[ReleaseNote] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_HICS_VersionInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_HoL]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_HoL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Who] [int] NOT NULL,
	[Guesses] [int] NOT NULL,
 CONSTRAINT [PK_Tb_HoL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Licencing]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Licencing](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkAssetID] [int] NOT NULL,
	[LnkDSVID] [int] NOT NULL,
	[Key] [varchar](255) NOT NULL,
	[Note] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_Licencing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Licencing_DSV]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Licencing_DSV](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Developer] [varchar](50) NOT NULL,
	[Software] [varchar](50) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Tb_Licencing_DSV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Log_Archive]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Log_Archive](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[SourceID] [int] NOT NULL,
	[SourceCreatedOn] [datetime] NOT NULL,
	[SourceCreatedBy] [int] NOT NULL,
	[Computer] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Environment] [varchar](50) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Process] [varchar](50) NOT NULL,
	[Message] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Tb_Log_Archive] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Messages]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Messages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[From] [int] NOT NULL,
	[To] [int] NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[Read] [datetime] NULL,
 CONSTRAINT [PK_Tb_Messages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Comparisons]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Mon_Comparisons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkTaskID] [int] NOT NULL,
	[Ref01] [varchar](max) NULL,
	[Ref02] [varchar](max) NULL,
	[Ref03] [varchar](max) NULL,
	[Ref04] [varchar](max) NULL,
	[Ref05] [varchar](max) NULL,
	[Ref06] [varchar](max) NULL,
	[Ref07] [varchar](max) NULL,
	[Ref08] [varchar](max) NULL,
	[Ref09] [varchar](max) NULL,
	[Ref10] [varchar](max) NULL,
 CONSTRAINT [PK_Tb_Mon_Comparisons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Email_Attachments]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Mon_Email_Attachments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkTaskID] [int] NOT NULL,
	[LnkRunID] [int] NOT NULL,
	[LnkEmailID] [int] NOT NULL,
	[File] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Tb_Mon_Email_Attachments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Email_Items]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Mon_Email_Items](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkTaskID] [int] NOT NULL,
	[LnkRunID] [int] NOT NULL,
	[LnkEmailID] [int] NOT NULL,
	[Ref] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Tb_Mon_Email_Items] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Emails]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Mon_Emails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkRunID] [int] NULL,
	[Profile] [varchar](255) NOT NULL,
	[To] [varchar](1024) NOT NULL,
	[CC] [varchar](1024) NOT NULL,
	[BCC] [varchar](1024) NOT NULL,
	[Subject] [varchar](255) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[ReadyToSend] [bit] NOT NULL,
	[Processed] [datetime] NULL,
 CONSTRAINT [PK_Tb_Mon_Emails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Runs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Mon_Runs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
	[Start] [datetime] NULL,
	[End] [datetime] NULL,
	[Status] [int] NOT NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Tb_Mon_Runs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Runs_Archive]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Mon_Runs_Archive](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[SourceID] [int] NOT NULL,
	[SourceCreatedOn] [datetime] NOT NULL,
	[SourceCreatedBy] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
	[Start] [datetime] NULL,
	[End] [datetime] NULL,
	[Status] [int] NOT NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Tb_Mon_Runs_Archive] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Tasks]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Mon_Tasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[SQLJobID] [uniqueidentifier] NOT NULL,
	[Comment] [varchar](512) NOT NULL,
	[To] [varchar](512) NOT NULL,
	[CC] [varchar](512) NOT NULL,
	[BCC] [varchar](512) NOT NULL,
	[LastRun] [datetime] NULL,
	[LastStatus] [int] NULL,
	[Runs] [int] NULL,
	[Emails] [int] NULL,
	[LastRunDuration] [decimal](15, 3) NULL,
	[AverageRunDuration] [decimal](15, 3) NULL,
 CONSTRAINT [PK_Tb_Mon_Tasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Usage]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Mon_Usage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Query] [varchar](max) NOT NULL,
	[Type] [varchar](50) NULL,
	[Duration] [decimal](15, 5) NULL,
 CONSTRAINT [PK_Tb_Mon_Usage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Permissions]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Permissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LnkUserID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Arc] [int] NOT NULL,
	[ArcR] [int] NOT NULL,
	[ASCAVTE] [int] NOT NULL,
	[ASCAVTV] [int] NOT NULL,
	[ASCBI] [int] NOT NULL,
	[ASCIM] [int] NOT NULL,
	[ASCIU] [int] NOT NULL,
	[COAA] [int] NOT NULL,
	[COAI] [int] NOT NULL,
	[COAI_L] [int] NOT NULL,
	[COAI_T] [int] NOT NULL,
	[COAI_V] [int] NOT NULL,
	[COAP] [int] NOT NULL,
	[COASR] [int] NOT NULL,
	[ITAR] [int] NOT NULL,
	[PPMA] [int] NOT NULL,
	[PPMR] [int] NOT NULL,
	[PPMI] [int] NOT NULL,
	[HICS_UM] [int] NOT NULL,
	[ITMon] [int] NOT NULL,
	[MSG] [int] NOT NULL,
	[ITUP] [int] NOT NULL,
	[ITS] [int] NOT NULL,
	[ASCDAR] [int] NOT NULL,
	[COAI_D] [int] NOT NULL,
	[ITSR] [int] NOT NULL,
	[CIE] [int] NOT NULL,
	[ASCWEDI] [int] NOT NULL,
	[ASCWEDI_Send] [int] NOT NULL,
	[ITARA] [int] NOT NULL,
	[SRV] [int] NOT NULL,
	[SRE] [int] NOT NULL,
	[SRA] [int] NOT NULL,
	[SRLTV] [int] NOT NULL,
	[SRLTN] [int] NOT NULL,
	[SRLTE] [int] NOT NULL,
	[ASCPPM] [int] NOT NULL,
	[ASCDOCS] [int] NOT NULL,
	[ASCPMV] [int] NOT NULL,
	[ASCPME] [int] NOT NULL,
	[ASCSBU] [int] NOT NULL,
	[ASCDOCS_BU] [int] NOT NULL,
	[POA] [int] NOT NULL,
	[POP] [int] NOT NULL,
	[ASCVU] [int] NOT NULL,
	[EPRA] [int] NOT NULL,
	[EPRI] [int] NOT NULL,
	[ARA] [int] NOT NULL,
	[ASCDOCS_BOT] [int] NOT NULL,
	[VCA] [int] NOT NULL,
 CONSTRAINT [PK_Tb_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PO_UsersToNominals]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PO_UsersToNominals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[LnkUSerID] [int] NOT NULL,
	[Nominal] [varchar](15) NOT NULL,
	[Description] [varchar](255) NULL,
 CONSTRAINT [PK_Tb_PO_UsersToNominals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_Files]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PPM_Files](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [int] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[TypeID2] [int] NOT NULL,
	[UploadedFrom] [varchar](255) NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[StoredAs] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Tb_PPM_Files] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_Groups]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PPM_Groups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Colour] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Tb_PPM_Groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_JobAssets]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PPM_JobAssets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[LnkJobID] [int] NOT NULL,
	[LnkAssetID] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Location] [varchar](255) NULL,
 CONSTRAINT [PK_Tb_PPM_JobAssets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_ScheduleJobs]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PPM_ScheduleJobs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[LnkGroupID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Location] [varchar](255) NOT NULL,
	[LnkJobID] [int] NOT NULL,
	[ReqDoc] [bit] NOT NULL,
	[Notes] [varchar](512) NULL,
	[OriginalSchedule] [datetime] NOT NULL,
	[Schedule] [datetime] NOT NULL,
	[Closed] [bit] NOT NULL,
	[ClosedOn] [datetime] NULL,
	[ClosedBy] [int] NULL,
 CONSTRAINT [PK_Tb_PPM_ScheduleJobs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_ScheduleTasks]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PPM_ScheduleTasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[LnkScheduleJobID] [int] NOT NULL,
	[LnkTaskID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[LnkJobAssetID] [int] NULL,
	[Position] [int] NOT NULL,
	[ReqDoc] [bit] NOT NULL,
	[Notes] [varchar](512) NULL,
	[Closed] [bit] NOT NULL,
	[ClosedOn] [datetime] NULL,
	[ClosedBy] [int] NULL,
 CONSTRAINT [PK_Tb_PPM_ScheduleTasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_Tasks]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PPM_Tasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[LnkJobID] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Position] [int] NOT NULL,
	[ReqDocOnComp] [bit] NOT NULL,
 CONSTRAINT [PK_Tb_PPM_Tasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_UsersToGroups]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_PPM_UsersToGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LnkUserID] [int] NOT NULL,
	[LnkGroupID] [int] NOT NULL,
 CONSTRAINT [PK_Tb_PPM_UserToGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SBI_Data]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SBI_Data](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkHeaderID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Year] [varchar](2) NOT NULL,
	[Customer] [varchar](10) NOT NULL,
	[Part] [varchar](16) NOT NULL,
	[P1Quantity] [decimal](15, 5) NOT NULL,
	[P1Value] [decimal](18, 5) NOT NULL,
	[P2Quantity] [decimal](15, 5) NOT NULL,
	[P2Value] [decimal](18, 5) NOT NULL,
	[P3Quantity] [decimal](15, 5) NOT NULL,
	[P3Value] [decimal](18, 5) NOT NULL,
	[P4Quantity] [decimal](15, 5) NOT NULL,
	[P4Value] [decimal](18, 5) NOT NULL,
	[P5Quantity] [decimal](15, 5) NOT NULL,
	[P5Value] [decimal](18, 5) NOT NULL,
	[P6Quantity] [decimal](15, 5) NOT NULL,
	[P6Value] [decimal](18, 5) NOT NULL,
	[P7Quantity] [decimal](15, 5) NOT NULL,
	[P7Value] [decimal](18, 5) NOT NULL,
	[P8Quantity] [decimal](15, 5) NOT NULL,
	[P8Value] [decimal](18, 5) NOT NULL,
	[P9Quantity] [decimal](15, 5) NOT NULL,
	[P9Value] [decimal](18, 5) NOT NULL,
	[P10Quantity] [decimal](15, 5) NOT NULL,
	[P10Value] [decimal](18, 5) NOT NULL,
	[P11Quantity] [decimal](15, 5) NOT NULL,
	[P11Value] [decimal](18, 5) NOT NULL,
	[P12Quantity] [decimal](15, 5) NOT NULL,
	[P12Value] [decimal](18, 5) NOT NULL,
	[P13Quantity] [decimal](15, 5) NOT NULL,
	[P13Value] [decimal](18, 5) NOT NULL,
	[Analysis1] [varchar](15) NOT NULL,
	[Analysis2] [varchar](15) NOT NULL,
	[Analysis3] [varchar](15) NOT NULL,
	[Analysis4] [varchar](15) NOT NULL,
	[Analysis5] [varchar](15) NOT NULL,
	[Analysis6] [varchar](15) NOT NULL,
	[Analysis7] [varchar](15) NOT NULL,
	[Analysis8] [varchar](15) NOT NULL,
	[Analysis9] [varchar](15) NOT NULL,
	[Analysis10] [varchar](15) NOT NULL,
	[SCUser] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tb_SBI_Data] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SBI_Header]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SBI_Header](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Stagged] [datetime] NULL,
	[Imported] [datetime] NULL,
 CONSTRAINT [PK_Tb_SBI_Header] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SC_Order_Audit_Monitor]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SC_Order_Audit_Monitor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[QuantityOrdered] [decimal](15, 5) NULL,
	[DeliveryDate] [datetime] NULL,
	[ReqdDespatchDate] [datetime] NULL,
	[Delivered] [datetime] NULL,
 CONSTRAINT [PK_Tb_SC_Order_Audit_Monitor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SC_Parts_Audit]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SC_Parts_Audit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Part] [varchar](35) NOT NULL,
	[Field] [varchar](255) NOT NULL,
	[From] [varchar](255) NOT NULL,
	[To] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Tb_SC_Parts_Audit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Audit]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SR_Audit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[SR] [int] NOT NULL,
	[Who] [int] NOT NULL,
	[Area] [varchar](100) NOT NULL,
	[Item_Value] [int] NULL,
	[Item_Description] [varchar](100) NOT NULL,
	[From_Value] [int] NULL,
	[From_Description] [varchar](max) NULL,
	[To_Value] [int] NULL,
	[To_Description] [varchar](max) NULL,
 CONSTRAINT [PK_Tb_SR_Audit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Test_Types]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SR_Test_Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Tb_SR_Test_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_TypeLinks]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_SR_TypeLinks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[Type] [int] NOT NULL,
	[ParentID] [int] NOT NULL,
 CONSTRAINT [PK_Tb_SR_TypeLinks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_VC_States]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_VC_States](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LnkValveID] [int] NOT NULL,
	[State] [bit] NOT NULL,
	[Source] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Tb_VC_States] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_VI_Data]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_VI_Data](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[LnkHeaderID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[LnkID] [int] NULL,
	[ProdGrp] [nvarchar](255) NOT NULL,
	[StdCost] [money] NOT NULL,
	[ActCost1] [money] NOT NULL,
	[ActCost2] [money] NOT NULL,
	[ActCost3] [money] NOT NULL,
	[ActCost4] [money] NOT NULL,
	[ActCost5] [money] NOT NULL,
	[ActCost6] [money] NOT NULL,
	[ActCost7] [money] NOT NULL,
	[ActCost8] [money] NOT NULL,
	[ActCost9] [money] NOT NULL,
	[ActCost10] [money] NOT NULL,
	[ActCost11] [money] NOT NULL,
	[ActCost12] [money] NOT NULL,
 CONSTRAINT [PK_Tb_VI_Data] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_VI_Header]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_VI_Header](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Stagged] [datetime] NULL,
	[Imported] [datetime] NULL,
 CONSTRAINT [PK_Tb_VI_Header] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tb_Addresses] ADD  CONSTRAINT [DF_Tb_Addresses_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Addresses] ADD  CONSTRAINT [DF_Tb_Addresses_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Addresses] ADD  CONSTRAINT [DF_Tb_Addresses_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Addresses] ADD  CONSTRAINT [DF_Tb_Addresses_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Addresses] ADD  CONSTRAINT [DF_Tb_Addresses_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_Addresses] ADD  CONSTRAINT [DF_Tb_Addresses_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_LnkLocationID]  DEFAULT ((0)) FOR [LnkLocationID]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_LnkBSMID]  DEFAULT ((0)) FOR [LnkBSMID]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_LnkSupplierID]  DEFAULT ((0)) FOR [LnkSupplierID]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_Cost]  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_Dell_ESC]  DEFAULT ('') FOR [Dell_ESC]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_Dell_PPID]  DEFAULT ('') FOR [Dell_PPID]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_Dell_ST]  DEFAULT ('') FOR [Dell_ST]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_EID]  DEFAULT ('') FOR [EID]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_HasDongle]  DEFAULT ((0)) FOR [HasDongle]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_IMEI]  DEFAULT ('') FOR [IMEI_1]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_IMEI_2]  DEFAULT ('') FOR [IMEI_2]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_LabelPrinter]  DEFAULT ((0)) FOR [LabelPrinter]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_MAC]  DEFAULT ('') FOR [MAC]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_ModelRef]  DEFAULT ('') FOR [ModelRef]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_LnkOSID]  DEFAULT ((0)) FOR [LnkOSID]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_PrinterName]  DEFAULT ('') FOR [PrinterName]
GO
ALTER TABLE [dbo].[Tb_AR] ADD  CONSTRAINT [DF_Tb_AR_LnkSIMID]  DEFAULT ((0)) FOR [LnkSIMID]
GO
ALTER TABLE [dbo].[Tb_AR_Audit] ADD  CONSTRAINT [DF_Tb_AR_Audit_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_AR_Audit] ADD  CONSTRAINT [DF_Tb_AR_Audit_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_AR_Audit] ADD  CONSTRAINT [DF_Tb_AR_Audit_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_AR_Audit] ADD  CONSTRAINT [DF_Tb_AR_Audit_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_AR_Audit] ADD  CONSTRAINT [DF_Tb_AR_Audit_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_Dell_ESC]  DEFAULT ((0)) FOR [Show_Dell_ESC]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_Dell_PPID]  DEFAULT ((0)) FOR [Show_Dell_PPID]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_Dell_ST]  DEFAULT ((0)) FOR [Show_Dell_ST]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_EID]  DEFAULT ((0)) FOR [Show_EID]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_HasDongle]  DEFAULT ((0)) FOR [Show_HasDongle]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_IMEI_1]  DEFAULT ((0)) FOR [Show_IMEI_1]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_IMEI_2]  DEFAULT ((0)) FOR [Show_IMEI_2]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_LabelPrinter]  DEFAULT ((0)) FOR [Show_LabelPrinter]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_MAC]  DEFAULT ((0)) FOR [Show_MAC]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_ModelRef]  DEFAULT ((0)) FOR [Show_ModelRef]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_Name]  DEFAULT ((0)) FOR [Show_Name]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_OS]  DEFAULT ((0)) FOR [Show_OS]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_PrinterName]  DEFAULT ((0)) FOR [Show_PrinterName]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Show_SIM]  DEFAULT ((0)) FOR [Show_SIM]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Tool_ADDisabled]  DEFAULT ((0)) FOR [Tool_ADDisabled]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Tool_C$Share]  DEFAULT ((0)) FOR [Tool_C$Share]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Tool_OnlineStatus]  DEFAULT ((0)) FOR [Tool_OnlineStatus]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Tool_DellSupport]  DEFAULT ((0)) FOR [Tool_DellSupport]
GO
ALTER TABLE [dbo].[Tb_AR_BSMs] ADD  CONSTRAINT [DF_Tb_AR_BSMs_Tool_Website]  DEFAULT ((0)) FOR [Tool_Website]
GO
ALTER TABLE [dbo].[Tb_AR_BSMTypes] ADD  CONSTRAINT [DF_Tb_AR_BSMTypes_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_AR_BSMTypes] ADD  CONSTRAINT [DF_Tb_AR_BSMTypes_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_AR_BSMTypes] ADD  CONSTRAINT [DF_Tb_AR_BSMTypes_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_AR_BSMTypes] ADD  CONSTRAINT [DF_Tb_AR_BSMTypes_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_AR_BSMTypes] ADD  CONSTRAINT [DF_Tb_AR_BSMTypes_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_AR_BSMTypes] ADD  CONSTRAINT [DF_Tb_AR_BSMTypes_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_AR_Shares] ADD  CONSTRAINT [DF_Tb_AR_Shares_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_AR_Shares] ADD  CONSTRAINT [DF_Tb_AR_Shares_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_AR_Shares] ADD  CONSTRAINT [DF_Tb_AR_Shares_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_AR_Statuses] ADD  CONSTRAINT [DF_Tb_AR_Statuses_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_AR_Statuses] ADD  CONSTRAINT [DF_Tb_AR_Statuses_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_AR_Statuses] ADD  CONSTRAINT [DF_Tb_AR_Statuses_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_AR_Statuses] ADD  CONSTRAINT [DF_Tb_AR_Statuses_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_AR_Statuses] ADD  CONSTRAINT [DF_Tb_AR_Statuses_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_AR_Statuses] ADD  CONSTRAINT [DF_Tb_AR_Statuses_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_AR_Suppliers] ADD  CONSTRAINT [DF_Tb_AR_Suppliers_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_AR_Suppliers] ADD  CONSTRAINT [DF_Tb_AR_Suppliers_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_AR_Suppliers] ADD  CONSTRAINT [DF_Tb_AR_Suppliers_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_AR_Suppliers] ADD  CONSTRAINT [DF_Tb_AR_Suppliers_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_AR_Suppliers] ADD  CONSTRAINT [DF_Tb_AR_Suppliers_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_AR_Suppliers] ADD  CONSTRAINT [DF_Tb_AR_Suppliers_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_AR_Suppliers] ADD  CONSTRAINT [DF_Tb_AR_Suppliers_SCSupID]  DEFAULT ('') FOR [SCSupRef]
GO
ALTER TABLE [dbo].[Tb_Arc_Log] ADD  CONSTRAINT [DF_Tb_Arc_Log_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Arc_Log] ADD  CONSTRAINT [DF_Tb_Arc_Log_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Arc_Log] ADD  CONSTRAINT [DF_Tb_Arc_Log_LnkSessionID]  DEFAULT ((0)) FOR [LnkSessionID]
GO
ALTER TABLE [dbo].[Tb_Arc_Log] ADD  CONSTRAINT [DF_Tb_Arc_Log_Path]  DEFAULT ('') FOR [Path]
GO
ALTER TABLE [dbo].[Tb_Arc_Sessions] ADD  CONSTRAINT [DF_Tb_Arc_Sessions_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Arc_Sessions] ADD  CONSTRAINT [DF_Tb_Arc_Sessions_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Arc_Sessions] ADD  CONSTRAINT [DF_Tb_Arc_Sessions_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Arc_Sessions] ADD  CONSTRAINT [DF_Tb_Arc_Sessions_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Arc_Sessions] ADD  CONSTRAINT [DF_Tb_Arc_Sessions_FileCount]  DEFAULT ((0)) FOR [FileCount]
GO
ALTER TABLE [dbo].[Tb_Arc_Sessions] ADD  CONSTRAINT [DF_Tb_Arc_Sessions_TotalFileSize]  DEFAULT ((0)) FOR [TotalFileSize]
GO
ALTER TABLE [dbo].[Tb_ARs] ADD  CONSTRAINT [DF_Tb_ARs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_ARs] ADD  CONSTRAINT [DF_Tb_ARs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_ARs] ADD  CONSTRAINT [DF_Tb_ARs_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_ARs] ADD  CONSTRAINT [DF_Tb_ARs_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_ARs] ADD  CONSTRAINT [DF_Tb_ARs_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_ARs] ADD  CONSTRAINT [DF_Tb_ARs_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_ARs_Links] ADD  CONSTRAINT [DF_Tb_ARs_Links_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_ARs_Links] ADD  CONSTRAINT [DF_Tb_ARs_Links_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_ARs_Links] ADD  CONSTRAINT [DF_Tb_ARs_Links_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_ARs_Links] ADD  CONSTRAINT [DF_Tb_ARs_Links_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_ARs_Links] ADD  CONSTRAINT [DF_Tb_ARs_Links_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_ARs_Users] ADD  CONSTRAINT [DF_Tb_ARs_Users_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_ARs_Users] ADD  CONSTRAINT [DF_Tb_ARs_Users_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_ARs_Users] ADD  CONSTRAINT [DF_Tb_ARs_Users_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_ARs_Users] ADD  CONSTRAINT [DF_Tb_ARs_Users_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_ARs_Users] ADD  CONSTRAINT [DF_Tb_ARs_Users_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_ASCPPM_Imports] ADD  CONSTRAINT [DF_Tb_ASCPPM_Imports_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_ASCPPM_Imports] ADD  CONSTRAINT [DF_Tb_ASCPPM_Imports_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_ASCPPM_Imports] ADD  CONSTRAINT [DF_Tb_ASCPPM_Imports_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Tb_ASCPPM_Sessions] ADD  CONSTRAINT [DF_Tb_ASCPPM_Sessions_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_ASCPPM_Sessions] ADD  CONSTRAINT [DF_Tb_ASCPPM_Sessions_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_BU] ADD  CONSTRAINT [DF_Tb_BU_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_BU] ADD  CONSTRAINT [DF_Tb_BU_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_BU] ADD  CONSTRAINT [DF_Tb_BU_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_BU] ADD  CONSTRAINT [DF_Tb_BU_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_BU] ADD  CONSTRAINT [DF_Tb_BU_LnkStatusID]  DEFAULT ((0)) FOR [LnkStatusID]
GO
ALTER TABLE [dbo].[Tb_BU] ADD  CONSTRAINT [DF_Tb_BU_FileSize]  DEFAULT ((0)) FOR [FileSize]
GO
ALTER TABLE [dbo].[Tb_BU] ADD  CONSTRAINT [DF_Tb_BU_SuccessfullyReupload]  DEFAULT ((0)) FOR [SuccessfulReupload]
GO
ALTER TABLE [dbo].[Tb_BU_Sessions] ADD  CONSTRAINT [DF_Tb_BU_Sessions_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_BU_Sessions] ADD  CONSTRAINT [DF_Tb_BU_Sessions_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_BU_Sessions] ADD  CONSTRAINT [DF_Tb_BU_Sessions_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_BU_Sessions] ADD  CONSTRAINT [DF_Tb_BU_Sessions_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_BU_Sessions] ADD  CONSTRAINT [DF_Tb_BU_Sessions_Finished]  DEFAULT ((0)) FOR [Finished]
GO
ALTER TABLE [dbo].[Tb_BU_Status] ADD  CONSTRAINT [DF_Tb_BU_Status_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_BU_Status] ADD  CONSTRAINT [DF_Tb_BU_Status_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_BU_Status] ADD  CONSTRAINT [DF_Tb_BU_Status_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_BU_Status] ADD  CONSTRAINT [DF_Tb_BU_Status_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_BU_Status] ADD  CONSTRAINT [DF_Tb_BU_Status_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_BU_Status] ADD  CONSTRAINT [DF_Tb_BU_Status_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_MaxSize]  DEFAULT ((5)) FOR [MaxSize]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_MinHeight]  DEFAULT ((0)) FOR [MinHeight]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_MinWidth]  DEFAULT ((0)) FOR [MinWidth]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_MaxHeight]  DEFAULT ((0)) FOR [MaxHeight]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_MaxWidth]  DEFAULT ((0)) FOR [MaxWidth]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_EnforceSquare]  DEFAULT ((0)) FOR [EnforceSquare]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_FileName]  DEFAULT ('') FOR [FileName]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_Overwrite]  DEFAULT ((0)) FOR [Overwrite]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_AllowBMPs]  DEFAULT ((0)) FOR [AllowBMPs]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_AllowDOCXs]  DEFAULT ((0)) FOR [AllowDOCXs]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_AllowPDFs]  DEFAULT ((1)) FOR [AllowPDFs]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_AllowPNGs]  DEFAULT ((0)) FOR [AllowPNGs]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_AllowPPTXs]  DEFAULT ((0)) FOR [AllowPPTXs]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_AllowJPGs]  DEFAULT ((0)) FOR [AllowJPGs]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_AllowTIFs]  DEFAULT ((0)) FOR [AllowTIFs]
GO
ALTER TABLE [dbo].[Tb_BU_Types] ADD  CONSTRAINT [DF_Tb_BU_Types_AllowXLSXs]  DEFAULT ((0)) FOR [AllowXLSXs]
GO
ALTER TABLE [dbo].[Tb_Cap_Import] ADD  CONSTRAINT [DF_Tb_Cap_Import_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Cap_Import] ADD  CONSTRAINT [DF_Tb_Cap_Import_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Cap_Import] ADD  CONSTRAINT [DF_Tb_Cap_Import_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Cap_Import] ADD  CONSTRAINT [DF_Tb_Cap_Import_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Cap_Import_Events] ADD  CONSTRAINT [DF_Tb_Cap_Import_Events_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Cap_Import_Events] ADD  CONSTRAINT [DF_Tb_Cap_Import_Events_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Cap_Import_Events_Files] ADD  CONSTRAINT [DF_Tb_Cap_Import_Events_Files_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Cap_Import_Events_Files] ADD  CONSTRAINT [DF_Tb_Cap_Import_Events_Files_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Cap_Import_Events_Files] ADD  CONSTRAINT [DF_Tb_Cap_Import_Events_Files_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Cap_Import_Events_Files] ADD  CONSTRAINT [DF_Tb_Cap_Import_Events_Files_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_Generations] ADD  CONSTRAINT [DF_Tb_CoA_Generations_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_Generations] ADD  CONSTRAINT [DF_Tb_CoA_Generations_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_Monographs] ADD  CONSTRAINT [DF_Tb_CoA_Monographs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_Monographs] ADD  CONSTRAINT [DF_Tb_CoA_Monographs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_Monographs] ADD  CONSTRAINT [DF_Tb_CoA_Monographs_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_Monographs] ADD  CONSTRAINT [DF_Tb_CoA_Monographs_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_Monographs] ADD  CONSTRAINT [DF_Tb_CoA_Monographs_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_CoA_Monographs] ADD  CONSTRAINT [DF_Tb_CoA_Monographs_Version]  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[Tb_CoA_Monographs] ADD  CONSTRAINT [DF_Tb_CoA_Monographs_Name]  DEFAULT ('New Monograph') FOR [Name]
GO
ALTER TABLE [dbo].[Tb_CoA_Monographs] ADD  CONSTRAINT [DF_Tb_CoA_Monographs_ShortName]  DEFAULT ('NewMono') FOR [ShortName]
GO
ALTER TABLE [dbo].[Tb_CoA_Monographs] ADD  CONSTRAINT [DF_Tb_CoA_Monographs_TimesUsed]  DEFAULT ((0)) FOR [TimesUsed]
GO
ALTER TABLE [dbo].[Tb_CoA_Monographs] ADD  CONSTRAINT [DF_Tb_CoA_Monographs_DontShowPL]  DEFAULT ((1)) FOR [DontShowPL]
GO
ALTER TABLE [dbo].[Tb_CoA_PartMaps] ADD  CONSTRAINT [DF_Tb_CoA_PartMaps_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_PartMaps] ADD  CONSTRAINT [DF_Tb_CoA_PartMaps_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_PartMaps] ADD  CONSTRAINT [DF_Tb_CoA_PartMaps_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_PartMaps] ADD  CONSTRAINT [DF_Tb_CoA_PartMaps_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_PartMaps_Naming] ADD  CONSTRAINT [DF_Tb_CoA_PartMaps_Naming_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_PartMaps_Naming] ADD  CONSTRAINT [DF_Tb_CoA_PartMaps_Naming_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_PartMaps_Naming] ADD  CONSTRAINT [DF_Tb_CoA_PartMaps_Naming_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_PartMaps_Naming] ADD  CONSTRAINT [DF_Tb_CoA_PartMaps_Naming_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_PartMaps_Naming] ADD  CONSTRAINT [DF_Tb_CoA_PartMaps_Naming_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_CoA_PrintMaps] ADD  CONSTRAINT [DF_Tb_CoA_PrintMaps_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_PrintMaps] ADD  CONSTRAINT [DF_Tb_CoA_PrintMaps_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_PrintMaps] ADD  CONSTRAINT [DF_Tb_CoA_PrintMaps_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_CoA_ProductsToMonographs] ADD  CONSTRAINT [DF_Tb_CoA_ProductsToMonographs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_ProductsToMonographs] ADD  CONSTRAINT [DF_Tb_CoA_ProductsToMonographs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_ProductsToMonographs] ADD  CONSTRAINT [DF_Tb_CoA_ProductsToMonographs_LnkMonographID]  DEFAULT ((0)) FOR [LnkMonographID]
GO
ALTER TABLE [dbo].[Tb_CoA_ProductsToMonographs] ADD  CONSTRAINT [DF_Tb_CoA_ProductsToMonographs_LnkProductID]  DEFAULT ((0)) FOR [LnkProductID]
GO
ALTER TABLE [dbo].[Tb_CoA_Questions] ADD  CONSTRAINT [DF_Tb_CoA_Questions_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_Questions] ADD  CONSTRAINT [DF_Tb_CoA_Questions_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_Questions] ADD  CONSTRAINT [DF_Tb_CoA_Questions_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_Questions] ADD  CONSTRAINT [DF_Tb_CoA_Questions_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_Questions] ADD  CONSTRAINT [DF_Tb_CoA_Questions_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_CoA_Questions] ADD  CONSTRAINT [DF_Tb_CoA_Questions_Name]  DEFAULT ('New Question') FOR [Name]
GO
ALTER TABLE [dbo].[Tb_CoA_Questions] ADD  CONSTRAINT [DF_Tb_CoA_Questions_Specification]  DEFAULT ('New Question') FOR [Specification]
GO
ALTER TABLE [dbo].[Tb_CoA_Questions] ADD  CONSTRAINT [DF_Tb_CoA_Questions_Encoded]  DEFAULT ('FR') FOR [Encoded]
GO
ALTER TABLE [dbo].[Tb_CoA_Questions] ADD  CONSTRAINT [DF_Tb_CoA_Questions_Redundant]  DEFAULT ((0)) FOR [Redundant]
GO
ALTER TABLE [dbo].[Tb_CoA_QuestionsToMonographs] ADD  CONSTRAINT [DF_Tb_CoA_QuestionsToMonographs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_QuestionsToMonographs] ADD  CONSTRAINT [DF_Tb_CoA_QuestionsToMonographs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_QuestionsToMonographs] ADD  CONSTRAINT [DF_Tb_CoA_QuestionsToMonographs_LnkMonographID]  DEFAULT ((0)) FOR [LnkMonographID]
GO
ALTER TABLE [dbo].[Tb_CoA_QuestionsToMonographs] ADD  CONSTRAINT [DF_Tb_CoA_QuestionsToMonographs_LnkQuestionID]  DEFAULT ((0)) FOR [LnkQuestionID]
GO
ALTER TABLE [dbo].[Tb_CoA_QuestionsToMonographs] ADD  CONSTRAINT [DF_Tb_CoA_QuestionsToMonographs_Position]  DEFAULT ((0)) FOR [Position]
GO
ALTER TABLE [dbo].[Tb_CoA_TestAnswers] ADD  CONSTRAINT [DF_Tb_CoA_TestAnswers_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_TestAnswers] ADD  CONSTRAINT [DF_Tb_CoA_TestAnswers_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_TestAnswers] ADD  CONSTRAINT [DF_Tb_CoA_TestAnswers_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_TestAnswers] ADD  CONSTRAINT [DF_Tb_CoA_TestAnswers_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_TestAnswers] ADD  CONSTRAINT [DF_Tb_CoA_TestAnswers_Passed]  DEFAULT ((0)) FOR [Passed]
GO
ALTER TABLE [dbo].[Tb_CoA_Tests] ADD  CONSTRAINT [DF_Tb_CoA_Tests_New_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_Tests] ADD  CONSTRAINT [DF_Tb_CoA_Tests_New_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_Tests] ADD  CONSTRAINT [DF_Tb_CoA_Tests_New_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_CoA_Tests] ADD  CONSTRAINT [DF_Tb_CoA_Tests_New_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_CoA_Tests] ADD  CONSTRAINT [DF_Tb_CoA_Tests_New_SampleDate]  DEFAULT (getdate()) FOR [SampleDate]
GO
ALTER TABLE [dbo].[Tb_Config] ADD  CONSTRAINT [DF_Tb_Config_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Config] ADD  CONSTRAINT [DF_Tb_Config_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Config] ADD  CONSTRAINT [DF_Tb_Config_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Config] ADD  CONSTRAINT [DF_Tb_Config_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Countries] ADD  CONSTRAINT [DF_Tb_Countries_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Countries] ADD  CONSTRAINT [DF_Tb_Countries_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Countries] ADD  CONSTRAINT [DF_Tb_Countries_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Countries] ADD  CONSTRAINT [DF_Tb_Countries_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Countries] ADD  CONSTRAINT [DF_Tb_Countries_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_Countries] ADD  CONSTRAINT [DF_Tb_Countries_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_Environments] ADD  CONSTRAINT [DF_Tb_Environments_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Environments] ADD  CONSTRAINT [DF_Tb_Environments_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Environments] ADD  CONSTRAINT [DF_Tb_Environments_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Environments] ADD  CONSTRAINT [DF_Tb_Environments_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Environments] ADD  CONSTRAINT [DF_Tb_Environments_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_Environments] ADD  CONSTRAINT [DF_Tb_Environments_ASC_DB_User]  DEFAULT ('') FOR [ASC_DB_User]
GO
ALTER TABLE [dbo].[Tb_Environments] ADD  CONSTRAINT [DF_Tb_Environments_ASC_DB_Password]  DEFAULT ('') FOR [ASC_DB_Password]
GO
ALTER TABLE [dbo].[Tb_EPR_Categories] ADD  CONSTRAINT [DF_Tb_EPR_Categories_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_EPR_Categories] ADD  CONSTRAINT [DF_Tb_EPR_Categories_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_EPR_Categories] ADD  CONSTRAINT [DF_Tb_EPR_Categories_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_EPR_Categories] ADD  CONSTRAINT [DF_Tb_EPR_Categories_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_EPR_Categories] ADD  CONSTRAINT [DF_Tb_EPR_Categories_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_EPR_Categories] ADD  CONSTRAINT [DF_Tb_EPR_Categories_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_EPR_PackagingTypes] ADD  CONSTRAINT [DF_Tb_EPR_PackagingTypes_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_EPR_PackagingTypes] ADD  CONSTRAINT [DF_Tb_EPR_PackagingTypes_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_EPR_PackagingTypes] ADD  CONSTRAINT [DF_Tb_EPR_PackagingTypes_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_EPR_PackagingTypes] ADD  CONSTRAINT [DF_Tb_EPR_PackagingTypes_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_EPR_PackagingTypes] ADD  CONSTRAINT [DF_Tb_EPR_PackagingTypes_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_EPR_PackagingTypes] ADD  CONSTRAINT [DF_Tb_EPR_PackagingTypes_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_Weight]  DEFAULT ((0)) FOR [Weight]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_RecycledContent]  DEFAULT ((0)) FOR [RecycledContent]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_PackagingForImportedGoods]  DEFAULT ((0)) FOR [PackagingForImportedGoods]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_SiteWaste]  DEFAULT ((0)) FOR [SiteWaste]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_PreviouslyUsedMaterial]  DEFAULT ((0)) FOR [PreviouslyUsedMaterial]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_MadeFromRecycled]  DEFAULT ((0)) FOR [MadeFromRecycled]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_Recyclable]  DEFAULT ((0)) FOR [Recyclable]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_Biodegradable]  DEFAULT ((0)) FOR [Biodegradable]
GO
ALTER TABLE [dbo].[Tb_EPRs] ADD  CONSTRAINT [DF_Tb_EPRs_Reusable]  DEFAULT ((0)) FOR [Reusable]
GO
ALTER TABLE [dbo].[Tb_Gold-Vision_HostedDomains] ADD  CONSTRAINT [DF_Tb_Job30_HostedDomains_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Gold-Vision_HostedDomains] ADD  CONSTRAINT [DF_Tb_Job30_HostedDomains_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Gold-Vision_HostedDomains] ADD  CONSTRAINT [DF_Tb_Job30_HostedDomains_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Gold-Vision_HostedDomains] ADD  CONSTRAINT [DF_Tb_Job30_HostedDomains_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Gold-Vision_Links] ADD  CONSTRAINT [DF_Tb_Gold-Vision_Links_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Gold-Vision_Links] ADD  CONSTRAINT [DF_Tb_Gold-Vision_Links_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Gold-Vision_Links] ADD  CONSTRAINT [DF_Tb_Gold-Vision_Links_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Gold-Vision_Links] ADD  CONSTRAINT [DF_Tb_Gold-Vision_Links_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Gold-Vision_Links] ADD  CONSTRAINT [DF_Tb_Gold-Vision_Links_LnkUserID]  DEFAULT ((0)) FOR [LnkUserID]
GO
ALTER TABLE [dbo].[Tb_HICS_VersionInfo] ADD  CONSTRAINT [DF_Tb_HICS_VersionInfo_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_HICS_VersionInfo] ADD  CONSTRAINT [DF_Tb_HICS_VersionInfo_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_HoL] ADD  CONSTRAINT [DF_Tb_Hol_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Licencing] ADD  CONSTRAINT [DF_Tb_Licencing_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Licencing] ADD  CONSTRAINT [DF_Tb_Licencing_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Licencing] ADD  CONSTRAINT [DF_Tb_Licencing_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Licencing] ADD  CONSTRAINT [DF_Tb_Licencing_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Licencing_DSV] ADD  CONSTRAINT [DF_Tb_Licencing_DSV_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Licencing_DSV] ADD  CONSTRAINT [DF_Tb_Licencing_DSV_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Licencing_DSV] ADD  CONSTRAINT [DF_Tb_Licencing_DSV_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Licencing_DSV] ADD  CONSTRAINT [DF_Tb_Licencing_DSV_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Licencing_DSV] ADD  CONSTRAINT [DF_Tb_Licencing_DSV_Version]  DEFAULT ('') FOR [Version]
GO
ALTER TABLE [dbo].[Tb_Licencing_DSV] ADD  CONSTRAINT [DF_Tb_Licencing_DSV_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_Locations] ADD  CONSTRAINT [DF_Tb_Locations_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Locations] ADD  CONSTRAINT [DF_Tb_Locations_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Locations] ADD  CONSTRAINT [DF_Tb_Locations_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Locations] ADD  CONSTRAINT [DF_Tb_Locations_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Locations] ADD  CONSTRAINT [DF_Tb_Locations_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_Locations] ADD  CONSTRAINT [DF_Tb_Locations_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_Locations] ADD  CONSTRAINT [DF_Tb_Locations_ParentID]  DEFAULT ((0)) FOR [ParentID]
GO
ALTER TABLE [dbo].[Tb_Log] ADD  CONSTRAINT [DF_Tb_Log_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Log] ADD  CONSTRAINT [DF_Tb_Log_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Log] ADD  CONSTRAINT [DF_Tb_Log_Source]  DEFAULT ('') FOR [Source]
GO
ALTER TABLE [dbo].[Tb_Log_Archive] ADD  CONSTRAINT [DF_Tb_Log_Archive_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Log_Archive] ADD  CONSTRAINT [DF_Tb_Log_Archive_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Log_Archive] ADD  CONSTRAINT [DF_Tb_Log_Archive_Source]  DEFAULT ('') FOR [Source]
GO
ALTER TABLE [dbo].[Tb_Messages] ADD  CONSTRAINT [DF_Tb_messages_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Messages] ADD  CONSTRAINT [DF_Tb_messages_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Comparisons] ADD  CONSTRAINT [DF_Tb_Mon_Comparisons_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Mon_Comparisons] ADD  CONSTRAINT [DF_Tb_Mon_Comparisons_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Email_Attachments] ADD  CONSTRAINT [DF_Tb_Mon_Email_Attachments_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Mon_Email_Attachments] ADD  CONSTRAINT [DF_Tb_Mon_Email_Attachments_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Email_Items] ADD  CONSTRAINT [DF_Tb_Mon_Email_Items_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Mon_Email_Items] ADD  CONSTRAINT [DF_Tb_Mon_Email_Items_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_Profile]  DEFAULT ('Default') FOR [Profile]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_To]  DEFAULT ('support@hgcompany.co.uk') FOR [To]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_CC]  DEFAULT ('') FOR [CC]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_BCC]  DEFAULT ('') FOR [BCC]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_Subject]  DEFAULT ('') FOR [Subject]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_Body]  DEFAULT ('<p>Message content missing</p>') FOR [Body]
GO
ALTER TABLE [dbo].[Tb_Mon_Emails] ADD  CONSTRAINT [DF_Tb_Mon_Emails_ReadyToSend]  DEFAULT ((1)) FOR [ReadyToSend]
GO
ALTER TABLE [dbo].[Tb_Mon_Runs] ADD  CONSTRAINT [DF_Tb_Mon_Runs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Mon_Runs] ADD  CONSTRAINT [DF_Tb_Mon_Runs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Runs] ADD  CONSTRAINT [DF_Tb_Mon_Runs_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Tb_Mon_Runs] ADD  CONSTRAINT [DF_Tb_Mon_Runs_AgentID]  DEFAULT ((0)) FOR [AgentID]
GO
ALTER TABLE [dbo].[Tb_Mon_Runs_Archive] ADD  CONSTRAINT [DF_Tb_Mon_Runs_Archive_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Mon_Runs_Archive] ADD  CONSTRAINT [DF_Tb_Mon_Runs_Archive_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Runs_Archive] ADD  CONSTRAINT [DF_Tb_Mon_Runs_Archive_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Tb_Mon_Runs_Archive] ADD  CONSTRAINT [DF_Tb_Mon_Runs_Archive_AgentID]  DEFAULT ((0)) FOR [AgentID]
GO
ALTER TABLE [dbo].[Tb_Mon_Tasks] ADD  CONSTRAINT [DF_Tb_Mon_Tasks_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Mon_Tasks] ADD  CONSTRAINT [DF_Tb_Mon_Tasks_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Tasks] ADD  CONSTRAINT [DF_Tb_Mon_Tasks_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Mon_Tasks] ADD  CONSTRAINT [DF_Tb_Mon_Tasks_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Tasks] ADD  CONSTRAINT [DF_Tb_Mon_Tasks_Comment]  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [dbo].[Tb_Mon_Tasks] ADD  CONSTRAINT [DF_Tb_Mon_Tasks_To]  DEFAULT ('') FOR [To]
GO
ALTER TABLE [dbo].[Tb_Mon_Tasks] ADD  CONSTRAINT [DF_Tb_Mon_Tasks_CC]  DEFAULT ('') FOR [CC]
GO
ALTER TABLE [dbo].[Tb_Mon_Tasks] ADD  CONSTRAINT [DF_Tb_Mon_Tasks_BCC]  DEFAULT ('') FOR [BCC]
GO
ALTER TABLE [dbo].[Tb_Mon_Usage] ADD  CONSTRAINT [DF_Tb_Mon_Usage_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Mon_Usage] ADD  CONSTRAINT [DF_Tb_Mon_Usage_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Mon_Usage] ADD  CONSTRAINT [DF_Tb_Mon_Usage_Duration]  DEFAULT ((0)) FOR [Duration]
GO
ALTER TABLE [dbo].[Tb_OSs] ADD  CONSTRAINT [DF_Tb_OSs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_OSs] ADD  CONSTRAINT [DF_Tb_OSs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_OSs] ADD  CONSTRAINT [DF_Tb_OSs_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_OSs] ADD  CONSTRAINT [DF_Tb_OSs_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_OSs] ADD  CONSTRAINT [DF_Tb_OSs_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_OSs] ADD  CONSTRAINT [DF_Tb_OSs_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_Arc]  DEFAULT ((0)) FOR [Arc]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ArcR]  DEFAULT ((0)) FOR [ArcR]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCAVTE]  DEFAULT ((0)) FOR [ASCAVTE]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCAVTV]  DEFAULT ((0)) FOR [ASCAVTV]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCBI]  DEFAULT ((0)) FOR [ASCBI]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCIM]  DEFAULT ((1)) FOR [ASCIM]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCIU]  DEFAULT ((0)) FOR [ASCIU]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_CoAA]  DEFAULT ((0)) FOR [COAA]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_CoAI]  DEFAULT ((0)) FOR [COAI]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_COAI_L]  DEFAULT ((0)) FOR [COAI_L]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_COAI_T]  DEFAULT ((0)) FOR [COAI_T]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_COAI_V]  DEFAULT ((0)) FOR [COAI_V]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_CoAP]  DEFAULT ((0)) FOR [COAP]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_COASR]  DEFAULT ((0)) FOR [COASR]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ITAR]  DEFAULT ((0)) FOR [ITAR]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_PPMA_EG]  DEFAULT ((0)) FOR [PPMA]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_PPMA_JT]  DEFAULT ((0)) FOR [PPMR]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_PPMI]  DEFAULT ((0)) FOR [PPMI]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_HICSS]  DEFAULT ((0)) FOR [HICS_UM]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ITMon]  DEFAULT ((0)) FOR [ITMon]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_MSG]  DEFAULT ((0)) FOR [MSG]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ITUP]  DEFAULT ((0)) FOR [ITUP]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ITS]  DEFAULT ((0)) FOR [ITS]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCDAR]  DEFAULT ((0)) FOR [ASCDAR]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_COAI_D]  DEFAULT ((0)) FOR [COAI_D]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ITSR]  DEFAULT ((0)) FOR [ITSR]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_CIE]  DEFAULT ((0)) FOR [CIE]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCWEDI]  DEFAULT ((0)) FOR [ASCWEDI]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCWEDI_Send]  DEFAULT ((0)) FOR [ASCWEDI_Send]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ITARA]  DEFAULT ((0)) FOR [ITARA]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_SRV]  DEFAULT ((0)) FOR [SRV]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_SRE]  DEFAULT ((0)) FOR [SRE]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_SRT]  DEFAULT ((0)) FOR [SRA]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_SRLTV]  DEFAULT ((0)) FOR [SRLTV]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_SRLTN]  DEFAULT ((0)) FOR [SRLTN]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_SRLTE]  DEFAULT ((0)) FOR [SRLTE]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCPPM]  DEFAULT ((0)) FOR [ASCPPM]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCDOCS]  DEFAULT ((0)) FOR [ASCDOCS]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCPM]  DEFAULT ((0)) FOR [ASCPMV]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCPME]  DEFAULT ((0)) FOR [ASCPME]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCSBU]  DEFAULT ((0)) FOR [ASCSBU]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCDOCS_BU]  DEFAULT ((0)) FOR [ASCDOCS_BU]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_POA]  DEFAULT ((0)) FOR [POA]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_POP]  DEFAULT ((0)) FOR [POP]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCVU]  DEFAULT ((0)) FOR [ASCVU]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_EPRA]  DEFAULT ((0)) FOR [EPRA]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_EPRI]  DEFAULT ((0)) FOR [EPRI]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_HICS_AL]  DEFAULT ((0)) FOR [ARA]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_ASCDOCS_BOT]  DEFAULT ((0)) FOR [ASCDOCS_BOT]
GO
ALTER TABLE [dbo].[Tb_Permissions] ADD  CONSTRAINT [DF_Tb_Permissions_VCA]  DEFAULT ((0)) FOR [VCA]
GO
ALTER TABLE [dbo].[Tb_PO_UsersToNominals] ADD  CONSTRAINT [DF_Tb_PO_UsersToNominals_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_PO_UsersToNominals] ADD  CONSTRAINT [DF_Tb_PO_UsersToNominals_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_PO_UsersToNominals] ADD  CONSTRAINT [DF_Tb_PO_UsersToNominals_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_PO_UsersToNominals] ADD  CONSTRAINT [DF_Tb_PO_UsersToNominals_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_PO_UsersToNominals] ADD  CONSTRAINT [DF_Tb_PO_UsersToNominals_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_PPM_Files] ADD  CONSTRAINT [DF_Tb_PPM_Files_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_Files] ADD  CONSTRAINT [DF_Tb_PPM_Files_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_Files] ADD  CONSTRAINT [DF_Tb_PPM_Files_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_Files] ADD  CONSTRAINT [DF_Tb_PPM_Files_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_Files] ADD  CONSTRAINT [DF_Tb_PPM_Files_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_PPM_Files] ADD  CONSTRAINT [DF_Tb_PPM_Files_DeletedBy]  DEFAULT ((0)) FOR [DeletedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_Files] ADD  CONSTRAINT [DF_Tb_PPM_Files_TypeID2]  DEFAULT ((0)) FOR [TypeID2]
GO
ALTER TABLE [dbo].[Tb_PPM_Groups] ADD  CONSTRAINT [DF_Tb_PPM_Groups_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_Groups] ADD  CONSTRAINT [DF_Tb_PPM_Groups_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_Groups] ADD  CONSTRAINT [DF_Tb_PPM_Groups_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_Groups] ADD  CONSTRAINT [DF_Tb_PPM_Groups_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_Groups] ADD  CONSTRAINT [DF_Tb_PPM_Groups_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_PPM_Groups] ADD  CONSTRAINT [DF_Tb_PPM_Groups_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_PPM_Groups] ADD  CONSTRAINT [DF_Tb_PPM_Groups_Name]  DEFAULT ('New Group') FOR [Name]
GO
ALTER TABLE [dbo].[Tb_PPM_Groups] ADD  CONSTRAINT [DF_Tb_PPM_Groups_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Tb_PPM_Groups] ADD  CONSTRAINT [DF_Tb_PPM_Groups_Colour]  DEFAULT ('') FOR [Colour]
GO
ALTER TABLE [dbo].[Tb_PPM_JobAssets] ADD  CONSTRAINT [DF_Tb_PPM_JobAssets_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_JobAssets] ADD  CONSTRAINT [DF_Tb_PPM_JobAssets_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_JobAssets] ADD  CONSTRAINT [DF_Tb_PPM_JobAssets_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_JobAssets] ADD  CONSTRAINT [DF_Tb_PPM_JobAssets_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_JobAssets] ADD  CONSTRAINT [DF_Tb_PPM_JobAssets_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_PPM_JobAssets] ADD  CONSTRAINT [DF_Tb_PPM_JobAssets_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_Name]  DEFAULT ('New Job') FOR [Name]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_Freq]  DEFAULT ((2)) FOR [Freq]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_FreqValue]  DEFAULT ((1)) FOR [FreqValue]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Tb_PPM_Jobs] ADD  CONSTRAINT [DF_Tb_PPM_Jobs_ReqDocOnComp]  DEFAULT ((0)) FOR [ReqDocOnComp]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleJobs] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleJobs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleJobs] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleJobs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleJobs] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleJobs_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleJobs] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleJobs_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleJobs] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleJobs_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleJobs] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleJobs_ReqDoc]  DEFAULT ((0)) FOR [ReqDoc]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleJobs] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleJobs_Closed]  DEFAULT ((0)) FOR [Closed]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleTasks] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleTasks_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleTasks] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleTasks_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleTasks] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleTasks_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleTasks] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleTasks_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleTasks] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleTasks_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleTasks] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleTasks_ReqDoc]  DEFAULT ((0)) FOR [ReqDoc]
GO
ALTER TABLE [dbo].[Tb_PPM_ScheduleTasks] ADD  CONSTRAINT [DF_Tb_PPM_ScheduleTasks_Closed]  DEFAULT ((0)) FOR [Closed]
GO
ALTER TABLE [dbo].[Tb_PPM_Tasks] ADD  CONSTRAINT [DF_Tb_PPM_Tasks_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_Tasks] ADD  CONSTRAINT [DF_Tb_PPM_Tasks_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_Tasks] ADD  CONSTRAINT [DF_Tb_PPM_Tasks_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_Tasks] ADD  CONSTRAINT [DF_Tb_PPM_Tasks_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_Tasks] ADD  CONSTRAINT [DF_Tb_PPM_Tasks_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_PPM_Tasks] ADD  CONSTRAINT [DF_Tb_PPM_Tasks_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_PPM_Tasks] ADD  CONSTRAINT [DF_Tb_PPM_Tasks_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Tb_PPM_Tasks] ADD  CONSTRAINT [DF_Tb_PPM_Tasks_Name]  DEFAULT ('New Task') FOR [Name]
GO
ALTER TABLE [dbo].[Tb_PPM_Tasks] ADD  CONSTRAINT [DF_Tb_PPM_Tasks_Position]  DEFAULT ((0)) FOR [Position]
GO
ALTER TABLE [dbo].[Tb_PPM_Tasks] ADD  CONSTRAINT [DF_Tb_PPM_Tasks_ReqDocOnComp]  DEFAULT ((0)) FOR [ReqDocOnComp]
GO
ALTER TABLE [dbo].[Tb_PPM_UsersToGroups] ADD  CONSTRAINT [DF_Tb_PPM_UsersToGroups_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_PPM_UsersToGroups] ADD  CONSTRAINT [DF_Tb_PPM_UsersToGroups_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_PPM_UsersToGroups] ADD  CONSTRAINT [DF_Tb_PPM_UsersToGroups_LnkUserID]  DEFAULT ((0)) FOR [LnkUserID]
GO
ALTER TABLE [dbo].[Tb_PPM_UsersToGroups] ADD  CONSTRAINT [DF_Tb_PPM_UsersToGroups_LnkGroupID]  DEFAULT ((0)) FOR [LnkGroupID]
GO
ALTER TABLE [dbo].[Tb_PrinterLog] ADD  CONSTRAINT [DF_Tb_PrinterLog_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_PrinterLog] ADD  CONSTRAINT [DF_Tb_PrinterLog_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_PrinterLog] ADD  CONSTRAINT [DF_Tb_PrinterLog_Pages]  DEFAULT ((0)) FOR [Pages]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P1Quantity]  DEFAULT ((0)) FOR [P1Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P1Value]  DEFAULT ((0)) FOR [P1Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P2Quantity]  DEFAULT ((0)) FOR [P2Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P2Value]  DEFAULT ((0)) FOR [P2Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P3Quantity]  DEFAULT ((0)) FOR [P3Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P3Value]  DEFAULT ((0)) FOR [P3Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P4Quantity]  DEFAULT ((0)) FOR [P4Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P4Value]  DEFAULT ((0)) FOR [P4Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P5Quantity]  DEFAULT ((0)) FOR [P5Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P5Value]  DEFAULT ((0)) FOR [P5Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P6Quantity]  DEFAULT ((0)) FOR [P6Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P6Value]  DEFAULT ((0)) FOR [P6Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P7Quantity]  DEFAULT ((0)) FOR [P7Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P7Value]  DEFAULT ((0)) FOR [P7Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P8Quantity]  DEFAULT ((0)) FOR [P8Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P8Value]  DEFAULT ((0)) FOR [P8Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P9Quantity]  DEFAULT ((0)) FOR [P9Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P9Value]  DEFAULT ((0)) FOR [P9Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P10Quantity]  DEFAULT ((0)) FOR [P10Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P10Value]  DEFAULT ((0)) FOR [P10Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P11Quantity]  DEFAULT ((0)) FOR [P11Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P11Value]  DEFAULT ((0)) FOR [P11Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P12Quantity]  DEFAULT ((0)) FOR [P12Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P12Value]  DEFAULT ((0)) FOR [P12Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P13Quantity]  DEFAULT ((0)) FOR [P13Quantity]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_P13Value]  DEFAULT ((0)) FOR [P13Value]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_Analysis1]  DEFAULT ('') FOR [Analysis1]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_Analysis2]  DEFAULT ('') FOR [Analysis2]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_Analysis3]  DEFAULT ('') FOR [Analysis3]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_Analysis4]  DEFAULT ('') FOR [Analysis4]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_Analysis5]  DEFAULT ('') FOR [Analysis5]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_Analysis6]  DEFAULT ('') FOR [Analysis6]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_Analysis7]  DEFAULT ('') FOR [Analysis7]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_Analysis8]  DEFAULT ('') FOR [Analysis8]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_Analysis9]  DEFAULT ('') FOR [Analysis9]
GO
ALTER TABLE [dbo].[Tb_SBI_Data] ADD  CONSTRAINT [DF_Tb_SBI_Data_Analysis10]  DEFAULT ('') FOR [Analysis10]
GO
ALTER TABLE [dbo].[Tb_SBI_Header] ADD  CONSTRAINT [DF_Tb_SBI_Header_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SBI_Header] ADD  CONSTRAINT [DF_Tb_SBI_Header_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SBI_Header] ADD  CONSTRAINT [DF_Tb_SBI_Header_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SBI_Header] ADD  CONSTRAINT [DF_Tb_SBI_Header_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SC_Order_Audit] ADD  CONSTRAINT [DF_Tb_SC_Order_Audit_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SC_Order_Audit] ADD  CONSTRAINT [DF_Tb_SC_Order_Audit_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SC_Order_Audit] ADD  CONSTRAINT [DF_Tb_SC_Order_Audit_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SC_Order_Audit] ADD  CONSTRAINT [DF_Tb_SC_Order_Audit_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SC_Order_Audit] ADD  CONSTRAINT [DF_Tb_SC_Order_Audit_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Tb_SC_Order_Audit_Monitor] ADD  CONSTRAINT [DF_Tb_SC_Order_Audit_Monitor_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SC_Order_Audit_Monitor] ADD  CONSTRAINT [DF_Tb_SC_Order_Audit_Monitor_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SC_Order_Audit_Monitor] ADD  CONSTRAINT [DF_Tb_SC_Order_Audit_Monitor_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SC_Order_Audit_Monitor] ADD  CONSTRAINT [DF_Tb_SC_Order_Audit_Monitor_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SC_Parts] ADD  CONSTRAINT [DF_Tb_SC_Parts_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SC_Parts] ADD  CONSTRAINT [DF_Tb_SC_Parts_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SC_Parts] ADD  CONSTRAINT [DF_Tb_SC_Parts_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SC_Parts] ADD  CONSTRAINT [DF_Tb_SC_Parts_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SC_Parts] ADD  CONSTRAINT [DF_Tb_SC_Parts_PrintedLotNumberPosition]  DEFAULT ('') FOR [PrintedLotNumberPosition]
GO
ALTER TABLE [dbo].[Tb_SC_Parts_Audit] ADD  CONSTRAINT [DF_Tb_SC_Parts_Audit_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SC_Parts_Audit] ADD  CONSTRAINT [DF_Tb_SC_Parts_Audit_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SC_Parts_Audit] ADD  CONSTRAINT [DF_Tb_SC_Parts_Audit_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SC_Parts_Audit] ADD  CONSTRAINT [DF_Tb_SC_Parts_Audit_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SIMs] ADD  CONSTRAINT [DF_Tb_SIMs_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SIMs] ADD  CONSTRAINT [DF_Tb_SIMs_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SIMs] ADD  CONSTRAINT [DF_Tb_SIMs_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SIMs] ADD  CONSTRAINT [DF_Tb_SIMs_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SIMs] ADD  CONSTRAINT [DF_Tb_SIMs_Dell_Mobile]  DEFAULT ('') FOR [Mobile]
GO
ALTER TABLE [dbo].[Tb_SIMs] ADD  CONSTRAINT [DF_Tb_SIMs_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_SIMs] ADD  CONSTRAINT [DF_Tb_SIMs_Note]  DEFAULT ('') FOR [Note]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_Cancelled]  DEFAULT ((0)) FOR [Cancelled]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_Closed]  DEFAULT ((0)) FOR [Closed]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_Sample]  DEFAULT ((1)) FOR [Sample]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_Level1]  DEFAULT ((0)) FOR [Level1]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_Level2]  DEFAULT ((0)) FOR [Level2]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_Level3]  DEFAULT ((0)) FOR [Level3]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_Level4]  DEFAULT ((0)) FOR [Level4]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_Level5]  DEFAULT ((0)) FOR [Level5]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_Comment]  DEFAULT ('') FOR [Comment]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_DerivativeOf]  DEFAULT ((0)) FOR [DerivativeOf]
GO
ALTER TABLE [dbo].[Tb_SR] ADD  CONSTRAINT [DF_Tb_SR_SuperceededBy]  DEFAULT ((0)) FOR [SupersededBy]
GO
ALTER TABLE [dbo].[Tb_SR_Audit] ADD  CONSTRAINT [DF_Tb_SR_Audit_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Audit] ADD  CONSTRAINT [DF_Tb_SR_Audit_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SR_List_Items] ADD  CONSTRAINT [DF_Tb_SR_List_Items_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SR_List_Items] ADD  CONSTRAINT [DF_Tb_SR_List_Items_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Lists] ADD  CONSTRAINT [DF_Tb_SR_Lists_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Lists] ADD  CONSTRAINT [DF_Tb_SR_Lists_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Lists] ADD  CONSTRAINT [DF_Tb_SR_Lists_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Lists] ADD  CONSTRAINT [DF_Tb_SR_Lists_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Lists] ADD  CONSTRAINT [DF_Tb_SR_Lists_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_SR_Lists] ADD  CONSTRAINT [DF_Tb_SR_Lists_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_SR_Nosings] ADD  CONSTRAINT [DF_Tb_SR_Nosings_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Nosings] ADD  CONSTRAINT [DF_Tb_SR_Nosings_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Results] ADD  CONSTRAINT [DF_Tb_SR_Test_Results_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Results] ADD  CONSTRAINT [DF_Tb_SR_Test_Results_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Results] ADD  CONSTRAINT [DF_Tb_SR_Test_Results_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Results] ADD  CONSTRAINT [DF_Tb_SR_Test_Results_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Results] ADD  CONSTRAINT [DF_Tb_SR_Test_Results_Who]  DEFAULT ((0)) FOR [Who]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Types] ADD  CONSTRAINT [DF_Tb_SR_Test_Types_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Types] ADD  CONSTRAINT [DF_Tb_SR_Test_Types_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Types] ADD  CONSTRAINT [DF_Tb_SR_Test_Types_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Types] ADD  CONSTRAINT [DF_Tb_SR_Test_Types_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Types] ADD  CONSTRAINT [DF_Tb_SR_Test_Types_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_SR_Test_Types] ADD  CONSTRAINT [DF_Tb_SR_Test_Types_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_SR_Tests] ADD  CONSTRAINT [DF_Tb_SR_Tests_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Tests] ADD  CONSTRAINT [DF_Tb_SR_Tests_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Tests] ADD  CONSTRAINT [DF_Tb_SR_Tests_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Tests] ADD  CONSTRAINT [DF_Tb_SR_Tests_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Tests] ADD  CONSTRAINT [DF_Tb_SR_Tests_AcceptedViaMatrix]  DEFAULT ((0)) FOR [AcceptedViaMatrix]
GO
ALTER TABLE [dbo].[Tb_SR_TypeLinks] ADD  CONSTRAINT [DF_Tb_SR_TypeLinks_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SR_TypeLinks] ADD  CONSTRAINT [DF_Tb_SR_TypeLinks_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SR_TypeLinks] ADD  CONSTRAINT [DF_Tb_SR_TypeLinks_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_AppendNumber]  DEFAULT ((1)) FOR [AppendNumber]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_SourceVAT]  DEFAULT ((0)) FOR [SourceVAT]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_SourceCUS]  DEFAULT ((0)) FOR [SourceCUS]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_SourceSUP]  DEFAULT ((0)) FOR [SourceSUP]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_SourceWO]  DEFAULT ((0)) FOR [SourceWO]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_DestinationVAT]  DEFAULT ((0)) FOR [DestinationVAT]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_DestinationCUS]  DEFAULT ((0)) FOR [DestinationCUS]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_DestinationSUP]  DEFAULT ((0)) FOR [DestinationSUP]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_DestinationWO]  DEFAULT ((0)) FOR [DestinationWO]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_ReqTesting]  DEFAULT ((1)) FOR [ReqTesting]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_CanSupersede]  DEFAULT ((1)) FOR [CanSupersede]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_IncrementSerialNumber]  DEFAULT ((0)) FOR [IncrementSerialNumber]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_GMP]  DEFAULT ((0)) FOR [GMP]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_AdditionalRef]  DEFAULT ((0)) FOR [AdditionalRef]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_SourcePO]  DEFAULT ((0)) FOR [SourcePO]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_DestinationPO]  DEFAULT ((0)) FOR [DestinationPO]
GO
ALTER TABLE [dbo].[Tb_SR_Types] ADD  CONSTRAINT [DF_Tb_SR_Types_Version]  DEFAULT ((1)) FOR [Version]
GO
ALTER TABLE [dbo].[Tb_SupplyChain_Links] ADD  CONSTRAINT [DF_Tb_SupplyChain_Links_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_SupplyChain_Links] ADD  CONSTRAINT [DF_Tb_SupplyChain_Links_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_SupplyChain_Links] ADD  CONSTRAINT [DF_Tb_SupplyChain_Links_LnkUserID]  DEFAULT ((0)) FOR [LnkUserID]
GO
ALTER TABLE [dbo].[Tb_SupplyChain_Links] ADD  CONSTRAINT [DF_Tb_SupplyChain_Links_LnkSYS_PEOPLE_PP_CODE]  DEFAULT ('') FOR [LnkSYS_PEOPLE_PP_CODE]
GO
ALTER TABLE [dbo].[Tb_TransportData] ADD  CONSTRAINT [DF_Tb_TransportData_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_TransportData] ADD  CONSTRAINT [DF_Tb_TransportData_Filename]  DEFAULT ('') FOR [Filename]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_Locked]  DEFAULT ((0)) FOR [Locked]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_OpenedCount]  DEFAULT ((0)) FOR [OpenedCount]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_Forenames]  DEFAULT ('Unknown') FOR [Forenames]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_Surname]  DEFAULT ('Unknown') FOR [Surname]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_P_LastPage]  DEFAULT ('') FOR [P_LastPage]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_P_LastButton]  DEFAULT ('') FOR [P_LastButton]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_P_LastEnvironment]  DEFAULT ((0)) FOR [P_LastEnvironment]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_HideFromList]  DEFAULT ((0)) FOR [HideFromList]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_ADDisabled]  DEFAULT ((0)) FOR [ADDisabled]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_Online]  DEFAULT ((0)) FOR [Online]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_Department]  DEFAULT ('') FOR [Department]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_DistinguishedName]  DEFAULT ('') FOR [DistinguishedName]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_DistinguishedManager]  DEFAULT ('') FOR [DistinguishedManager]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_Manager]  DEFAULT ((0)) FOR [Manager]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_Office]  DEFAULT ('') FOR [Office]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_P_CoAI_FontSize]  DEFAULT ((1)) FOR [P_CoAI_FontSize]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_P_CoAI_SortOrder]  DEFAULT ((10)) FOR [P_CoAI_SortOrder]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_P_WEDI_SortOrder]  DEFAULT ((0)) FOR [P_WEDI_SortOrder]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_P_WEDI_SearchInData]  DEFAULT ((1)) FOR [P_WEDI_SearchInData]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_P_SBU_SkipProductChecks]  DEFAULT ((0)) FOR [P_SBU_SkipProductChecks]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_PO_CanRaise]  DEFAULT ((0)) FOR [PO_CanRaise]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_PO_Limit]  DEFAULT ((0)) FOR [PO_Limit]
GO
ALTER TABLE [dbo].[Tb_Users] ADD  CONSTRAINT [DF_Tb_Users_P_SR_OnlyMe]  DEFAULT ((0)) FOR [P_SR_OnlyMe]
GO
ALTER TABLE [dbo].[Tb_VC_States] ADD  CONSTRAINT [DF_Tb_VC_States_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_VC_States] ADD  CONSTRAINT [DF_Tb_VC_States_Source]  DEFAULT ('') FOR [Source]
GO
ALTER TABLE [dbo].[Tb_VC_Valves] ADD  CONSTRAINT [DF_Tb_VC_Valves_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_VC_Valves] ADD  CONSTRAINT [DF_Tb_VC_Valves_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_VC_Valves] ADD  CONSTRAINT [DF_Tb_VC_Valves_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_VC_Valves] ADD  CONSTRAINT [DF_Tb_VC_Valves_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_VC_Valves] ADD  CONSTRAINT [DF_Tb_VC_Valves_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_VC_Valves] ADD  CONSTRAINT [DF_Tb_VC_Valves_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_VC_Valves] ADD  CONSTRAINT [DF_Tb_VC_Valves_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Tb_VC_Valves] ADD  CONSTRAINT [DF_Tb_VC_Valves_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Tb_VC_Vats] ADD  CONSTRAINT [DF_Tb_VC_Vats_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_VC_Vats] ADD  CONSTRAINT [DF_Tb_VC_Vats_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_VC_Vats] ADD  CONSTRAINT [DF_Tb_VC_Vats_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_VC_Vats] ADD  CONSTRAINT [DF_Tb_VC_Vats_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_VC_Vats] ADD  CONSTRAINT [DF_Tb_VC_Vats_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Tb_VC_Vats] ADD  CONSTRAINT [DF_Tb_VC_Vats_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Tb_VC_Vats] ADD  CONSTRAINT [DF_Tb_VC_Vats_Name]  DEFAULT ('New vat') FOR [Name]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_StdCost]  DEFAULT ((0)) FOR [StdCost]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost1]  DEFAULT ((0)) FOR [ActCost1]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost2]  DEFAULT ((0)) FOR [ActCost2]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost3]  DEFAULT ((0)) FOR [ActCost3]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost4]  DEFAULT ((0)) FOR [ActCost4]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost5]  DEFAULT ((0)) FOR [ActCost5]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost6]  DEFAULT ((0)) FOR [ActCost6]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost7]  DEFAULT ((0)) FOR [ActCost7]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost8]  DEFAULT ((0)) FOR [ActCost8]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost9]  DEFAULT ((0)) FOR [ActCost9]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost10]  DEFAULT ((0)) FOR [ActCost10]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost11]  DEFAULT ((0)) FOR [ActCost11]
GO
ALTER TABLE [dbo].[Tb_VI_Data] ADD  CONSTRAINT [DF_Tb_VI_Data_ActCost12]  DEFAULT ((0)) FOR [ActCost12]
GO
ALTER TABLE [dbo].[Tb_VI_Header] ADD  CONSTRAINT [DF_Tb_VI_Header_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tb_VI_Header] ADD  CONSTRAINT [DF_Tb_VI_Header_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Tb_VI_Header] ADD  CONSTRAINT [DF_Tb_VI_Header_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tb_VI_Header] ADD  CONSTRAINT [DF_Tb_VI_Header_ModifiedBy]  DEFAULT ((0)) FOR [ModifiedBy]
GO
/****** Object:  StoredProcedure [dbo].[Delete_sp_PPM_Scheduler]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_sp_PPM_Scheduler]
AS
--Only look at jobs where: -
--	Enabled and not deleted
--  The start date is not in the future
--  There is not an open job for it
DECLARE @ID			INT;
DECLARE @Freq		INT;
DECLARE @FreqValue	INT;
DECLARE @Start		DATE;
DECLARE @Due		DATE;
DECLARE @CJID		INT;

--WHILE (SELECT COUNT([ID]) FROM [Tb_PPM_Jobs] WHERE [Enabled] = 1 AND [Deleted] = 0 AND [StartDate] < sysdatetime() AND [ID] NOT IN (SELECT [LnkJobID] FROM [Tb_PPM_CompletedJobs] WHERE [Closed] IS NULL) AND [LnkEntityID] IN (SELECT [ID] FROM [Tb_PPM_Entities] WHERE [Deleted] = 0 and [Enabled] = 1) AND [LnkGroupID] IN (SELECT [ID] FROM [Tb_PPM_Groups] WHERE [Deleted] = 0 and [Enabled] = 1)) > 0
WHILE (SELECT COUNT([ID]) FROM [Tb_PPM_Jobs] WHERE [Enabled] = 1 AND [Deleted] = 0 AND [ID] NOT IN (SELECT [LnkJobID] FROM [Tb_PPM_CompletedJobs] WHERE [Closed] IS NULL) AND [LnkEntityID] IN (SELECT [ID] FROM [Tb_PPM_Entities] WHERE [Deleted] = 0 and [Enabled] = 1) AND [LnkGroupID] IN (SELECT [ID] FROM [Tb_PPM_Groups] WHERE [Deleted] = 0 and [Enabled] = 1)) > 0
BEGIN
	
	--Collect the ID of the first one to check
	--SELECT @ID = MIN([ID]) FROM [Tb_PPM_Jobs] WHERE [Enabled] = 1 AND [Deleted] = 0 AND [StartDate] < sysdatetime() AND [ID] NOT IN (SELECT [LnkJobID] FROM [Tb_PPM_CompletedJobs] WHERE [Closed] IS NULL) AND [LnkEntityID] IN (SELECT [ID] FROM [Tb_PPM_Entities] WHERE [Deleted] = 0 and [Enabled] = 1) AND [LnkGroupID] IN (SELECT [ID] FROM [Tb_PPM_Groups] WHERE [Deleted] = 0 and [Enabled] = 1);
	SELECT @ID = MIN([ID]) FROM [Tb_PPM_Jobs] WHERE [Enabled] = 1 AND [Deleted] = 0 AND [ID] NOT IN (SELECT [LnkJobID] FROM [Tb_PPM_CompletedJobs] WHERE [Closed] IS NULL) AND [LnkEntityID] IN (SELECT [ID] FROM [Tb_PPM_Entities] WHERE [Deleted] = 0 and [Enabled] = 1) AND [LnkGroupID] IN (SELECT [ID] FROM [Tb_PPM_Groups] WHERE [Deleted] = 0 and [Enabled] = 1);
	
	--Collect Values of the item we are working on
	SELECT 
		@Freq = [Freq],
		@FreqValue = [FreqValue],
		@Start = [StartDate]
	FROM 
		[Tb_PPM_Jobs] 
	WHERE 
		[ID] = @ID;

	--Take either the start date or the last completed date if there is one
	-- (Could have been in inline in the above, but readibility can have a place over functionality)
	SELECT @Start = ISNULL(MAX(CONVERT(DATE,[Closed])),@Start) FROM [Tb_PPM_CompletedJobs] WHERE [LnkJobID] = @ID

	-- Frequency values
	--0	Days
	--1	Weeks
	--2	Months
	--3	Years
	If @Start > SYSDATETIME()
	BEGIN
		SET @Due = @Start
	END
	ELSE
	BEGIN
		IF @Freq = 0 
			SET @Due = DATEADD(D,@FreqValue,@Start)	
		ELSE
		BEGIN
			IF @Freq = 1
				SET @Due = DATEADD(D,@FreqValue*7,@Start)	
			ELSE
			BEGIN
				IF @Freq = 2
					SET @Due = DATEADD(M,@FreqValue,@Start)	
				ELSE
					SET @Due = DATEADD(YY,@FreqValue,@Start)	
			END;
		END;
	END;
	INSERT INTO [Tb_PPM_CompletedJobs] ([LnkJobID],[Due]) VALUES (@ID,@Due)

	SELECT @CJID = MAX([ID]) FROM [Tb_PPM_CompletedJobs] WHERE [LnkJobID] = @ID 
	
	INSERT INTO [Tb_PPM_CompletedTasks] ([LnkCJID],[LnkTaskID],[Position]) SELECT @CJID, [ID], [Position] FROM [Tb_PPM_Tasks] WHERE [LnkJobID] = @ID AND [Enabled] = 1 AND [Deleted] = 0

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ASC_LIVE_Rep_BoMRollUp]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ASC_LIVE_Rep_BoMRollUp] as
BEGIN 

Declare @Depth int

SELECT
	T1.[Parent],
	MAX(T1.[Owns(1)]+T1.[Owns(2)]+T1.[Owns(3)]+T1.[Owns(4)]+T1.[Owns(5)]+T1.[Owns(6)]+T1.[Owns(7)]+T1.[Owns(8)]+T1.[Owns(9)]+T1.[Owns(10)]+T1.[Owns(11)]+T1.[Owns(12)]+T1.[Owns(13)]+T1.[Owns(14)]+T1.[Owns(15)])	AS [BoMDepth]
INTO #BoMDepth
FROM
	(SELECT
		B1.[BOM_PARENT_PART_ONLY]				AS [Parent],
		CASE ISNULL(B1.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(1)],
		CASE ISNULL(B2.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(2)],
		CASE ISNULL(B3.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(3)],
		CASE ISNULL(B4.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(4)],
		CASE ISNULL(B5.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(5)],
		CASE ISNULL(B6.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(6)],
		CASE ISNULL(B7.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(7)],
		CASE ISNULL(B8.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(8)],
		CASE ISNULL(B9.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(9)],
		CASE ISNULL(B10.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(10)],
		CASE ISNULL(B11.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(11)],
		CASE ISNULL(B12.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(12)],
		CASE ISNULL(B13.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(13)],
		CASE ISNULL(B14.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(14)],
		CASE ISNULL(B15.[BOM_OWNED_PART_ONLY],'0') WHEN '0' THEN 0 ELSE 1 END		AS [Owns(15)]
	FROM
					[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B1
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B2	ON B1.[BOM_OWNED_PART_ONLY] = B2.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B3	ON B2.[BOM_OWNED_PART_ONLY] = B3.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B4	ON B3.[BOM_OWNED_PART_ONLY] = B4.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B5	ON B4.[BOM_OWNED_PART_ONLY] = B5.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B6	ON B5.[BOM_OWNED_PART_ONLY] = B6.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B7	ON B6.[BOM_OWNED_PART_ONLY] = B7.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B8	ON B7.[BOM_OWNED_PART_ONLY] = B8.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B9	ON B8.[BOM_OWNED_PART_ONLY] = B9.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B10 ON B9.[BOM_OWNED_PART_ONLY] = B10.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B11 ON B10.[BOM_OWNED_PART_ONLY] = B11.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B12 ON B11.[BOM_OWNED_PART_ONLY] = B12.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B13 ON B12.[BOM_OWNED_PART_ONLY] = B13.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B14 ON B13.[BOM_OWNED_PART_ONLY] = B14.[BOM_PARENT_PART_ONLY]
	LEFT OUTER JOIN	[ASC_LIVE].[dbo].[ASC_BOM_TBL]						B15 ON B14.[BOM_OWNED_PART_ONLY] = B15.[BOM_PARENT_PART_ONLY]
	) T1
GROUP BY
	T1.[Parent]

SELECT 
	P.[PMA_PART_ONLY]		AS [Part],
	P.[PMA_DESC] + CASE ISNULL(P.[PMA_DESC_1],'') WHEN '' THEN '' ELSE ' ' + P.[PMA_DESC_1] END AS [PartDescription],
	P.[PMA_PROC_CODE]		AS [ProcurementCode],
	P.[PMA_COST_MAT]		AS [StdCost],
	P.[PMA_COST_MAT_PER]	AS [StdCostPer],
	P.[PMA_UOM]				AS [UoM],
	ISNULL(BD.[BoMDepth],0)	AS [BoMDepth],
	CASE ISNULL(BD.[BoMDepth],0)
		WHEN 0 THEN P.[PMA_COST_MAT]
		ELSE 0
	END		AS [RolledCost]
INTO #MasterPrice
FROM 
				[ASC_LIVE].[dbo].[ASC_PMA_TBL]	P
LEFT OUTER JOIN	[#BoMDepth]						BD ON P.[PMA_PART_ONLY] = BD.[Parent]

SET @Depth = 1

WHILE @Depth <= 15
BEGIN
	UPDATE 
		T1
	SET 
		T1.[RolledCost] = T2.[RolledCost]
	FROM
				[#MasterPrice]  AS T1
	INNER JOIN	(SELECT 
					B.[BOM_PARENT_PART_ONLY],
					SUM((MP.[RolledCost] / MP.[StdCostPer]) * B.[BOM_QTY_USED]) AS [RolledCost]
				FROM 
								[ASC_LIVE].[dbo].[ASC_BOM_TBL]	B 
				LEFT OUTER JOIN	[#MasterPrice]					MP	ON B.[BOM_OWNED_PART_ONLY] = MP.[Part]
				WHERE 
					B.[BOM_PARENT_PART_ONLY] IN (SELECT [Part] FROM [#MasterPrice] WHERE [BoMDepth] = @Depth)
				GROUP BY
					B.[BOM_PARENT_PART_ONLY]) T2 ON T1.[Part] = T2.[BOM_PARENT_PART_ONLY]

	SET @Depth = @Depth + 1
END

SELECT 
	T1.[Part],
	T1.[PartDescription],
	T1.[ProcurementCode],
	T1.[StdCost],
	T1.[StdCostPer],
	T1.[UoM],
	T1.[Variant],
	T1.[VariantDescription],
	T1.[BoMDepth],
	T1.[RolledCost],
	CASE LEFT(T1.[Part],1)
		WHEN 'F' THEN
			CASE (SELECT COUNT([Part]) FROM #MasterPrice WHERE [Part] = 'EF' + RIGHT(T1.[Part],LEN(T1.[Part])-1))
				WHEN 0 THEN '0'
				ELSE '1'
			END 
		WHEN 'E' THEN
			CASE LEFT(T1.[Part],2)
				WHEN 'EF' THEN 
					CASE (SELECT COUNT([Part]) FROM #MasterPrice WHERE [Part] = 'F' + RIGHT(T1.[Part],LEN(T1.[Part])-2))
						WHEN 0 THEN '0'
						ELSE 'F' + RIGHT(T1.[Part],LEN(T1.[Part])-2)
					END 
				ELSE '0'
			END 
		ELSE '0'
	END		AS [EFStatus] -- 0 = Show, 1 = Surpress, Else it will show the FCode to pull from
INTO #ResultSet
FROM 
	(SELECT 
		MP.[Part],
		MP.[PartDescription],
		MP.[ProcurementCode],
		MP.[StdCost],
		MP.[StdCostPer],
		MP.[UoM],
		P.[Analysis3]						AS [Variant],
		ISNULL(AC.AnalysisDescription,'')	AS [VariantDescription],
		MP.[BoMDepth],
		MP.[RolledCost]
	FROM 
					#MasterPrice				MP 
	LEFT OUTER JOIN vw_ASC_LIVE_Parts			P	ON	MP.[Part] = P.[Part]
	LEFT OUTER JOIN vw_ASC_LIVE_AnalysisCodes	AC	ON	P.[Analysis3] = AC.[AnalysisCode]
													AND	AC.[TypeCode] = 'I'
													AND AC.[LabelCode] = '3') T1

SELECT 
	T1.[Part],
	T1.[PartDescription],
	T1.[ProcurementCode],
	T1.[StdCost],
	T1.[StdCostPer],
	T1.[UoM],
	T1.[Variant],
	T1.[VariantDescription],
	T1.[BoMDepth],
	T1.[RolledCost],
	T1.[RolledCost] - T1.[StdCost]		AS [Variance],
	CONVERT(DECIMAL(15,5),CASE T1.[RolledCost]
		WHEN 0 THEN 0
		ELSE (T1.[RolledCost] - T1.[StdCost]) / T1.[RolledCost]	
	END)									AS [VariancePercentage]
FROM
	(SELECT 
		R1.[Part],
		R1.[PartDescription],
		R1.[ProcurementCode],
		R1.[StdCost],
		R1.[StdCostPer],
		R1.[UoM],
		R1.[Variant],
		R1.[VariantDescription],
		R1.[BoMDepth],
		CASE R1.[EFStatus]
			WHEN '0' THEN R1.[RolledCost]
			ELSE R2.[RolledCost]
		END	AS [RolledCost]
	FROM 
					#ResultSet R1
	LEFT OUTER JOIN	#ResultSet R2	ON	R2.[Part] = R1.[EFStatus]
	WHERE
		R1.[EFStatus] <> '1') T1

--ORDER BY 
--	MP.[BoMDepth], 
--	MP.[Part]

DROP TABLE #BoMDepth
DROP TABLE #MasterPrice
DROP TABLE #ResultSet



END
GO
/****** Object:  StoredProcedure [dbo].[sp_ASC_LIVE_Rep_SetLev]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ASC_LIVE_Rep_SetLev] as

IF OBJECT_ID('tempdb..#Tb_Rep_SetLev') IS NOT NULL
	DROP TABLE #Tb_Rep_SetLev;

CREATE TABLE #Tb_Rep_SetLev
(
[Group]				VARCHAR(50) NOT NULL,
[Type]				VARCHAR(6) NOT NULL,
[Part]				VARCHAR(16) NOT NULL,
[UoM]				VARCHAR(4) NOT NULL,
[Description]		VARCHAR(51) NOT NULL,
[SerialNo]			VARCHAR(40) NOT NULL,
[Quantity]			DECIMAL(15,5) NOT NULL,
[Capacity]			DECIMAL(15,5) NOT NULL,
[TCF]				DECIMAL(15,5) NOT NULL,
[Strength]			DECIMAL(15,5) NOT NULL,
[CalculatedLoA]		DECIMAL(15,5) NOT NULL,
[AttributeLoA]		DECIMAL(15,5) NOT NULL,
[LotGroup]			VARCHAR(10) NOT NULL,
[Bulk]				DECIMAL(15,5) NOT NULL
);

INSERT INTO #Tb_Rep_SetLev
SELECT
	CASE 
		WHEN P.[Analysis4] IN ('1','2','3') THEN 'Whisky'
		WHEN P.[Analysis4] = 'MW' THEN 'Made Wine'
		WHEN P.[Analysis4] = 'W' THEN 'Wine'
		WHEN P.[Analysis4] IN ('4','5','6','7','8','9','EU') THEN 'Spirits'
		ELSE 'Unknown (' + P.[Analysis4] + ')'
	END AS [Group],
	CASE LEFT(P.[Part],1) 
		WHEN 'B' THEN 'Bulk' 
		ELSE 'Filled'
	END AS [Type],
	L.[Part],
	P.[UoM],
	P.[Description1] + ' ' + P.[Description2]	AS [Description],
	L.[SerialNo],
	L.[Quantity],
	P.[Capacity],
	ISNULL(A10.[Value],0)						AS [TCF],
	ISNULL(A20.[Value],0)						AS [Strength],
	CASE 
		WHEN P.[Analysis4] in ('W','MW') THEN 0 
		WHEN P.[UoM] = 'LA' THEN L.[Quantity] 
		WHEN P.[LotGroup] = 'BONDED' THEN	CASE 
												WHEN P.[UoM] = 'MT' THEN L.[Quantity] * P.[RRP] * P.[AllocTolerance] / 100
												ELSE L.[Quantity] * P.[Capacity] * 1 * P.[AllocTolerance] /100
											END
		WHEN P.[LotGroup] = 'BULKBOND' THEN	(L.[Quantity] / (A10.[Value] * A20.[Value])) * 100 
		ELSE 0
	END AS [CalculatedLoA],
	CASE 
		WHEN P.[Analysis4] in ('W','MW') THEN 0 
		WHEN P.[LOTGROUP] = 'BONDBULK' THEN L.[Quantity]
		WHEN P.[UOM] = 'LA' THEN L.[Quantity] 
		ELSE ISNULL(A30.[Value],0)
	END AS [AttributeLoA],
	P.[LotGroup],
	CASE 
		WHEN P.[UoM] = 'MT' THEN L.[Quantity] * P.[RRP] 
		WHEN P.[UoM] = 'LT' THEN L.[Quantity] 
		WHEN P.[UoM] = 'LA' THEN L.[Quantity] * P.[Capacity] * 100 / (A10.[value] * A20.[Value]) 
		ELSE L.[Quantity] * P.[Capacity]
	END AS [Bulk]
FROM
				[vw_ASC_LIVE_Lots]			L
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]			P	ON	L.[Part] = P.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_Attributes]	A10 ON	L.[Part] = A10.[Part]
												AND L.[Number] = A10.[Lot]
												AND L.[Sequence] = A10.[LotSequence]
												AND A10.[CodeSequence] = 10
LEFT OUTER JOIN [vw_ASC_LIVE_Attributes]	A20 ON	L.[Part] = A20.[Part]
												AND	L.[Number] = A20.[Lot]
												AND L.[Sequence] = A20.[LotSequence]
												AND A20.[CodeSequence] = 20
LEFT OUTER JOIN [vw_ASC_LIVE_Attributes]	A30 ON L.[Part] = A30.[Part]
												AND L.[Number] = A30.[Lot]
												AND L.[Sequence] = A30.[LotSequence]
												AND A30.[CodeSequence] = 30
WHERE
	P.[Analysis4] <>'N'
AND L.[Warehouse] NOT IN ('HD','HH','MP','O','OT','PB','RM','RN','TH','WD','WN','WP')
AND L.[Quantity] > 0
AND LEFT(P.[Part],1) in ('F', 'R', 'B', 'D') 
AND LEFT(L.[SerialNo], 3) <> 'BAL'
AND P.[LotGroup] <> 'NON-BONDED'

SELECT 
	T1.[Group],
	T1.[Part],
	T1.[UoM],
	T1.[Description],
	T1.[SerialNo],
	T1.[Quantity],
	T1.[Capacity],
	T1.[TCF],
	T1.[Strength],
	T1.[CalculatedLoA],
	T1.[AttributeLoA],
	T1.[Discrepancy],
	T1.[LotGroup],
	T1.[Bulk]
FROM
	(SELECT 
		[Group]  + '1' AS [SortOrder],
		[Group] + ' ' + [Type] AS [Group],
		[Part],
		[UoM],
		[Description],
		[SerialNo],
		[Quantity],
		[Capacity],
		[TCF],
		[Strength],
		[CalculatedLoA],
		[AttributeLoA],
		[CalculatedLoA] - [AttributeLoA] as [Discrepancy],
		[LotGroup],
		[Bulk]
	FROM 
		#Tb_Rep_SetLev
	UNION ALL
	SELECT 
		[Group] + '1' AS [SortOrder],
		[Group] + ' ' + [Type] + ' (Total)'  AS [Group],
		'' AS [Part],
		'' AS [UoM],
		'' AS [Description],
		'' AS [SerialNo],
		0 AS [Quantity],
		0 AS [Capacity],
		0 AS [TCF],
		0 AS [Strength],
		SUM([CalculatedLoA])	AS [CalculatedLoA],
		SUM([AttributeLoA])		AS [AttributeLoA],
		SUM([CalculatedLoA]) - SUM([AttributeLoA]) AS [Discrepancy],
		'' AS [LotGroup],
		SUM([Bulk]) AS [Bulk]
	FROM 
		#Tb_Rep_SetLev
	GROUP BY
		[Group],
		[Group] + ' ' + [Type]
	UNION ALL
	SELECT 
		[Group]  + '3' AS [SortOrder],
		[Group] + ' (Total)'  AS [Group],
		'' AS [Part],
		'' AS [UoM],
		'' AS [Description],
		'' AS [SerialNo],
		0 AS [Quantity],
		0 AS [Capacity],
		0 AS [TCF],
		0 AS [Strength],
		SUM([CalculatedLoA])	AS [CalculatedLoA],
		SUM([AttributeLoA])		AS [AttributeLoA],
		SUM([CalculatedLoA]) - SUM([AttributeLoA]) AS [Discrepancy],
		'' AS [LotGroup],
		SUM([Bulk]) AS [Bulk]
	FROM 
		#Tb_Rep_SetLev
	GROUP BY
		[Group]) T1
ORDER BY
	T1.[SortOrder],
	T1.[Group],
	T1.[Part]

DROP TABLE #Tb_Rep_SetLev

GO
/****** Object:  StoredProcedure [dbo].[sp_GET_DATA]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:			Gary Evans (garye@hayman-group.co.uk)
-- Create date:		20190529
-- Modified Date:	20190627
-- Description:		Runs the view and logs its usage in the table, this is to address marking when reports are no longer used
--					Updated to auto define the type so it no longer needs to be passed
-- =============================================
CREATE PROCEDURE [dbo].[sp_GET_DATA]
	-- Name is the name of the view it will be running to get the data
	@Name		varchar(500),
	@Where		varchar(2000) = '',
	@Log		bit = 1
AS
BEGIN
	DECLARE @DTS	as datetime2 = sysdatetime()
	DECLARE @Query	as varchar(MAX)

		-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	execute as login = 'hayman0\Reporting'

	if OBJECT_ID('vw_'+ @Name,'V') IS NOT NULL 
		set @Query = 'select * from vw_' + @Name + CASE ISNULL(@Where,'') WHEN '' THEN '' ELSE ' where ' + @Where END 
	ELSE
		set @Query = 'sp_' + @Name

	REVERT

	IF @Log= 1
		BEGIN
			INSERT INTO [Tb_Log] ([Computer],[Source],[Environment],[Category],[Process],[Message]) VALUES (HOST_NAME(),'Reporting','','GET_DATA','ByName','Running ''' + @Name + '''');
		END

	execute as login = 'hayman0\Reporting'

	execute (@Query)
	
	REVERT

	IF @Log = 1
		BEGIN
			INSERT INTO [Tb_Mon_Usage] ([Name],[Type],[Query],[Duration]) VALUES (@Name,'Get Data',@Query,CONVERT(DECIMAL(15,5),CONVERT(DECIMAL(20,0),datediff(ms,@DTS,SYSDATETIME()))/1000));
		END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GET_DATA_FullQuery]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:			Gary Evans (garye@hayman-group.co.uk)
-- Create date:		20190529
-- Modified Date:	20190627
-- Description:		Runs the view and logs its usage in the table, this is to address marking when reports are no longer used
--					Updated to auto define the type so it no longer needs to be passed
-- =============================================
CREATE PROCEDURE [dbo].[sp_GET_DATA_FullQuery]
	-- Name is the name of the view it will be running to get the data
	@Query		varchar(5000),
	@Log		bit = 1
AS
BEGIN
	DECLARE @DTS	as datetime2 = sysdatetime()
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @Log= 1
		BEGIN
			INSERT INTO [Tb_Log] ([Computer],[Source],[Environment],[Category],[Process],[Message]) VALUES (HOST_NAME(),'Reporting','','GET_DATA','Custom','Running a full query');
		END

	execute as login = 'hayman0\Reporting'

	execute (@Query)
	
	REVERT

	IF @Log= 1
		BEGIN
			INSERT INTO [Tb_Mon_Usage] ([Name],[Type],[Query],[Duration]) VALUES ('HICS','Get Data (Custom)',@Query, CONVERT(DECIMAL(15,5),CONVERT(DECIMAL(20,0),datediff(ms,@DTS,SYSDATETIME()))/1000));
		END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_HICS_Rep_ReportUsage_Daily]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Alter view [dbo].[vw_HICS_Rep_ReportUsage_Detail] as
CREATE procedure [dbo].[sp_HICS_Rep_ReportUsage_Daily] as

BEGIN

WITH [DTS] AS
(SELECT 
	DATEADD(yy,-1,CONVERT(DATE,SYSDATETIME())) AS [DateValue]
 UNION ALL
 SELECT 
	DATEADD(dd,1,[DateValue])
 FROM
	[DTS]
 WHERE 
	 DATEADD(dd,1,[DateValue]) <= SYSDATETIME())

SELECT 
	DTS.[DateValue]				AS [DTS],
	MU.[Name]					AS [Report],
	ISNULL(T1.[Runs],0)			AS [Runs],
	ISNULL(T1.[AvgRunTime],0)	AS [AvgRunTime]
FROM 
				[DTS]				DTS
CROSS JOIN		(SELECT DISTINCT [Name] FROM [Tb_Monitor_Usage] WHERE [Name] LIKE '%_Rep_%') MU
LEFT OUTER JOIN	(SELECT 
				CONVERT(DATE,MU.[CreatedOn]) [RunTime],
				MU.[Name]			AS [Report],
				COUNT(MU.[ID])		AS [Runs],
				SUM(MU.[Duration]) / COUNT(MU.[ID]) AS [AvgRunTime]
			FROM 
							[Tb_Monitor_Usage]	MU
			WHERE
				MU.[Name] LIKE '%_Rep_%'
			GROUP BY
				CONVERT(DATE,MU.[CreatedOn]),
				MU.[Name]) T1	ON	T1.[RunTime] = DTS.[DateValue]
								AND	T1.[Report]	= MU.[Name]
WHERE
	NOT FORMAT(DTS.[DateValue],'ddd') IN ('Sat','Sun')
ORDER BY MU.[Name], DTS.[DateValue]
OPTION (MAXRECURSION 0)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_HICS_Rep_ReportUsage_Daily2]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Alter view [dbo].[vw_HICS_Rep_ReportUsage_Detail] as
create procedure [dbo].[sp_HICS_Rep_ReportUsage_Daily2] as

BEGIN

WITH [DTS] AS
(SELECT 
	DATEADD(yy,-1,CONVERT(DATE,SYSDATETIME())) AS [DateValue]
 UNION ALL
 SELECT 
	DATEADD(dd,1,[DateValue])
 FROM
	[DTS]
 WHERE 
	 DATEADD(dd,1,[DateValue]) < convert(date,SYSDATETIME()))

SELECT 
	DTS.[DateValue]				AS [DTS],
	ISNULL(T1.[Runs],0)			AS [Runs],
	ISNULL(T1.[AvgRunTime],0)	AS [AvgRunTime]
FROM 
				[DTS]				DTS
LEFT OUTER JOIN	(SELECT 
					CONVERT(DATE,MU.[CreatedOn]) [RunTime],
					COUNT(MU.[ID])		AS [Runs],
					SUM(MU.[Duration]) / COUNT(MU.[ID]) AS [AvgRunTime]
				FROM 
					[Tb_Monitor_Usage]	MU
				WHERE
					MU.[Name] LIKE '%_Rep_%'
				GROUP BY
					CONVERT(DATE,MU.[CreatedOn])) T1	ON	T1.[RunTime] = DTS.[DateValue]
WHERE
	NOT FORMAT(DTS.[DateValue],'ddd') IN ('Sat','Sun')
ORDER BY DTS.[DateValue]
OPTION (MAXRECURSION 0)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Log]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Log]
	@Source AS [VARCHAR](50),
	@Category AS [VARCHAR](50),
	@Process AS [VARCHAR](50),
	@Message AS [VARCHAR](500),
	@Environment AS [VARCHAR](50) = 'Live'
AS
DECLARE @UserID			INT

IF (SELECT COUNT([ID]) FROM [Tb_Users] WHERE [ADUsername] = SUSER_NAME()) = 0 
	INSERT INTO [Tb_Users] ([ADUsername]) VALUES (SUSER_NAME());
	
SELECT @UserID = (SELECT TOP 1 [ID] FROM [Tb_Users] WHERE [ADUsername] = SUSER_NAME());

INSERT INTO [Tb_Log] ([CreatedBy],[Computer],[Source],[Environment],[Category],[Process],[Message]) VALUES (@UserID,HOST_NAME() ,@Source,@Environment,@Category,@Process,@Message);

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_ASCLicenceCheck]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Mon_ASCLicenceCheck] as
DECLARE @DTS DATETIME

SET @DTS = CONVERT(datetime, FORMAT(SYSDATETIME(),'yyyy-MMM-dd HH:mm:0')) 

INSERT INTO [HICSDEV].[dbo].[Tb_ASC_Licences2] ([DTS], [USER_ID],[USER_NAME]) (
SELECT @DTS AS [DTS], [USER_ID], [USER_NAME] FROM [AA_ACCESS_USER_MANAGEMENT].[dbo].[CURRENT_ACTIVITY]);

INSERT INTO [HICSDEV].[dbo].[Tb_ASC_Licences] ([DTS], [ActiveUsers]) (
SELECT @DTS AS [DTS], COUNT([ID]) AS [ActiveUsers] FROM [HICSDEV].[dbo].[Tb_ASC_Licences2] WHERE [DTS] = @DTS);

DELETE FROM [HICSDEV].[dbo].[Tb_ASC_Licences] WHERE CONVERT(date, [DTS]) < DATEADD(dd,-60,convert(date,sysdatetime()));
DELETE FROM [HICSDEV].[dbo].[Tb_ASC_Licences2] WHERE CONVERT(date, [DTS]) < DATEADD(dd,-60,convert(date,sysdatetime()));
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task01]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task01]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @EmailsSent		INT = 0
DECLARE @EmailLimit		INT = 20
DECLARE @LogText		VARCHAR(1000)
DECLARE @ID				INT;
DECLARE @Profile		VARCHAR(255);
DECLARE @EMailBody		NVARCHAR(MAX);
DECLARE @EMailBody2		NVARCHAR(MAX);
DECLARE @EmailTo		VARCHAR(1024);
DECLARE @EmailCC		VARCHAR(1024);
DECLARE @EmailBCC		VARCHAR(1024);
DECLARE @EmailSub		VARCHAR(1024);
DECLARE @EmailRunID		INT;
DECLARE @EmailTaskID	INT;
DECLARE @Attachments	NVARCHAR(MAX);
DECLARE @Attachment		NVARCHAR(MAX);
DECLARE @Filename		NVARCHAR(MAX);
DECLARE @Counter		INT;
DECLARE @Counter2		INT;
DECLARE @ShellCmd		VARCHAR(1000);
DECLARE @Tb_Attachments TABLE ([Original] NVARCHAR(MAX), [Filename] NVARCHAR(MAX));


--Update to cap at 20 emails per run
While ((Select COUNT([ID]) From [Tb_Mon_Emails] Where [Processed] IS NULL AND [ReadyToSend] = 1) > 0) AND (@EmailsSent < @EmailLimit)
BEGIN
	
	SET @ID = (SELECT MIN([ID]) FROM [Tb_Mon_Emails] Where [Processed] IS NULL AND [ReadyToSend] = 1);
	
	SELECT 
		@Profile		= ISNULL([Profile],''), 
		@EMailBody2		= ISNULL([Body],''),
		@EmailTo		= ISNULL([To],''),
		@EmailCC		= ISNULL([CC],''),
		@EmailBCC		= ISNULL([BCC],''),
		@EmailSub		= ISNULL([Subject],''),
		@EmailRunID		= ISNULL([LnkRunID],0)
	FROM 
		[Tb_Mon_Emails] 
	WHERE 
		[ID] = @ID;
	
	set @EMailBody =	'<!DOCTYPE html>' + 
						'<html>' + 
						'<head>' +
						'<style>' +
						'p {text-align: left;' +
						'font-family: Calibri, Arial;' +
						'font-size: 14px}' +
						'p.footer {font-size: 10px;' +
						'color: rgb(100,100,100)}' +
						'th,td {text-align: left;' +
						'font-family: Calibri, Arial;' +
						'font-size: 14px;' +
						'border: 1px solid rgb(225,225,255)}' +
						'table {border-collapse: collapse;' +
						'width:100%}' +
						'tr:nth-child(even) {
						 background-color: rgb(225,225,255)}' +
						'footer p{font-size: 10px;' +
						'color: rgb(100,100,100)}' +
						'</style>' +
						'<meta http-equiv="Content-Type" content="text/html; charset=utf-8">' +
						'</head>' +
						'<body>'
	
	IF @EmailTo = ''
		BEGIN
			SET @EmailTo  = 'support@hgcompany.co.uk'
			SET @EMailBody2  = '<p><b>No recipients were provided/available for this email, if this should have gone to a user it should be investigated.</b></p>' + @EMailBody2
		END

	set @EmailTaskID = (SELECT ISNULL(MAX([TaskID]),0) from [Tb_Mon_Runs] WHERE [ID] = @EmailRunID)


	SET @EMailBody = @EMailBody + @EMailBody2 + '<footer><p class=footer>Do not reply to this email, this is an automated email, delivery will fail. ' +
					'For technical support please contact the <a href="mailto:hgcompany@melbek.co.uk" target="_top">helpdesk</a>, you may also wish to contact your line manager for further support.<br>' +
					'Email: 00' + CONVERT(VARCHAR(100),@ID) + '. Run: 00' + CONVERT(VARCHAR(100),@EmailRunID) + '. Task: 00' + CONVERT(VARCHAR(100),@EmailTaskID) + '</p></footer></body></html>';
	
	SET @Counter = 0
	SET @Attachments = N''

	WHILE (SELECT COUNT([ID]) FROM [Tb_Mon_Email_Attachments] WHERE [LnkEmailID] = @ID AND [ID] > @Counter) > 0
	BEGIN
		SET @Counter = (SELECT MIN([ID]) FROM [Tb_Mon_Email_Attachments] WHERE [LnkEmailID] = @ID AND [ID] > @Counter)
		
		SET @Attachment = (SELECT CONVERT(NVARCHAR(MAX),[File]) FROM [Tb_Mon_Email_Attachments] WHERE [ID] = @Counter)
		SET @Filename = ''
		SET @Counter2 = 1
		WHILE LEFT(RIGHT(@Attachment,@Counter2),1) <> '\'
		BEGIN
			SET @Filename = RIGHT(@Attachment,@Counter2)
			SET @Counter2 = @Counter2 + 1
		END

		INSERT INTO @Tb_Attachments ([Original],[Filename]) VALUES (@Attachment,@Filename)
		
		Set @Attachments = @Attachments + 'C:\Temp\' + @Filename + ';'

		SELECT @ShellCmd = CONCAT('COPY "', @Attachment,'" "','C:\Temp\',@Filename,'"')

		execute AS login = 'HAYMAN0\SQLNetworkAccess' 
		execute xp_cmdshell @ShellCmd
		REVERT;
		
	END

	IF (@Attachments <> N'') 
		SET @Attachments = LEFT(@Attachments ,LEN(@Attachments )-1)

	SET @LogText = CONCAT('Sending Email ',CONVERT(VARCHAR(10),@ID))
	IF NOT @EmailRunID IS NULL
		SET @LogText = CONCAT(@LogText , ' for monitor run ',CONVERT(VARCHAR(10),@EmailRunID))
	
	exec sp_Log @LogSrc, @LogCat, @LogProc, @LogText
	
	EXEC [msdb].[dbo].[sp_send_dbmail]
		@Profile_name			= @Profile,
		@recipients				= @EmailTo,
		@copy_recipients 		= @EmailCC,
		@blind_copy_recipients 	= @EmailBCC,
		@subject				= @EmailSub,
		@body					= @EMailBody,
		@body_format			= 'HTML',
		@file_attachments		= @Attachments;
	
	WHILE (SELECT COUNT(*) FROM @Tb_Attachments) > 0
	BEGIN
		SET @Attachment = (SELECT MIN([FileName]) FROM @Tb_Attachments)

		SELECT @ShellCmd = CONCAT('DEL "C:\Temp\',@Filename,'" /F /Q')

		execute AS login = 'HAYMAN0\SQLNetworkAccess' 
		execute xp_cmdshell @ShellCmd
		REVERT;

		delete from @Tb_Attachments WHERE [Filename] = @Attachment

	END

	Update [Tb_Mon_Emails] Set [Processed] = SYSDATETIME() WHERE [ID] = @ID;

	SET @EmailsSent = @EmailsSent + 1;

	IF (@EmailsSent > @EmailLimit)
		set @LogText = CONCAT('Emailing has reached its safety limit of ', CONVERT(VARCHAR(10),@EmailLimit),', no more will be sent in this session')
		exec sp_Log @LogSrc, @LogCat, @LogProc, @LogText

END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task02]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task02]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS
DECLARE @Count		AS [INT]
DECLARE @MaxYears	AS [INT] = 3
DECLARE @MaxRows	AS [INT] = 100000
DECLARE @LogMsg		AS [VARCHAR](500)
DECLARE @ID			INT = 0
DECLARE @MaxRunID	INT

--first look for run older than the max age
SET @Count =(SELECT COUNT([ID]) FROM [Tb_Mon_Runs] WHERE [Status] <> 0 AND [Start] < dateadd(YEAR,-@MaxYears,SYSDATETIME()))

IF @Count <> 0
	BEGIN
		SET @LogMsg = CONCAT(convert(varchar(10),@Count), ' Entr', CASE @Count WHEN 1 THEN 'y' ELSE 'ies' END, ' will be deleted based on age (Max. 3 years)')
		EXEC sp_log @LogSrc, @LogCat, @LogProc, @LogMsg

		DELETE FROM [Tb_Mon_Runs] WHERE [Status] <> 0 AND [Start] < dateadd(YEAR,-@MaxYears,SYSDATETIME());
	END;		

WHILE (SELECT COUNT([ID]) FROM [Tb_Mon_Tasks] WHERE [ID] > @ID) > 0
BEGIN
	SET @ID = (SELECT MIN([ID]) FROM [Tb_Mon_Tasks] WHERE [ID] > @ID)

	IF (SELECT COUNT([ID]) FROM [Tb_Mon_Runs] WHERE [TaskID] = @ID AND [Status] <> 0) > @MaxRows
	BEGIN
		SELECT
			@MaxRunID = T1.[ID]
		FROM
			(SELECT
				ROW_NUMBER() OVER (ORDER BY [ID] DESC) AS [Row],
				ID
			 FROM 
				[Tb_Mon_Runs]
			WHERE
				[TaskID] = @ID
			AND [Status] <> 0) T1
		WHERE
			T1.[Row] = @MaxRows
	
		SET @Count =(SELECT COUNT([ID]) FROM [Tb_Mon_Runs] WHERE [TaskID] = @ID AND [ID] < @MaxRunID)

		SET @LogMsg = CONCAT(convert(varchar(10),@Count) , ' Entr', CASE @Count WHEN 1 THEN 'y' ELSE 'ies' END, ' will be deleted for task ', CONVERT(VARCHAR(10),@ID), ' based on count (Max. ', CONVERT(VARCHAR(10),@MaxRows) ,' per task)')
		EXEC sp_log @LogSrc, @LogCat, @LogProc, @LogMsg

		DELETE FROM [Tb_Mon_Runs] WHERE [Status] <> 0 AND [TaskID] = @ID and [ID] < @MaxRunID
	END
	SET @MaxRunID = (SELECT ISNULL(MIN(T1.[ID]),0) FROM (SELECT TOP 100000 [ID] FROM [Tb_Mon_Runs] WHERE [Status] <> 0 AND [TaskID] = @TaskID ORDER BY ID DESC) T1)

END

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task03]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task03]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task3_Email') IS NOT NULL
	DROP TABLE #Tb_Mon_Task3_Email;

IF OBJECT_ID('tempdb..#Tb_Mon_Task3') IS NOT NULL
	DROP TABLE #Tb_Mon_Task3;

IF OBJECT_ID('tempdb..#Tb_Mon_Task3_2') IS NOT NULL
	DROP TABLE #Tb_Mon_Task3_2;


--Sync HICS Users with AD
--This is all users not disabled
INSERT INTO [HICSDEV].[dbo].[Tb_Users] ([ADGUID],[ADUsername],[Email],[Forenames],[Surname],[ADCreatedOn],[ADDisabled],[Department],[DistinguishedName],[DistinguishedManager],[Office],[Title]) 
SELECT
	convert(varchar(50),convert(uniqueidentifier, AD.[objectGUID]))	AS [ADGUID],
	'HAYMAN0\' + AD.[sAMAccountName]								AS [ADUsername], 
	ISNULL(AD.[mail],'')											AS [Email], 
	ISNULL(AD.[givenName],'')										AS [Forenames], 
	ISNULL(AD.[sn],'')												AS [Surname],
	AD.[whenCreated]												AS [ADCreatedOn],
	0																AS [ADDisabled],
	ISNULL(AD.[department],'')										AS [Department],
	ISNULL(AD.[distinguishedName],'')								AS [DistinguishedName],
	ISNULL(AD.[manager],'')											AS [DistinguishedManager],
	ISNULL(AD.[physicalDeliveryOfficeName],'')						AS [Office],
	ISNULL(AD.[Title],'')											AS [Title]
FROM 
	OpenQuery (AD, 'SELECT objectGUID, sAMAccountName, mail, givenName, sn, whenCreated, userAccountControl, department, distinguishedName, manager, physicalDeliveryOfficeName, title
					FROM ''LDAP://dc=hayman,dc=local'' 
					WHERE objectCategory = ''Person'' AND objectClass = ''user'' AND ''userAccountControl:1.2.840.113556.1.4.803:'' <> 2 ') AD
LEFT OUTER JOIN	[HICSDEV].[dbo].[Tb_Users] U ON convert(varchar(50),convert(uniqueidentifier, AD.[objectGUID])) = U.[ADGUID]
WHERE 
	U.[ID] IS NULL;

--This is all users disabled
INSERT INTO [HICSDEV].[dbo].[Tb_Users] ([ADGUID],[ADUsername],[Email],[Forenames],[Surname],[ADCreatedOn],[ADDisabled],[Department],[DistinguishedName],[DistinguishedManager],[Office],[Title]) 
SELECT
	convert(varchar(50),convert(uniqueidentifier, AD.[objectGUID]))	AS [ADGUID],
	'HAYMAN0\' + AD.[sAMAccountName]								AS [ADUsername], 
	ISNULL(AD.[mail],'')											AS [Email], 
	ISNULL(AD.[givenName],'')										AS [Forenames], 
	ISNULL(AD.[sn],'')												AS [Surname],
	AD.[whenCreated]												AS [ADCreatedOn],
	1																AS [ADDisabled],
	ISNULL(AD.[department],'')										AS [Department],
	ISNULL(AD.[distinguishedName],'')								AS [DistinguishedName],
	ISNULL(AD.[manager],'')											AS [DistinguishedManager],
	ISNULL(AD.[physicalDeliveryOfficeName],'')						AS [Office],
	ISNULL(AD.[Title],'')											AS [Title]
FROM 
	OpenQuery (AD, 'SELECT objectGUID, sAMAccountName, mail, givenName, sn, whenCreated, userAccountControl, department, distinguishedName, manager, physicalDeliveryOfficeName, title
					FROM ''LDAP://dc=hayman,dc=local'' 
					WHERE objectCategory = ''Person'' AND objectClass = ''user'' AND ''userAccountControl:1.2.840.113556.1.4.803:'' = 2 ') AD
LEFT OUTER JOIN	[HICSDEV].[dbo].[Tb_Users] U ON convert(varchar(50),convert(uniqueidentifier, AD.[objectGUID])) = U.[ADGUID]
WHERE 
	U.[ID] IS NULL;

--The we update the line manager information of these new users
DECLARE @UserID INT = 0
DECLARE @DM		varchar(255)
While (Select Count([ID]) From [Tb_Users] Where [Manager] = 0 and [DistinguishedManager] <> '' AND [ID] > @UserID AND DATEDIFF(MINUTE,[CreatedOn],getdate()) <= 1) > 0
BEGIN
	SELECT TOP 1
		@UserID =		[ID],
		@DM		=		[DistinguishedManager]
	FROM 
		[Tb_Users]
	WHERE 
		[Manager] = 0 
	AND [DistinguishedManager] <> ''
	AND [ID] > @UserID
	AND DATEDIFF(MINUTE,[CreatedOn],getdate()) <= 1;
		
	UPDATE [Tb_Users] SET [Manager] = (SELECT TOP 1 ISNULL([ID],0) FROM [Tb_Users] WHERE [DistinguishedName] = @DM) WHERE [ID] = @UserID;
	
END;

--Create Email table
CREATE TABLE #Tb_Mon_Task3_Email
([ID]			int NULL,
[Type1]			varchar(10) NOT NULL,
[Type2]			varchar(10) NOT NULL,
[Data1]			varchar(255) NULL,
[Data2]			varchar(255) NULL, 
[Area]			varchar(255) NULL,
[Was]			varchar(255) NULL,
[Is]			varchar(255) NULL);

--Insert all the newly created ones into the email table
INSERT INTO #Tb_Mon_Task3_Email
SELECT 
	[ID],
	'User'		AS [Type1],
	'New'		AS [Type2], 
	[Username],
	[FullName], 
	''			AS [Area],
	''			AS [Was],
	''			AS [Is]
FROM 
	[vw_HICS_rep_Users] 
where 
	DATEDIFF(MINUTE,[CreatedOn],getdate()) <= 1

--Create temp table
CREATE TABLE #Tb_Mon_Task3
([ID]						int NULL,
[ADGUID]					varchar(50) NULL,
[ADCreated_Was]				datetime NULL,	--There were some instances of this being empty, not sure how but this will plug the gap
[ADCreated_Is]				datetime NULL,
[ADUsername_Was]			varchar(255) NULL,
[ADUsername_Is]				varchar(255) NULL,
[ADDisabled_Was]			bit NOT NULL,
[ADDisabled_Is]				bit NULL,
[Forenames_Was]				varchar(255) NULL, 
[Forenames_Is]				varchar(255) NULL, 
[Surname_Was]				varchar(255) NULL, 
[Surname_Is]				varchar(255) NULL, 
[Email_Was]					varchar(255) NULL,
[Email_Is]					varchar(255) NULL,
[Department_Was]			varchar(255) NULL,
[Department_Is]				varchar(255) NULL,
[DistinguishedName_Was]		varchar(255) NULL,
[DistinguishedName_Is]		varchar(255) NULL,
[DistinguishedManager_Was]	varchar(255) NULL,
[DistinguishedManager_Is]	varchar(255) NULL,
[Office_Was]				varchar(255) NULL,
[Office_Is]					varchar(255) NULL,
[Title_Was]					varchar(255) NULL,
[Title_Is]					varchar(255) NULL,
[Processed]					bit NOT NULL);

--Populate list of all current details
INSERT INTO #Tb_Mon_Task3 ([ID],[ADGUID],[ADCreated_Was],[ADUsername_Was],[ADDisabled_Was],[Forenames_Was],[Surname_Was],[Email_Was], [Department_Was], [DistinguishedName_Was], [DistinguishedManager_Was], [Office_Was], [Title_Was], [Processed])
SELECT [ID],[ADGUID],ISNULL([ADCreatedOn],0)[ADCreatedOn],[ADUsername],[ADDisabled],[Forenames], [Surname], ISNULL([Email],'')[Email], [Department], [DistinguishedName], [DistinguishedManager], [Office], [Title] ,0 FROM [HICSDEV].[dbo].[Tb_Users];

--Insert new details
--First we sync HICS Users with AD, this is all users not disabled
UPDATE [#Tb_Mon_Task3] SET 
	[ADCreated_Is]				= T2.[Created],
	[ADUsername_Is]				= T2.[ADUsername],
	[ADDisabled_Is]				= 0,
	[Forenames_Is]				= T2.[Forenames],
	[Surname_Is]				= T2.[Surname],
	[Email_Is]					= T2.[Email],
	[Department_Is]				= T2.[Department],
	[DistinguishedName_Is]		= T2.[DistinguishedName],
	[DistinguishedManager_Is]	= T2.[DistinguishedManager],
	[Office_Is]					= T2.[Office],
	[Title_Is]					= T2.[Title]
FROM 
	[#Tb_Mon_Task3] T1
INNER JOIN (SELECT
				convert(varchar(50),convert(uniqueidentifier, AD.[objectGUID]))	AS [ADGUID],
				AD.[whenCreated]												AS [Created],
				'HAYMAN0\' + AD.[sAMAccountName]								AS [ADUsername],
				ISNULL(AD.[givenName],'')										AS [Forenames], 
				ISNULL(AD.[sn],'')												AS [Surname],
				ISNULL(AD.[mail],'')											AS [Email],
				ISNULL(AD.[department],'')										AS [Department],
				ISNULL(AD.[distinguishedName],'')								AS [DistinguishedName],
				ISNULL(AD.[manager],'')											AS [DistinguishedManager],
				ISNULL(AD.[physicalDeliveryOfficeName],'')						AS [Office],
				ISNULL(AD.[Title],'')											AS [Title] 
			FROM 
				OpenQuery (AD, 'SELECT objectGUID, whenCreated, sAMAccountName, mail, givenName, sn, department, distinguishedName, manager, physicalDeliveryOfficeName, title
					FROM ''LDAP://dc=hayman,dc=local'' 
								WHERE objectCategory = ''Person'' AND objectClass = ''user'' AND ''userAccountControl:1.2.840.113556.1.4.803:'' <> 2 ') AD) T2 ON T1.[ADGUID] = T2.[ADGUID];

--This is all users disabled
UPDATE [#Tb_Mon_Task3] SET 
	[ADCreated_Is]				= T2.[Created],
	[ADUsername_Is]				= T2.[ADUsername],
	[ADDisabled_Is]				= 1,
	[Forenames_Is]				= T2.[Forenames],
	[Surname_Is]				= T2.[Surname],
	[Email_Is]					= T2.[Email],
	[Department_Is]				= T2.[Department],
	[DistinguishedName_Is]		= T2.[DistinguishedName],
	[DistinguishedManager_Is]	= T2.[DistinguishedManager],
	[Office_Is]					= T2.[Office],
	[Title_Is]					= T2.[Title]
FROM 
	[#Tb_Mon_Task3] T1
INNER JOIN (SELECT
				convert(varchar(50),convert(uniqueidentifier, AD.[objectGUID]))	AS [ADGUID],
				AD.[whenCreated]												AS [Created],
				'HAYMAN0\' + AD.[sAMAccountName]								AS [ADUsername],
				ISNULL(AD.[givenName],'')										AS [Forenames], 
				ISNULL(AD.[sn],'')												AS [Surname],
				ISNULL(AD.[mail],'')											AS [Email],
				ISNULL(AD.[department],'')										AS [Department],
				ISNULL(AD.[distinguishedName],'')								AS [DistinguishedName],
				ISNULL(AD.[manager],'')											AS [DistinguishedManager],
				ISNULL(AD.[physicalDeliveryOfficeName],'')						AS [Office],
				ISNULL(AD.[Title],'')											AS [Title] 
			FROM 
				OpenQuery (AD, 'SELECT objectGUID, whenCreated, sAMAccountName, mail, givenName, sn, department, distinguishedName, manager, physicalDeliveryOfficeName, title
					FROM ''LDAP://dc=hayman,dc=local'' 
								WHERE objectCategory = ''Person'' AND objectClass = ''user'' AND ''userAccountControl:1.2.840.113556.1.4.803:'' = 2 ') AD) T2 ON T1.[ADGUID] = T2.[ADGUID];


--Clear off items with no change
Delete from [#Tb_Mon_Task3] 
WHERE 
	([ADCreated_Was] = [ADCreated_Is]
AND [ADUsername_Was] = [ADUsername_Is] 
AND	[Forenames_Was] = [Forenames_Is] 
AND [Surname_Was] = [Surname_Is] 
AND [Email_Was] = [Email_Is]
AND [Department_Was] = [Department_Is]
AND [DistinguishedName_Was] = [DistinguishedName_Is]
AND [DistinguishedManager_Was] = [DistinguishedManager_Is]
AND [Office_Was] = [Office_Is]
AND [Title_Was] = [Title_Is]
AND [ADDisabled_Was] = [ADDisabled_Is])
OR [ADGUID] IS NULL
OR [ADUsername_Is] IS NULL


--These are declared here as they may be needed in the below but if they are not they may be needed further down so should still exist
DECLARE @EMailBody		NVARCHAR(MAX)
DECLARE @EmailID		INT
DECLARE @ADGUID			varchar(50)
DECLARE @ID				INT
DECLARE @ADDisabled_Was	INT 
DECLARE @ADDisabled_Is	INT
	
--Check there are changes to report on
IF (Select COUNT([ADGUID]) From [#Tb_Mon_Task3]) > 0
BEGIN
	--Insert the differences into the email table
	DECLARE	@User			varchar(255)
	DECLARE @ADCreated_Was	datetime 
	DECLARE @ADCreated_Is	datetime
	DECLARE @ADUsername_Was varchar(255) 
	DECLARE @ADUsername_Is	varchar(255) 
	DECLARE @Forenames_Was	varchar(255) 
	DECLARE @Forenames_Is	varchar(255) 
	DECLARE @Surname_Was	varchar(255) 
	DECLARE @Surname_Is		varchar(255) 
	DECLARE @Email_Was		varchar(255)
	DECLARE @Email_Is		varchar(255)
	DECLARE @Department_Was varchar(255)
	DECLARE @Department_Is	varchar(255)
	DECLARE @DN_Was			varchar(255)
	DECLARE @DN_Is			varchar(255)
	DECLARE @DM_Was			varchar(255)
	DECLARE @DM_Is			varchar(255)
	DECLARE @Office_Was		varchar(255)
	DECLARE @Office_Is		varchar(255)
	DECLARE @Title_Was		varchar(255)
	DECLARE @Title_Is		varchar(255)
	DECLARE @FullName		varchar(255)

	While (Select COUNT([ADGUID]) From [#Tb_Mon_Task3] Where [Processed] = 0) > 0
	Begin
		Select Top 1
			@ADGUID =			[ADGUID],
			@ADCreated_Was =	ISNULL([ADCreated_Was],0),
			@ADCreated_Is =		ISNULL([ADCreated_Is],0),
			@ADUsername_Was =	ISNULL([ADUsername_Was],''),
			@ADUsername_Is =	ISNULL([ADUsername_Is],''),
			@ADDisabled_Was =	ISNULL(CONVERT(VARCHAR(1),[ADDisabled_Was]),''),
			@ADDisabled_Is =	ISNULL(CONVERT(VARCHAR(1),[ADDisabled_Is]),''),
			@Forenames_Was =	ISNULL([Forenames_Was],''),
			@Forenames_Is =		ISNULL([Forenames_Is],''),
			@surname_Was =		ISNULL([Surname_Was],''),
			@Surname_Is =		ISNULL([Surname_Is],''),
			@Email_Was =		ISNULL([Email_Was],''),
			@Email_Is =			ISNULL([Email_Is],''),
			@Department_Was =	ISNULL([Department_Was],''),
			@Department_Is =	ISNULL([Department_Is],''),
			@DN_Was =			ISNULL([DistinguishedName_Was],''),
			@DN_Is =			ISNULL([DistinguishedName_Is],''),
			@DM_Was =			ISNULL([DistinguishedManager_Was],''),
			@DM_Is =			ISNULL([DistinguishedManager_Is],''),
			@Office_Was =		ISNULL([Office_Was],''),
			@Office_Is =		ISNULL([Office_Is],''),
			@Title_Was =		ISNULL([Title_Was],''),
			@Title_Is =			ISNULL([Title_Is],'')
		FROM 
			[#Tb_Mon_Task3] 
		WHERE 
			[Processed] = 0;

		SELECT 
			@ID = [ID],
			@User = [Username],
			@FullName = [FullName]
		FROM
			[vw_HICS_Rep_Users]
		WHERe
			[ADUsername] = @ADUsername_Was;

		IF @ADCreated_Was <> @ADCreated_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'AD Created',@ADCreated_Was, @ADCreated_Is);
		
		IF @ADUsername_Was <> @ADUsername_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'AD Username',@ADUsername_Was, @ADUsername_Is);

		IF @ADDisabled_Was <> @ADDisabled_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'AD Disabled',@ADDisabled_Was, @ADDisabled_Is);

		IF @Forenames_Was <> @Forenames_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'Forenames',@Forenames_Was, @Forenames_Is);

		IF @Surname_Was <> @Surname_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'Surname',@Surname_Was, @Surname_Is);

		IF @Email_Was <> @Email_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'Email',@Email_Was, @Email_Is);
	
		IF @Department_Was <> @Department_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'Department',@Department_Was, @Department_Is);

		IF @DN_Was <> @DN_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'Distinguished Name',@DN_Was, @DN_Is);
	
		IF @DM_Was <> @DM_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'Distinguished Manager',@DM_Was, @Dm_Is);

		IF @Office_Was <> @Office_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'Office',@Office_Was, @Office_Is);

		IF @Title_Was <> @Title_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'User','Updated',@User,@FullName,'Title',@Title_Was, @Title_Is);

		UPDATE [#Tb_Mon_Task3] SET [Processed] = 1 WHERE [ADGUID] = @ADGUID;

	End;

	--This will only run the update if there are updates to run and only runs once instead of for each item in the list
	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [ADCreated_Was] <> [ADCreated_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[ADCreatedOn]				= T1.[ADCreated_Is]
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[ADCreated_Was] <> T1.[ADCreated_Is];
	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [ADUsername_Was] <> [ADUsername_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[ADUsername]				= T1.[ADUsername_Is]
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[ADUsername_Was] <> T1.[ADUsername_Is];
	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [ADDisabled_Was] <> [ADDisabled_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[ADDisabled]				= 1,
			[HideFromList]				= 1,
			[Locked]					= 1
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[ADDisabled_Was] <> T1.[ADDisabled_Is]
		AND T1.[ADDisabled_Is] = 1;

		UPDATE [Tb_Users] SET 
			[ADDisabled]				= 0
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[ADDisabled_Was] <> T1.[ADDisabled_Is]
		AND T1.[ADDisabled_Is] = 0;

	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [Forenames_Was] <> [Forenames_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[Forenames]				= T1.[Forenames_Is]
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[Forenames_Was] <> T1.[Forenames_Is];
	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [Surname_Was] <> [Surname_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[Surname]				= T1.[Surname_Is]
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[Surname_Was] <> T1.[Surname_Is];
	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [Email_Was] <> [Email_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[Email]				= T1.[Email_Is]
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[Email_Was] <> T1.[Email_Is];
	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [Department_Was] <> [Department_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[Department]				= T1.[Department_Is]
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[Department_Was] <> T1.[Department_Is];
	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [DistinguishedName_Was] <> [DistinguishedName_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[DistinguishedName]				= T1.[DistinguishedName_Is]
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[DistinguishedName_Was] <> T1.[DistinguishedName_Is];
	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [DistinguishedManager_Was] <> [DistinguishedManager_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[DistinguishedManager]				= T1.[DistinguishedManager_Is]
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[DistinguishedManager_Was] <> T1.[DistinguishedManager_Is];

		UPDATE [Tb_Users] SET 
			[Manager]				= T2.[ID]
		FROM 
			[Tb_Users] T1
		INNER JOIN (SELECT [ID], [DistinguishedName] FROM [Tb_Users]) T2 ON T1.[DistinguishedManager] = T2.[DistinguishedName]
		WHERE
			T1.[ID] IN (SELECT [ID] FROM [#Tb_Mon_Task3] WHERE [DistinguishedManager_Was] <> [DistinguishedManager_Is]);
	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [Office_Was] <> [Office_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[Office]				= T1.[Office_Is]
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[Office_Was] <> T1.[Office_Is];
	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3] WHERE [Title_Was] <> [Title_Is]) > 0 
	BEGIN
		UPDATE [Tb_Users] SET 
			[Title]				= T1.[Title_Is]
		FROM 
			[#Tb_Mon_Task3] T1
		WHERE
			[Tb_Users].[ID] = T1.[ID]
		AND T1.[Title_Was] <> T1.[Title_Is];
	END
	
END;
	
--Create temp table
CREATE TABLE #Tb_Mon_Task3_2
([ID]				int NULL,
[ADGUID]			varchar(50) NULL,
[Device_Was]		VARCHAR(255) NULL, 
[Device_Is]			VARCHAR(255) NULL, 
[OSID_Was]			INT NULL, 
[OSID_Is]			INT NULL, 
[OS_Was]			VARCHAR(255) NULL, 
[OS_Is]				VARCHAR(255) NULL, 
[OSV_Was]			VARCHAR(255) NULL, 
[OSV_Is]			VARCHAR(255) NULL, 
[ADDisabled_Was]	INT NULL,
[ADDisabled_Is]		INT NULL,
[Processed]			BIT NOT NULL);

--First try and connect any unconnected assets
UPDATE [Tb_AR] SET 
	[ADGUID] = T2.[ADGUID]
FROM
	[Tb_AR] T1
LEFT OUTER JOIN [Tb_ARs] A	ON A.[ID] = T1.[LnkARID]
INNER JOIN (select 
				convert(varchar(50),convert(uniqueidentifier, AD.[objectGUID]))	AS [ADGUID],
				AD.[cn]															AS [Device]
			from 
				OpenQuery (AD, 'SELECT objectGUID,cn FROM ''LDAP://dc=hayman,dc=local'' 
					WHERE objectCategory = ''computer'' AND objectClass = ''computer'' AND ''userAccountControl:1.2.840.113556.1.4.803:'' <> 2 ') AD
			UNION
			select 
				convert(varchar(50),convert(uniqueidentifier, AD.[objectGUID]))	AS [ADGUID],
				AD.[cn]															AS [Device]
			from 
				OpenQuery (AD, 'SELECT objectGUID,cn FROM ''LDAP://dc=hayman,dc=local'' 
					WHERE objectCategory = ''computer'' AND objectClass = ''computer'' AND ''userAccountControl:1.2.840.113556.1.4.803:'' = 2 ') AD) T2 ON T2.[Device] = CASE ISNULL(T1.[Name],'') WHEN '' THEN A.[Shortcode] + '-' + right('0000' + convert(varchar(10),T1.[Number]),4)  ELSE T1.[Name] END
WHERE
	ISNULL(T1.[ADGUID],'') = ''
AND	T1.[Deleted] = 1;

--UPDATE [Tb_AR] SET [Name] = [AssetRef] WHERE ISNULL([ADGUID],'') <> '' AND ISNULL([Name],'') = ''
UPDATE [Tb_AR] SET 
	[Name] = A.[Shortcode] + '-' + right('0000' + convert(varchar(10),T1.[Number]),4)
FROM
	[Tb_AR] T1
LEFT OUTER JOIN [Tb_ARs] A ON A.[ID] = T1.[LnkARID] 
WHERE
	ISNULL(T1.[ADGUID],'') <> '' 
AND ISNULL(T1.[Name],'') = ''
AND T1.[Deleted] = 0;

--Populate list of all current details
INSERT INTO #Tb_Mon_Task3_2 ([ID],[ADGUID],[Device_Was],[OSID_Was],[OS_Was],[OSV_Was],[ADDisabled_Was],[Processed])
SELECT 
	A.[ID],
	A.[ADGUID],
	A.[Name],
	A.[LnkOSID]					AS [OS],
	O.[Name],
	O.[Version],
	A.[ADDisabled],
	0 
FROM 
				[Tb_AR]		A 
LEFT OUTER JOIN [Tb_OSs]	O ON A.[LnkOSID] = O.[ID] 
WHERE 
	ISNULL(A.[LnkOSID],0) <> 0 
AND O.[Developer] = 'Microsoft'
AND ISNULL(A.[ADGUID],'') <> '';

--Insert new details
--First we sync HICS Users with AD
UPDATE [#Tb_Mon_Task3_2] SET 
	[Device_Is] =		T2.[Device_Is],
	[OS_Is] =			T2.[OS_Is],
	[OSV_Is] =			T2.[OSV_Is],
	[ADDisabled_Is] =	T2.[ADDisabled]
FROM 
	[#Tb_Mon_Task3_2] T1
INNER JOIN (SELECT
				convert(varchar(50),convert(uniqueidentifier, AD.[objectGUID]))	AS [ADGUID],
				AD.[cn]															AS [Device_Is],
				ISNULL(AD.[operatingsystem],'')									AS [OS_Is], 
				ISNULL(AD.[operatingsystemversion],'')							AS [OSV_Is],
				0																AS [ADDisabled]
			FROM 
				OpenQuery (AD, 'SELECT objectGUID,cn,operatingsystem, operatingsystemversion FROM ''LDAP://dc=hayman,dc=local'' 
					WHERE objectCategory = ''computer'' AND objectClass = ''computer'' AND ''userAccountControl:1.2.840.113556.1.4.803:'' <> 2 ') AD
			UNION
			SELECT
				convert(varchar(50),convert(uniqueidentifier, AD.[objectGUID]))	AS [ADGUID],
				AD.[cn]															AS [Device_Is],
				ISNULL(AD.[operatingsystem],'')									AS [OS_Is], 
				ISNULL(AD.[operatingsystemversion],'')							AS [OSV_Is],
				1																AS [ADDisabled]
			FROM 
				OpenQuery (AD, 'SELECT objectGUID,cn,operatingsystem, operatingsystemversion FROM ''LDAP://dc=hayman,dc=local'' 
					WHERE objectCategory = ''computer'' AND objectClass = ''computer'' AND ''userAccountControl:1.2.840.113556.1.4.803:'' = 2 ') AD
			) T2 ON T1.[ADGUID] = T2.[ADGUID];

--Now we need to connect the IS ones to their respective OSID, or create the OSID if it is needed
UPDATE [#Tb_Mon_Task3_2] SET 
	[OSID_Is] =			O.[ID]
FROM 
	[Tb_OSs] O
WHERE
	O.[Developer] = 'Microsoft'
AND O.[Name] = [OS_Is]
AND O.[Version] = [OSV_Is]
AND O.[Deleted] = 0;

IF (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3_2] WHERE [OSID_Is] IS NULL) > 0 
BEGIN
	INSERT INTO [Tb_OSs] ([Developer],[Name],[Version],[Enabled]) (SELECT 'Microsoft',[OS_Is],[OSV_Is],1 FROM [#Tb_Mon_Task3_2] where [OSID_Is] IS NULL);

	UPDATE [#Tb_Mon_Task3_2] SET 
		[OSID_Is] =			O.[ID]
	FROM 
		[Tb_OSs] O
	WHERE
		O.[Developer] = 'Microsoft'
	AND O.[Name] = [OS_Is]
	AND O.[Version] = [OSV_Is]
	AND O.[Deleted] = 0;
END

--Clear off items with no change
Delete from [#Tb_Mon_Task3_2] 
WHERE 
	([Device_Was] = [Device_Is]
AND [OSID_Was] = [OSID_Is] 
AND ISNULL([ADDisabled_Was],2) = ISNULL([ADDisabled_Is],2))
OR [ADGUID] IS NULL



--Check there are changes to report on
IF (Select COUNT([ADGUID]) From [#Tb_Mon_Task3_2]) > 0
BEGIN
	--Insert the differences into the email table
	
	--YOU WERE HERE
	DECLARE @Device_Was		varchar(255) 
	DECLARE @Device_Is		varchar(255)
	DECLARE @OS_Was			varchar(255) 
	DECLARE @OS_Is			varchar(255) 
	DECLARE @OSV_Was		varchar(255) 
	DECLARE @OSV_Is			varchar(255) 
	
	While (Select COUNT([ADGUID]) From [#Tb_Mon_Task3_2] Where [Processed] = 0) > 0
	Begin
		Select Top 1
			@ADGUID =			[ADGUID],
			@Device_Was =		ISNULL([Device_Was],0),
			@Device_Is =		ISNULL([Device_Is],0),
			@OS_Was =			ISNULL([OS_Was],''),
			@OS_Is =			ISNULL([OS_Is],''),
			@OSV_Was =			ISNULL([OSV_Was],''),
			@OSV_Is =			ISNULL([OSV_Is],''),
			@ADDisabled_Was =	ISNULL([ADDisabled_Was],2),
			@ADDisabled_Is =	ISNULL([ADDisabled_Is],2)
		FROM 
			[#Tb_Mon_Task3_2] 
		WHERE 
			[Processed] = 0;
	
		SELECT @ID = [ID] FROM [Tb_AR] WHERE [ADGUID] = @ADGUID;

		IF @Device_Was <> @Device_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'Computer','',@Device_Is,'','Name',@Device_Was, @Device_Is);
		
		IF @OS_Was <> @OS_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'Computer','',@Device_Is,'','OS',@OS_Was, @OS_Is);

		IF @OSV_Was <> @OSV_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'Computer','',@Device_Is,'','OS Version',@OSV_Was, @OSV_Is);

		IF @ADDisabled_Was <> @ADDisabled_Is
			INSERT INTO [#Tb_Mon_Task3_Email] ([ID],[Type1],[Type2],[Data1],[Data2],[Area],[Was],[Is]) VALUES (@ID,'Computer','',@Device_Is,'','Disabled',CASE @ADDisabled_Was WHEN 0 THEN 'No' WHEN 1 THEN 'Yes' ELSE 'Unknown' END, CASE @ADDisabled_Is WHEN 0 THEN 'No' WHEN 1 THEN 'Yes' ELSE 'Unknown' END);

		UPDATE [#Tb_Mon_Task3_2] SET [Processed] = 1 WHERE [ADGUID] = @ADGUID;

	End;

	--This will only run the update if there are updates to run and only runs once instead of for each item in the list
	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3_2] WHERE [Device_Was] <> [Device_Is]) > 0 
	BEGIN
		UPDATE [Tb_AR] SET 
			[Name]				= T1.[Device_Is]
		FROM 
			[#Tb_Mon_Task3_2] T1
		WHERE
			[Tb_AR].[ID] = T1.[ID]
		AND T1.[Device_Was] <> T1.[Device_Is];
	END

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3_2] WHERE [OSID_Was] <> [OSID_Is]) > 0 
	BEGIN
		UPDATE [Tb_AR] SET 
			[LnkOSID]			= T1.[OSID_Is]
		FROM 
			[#Tb_Mon_Task3_2] T1
		WHERE
			[Tb_AR].[ID] = T1.[ID]
		AND T1.[OSID_Was] <> T1.[OSID_Is];
	END
	
	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task3_2] WHERE ISNULL([ADDisabled_Was],2) <> ISNULL([ADDisabled_Is],2)) > 0 
	BEGIN
		UPDATE [Tb_AR] SET 
			[ADDisabled]		= T1.[ADDisabled_Is]
		FROM 
			[#Tb_Mon_Task3_2] T1
		WHERE
			[Tb_AR].[ID] = T1.[ID]
		AND ISNULL(T1.[ADDisabled_Was],2) <> ISNULL(T1.[ADDisabled_Is],2);
	END

END;

--Update Supply chain
UPDATE
    [ASC_LIVE].[dbo].[SYS_PEOPLE]
SET
    [PP_FIRST_NAME]	= LEFT(T1.[Forenames],20),
	[PP_SURNAME]	= LEFT(T1.[Surname],20),
	[PP_EMAIL]		= LEFT(T1.[Email],64),
	[PP_JOB_TITLE]  = LEFT(T1.[Title],35),
	[PP_KNOWN_AS]	= LEFT(T1.[FullName],30)
FROM
	(SELECT	
		SC_L.[LnkSYS_PEOPLE_PP_CODE],
		U.[Forenames],
		U.[Surname],
		U.[Email],
		U.[Title],
		U.[FullName]
	FROM 
					[HICSDEV].[dbo].[vw_HICS_Users]	U
	INNER JOIN	[HICSDEV].[dbo].[Tb_SupplyChain_Links]	SC_L ON SC_L.[LnkUserID] = U.[ID]) T1
WHERE 
	[PP_CODE] 	= T1.[LnkSYS_PEOPLE_PP_CODE]
AND	(	[PP_FIRST_NAME]	<> LEFT(T1.[Forenames],20)
	OR	[PP_SURNAME]	<> LEFT(T1.[Surname],20)
	OR	[PP_EMAIL]		<> LEFT(T1.[Email],64)
	OR	[PP_JOB_TITLE]	<> LEFT(T1.[Title],35)
	OR	[PP_KNOWN_AS]	<> LEFT(T1.[FullName],30)
	)

--Update Gold-Vision
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;

--Get gold-Vision GUIDS
update 
	[Tb_Users]
set 
	[GVGUID] = GVU.[US_ID]
FROM 
			[Tb_Users] U
INNER JOIN	[GoldVisionCRM].[dbo].[USERS] GVU ON upper(U.[ADUsername]) = UPPER(GVU.[NT_ACCOUNT])
WHERE
	U.[GVGUID] IS NULL;

--Then update gold-Vision
UPDATE
	[GoldVisionCRM].[dbo].[USERS]
SET
    [FNAME]						= T1.[Forenames],
	[LNAME]						= T1.[Surname],
	[EMAIL_ADDRESS]				= T1.[Email],
	[NT_ACCOUNT]				= T1.[ADUsername],
	[UserJobTitle]				= T1.[Title],
	[EMAIL_SCAN_DETAILS]		= T1.[Email_Scan],
	[EMAIL_SCAN_FOLDERS]		= '*',
	[EMAIL_SCAN_APPOINTMENTS]	= 0,
	[EMAIL_SCAN_CONTACTS]		= 0,
	[EMAIL_SCAN_TASKS]			= 0
FROM
	(SELECT	
		U.[GVGUID],
		LEFT(ISNULL(U.[Forenames],' '),50)		AS [Forenames],
		LEFT(ISNULL(U.[Surname],' '),50)		AS [Surname],
		LEFT(ISNULL(U.[Email],' '),255)			AS [Email],
		LEFT(ISNULL(U.[ADUsername], ' '),100)	AS [ADUsername],		
		LEFT(ISNULL(U.[Title],' '),128)			AS [Title],
  		LEFT('library=exchange2007;server=https://clientaccess.hayman.co.uk/ews/exchange.asmx;mailbox=' + ISNULL(U.[Email],'') + ';ssl=false;ewsuser=hayman0\goldvision;ewspassword=YSRNei/+xE8lnO331ibitw==;dontimpersonate=no;allowselfcert=yes;exchangeversion=Exchange2013_SP1;smtpssl=false;useoauthforsmtp=False;',512) AS [Email_Scan]
		--LEFT('library=exchange2007;server=https://clientaccess.hayman.co.uk/ews/exchange.asmx;mailbox=' + ISNULL(U.[Email],'') + ';ssl=false;dontimpersonate=no;allowselfcert=yes;exchangeversion=Exchange2013_SP1;smtpssl=false;',512) AS [Email_Scan]
		--LEFT('library=exchange2007;server=https://exchange01/ews/exchange.asmx;mailbox=' + ISNULL(U.[Email],'') + ';ssl=false;dontimpersonate=no;allowselfcert=yes;smtpssl=false',512) AS [Email_Scan]
		--LEFT('library=exchange2007;server=https://clientaccess.hayman.co.uk/ews/exchange.asmx;mailbox=' + ISNULL(U.[Email],'') + ';ssl=false;dontimpersonate=no;allowselfcert=no;exchangeversion=Exchange2016;smtpssl=false',512) AS [Email_Scan]
		--LEFT('library=exchange2007;server=https://exch-01.hayman.local/ews/exchange.asmx;mailbox=' + ISNULL(U.[Email],''),512) AS [Email_Scan]
	FROM 
				[HICSDEV].[dbo].[Tb_Users]				U
	WHERE
		NOT U.[GVGUID] IS NULL) T1
WHERE 
    convert(varchar(50),convert(uniqueidentifier, [US_ID])) = T1.[GVGUID]
AND [US_DELETED] = 0
AND ([FNAME]					<> T1.[Forenames]
OR	[LNAME]						<> T1.[Surname]
OR	[EMAIL_ADDRESS]				<> T1.[Email]
OR	[UserJobTitle]				<> T1.[Title]
OR	[EMAIL_SCAN_APPOINTMENTS]	<> 0
OR	[EMAIL_SCAN_CONTACTS]		<> 0
OR	[EMAIL_SCAN_TASKS]			<> 0
OR	[EMAIL_SCAN_DETAILS]		<> T1.[Email_Scan]
OR	[EMAIL_SCAN_FOLDERS]		<> '*');

UPDATE
    [GoldVisionCRM].[dbo].[USERS]
SET
    [SHOW_ON_USERS]			= 0,
	[SHOW_ON_AC_MANAGER]	= 0,
	[SHOW_ON_SUPPORT]		= 0,
	[SHOW_ON_CALENDAR]		= 0
	--[ACCESS_ENABLED]		= 0
	--,[LICENCE_TYPE]			= '8C848D9C-E432-4A86-8D7E-2D9CA6FBE77B'
FROM
	(SELECT
		U.[GVGUID]
	FROM 
		[HICSDEV].[dbo].[Tb_Users]	U
	WHERE
		U.[ADDisabled] = 1
	AND NOT U.[GVGUID] IS NULL) T1
WHERE 
    convert(varchar(50),convert(uniqueidentifier, [US_ID])) = T1.[GVGUID]
AND [US_DELETED]			= 0
AND ([SHOW_ON_USERS]		<> 0
OR	[SHOW_ON_AC_MANAGER]	<> 0
OR	[SHOW_ON_SUPPORT]		<> 0
OR	[SHOW_ON_CALENDAR]		<> 0
--OR  [ACCESS_ENABLED]		<> 0
--OR	[LICENCE_TYPE]		<> '8C848D9C-E432-4A86-8D7E-2D9CA6FBE77B'
);

--Now to email
IF (Select COUNT([ID]) From [#Tb_Mon_Task3_Email]) > 0
BEGIN

	IF (Select COUNT([ID]) From [#Tb_Mon_Task3_Email] WHERE [Type1] = 'User') > 0
	BEGIN
		set @EMailBody =	'<p>The following users were created/updated in HICS, this data came from Active Directory, it will also propagate to Supply Chain and Gold-Vision where applicable.</p>' +
							'<p><table>' +  
							'<tr><th>ID</th><th>Type</th><th>User</th><th>Fullname</th><th>Area</th><th>Was</th><th>Is</th></tr>';
		set @EMailBody =	@EMailBody + CAST((	SELECT	
													[ID]	as [td],'',
													[Type2] as [td],'',
													[Data1] as [td],'', 
													[Data2] as [td],'',
													[Area] as [td],'',
													[Was] as [td],'',
													[Is] as [td],''
												FROM 
													[#Tb_Mon_Task3_Email] 
												WHERE
													[Type1] = 'User'
												ORDER BY 
													[Type2], 
													[Data1], 
													[Area] 
												FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX));
		set @EMailBody =	@EMailBody + '</table></p>';
		
		INSERT INTO [Tb_Mon_Emails] ([To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('','Created and updated users',@EMailBody,0,@RunID);
		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
		INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID, @TaskID,@RunID,[Data1] + ': ' + [Area] + ' was ' + '''' + [Was] + '''' + ', is now ' + '''' + [Is] + '''' FROM [#Tb_Mon_Task3_Email] WHERE [Type1] = 'User' ORDER BY [Type2], [Data1], [Area];

	END

	IF (Select COUNT([ID]) From [#Tb_Mon_Task3_Email] WHERE [Type1] = 'Computer') > 0
	BEGIN
		set @EMailBody =	'<p>The following assets were updated in HICS, this data came from Active Directory. Note that this process does not create assets in HICS, it will only update existing assets.</p>' +
							'<p><table>' +  
							'<tr><th>ID</th><th>Device</th><th>Area</th><th>Was</th><th>Is</th></tr>';
		set @EMailBody =	@EMailBody + CAST((	SELECT	
													[ID]	as [td],'',
													[Data1] as [td],'', 
													[Area] as [td],'',
													[Was] as [td],'',
													[Is] as [td],''
												FROM 
													[#Tb_Mon_Task3_Email] 
												WHERE
													[Type1] = 'Computer'
												ORDER BY 
													[Data1], 
													[Area] 
												FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX));
		set @EMailBody =	@EMailBody + '</table></p>';
		
		INSERT INTO [Tb_Mon_Emails] ([To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('','Updated computers',@EMailBody,0,@RunID);
		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
		INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID, @TaskID, @RunID, [Data1] + ': ' + [Area] + ' was ' + '''' + [Was] + '''' + ', is now ' + '''' + [Is] + '''' FROM [#Tb_Mon_Task3_Email] WHERE [Type1] = 'Computer' ORDER BY [Data1], [Area];

	END
END;

IF OBJECT_ID('tempdb..#Tb_Mon_Task3_Email') IS NOT NULL
	DROP TABLE #Tb_Mon_Task3_Email;

IF OBJECT_ID('tempdb..#Tb_Mon_Task3_2') IS NOT NULL
	DROP TABLE #Tb_Mon_Task3_2;

IF OBJECT_ID('tempdb..#Tb_Mon_Task3') IS NOT NULL
	DROP TABLE #Tb_Mon_Task3;

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task04]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task04]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @DTS DATETIME

SET @DTS = CONVERT(datetime, FORMAT(SYSDATETIME(),'yyyy-MMM-dd HH:mm:0')) 

INSERT INTO [HICSDEV].[dbo].[Tb_ASC_Licences2] ([DTS], [USER_ID],[USER_NAME]) (
SELECT @DTS AS [DTS], [USER_ID], [USER_NAME] FROM [AA_ACCESS_USER_MANAGEMENT].[dbo].[CURRENT_ACTIVITY] WITH (NOLOCK));

INSERT INTO [HICSDEV].[dbo].[Tb_ASC_Licences] ([DTS], [ActiveUsers]) (
SELECT @DTS AS [DTS], COUNT([ID]) AS [ActiveUsers] FROM [HICSDEV].[dbo].[Tb_ASC_Licences2] WITH (NOLOCK) WHERE [DTS] = @DTS);

DELETE FROM [HICSDEV].[dbo].[Tb_ASC_Licences] WHERE CONVERT(date, [DTS]) < DATEADD(dd,-60,convert(date,sysdatetime()));
DELETE FROM [HICSDEV].[dbo].[Tb_ASC_Licences2] WHERE CONVERT(date, [DTS]) < DATEADD(dd,-60,convert(date,sysdatetime()));
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task05]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task05]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task5') IS NOT NULL
	DROP TABLE #Tb_Mon_Task5;

CREATE TABLE #Tb_Mon_Task5
([OrderNo]			VARCHAR(30) NOT NULL,
[RaisedBy]			VARCHAR(30) NOT NULL,
[Customer]			VARCHAR(255) NOT NULL,
[CustomerRef]		VARCHAR(255) NOT NULL,
[Part]				VARCHAR(255) NOT NULL,
[OutstandingQty]	DECIMAL(15,5) NOT NULL,
[UoM]				VARCHAR(30) NOT NULL,
[OutstandingVal]	DECIMAL(15,5) NOT NULL,
[DueDate]			DATETIME NOT NULL);

INSERT INTO #Tb_Mon_Task5
SELECT 
	O.[OrderNum]																		AS [OrderNo],
	CASE ISNULL(U.[ID],'')
		WHEN '' THEN O.[OrderEnteredBy] COLLATE Latin1_General_CI_AS
		ELSE ISNULL(U.[Surname],'') + ', ' + ISNULL(U.Forenames,'')					
	END																					AS [RaisedBy],
	CASE ISNULL(C.[Code],'')
		WHEN '' THEN O.[CustomerCode] COLLATE Latin1_General_CI_AS
		ELSE ISNULL(C.[Code],'') + ': ' + ISNULL(C.[Name],'')			
	END																					AS [Customer],
	O.[CustomerOrderRef]																AS [CustomerRef],
	P.[Part] + ': ' + P.[Description1] + ' ' + P.[Description2]							AS [Part],
	O.[QuantityDelivered] - O.[QuantityInvoiced]										AS [OutstandingQty],
	P.[UoM]																				AS [UoM],
	CASE O.[PricePerPer]
		WHEN 0 THEN (O.[QuantityDelivered] - O.[QuantityInvoiced]) * O.[FinalPrice] 
		ELSE (O.[QuantityDelivered] - O.[QuantityInvoiced]) * (O.[FinalPrice] / O.[PricePerPer]) 
	END																					AS [OutstandingVal],
	O.[ExpectedDueDate]																	AS [DueDate]
FROM
				[vw_ASC_LIVE_Orders]		O
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]			P	ON	O.[Part]				= P.[Part]
LEFT OUTER JOIN	[vw_ASC_LIVE_Customers]		C	ON	O.[CustomerCode]		= C.[code] COLLATE Latin1_General_CI_AS
LEFT OUTER JOIN [Tb_SupplyChain_Links]		SCL	ON	O.[OrderEnteredBy]		= SCL.[LnkSYS_PEOPLE_PP_CODE]	COLLATE Latin1_General_CI_AS
LEFT OUTER JOIN [Tb_Users]					U	ON	SCL.[LnkUserID]			= U.[ID]					
WHERE
	O.[QuantityDelivered] > O.[QuantityInvoiced] 
AND O.[Part] <> 'ZDUTY' 
AND	O.[QuantityOrdered] > 0.00 
AND O.[Status] <> 'C'

If (SELECT COUNT(*) FROM [#Tb_Mon_Task5]) > 0
BEGIN
	
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	set @EMailBody =	'<p>Please find below a list of incompleted sales orders that have been desptached (either all or in part) but have not been invoiced. These orders should be completed or invoiced.</p>' +
						'<p><table>' +  
						'<tr><th>Order No.</th><th>Raised By</th><th>Customer</th><th>Customer Ref.</th><th>Part</th><th>Outstanding Qty.</th><th>UoM</th><th>Outstanding Val.</th><th>Due Date</th></tr>' +  
						CAST((SELECT 
								[OrderNo]								AS [td],'',
								[RaisedBy]								AS [td],'',
								[Customer]								AS [td],'',
								[CustomerRef]							AS [td],'',
								[Part]									AS [td],'',
								CONVERT(DECIMAL(15,2),[OutstandingQty])	AS [td],'',
								[UoM]									AS [td],'',
								CONVERT(DECIMAL(15,2),[OutstandingVal])	AS [td],'',
								CONVERT(VARCHAR(30),[DueDate],103)		AS [td],''
							FROM 
								[#Tb_Mon_Task5]
							ORDER BY
								[OrderNo],
								[Part]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>' +
						'<p>Total outstanding value is £' + (SELECT CONVERT(VARCHAR(30),CONVERT(DECIMAL(15,2),SUM([OutstandingVal]))) FROM [#Tb_Mon_Task5]) + '</p>'
						
	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','','Despatched but not invoiced', @EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT DISTINCT @EmailID,@TaskID,@RunID,[OrderNo] FROM [#Tb_Mon_Task5];

END;

DROP TABLE #Tb_Mon_Task5;

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task06]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task06]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS
DECLARE @ItemsFound INT

--Drop the temp table if it somehow exists (maybe from a crash)
IF OBJECT_ID('tempdb..#Tb_Mon_Task6') IS NOT NULL
	DROP TABLE #Tb_Mon_Task6;

--Create temp table
CREATE TABLE #Tb_Mon_Task6
([CreatedOn]		DATETIME NULL,
[ModifedOn]			DATETIME NULL,
[OrderNum]			INT NULL, 
[Email]				VARCHAR(255) NOT NULL,
[Processed]			BIT NOT NULL);

--Query that gets a list of all orders where it has a duty exempt flag of 2 but no authorisation number
INSERT INTO #Tb_Mon_Task6 
SELECT
	O.[CreatedOn],
	O.[ModifiedOn],
	O.[OrderNum], 
	CASE ISNULL(SP.[Email],'')
		WHEN '' THEN 'support@hgcompany.co.uk'
		ELSE SP.[Email]
	END	AS [EMail],
	0 AS [Processed]
FROM 
				[vw_ASC_LIVE_Orders]			O 
	INNER JOIN	[vw_ASC_LIVE_SystemPeople]		SP ON O.[OrderEnteredBy] COLLATE Latin1_General_CI_AS = SP.[Code]
WHERE 
	O.[DutyReason] IN (2,8) 
AND O.[Analysis9] = ''
AND O.[OrderNum] NOT IN (SELECT [Ref] FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID);

set @ItemsFound = (Select Count(*) From #Tb_Mon_Task6) 

IF @ItemsFound > 0
BEGIN
	DECLARE @LogText	varchar(1000)

	if @ItemsFound = 1
		set @LogText = '1 dutyable product has a reason for no duty code of ''2'' or ''8'' but no ''Authorisation no'', user will be notified'
	else
		set @LogText = concat(convert(varchar(10),@ItemsFound), ' dutyable products have a reason for no duty code of ''2'' or ''8'' but no ''Authorisation no'', user(s) will be notified')

	exec sp_Log @LogSrc, @LogCat, @LogProc, @LogText
	
END;

--Loop through temp table processing each entry, grouped by email address
While (Select Count(*) From #Tb_Mon_Task6 Where Processed = 0) > 0
Begin
  
    DECLARE @Email varchar(355)
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	Select Top 1 @Email = [Email] From #Tb_Mon_Task6 Where Processed = 0;
		
	set @EMailBody =	'<p>The following dutyable products have a reason for no duty code of ''2'' or ''8'' but no ''Authorisation no.''.</p>' +
						'<p><table>' +  
					    '<tr><th>Created</th><th>Updated</th><th>Order No.</th></tr>' +  
						CAST((SELECT	CONVERT(VARCHAR(30), [CreatedOn], 100) as [td],'', 
										CONVERT(VARCHAR(30), [CreatedOn], 100) as [td],'', 
										[OrderNum] as [td],''
							  FROM #Tb_Mon_Task6
							  WHERE [Email] = @Email
							  ORDER BY [OrderNum]
							  FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>';

	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain',@Email,'Missing ''Authorisation No.'' on dutyable content (that is not having duty applied)',@EMailBody,0,@RunID);
	--INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','garye@hgcompany.co.uk','Missing ''Authorisation No.'' on dutyable content (that is not having duty applied)',@EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID,[OrderNum] FROM #Tb_Mon_Task6 WHERE [Email] = @Email;
		
	Update #Tb_Mon_Task6 Set [Processed] = 1 Where [Email] = @Email 
	
End;

DROP TABLE #Tb_Mon_Task6;

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task07]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Mon_Task07]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS
IF OBJECT_ID('tempdb..#Tb_Mon_Task7') IS NOT NULL
DROP TABLE #Tb_Mon_Task7;

--Create temp table
CREATE TABLE #Tb_Mon_Task7
([Customer]			VARCHAR(512) NOT NULL,
[Order]				VARCHAR(512) NOT NULL,
[Part]				VARCHAR(512) NOT NULL,
[DueDate]			DATETIME NOT NULL, 
[Email]				VARCHAR(255) NOT NULL,
[Processed]			BIT NOT NULL);

--Query that gets a list of all orders where it has a duty exempt flag of 2 but no authorisation number
INSERT INTO #Tb_Mon_Task7
SELECT
	C.[Code] + ': ' + C.[Name]							AS [Customer],
	O.[OrderNum]										AS [Order],
	O.[Part]											AS [Part],
	O.[ExpectedDueDate]									AS [DueDate],
	case ISNULL(U.[Email],'')
		when '' then 'support@hgcompany.co.uk'
		else U.[Email]
	end 												AS [Email],
	0													AS [Processed]
FROM
					[vw_ASC_LIVE_Customers]			C
	INNER JOIN		[vw_ASC_LIVE_Orders]			O	ON O.[CustomerCode] = C.[Code] COLLATE Latin1_General_CI_AS
	LEFT OUTER JOIN [vw_ASC_LIVE_SystemPeople]		U	ON U.[Code] = O.[OrderEnteredBy] collate Latin1_General_CI_AS
WHERE
	O.[QuantityOrdered] > O.[QuantityDelivered]
	AND O.[Status] <> 'C'
	AND O.[ExpectedDueDate] < CONVERT(date, getdate())

--Loop through temp table processing each entry, grouped by email address
While (Select Count(*) From #Tb_mon_Task7 Where Processed = 0) > 0
Begin
  
    DECLARE @Email varchar(355)
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	Select Top 1 @Email = [Email] From #Tb_Mon_Task7 Where Processed = 0;
		
	set @EMailBody =	'<p>The following orders have an outstanding amount to be delivered, are not marked as complete, and the customer due date is less than today.</p>' +
						'<p><table>' +  
					    '<tr><th>Customer</th><th>Order No.</th><th>Part</th><th>Customer Due Date</th></tr>' +  
						CAST((SELECT	[Customer] AS [td],'',
										[Order] AS [td],'',
										[Part] AS [td],'',
										CONVERT(VARCHAR(30), [DueDate], 100) as [td],''
							  FROM #Tb_Mon_Task7
							  WHERE [Email] = @Email
							  ORDER BY
								[Customer],
								[Order],
								[Part]
							  FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>';

	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain',@Email,'Outstanding orders',@EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 and [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID,[Order] + ': ' + [Part] FROM #Tb_Mon_Task7 WHERE [Email] = @Email;
		
	Update #Tb_Mon_Task7 Set [Processed] = 1 Where [Email] = @Email 
	
End;

DROP TABLE #Tb_Mon_Task7;
	
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task08]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Mon_Task08]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task8') IS NOT NULL
DROP TABLE #Tb_Mon_Task8;

CREATE TABLE #Tb_Mon_Task8
([Part]				VARCHAR(30) NOT NULL,
[PartDesc]			VARCHAR(255) NOT NULL,
[Physical]			DECIMAL(20,5) NOT NULL);

INSERT INTO #Tb_Mon_Task8
SELECT
	P.[Part]									AS [Part],
	P.[Description1] + ' ' + P.[Description2]	AS [PartDesc],
	P.[PhysicalStockLevel]						AS [Physical]
FROM
	[vw_ASC_LIVE_Parts]		P
WHERE
	P.[ProcurementCode] = '0'
AND P.[Part] NOT IN (SELECT [Ref] COLLATE Latin1_General_CI_AS FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID);

If (SELECT COUNT([Part]) FROM [#Tb_Mon_Task8]) > 0
BEGIN
	
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	set @EMailBody =	'<p>Please find below a list of newly phantomised parts.</p>' +
						'<p><table>' +  
						'<tr><th>Part</th><th>Description</th><th>Physical Qty.</th></tr>' +  
						CAST((SELECT 
								[Part]								AS [td],'',
								[PartDesc]							AS [td],'',
								[Physical]							AS [td],''
							FROM 
								[#Tb_Mon_Task8]
							ORDER BY
								[Part]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>' 
						
	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('Supply Chain','','Phantomised parts', @EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 and [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID, @RunID, [Part] FROM [#Tb_Mon_Task8];

END;

DROP TABLE #Tb_Mon_Task8;
	
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task09]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_Mon_Task09]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task9') IS NOT NULL
	DROP TABLE #Tb_Mon_Task9;

DECLARE @DTEToday	DATE
DECLARE @DTEEarly	DATE

SELECT @DTEToday = CONVERT(DATE,SYSDATETIME())
SELECT @DTEEarly = DATEADD(YYYY,-2,@DTEToday)

CREATE TABLE #Tb_Mon_Task9
(
[Part]				VARCHAR(16) NOT NULL,
[Description]		VARCHAR(500) NOT NULL,
[Created]			DATE NOT NULL,
[LastMovement]		DATE NOT NULL,
[HasLot]			INT NOT NULL,
[Processed]			INT NOT NULL);

INSERT INTO #Tb_Mon_Task9
SELECT 
	T2.[Part],
	P.[Description1] + ' ' + P.[Description2]	AS [Description],
	CONVERT(DATE,P.[CreatedOn])					AS [Created],
	T2.[LastMovement],
	0											AS [HasLot],
	0											AS [Processed]
FROM 
	(SELECT 
		T1.[Part],
		MAX(ISNULL(T1.[Date],T1.[CreatedOn]))		AS [LastMovement]
	FROM
		(SELECT
			P.[Part], P.[CreatedOn],
			CONVERT(DATE,(SELECT MAX([CreatedOn]) FROM [vw_ASC_LIVE_PartAudit] WHERE [Type] = P.[Part] and [Type] = 'C' and [File] = 'IT')) AS [Date]
		FROM
			[vw_ASC_LIVE_Parts] P WHERE P.[ProcurementCode] <> '0' AND P.[PhysicalStockLevel] = 0
		UNION
		select 
			P.[Part], P.[CreatedOn],
			CONVERT(DATE,(SELECT MAX([CreatedOn]) FROM [vw_ASC_LIVE_Orders] WHERE [Part] = P.[Part])) AS [Date]
		FROM
			[vw_ASC_LIVE_Parts] P WHERE P.[ProcurementCode] <> '0' AND P.[PhysicalStockLevel] = 0
		UNION
		select 
			P.[Part], P.[CreatedOn],
			CONVERT(DATE,(SELECT MAX([CreatedOn]) FROM [vw_ASC_LIVE_PurchaseOrders] WHERE [Part] = P.[Part])) AS [Date]
		FROM
			[vw_ASC_LIVE_Parts] P WHERE P.[ProcurementCode] <> '0' AND P.[PhysicalStockLevel] = 0
		UNION
		SELECT
			P.[Part], P.[CreatedOn],
			CONVERT(DATE,(select MAX([CreatedOn]) FROM [vw_ASC_LIVE_Picknotes] WHERE [OrderID] IN (SELECT [ID] FROM [vw_ASC_LIVE_Orders] WHERE [Part] = P.[Part]))) AS [Date]
		FROM
			[vw_ASC_LIVE_Parts] P WHERE P.[ProcurementCode] <> '0' AND P.[PhysicalStockLevel] = 0
		UNION
		SELECT
			P.[Part], P.[CreatedOn],
			CONVERT(DATE,(SELECT MAX([CreatedOn]) FROM [vw_ASC_LIVE_WorksOrders] WHERE [Part] = P.[Part])) AS [Date]
		FROM
			[vw_ASC_LIVE_Parts] P WHERE P.[ProcurementCode] <> '0' AND P.[PhysicalStockLevel] = 0
		UNION
		SELECT
			P.[Part], P.[CreatedOn],
			CONVERT(DATE,(SELECT MAX(T1.[Date]) FROM 
			(SELECT MAX([CreatedOn]) AS [Date] FROM [vw_ASC_LIVE_Lots] WHERE [Part] = P.[Part]
			UNION
			SELECT MAX([Date]) AS [Date] FROM [vw_ASC_LIVE_LotHistory] WHERE [Part] = P.[Part]) T1)) AS [Date]
		FROM
			[vw_ASC_LIVE_Parts] P WHERE P.[ProcurementCode] <> '0' AND P.[PhysicalStockLevel] = 0
		UNION
		SELECT
			P.[Part], P.[CreatedOn],
			CONVERT(DATE,(SELECT MAX([CreatedOn]) FROM [vw_ASC_LIVE_PartAudit] WHERE [Part] = P.[Part])) AS [Date]
		FROM
			[vw_ASC_LIVE_Parts] P WHERE P.[ProcurementCode] <> '0' AND P.[PhysicalStockLevel] = 0
		) T1
	GROUP BY
		T1.[Part]) T2	
LEFT OUTER JOIN [vw_ASC_LIVE_Parts] P ON P.[Part] = T2.[Part]
WHERE
	T2.[LastMovement] < @DTEEarly

UPDATE [#Tb_Mon_Task9] SET [HasLot] = 1 WHERE [Part] IN (SELECT DISTINCT [Part] FROM [vw_ASC_LIVE_Lots])

If (SELECT COUNT([Part]) FROM [#Tb_Mon_Task9]) > 0
BEGIN
	
	DECLARE @Part VARCHAR(20)
	DECLARE @From varchar(20)
	DECLARE @To varchar(20)
	DECLARE @Dte as datetime

	SET @Dte = SYSDATETIME()
	SET @Dte = dateadd(MILLISECOND,-DATEPART(MILLISECOND,@dte),@Dte)

	WHILE (SELECT COUNT([Processed]) FROM [#Tb_Mon_Task9] WHERE [Processed] = 0 and [HasLot] = 0) <> 0
	BEGIN

		SET @Part = (SELECT MIN([Part]) FROM [#Tb_Mon_Task9] WHERE [Processed] = 0 and [HasLot] = 0)

		INSERT INTO [ASC_LIVE].[dbo].[ASC_AUD_TBL] ([AUD_SOURCE_IND],[AUD_REC_TYPE],[AUD_WHEN],[AUD_SUB],[AUD_USER],[AUD_TYPE],[AUD_FILE],[AUD_FIELD],[AUD_OLD_VALUE],[AUD_NEW_VALUE],[AUD_OPTION]) 
		(SELECT 2,@Part,@Dte,1,'SA','C','IT','Procurement Code',ISNULL([ProcurementCode],''),'0','IL' FROM [vw_ASC_LIVE_Parts] WHERE [Part] COLLATE Latin1_General_CI_AS  = @Part)
		
		SET @From = (select CONVERT(VARCHAR(4),YEAR(ISNULL([EndDate],0))) + RIGHT('00' + CONVERT(VARCHAR(2),MONTH(ISNULL([EndDate],0))),2) + RIGHT('00' + CONVERT(VARCHAR(2),DAY(ISNULL([EndDate],0))),2) FROM [vw_ASC_LIVE_Parts] WHERE [Part] = @Part)
		SET @To = (select CONVERT(VARCHAR(4),YEAR(@DTEToday)) + RIGHT('00' + CONVERT(VARCHAR(2),MONTH(@DTEToday)),2) + RIGHT('00' + CONVERT(VARCHAR(2),DAY(@DTEToday)),2))
		INSERT INTO [ASC_LIVE].[dbo].[ASC_AUD_TBL] ([AUD_SOURCE_IND],[AUD_REC_TYPE],[AUD_WHEN],[AUD_SUB],[AUD_USER],[AUD_TYPE],[AUD_FILE],[AUD_FIELD],[AUD_OLD_VALUE],[AUD_NEW_VALUE],[AUD_OPTION]) 
		VALUES (2,@Part,@Dte,2,'SA','C','IT','Effective off date',@From,@To,'IL')

		INSERT INTO [ASC_LIVE].[dbo].[ASC_AUD_TBL] ([AUD_SOURCE_IND],[AUD_REC_TYPE],[AUD_WHEN],[AUD_SUB],[AUD_USER],[AUD_TYPE],[AUD_FILE],[AUD_FIELD],[AUD_OLD_VALUE],[AUD_NEW_VALUE],[AUD_OPTION]) 
		(SELECT 2,@Part,@Dte,3,'SA','C','IT','Approved for sale',ISNULL([AppSale],''),'N','IL' FROM [vw_ASC_LIVE_Parts] WHERE [Part] COLLATE Latin1_General_CI_AS  = @Part)

		UPDATE [#Tb_Mon_Task9] SET [Processed] = 1 where [Part] = @Part
	END

	UPDATE [ASC_LIVE].[dbo].[ASC_PMA_TBL] SET [PMA_PROC_CODE] = '0', [PMA_EFFECT_DATE_OFF] = @DTEToday, [PMA_APP_SALE] = 'N' where [PMA_PART_ONLY] in (SELECT [Part] COLLATE Latin1_General_CI_AS FROM [#Tb_Mon_Task9] WHERE [HasLot] = 0)

	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int
	DECLARE @StringDateToday as varchar(11)

	SELECT @StringDateToday = RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(dd,@DTEToday)),2) + '/' + 
	CONVERT(VARCHAR(3),(SELECT 
		CASE DATEPART(M,@DTEToday)
			WHEN 1 THEN 'Jan'
			WHEN 2 THEN 'Feb'
			WHEN 3 THEN 'Mar'
			WHEN 4 THEN 'Apr'
			WHEN 5 THEN 'May'
			WHEN 6 THEN 'Jun'
			WHEN 7 THEN 'Jul'
			WHEN 8 THEN 'Aug'
			WHEN 9 THEN 'Sep'
			WHEN 10 THEN 'Oct'
			WHEN 11 THEN 'Nov'
			WHEN 12 THEN 'Dec'		
		END)) + '/' + CONVERT(VARCHAR(4),DATEPART(YYYY,@DTEToday))
	
	set @EMailBody =	'<p>Please find below a list of parts that have been phantomised, had their ' + '''' + 'effective to' + '''' + ' date set to today (' + @StringDateToday + '), and had their ' + '''' + 'Approved for sale' + '''' + ' status set as unticked.</p>' +
						'<p>These parts were altered because there has been no movement of the part in over 2 years and there is no stock of it. Areas of the system that are checked are ' + 
						'''' + 'Audited part fields' + '''' + ', ' + '''' + 'Sales' + '''' + ', ' + '''' + 'Purchases' + '''' + ', ' + '''' + 'Pick notes' + '''' + ', ' + 
						'''' + 'Works orders' + '''' + ', ' + '''' + 'Lots (including lot history)' + '''' + ', and ' + '''' + 'History' + '''' + '.</p>' +
						'<p><table>' +  
						'<tr><th>Part</th><th>Description</th><th>Created</th><th>Last Movement</th></tr>' +  
						CAST((SELECT
								[Part]			AS [td],'',
								[Description]	AS [td],'',
								[Created]		AS [td],'',
								[LastMovement]	AS [td],''
							FROM 
								[#Tb_Mon_Task9]
							WHERE
								[HasLot] = 0
							ORDER BY
								[Part] 
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>' 
	
	IF (SELECT COUNT([Processed]) FROM [#Tb_Mon_Task9] WHERE [HasLot] = 1) <> 0
	BEGIN
		set @EMailBody = @EMailBody +'<p></><p>The below would have been phantomised but there are lots in the system (meaning a variance between the stock physical and lot physical). The lots of these parts should be reviewed and removed if they are no longer valid.</p>' +
						'<p><table>' +  
						'<tr><th>Part</th><th>Description</th><th>Lot count</th><th>Lots physical</th></tr>' +  
						CAST((SELECT
								T9.[Part]			AS [td],'',
								T9.[Description]	AS [td],'',
								COUNT([ID])			AS [td],'',
								SUM([ID])			AS [td],''
							FROM 
											[#Tb_Mon_Task9]		T9
							LEFT OUTER JOIN [vw_ASC_LIVE_Lots]	L	ON T9.[Part] = L.[Part]
							WHERE
								T9.[HasLot] = 1
							GROUP BY
								T9.[Part],
								T9.[Description]
							ORDER BY
								T9.[Part] 
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>'
	END

	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('Supply Chain','','Phantomised parts', @EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID, @RunID, [Part] + CASE [HasLot] WHEN 1 THEN ' (Lots exist)' ELSE '' END  FROM [#Tb_Mon_Task9];

END;

DROP TABLE #Tb_Mon_Task9;
	
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task10]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task10]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task10') IS NOT NULL
DROP TABLE #Tb_Mon_Task10;

CREATE TABLE #Tb_Mon_Task10
([PO Number]	VARCHAR(30) NOT NULL,
[Order Date]	VARCHAR(30) NOT NULL,
[Order Value]	DECIMAL(15,2) NOT NULL,
[Supplier]		VARCHAR(255) NOT NULL,
[OrderByDate]	DATETIME NOT NULL);

INSERT INTO #Tb_Mon_Task10
SELECT
	P.[OrderNumber]																	AS [PO Number],
	CONVERT(VARCHAR(30), P.[OrderDate], 103)										AS [Order Date],
	CONVERT(DECIMAL(15,2),sum(P.[QuantityOrdered] * (P.[Value] / P.[Per])))			AS [Order Value],
	P.[Supplier] + ': ' + ISNULL(S.[Name],'')										AS [Supplier],
	P.[OrderDate]																	AS [OrderByDate]
FROM
	[vw_ASC_LIVE_PurchaseOrders]				P
LEFT OUTER JOIN [vw_ASC_LIVE_Suppliers1]		S ON	P.[Supplier] 	= S.[Code] 
WHERE
	P.[OrderNumber] NOT IN (SELECT [Ref] FROM [Tb_Mon_Email_Items]  WHERE [LnkTaskID] = 10)
GROUP BY
	P.[OrderNumber],
	P.[OrderDate],
	P.[Supplier] + ': ' + ISNULL(S.[Name],'') 
HAVING
	sum(P.[QuantityOrdered] * (P.[Value] / P.[Per])) > 50000;

If (SELECT COUNT(*) FROM [#Tb_Mon_Task10]) > 0
BEGIN
	
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int
		
	set @EMailBody =	'<p>Please find below a list of purchase orders with a total value greater than £50,000.</p>' +
						'<p><table>' +  
						'<tr><th>PO Number</th><th>Order Date</th><th>Order Value</th><th>Supplier</th></tr>' +  
						CAST((SELECT 
								[PO Number]		AS [td],'',
								[Order Date]	AS [td],'',
								[Order Value]	AS [td],'',
								[Supplier]		AS [td],''
							FROM 
								[#Tb_Mon_Task10]
							ORDER BY
								[OrderByDate]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>'
						
	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('Supply Chain','','Purchase Orders over 50K',@EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND  [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [PO Number] FROM [#Tb_Mon_Task10];

END;

DROP TABLE #Tb_Mon_Task10;
	
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task11]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task11]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task11') IS NOT NULL
DROP TABLE #Tb_Mon_Task11;

IF OBJECT_ID('tempdb..#Tb_Mon_Task11_1') IS NOT NULL
DROP TABLE #Tb_Mon_Task11_1;

CREATE TABLE #Tb_Mon_Task11_1
([CustomsGroup]		VARCHAR(20) NULL,
[Type]				VARCHAR(20) NULL,
[Analysis4]			VARCHAR(20) NULL,
[UoM]				VARCHAR(20) NULL,
[Quantity]			DECIMAL(15,5) NULL,
[LotGroup]			VARCHAR(20) NULL,
[RRP]				DECIMAL(15,5) NULL, 
[AllocTolerance]	DECIMAL(15,5) NULL, 
[Capacity]			DECIMAL(15,5) NULL,
[LotNum]			INT NULL,
[A10Value]			DECIMAL(15,5) NULL, 
[A20Value]			DECIMAL(15,5) NULL, 
[A30Value]			DECIMAL(15,5) NULL);

CREATE TABLE #Tb_Mon_Task11
([CustomsGroup]	VARCHAR(20) NOT NULL,
[Type]			VARCHAR(20) NOT NULL,
[RecalcLoA]		DECIMAL(15,5) NOT NULL,
[Bulk]			DECIMAL(15,5) NOT NULL,
[AttLoA]		DECIMAL(15,5) NOT NULL, 
[Descrepancy]	DECIMAL(15,5) NOT NULL);


INSERT INTO #Tb_Mon_Task11_1
SELECT 
	CASE 
		WHEN P.[Analysis4] IN ('1', '2', '3') THEN 'Whisky'
		WHEN P.[Analysis4] = 'MW' THEN 'Made wine'
		WHEN P.[Analysis4] = 'W' THEN 'Wine'
		WHEN P.[Analysis4] IN ('4', '5', '6', '7', '8', '9', 'EU') THEN 'Spirits'
		ELSE 'Unknown'
	END						AS [CustomsGroup],
	CASE LEFT(P.[Part],1) 
		WHEN 'B' THEN 'Bulk' 
		ELSE 'Filled'
	END						AS [Type],
	P.[Analysis4],
	P.[UoM],
	L.[Quantity],
	P.[LotGroup],
	P.[RRP],
	P.[AllocTolerance],
	P.[Capacity],
	L.[Number],
	A10.[Value]				AS [A10Value],
	A20.[Value]				AS [A20Value],
	A30.[Value]				AS [A30Value]
FROM 
				[vw_ASC_LIVE_Lots]						L
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]						P	ON	L.[Part]		= P.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_Attributes]				A10 ON	L.[Part] = A10.[Part]
															AND L.[Number] = A10.[Lot]
															AND L.[Sequence] = A10.[LotSequence]
															AND A10.[CodeSequence] = 10
LEFT OUTER JOIN [vw_ASC_LIVE_Attributes]				A20 ON	L.[Part] = A20.[Part]
															AND L.[Number] = A20.[Lot]
															AND L.[Sequence] = A20.[LotSequence]
															AND A20.[CodeSequence] = 20
LEFT OUTER JOIN [vw_ASC_LIVE_Attributes]				A30 ON	L.[Part] = A30.[Part]
															AND L.[Number] = A30.[Lot]
															AND L.[Sequence] = A30.[LotSequence]
															AND A30.[CodeSequence] = 30
WHERE
	LEFT(P.[Part],1) in ('F', 'R', 'B', 'D') 
AND LEFT(L.[SerialNo],3) <> 'BAL'
AND P.[Analysis4] <> 'N'
AND NOT L.[Warehouse] in ('WD', 'WP', 'TH', 'O', 'OT', 'MP', 'PB', 'WN', 'RN', 'RM', 'HH', 'HD')
AND L.[Quantity] > 0

if (SELECT COUNT(*) FROM #Tb_Mon_Task11_1) > 0
BEGIN

	INSERT INTO #Tb_Mon_Task11
	SELECT 
		T1.[CustomsGroup],
		T1.[Type],
		SUM(ISNULL(T1.[RecalcLoA],0)) AS [RecalcLoA],
		SUM(ISNULL(T1.[Bulk],0))		AS [Bulk],
		SUM(ISNULL(T1.[AttLoA],0))	AS [AttLoA],
		SUM(ISNULL(T1.[RecalcLoA],0) - ISNULL(T1.[AttLoA],0)) AS [Descrepancy]
	FROM 
		(SELECT 
			[CustomsGroup],
			[Type],
			CASE 
				WHEN [Analysis4] IN ('W', 'MW') THEN 0
				WHEN [UoM] = 'LA' THEN [Quantity]
				WHEN [LotGroup] = 'BONDED' THEN
					CASE WHEN [UoM] = 'MT' THEN [Quantity] * [RRP] * [AllocTolerance] / 100 
						ELSE [Quantity] * [Capacity] * 1 * [AllocTolerance] / 100
					END
				WHEN [LotGroup] = 'BONDBULK' THEN [Quantity]/([A10Value] * [A20Value]) * 100 
				ELSE 0
			END						AS [RecalcLoA],
			CASE [UoM] 
				WHEN 'MT' THEN [Quantity] * [RRP] 
				WHEN 'LT' THEN [Quantity]
				WHEN 'LA' THEN [Quantity] * [Capacity] * 100 / ([A10Value] * [A20Value]) 
				ELSE [Quantity] * [Capacity]
			END						AS [Bulk],
			CASE 
				WHEN [Analysis4] IN ('W','MW') THEN 0
				WHEN [LotGroup] = 'BONDBULK' THEN [Quantity]
				WHEN [UoM] = 'LA' THEN [Quantity]
				ELSE [A30Value]
			END						AS [AttLoA]
		FROM 
			#Tb_Mon_Task11_1) T1
	GROUP BY
		T1.[CustomsGroup],
		T1.[Type]
	ORDER BY
		T1.[CustomsGroup],
		T1.[Type];

	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int
		
	set @EMailBody =	'<p>Please find below the ''Current Stock (Set Lev)'' data.</p>' +
						'<p><table>' +  
						'<tr><th>Customs Group</th><th>Type</th><th>RecalcLoA</th><th>AttLoA</th><th>Discrepancy</th><th>Bulk</th></tr>' +  
						CAST((SELECT 
								[CustomsGroup] AS [td],'',
								[Type] AS [td],'',
								CAST(CAST([RecalcLoA] AS decimal(10,2)) AS VARCHAR(50)) AS [td],'',
								CASE [Type]
									WHEN 'Total' THEN CAST(CAST([AttLoA] AS decimal(10,2)) AS VARCHAR(50)) 
									ELSE ''
								END AS [td],'',
								CASE [Type]
									WHEN 'Total' THEN CAST(CAST([Descrepancy] AS decimal(10,2)) AS VARCHAR(50)) 
									ELSE ''
								END AS [td],'',
								CAST(CAST([Bulk] AS decimal(10,2)) AS VARCHAR(50)) AS [td],''
							FROM 
								(select * from #Tb_Mon_Task11
								UNION ALL
								SELECT 
									[CustomsGroup],
									'Total'	AS [Type],
									SUM([RecalcLoA]) AS [RecalcLoA],
									SUM([Bulk]) AS [Bulk], 
									SUM([AttLoA]) AS [AttLoA], 
									SUM([Descrepancy]) AS [Descrepancy]
								FROM 
									#Tb_Mon_Task11
								GROUP BY
									[CustomsGroup]) T1
								ORDER BY
									T1.[CustomsGroup],
									T1.[Type]
								FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>' +
						'<p></p>' +
						'<p>Total lines with attributes: ' + (SELECT CAST(COUNT([A10Value]) AS VARCHAR(50)) FROM #Tb_Mon_Task11_1) +'</p>' + 
						'<p>Total lines: ' + (SELECT CAST(COUNT([LotNum]) AS VARCHAR(50)) FROM #Tb_Mon_Task11_1) +'</p>';

	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','','Current Stock (Set Lev)',@EMailBody,0,@RunID);

END

DROP TABLE #Tb_Mon_Task11_1;
DROP TABLE #Tb_Mon_Task11;
	
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task12]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task12]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task12') IS NOT NULL
DROP TABLE #Tb_Mon_Task12;

CREATE TABLE #Tb_Mon_Task12
([SO Number]	VARCHAR(30) NOT NULL,
[Order Date]	VARCHAR(30) NOT NULL,
[Order Value]	DECIMAL(15,2) NOT NULL,
[Customer]		VARCHAR(255) NOT NULL,
[OrderByDate]	DATE NOT NULL);

INSERT INTO #Tb_Mon_Task12
SELECT
	O.[OrderNum]																								AS [SO Number],
	CONVERT(DATE,O.[CreatedOn],100)																				AS [Order Date],
	SUM(O.[QuantityOrdered] * (O.[FinalPrice] / CASE O.[PricePerPer] WHEN 0 THEN 1 ELSE O.[PricePerPer] END))	AS [Order Value],
	CONVERT(VARCHAR(10),C.[Code]) + ': ' + ISNULL(C.[Name],'')													AS [Customer],
	O.[CreatedOn]																								AS [OrderByDate]
FROM
					[vw_ASC_LIVE_Orders]	O
LEFT OUTER JOIN		[vw_ASC_LIVE_Customers]	C ON O.[CustomerCode] = C.[Code]
WHERE
	O.[OrderNum] NOT IN (SELECT [Ref] FROM [Tb_Mon_Email_Items]  WHERE [LnkTaskID] = @TaskID)
GROUP BY
	O.[OrderNum],
	O.[CreatedOn],
	CONVERT(VARCHAR(10),C.[Code]) + ': ' + ISNULL(C.[Name],'')
HAVING
	SUM(O.[QuantityOrdered] * (O.[FinalPrice] / CASE O.[PricePerPer] WHEN 0 THEN 1 ELSE O.[PricePerPer] END)) > 200000;

If (SELECT COUNT(*) FROM [#Tb_Mon_Task12]) > 0
BEGIN
	
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	set @EMailBody =	'<p>Please find below a list of sales orders with a total value greater than £200,000.</p>' +
						'<p><table>' +  
						'<tr><th>SO Number</th><th>Order Date</th><th>Order Value</th><th>Customer</th></tr>' +  
						CAST((SELECT 
								[SO Number]		AS [td],'',
								[Order Date]	AS [td],'',
								[Order Value]	AS [td],'',
								[Customer]		AS [td],''
							FROM 
								[#Tb_Mon_Task12]
							ORDER BY
								[OrderByDate]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>'
						
	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('Supply Chain','','Sales Orders over 200K',@EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = '0' AND [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID, @TaskID, @RunID, [SO Number] FROM [#Tb_Mon_Task12];

END;

DROP TABLE #Tb_Mon_Task12;
	
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task13]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task13]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task13') IS NOT NULL
	DROP TABLE #Tb_Mon_Task13;

CREATE TABLE #Tb_Mon_Task13
([Link]				VARCHAR(255) NOT NULL,
[Part]				VARCHAR(255) NOT NULL,
[PartDesc]			VARCHAR(255) NOT NULL,
[Safety Level]		DECIMAL(15,5) NOT NULL,
[Physical_Was]		DECIMAL(15,5) NOT NULL,
[Physical_Is]		DECIMAL(15,5) NOT NULL,
[Procurement]		VARCHAR(255) NOT NULL,
[State]				VARCHAR(255) NOT NULL,
[Offset]			INT
);

--First insert all items that are below the safety level
INSERT INTO #Tb_Mon_Task13
SELECT
	P.[Part] + ':' + CONVERT(VARCHAR(20),P.[PhysicalStockLevel])	AS [Link],
	P.[Part]														AS [Part],
	P.[Part] + ': ' + P.[Description1] + ' ' + P.[Description2]		AS [PartDesc],
	P.[SafetyStockLevel]											AS [Safety Level],
	0																AS [Physical_Was],
	P.[PhysicalStockLevel]											AS [Physical_Is],
	CASE P.[ProcurementCode]
		WHEN 'M' THEN 'Made'
		WHEN 'P' THEN 'Purchased'
		WHEN 'O' THEN 'Other'
		ELSE P.[ProcurementCode]
	END																AS [Procurement],
	'New item' 														AS [State],
	CONVERT(INT,ROUND(1-(P.[PhysicalStockLevel]/P.[SafetyStockLevel]),2)*100) AS [Offset]
FROM
	[vw_ASC_LIVE_Parts]		P
WHERE
	P.[PhysicalStockLevel] < P.[SafetyStockLevel]
	AND P.[PhysicalStockLevel] > 0
	AND P.[ProcurementCode] <> '0'
	AND P.[SafetyStockLevel] > 0

--Then update these that were on the list before
update 
	#Tb_Mon_Task13
SET
	#Tb_Mon_Task13.[Physical_Was] = T1.[Physical_Was],
	#Tb_Mon_Task13.[State] =	CASE 
								WHEN #Tb_Mon_Task13.[Physical_Is] = T1.[Physical_Was] THEN 'No change'
								WHEN #Tb_Mon_Task13.[Physical_Is] > T1.[Physical_Was] THEN 'Stock increased'
								WHEN #Tb_Mon_Task13.[Physical_Is] < T1.[Physical_Was] THEN 'Stock decreased'
								ELSE 'Unknown'
							END
FROM 
	(SELECT 
		T2.[Part], 
		CASE T2.[Physial_Was] 
			when 'NLBL' THEN 0 
			ELSE convert(DECIMAL(15,5),T2.[Physial_Was]) 
		END [Physical_Was] 
	FROM 
		(SELECT 
			CASE CHARINDEX(':',[Ref])
				WHEN 0 THEN ''
				ELSE LEFT([Ref],CHARINDEX(':',[Ref])-1) 
			END AS [Part], 
			CASE CHARINDEX(':',[Ref])
				WHEN 0 THEN '' 
				ELSE RIGHT([Ref],LEN([Ref])-CHARINDEX(':',[Ref])) 
			END AS [Physial_Was] 
		FROM 
			[Tb_Mon_Email_Items] 
		WHERE 
			[LnkEmailID] = (SELECT MAX([LnkEmailID]) FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID)) T2) T1
WHERE
	#Tb_Mon_Task13.[Part] = T1.[Part]

--Then insert those that are no longer on the list
INSERT INTO #Tb_Mon_Task13
SELECT
	P.[Part] + ':NLBL'												AS [Link],
	P.[Part]														AS [Part],
	P.[Part] + ': ' + P.[Description1] + ' ' + P.[Description2]		AS [PartDesc],
	P.[SafetyStockLevel]											AS [Safety Level],
	I.[Physial_Was]													AS [Physical_Was],
	P.[PhysicalStockLevel]											AS [Physical_Is],
	CASE P.[ProcurementCode]
		WHEN 'M' THEN 'Made'
		WHEN 'P' THEN 'Purchased'
		WHEN 'O' THEN 'Other'
		ELSE P.[ProcurementCode]
	END																AS [Procurement],
	'No longer below level'											AS [State],
	CONVERT(INT,ROUND(1-(P.[PhysicalStockLevel]/P.[SafetyStockLevel]),2)*100) AS [Offset]
FROM
					(SELECT 
						CASE CHARINDEX(':',[Ref])
							WHEN 0 THEN ''
							ELSE LEFT([Ref],CHARINDEX(':',[Ref])-1) 
						END AS [Part], 
						CASE CHARINDEX(':',[Ref])
							WHEN 0 THEN '' 
							ELSE RIGHT([Ref],LEN([Ref])-CHARINDEX(':',[Ref])) 
						END AS [Physial_Was] 
					FROM 
						[Tb_Mon_Email_Items] 
					WHERE 
						[LnkEmailID] = (SELECT MAX([LnkEmailID]) FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID)
					AND RIGHT([Ref],LEN([Ref])-CHARINDEX(':',[Ref])) <> 'NLBL') I
LEFT OUTER JOIN		[vw_ASC_LIVE_Parts]			P ON P.[Part] = I.[Part] 
WHERE
	I.[Part] NOT IN (SELECT [Part] FROM [#Tb_Mon_Task13])
AND P.[SafetyStockLevel] > 0


If (SELECT COUNT([Link]) FROM [#Tb_Mon_Task13] WHERE [State] <> 'No change') > 0
BEGIN
	
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	set @EMailBody =	'<p>Please find below a list of all non phantomised stock that has a physical quantity that is at or below its safety level.</p>' +
						'<p>The states are: -</p><ul>' +
						'<li><b>New item</b> - This stock was at or above its safety level and is now below</li>' +
						'<li><b>No longer below level</b> - This stock was below its safety level and is now back at or above it</li>' +
						'<li><b>Stock decreased</b> - This stock is below its safety level and has fallen further since the last time this report was made</li>' +
						'<li><b>Stock increased</b> - This stock is below its safety level but the amount it is below is now less than the last time this report was made</li>' +
						'</ul><p>The state will also show the distance the physical is from the safety as a percentage</p>' +
						'<p><table>' +  
						'<tr><th>Proc. Method</th><th>Part</th><th>Safety Level</th><th>Physical Was</th><th>Physical Is</th><th>State</th></tr>' +  
						CAST((SELECT 
								[Procurement]	AS [td],'',
								[PartDesc]		AS [td],'',
								REPLACE(CONVERT(VARCHAR(16),[Safety Level]),'.00000','')	AS [td],'',
								REPLACE(CONVERT(VARCHAR(16),[Physical_Was]),'.00000','')	AS [td],'',
								REPLACE(CONVERT(VARCHAR(16),[Physical_Is]),'.00000','')	AS [td],'',
								CONCAT([State], ' (', CONVERT(VARCHAR(10),[Offset]), '%)') AS [td],''
							FROM 
								[#Tb_Mon_Task13]
							WHERE 
								[State] <> 'No change'
							ORDER BY
								[Procurement],
								[Offset] DESC,
								[PartDesc]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>'  
						
	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','','Stock below safety level',@EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 and [LnkRunID] = @RunID);
	
	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID, @TaskID, @RunID, [Link] FROM [#Tb_Mon_Task13];

END;

DROP TABLE #Tb_Mon_Task13;
	
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task14]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task14]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task14') IS NOT NULL
	DROP TABLE #Tb_Mon_Task14;


CREATE TABLE #Tb_Mon_Task14
([PO Number]	VARCHAR(30) NOT NULL,
[Part]			VARCHAR(255) NOT NULL,
[Supplier]		VARCHAR(255) NOT NULL,
[Date Created]	DATE NOT NULL,
[OrderByDate]	DATE NOT NULL);

INSERT INTO #Tb_Mon_Task14
SELECT
	PO.[OrderNumber]																				AS [PO Number],
	ISNULL(P.[Part],'') + ': ' + ISNULL(P.[Description1],'') + ' ' + ISNULL(P.[Description2],'')	AS [Part],
	S.[Code] + ': ' + S.[Name]																		AS [Supplier],
	CONVERT(DATE,PO.[CreatedOn],100)																AS [Date Created],
	PO.[CreatedOn]																					AS [OrderByDate]
FROM
				[vw_ASC_LIVE_PurchaseOrders]	PO
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]				P	ON PO.[Part]		= P.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_Suppliers1]		S	ON PO.[Supplier]	= S.[Code]
WHERE
	PO.[Value] <= 0
AND PO.[OrderNumber] NOT IN (SELECT [Ref] FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID);

If (SELECT COUNT(*) FROM [#Tb_Mon_Task14]) > 0
BEGIN
	
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	set @EMailBody =	'<p>Please find below a list of purchase orders with a zero value (or less).</p>' +
						'<p><table>' +  
						'<tr><th>PO Number</th><th>Part</th><th>Supplier</th><th>Date Created</th></tr>' +  
						CAST((SELECT 
								[PO Number]							AS [td],'',
								[Part]								AS [td],'',
								[Supplier]							AS [td],'',
								CONVERT(DATE,[Date Created],100)	AS [td],''
							FROM 
								[#Tb_Mon_Task14]
							ORDER BY
								[OrderByDate] desc
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>'
						
	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('Supply Chain','','Zero value purchase orders',@EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 and [LnkRunID] = @RunID );

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID, @RunID, [PO Number] FROM [#Tb_Mon_Task14];

END;

DROP TABLE [#Tb_Mon_Task14];


GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task15]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task15]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @RetDays	INT
DECLARE @Count		INT
DECLARE @LogMsg		VARCHAR(500)
DECLARE @Run		BIT

exec sp_log @LogSrc,@LogCat,@LogProc,'Checking archive sizes'

exec sp_log @LogSrc,@LogCat,@LogProc,'Checking Tb_Log table'

--Default of 3 years
Set @RetDays = 365 * 3

--collect specific value if there is one
SET @Run = 1
IF (SELECT COUNT(*) FROM [Tb_Config] WHERE [Name] = 'Archive_Tb_Log') > 0
	BEGIN
	SET @RetDays = (SELECT CONVERT(int, [Value]) FROM [Tb_Config] WHERE [Name] = 'Archive_Tb_Log');

	IF @RetDays = 0
		BEGIN
		exec sp_log @LogSrc,@LogCat,@LogProc,'Archive is set to zero, nothing will be moved to archive'
		SET @Run = 0
		END
	ELSE
		BEGIN
		SET @LogMsg = 'Archive is set to ' + convert(varchar(10),@RetDays) + ' days'
		exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
		END
	END
ELSE
	BEGIN
	Set @LogMsg = 'No archive has been set, the default of ' + @RetDays + ' days will be used'
	exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
	END


IF @Run = 1
	BEGIN

	set @Count =(SELECT COUNT([ID]) FROM [Tb_Log] WHERE [CreatedOn] < dateadd(d,-@RetDays,getdate()))

	IF @Count = 0
		exec sp_log @LogSrc,@LogCat,@LogProc,'Nothing is due to be moved to archive'
	ELSE
		BEGIN
			set @LogMsg = convert(varchar(10),@Count) + ' Entr' + CASE @Count WHEN 1 THEN 'y' ELSE 'ies' END + ' will be moved to the archive'
			exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
				
			INSERT INTO [Tb_Log_Archive] ([SourceID],[SourceCreatedOn],[SourceCreatedBy],[Computer],[Source],[Environment],[Category],[Process],[Message]) SELECT [ID] AS [SourceID],[CreatedOn] AS [SourceCreatedOn], [CreatedBy] AS [SourceCreatedBy],[Computer],[Source],[Environment],[Category],[Process],[Message] FROM [Tb_Log] WHERE [CreatedOn] < dateadd(d,-@RetDays,getdate());
			DELETE FROM [Tb_Log] WHERE [CreatedOn] < dateadd(d,-@RetDays,getdate());
		
			--Now do the same for the archive table
			--Default of 3 years
			Set @RetDays = 365 * 3

			--collect specific value if there is one
			SET @Run = 1
			IF (SELECT COUNT(*) FROM [Tb_Config] WHERE [Name] = 'Archive_Tb_Log_Remove') > 0
				BEGIN
				SET @RetDays = (SELECT CONVERT(int, [Value]) FROM [Tb_Config] WHERE [Name] = 'Archive_Tb_Log_Remove');

				IF @RetDays = 0
					BEGIN
					exec sp_log @LogSrc,@LogCat,@LogProc,'Archive clearing is set to zero, nothing will be removed form the archive'
					SET @Run = 0
					END
				ELSE
					BEGIN
					SET @LogMsg = 'Archive clearing is set to ' + convert(varchar(10),@RetDays) + ' days'
					exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
					END
				END
			ELSE
				BEGIN
				Set @LogMsg = 'No archive clearing value has been set, the default of ' + @RetDays + ' days will be used'
				exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
				END


			IF @Run = 1
				BEGIN

				set @Count =(SELECT COUNT([ID]) FROM [Tb_Log_Archive] WHERE [CreatedOn] < dateadd(d,-@RetDays,getdate()))

				IF @Count = 0
					exec sp_log @LogSrc,@LogCat,@LogProc,'Nothing is due to be removed archive'
				ELSE
					BEGIN
						set @LogMsg = convert(varchar(10),@Count) + ' Entr' + CASE @Count WHEN 1 THEN 'y' ELSE 'ies' END + ' will be removed from the archive'
						exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
				
						DELETE FROM [Tb_Log_Archive] WHERE [CreatedOn] < dateadd(d,-@RetDays,getdate());
		
					END;
		
				END;

		END;
		
	END;

exec sp_log @LogSrc,@LogCat,@LogProc,'Checking Tb_Mon_Runs table'

--Default of 3 years
Set @RetDays = 365 * 3

--collect specific value if there is one
SET @Run = 1
IF (SELECT COUNT(*) FROM [Tb_Config] WHERE [Name] = 'Archive_Tb_Mon_Runs') > 0
	BEGIN
	SET @RetDays = (SELECT CONVERT(int, [Value]) FROM [Tb_Config] WHERE [Name] = 'Archive_Tb_Mon_Runs');

	IF @RetDays = 0
		BEGIN
		exec sp_log @LogSrc,@LogCat,@LogProc,'Archive is set to zero, nothing will be moved to archive'
		SET @Run = 0
		END
	ELSE
		BEGIN
		SET @LogMsg = 'Archive is set to ' + convert(varchar(10),@RetDays) + ' days'
		exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
		END
	END
ELSE
	BEGIN
	Set @LogMsg = 'No archive has been set, the default of ' + @RetDays + ' days will be used'
	exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
	END


IF @Run = 1
	BEGIN

	set @Count =(SELECT COUNT([ID]) FROM [Tb_Mon_Runs] WHERE [CreatedOn] < dateadd(d,-@RetDays,getdate()) AND [Status] <> 0)

	IF @Count = 0
		exec sp_log @LogSrc,@LogCat,@LogProc,'Nothing is due to be moved to archive'
	ELSE
		BEGIN
			set @LogMsg = convert(varchar(10),@Count) + ' Entr' + CASE @Count WHEN 1 THEN 'y' ELSE 'ies' END + ' will be moved to the archive'
			exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
				
			INSERT INTO [Tb_Mon_Runs_Archive] ([SourceID],[SourceCreatedOn],[SourceCreatedBy],[TaskID],[Start],[End],[Status],[AgentID]) SELECT [ID] AS [SourceID],[CreatedOn] AS [SourceCreatedOn], [CreatedBy] AS [SourceCreatedBy],[TaskID],[Start],[End],[Status],[AgentID] FROM [Tb_Mon_Runs] WHERE [CreatedOn] < dateadd(d,-@RetDays,getdate()) AND [Status] <> 0;
			DELETE FROM [Tb_Mon_Runs] WHERE [CreatedOn] < dateadd(d,-@RetDays,getdate()) AND [Status] <> 0;
		
			--Now do the same for the archive table
			--Default of 3 years
			Set @RetDays = 365 * 3

			--collect specific value if there is one
			SET @Run = 1
			IF (SELECT COUNT(*) FROM [Tb_Config] WHERE [Name] = 'Archive_Tb_Mon_Runs_Remove') > 0
				BEGIN
				SET @RetDays = (SELECT CONVERT(int, [Value]) FROM [Tb_Config] WHERE [Name] = 'Archive_Tb_Mon_Runs_Remove');

				IF @RetDays = 0
					BEGIN
					exec sp_log @LogSrc,@LogCat,@LogProc,'Archive clearing is set to zero, nothing will be removed form the archive'
					SET @Run = 0
					END
				ELSE
					BEGIN
					SET @LogMsg = 'Archive clearing is set to ' + convert(varchar(10),@RetDays) + ' days'
					exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
					END
				END
			ELSE
				BEGIN
				Set @LogMsg = 'No archive clearing value has been set, the default of ' + @RetDays + ' days will be used'
				exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
				END


			IF @Run = 1
				BEGIN

				set @Count =(SELECT COUNT([ID]) FROM [Tb_Log_Archive] WHERE [CreatedOn] < dateadd(d,-@RetDays,getdate()))

				IF @Count = 0
					exec sp_log @LogSrc,@LogCat,@LogProc,'Nothing is due to be removed archive'
				ELSE
					BEGIN
						set @LogMsg = convert(varchar(10),@Count) + ' Entr' + CASE @Count WHEN 1 THEN 'y' ELSE 'ies' END + ' will be removed from the archive'
						exec sp_log @LogSrc,@LogCat,@LogProc,@LogMsg
				
						DELETE FROM [Tb_Mon_Runs_Archive] WHERE [CreatedOn] < dateadd(d,-@RetDays,getdate());
		
					END;
		
				END;

		END;
		
	END;

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task16]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[sp_Mon_Task16]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task16') IS NOT NULL
	DROP TABLE #Tb_Mon_Task16;

--Create temp table
CREATE TABLE #Tb_Mon_Task16
([ID]				INT NOT NULL,
[CreatedOn]			DATETIME NOT NULL,
[CreatedBy]			VARCHAR(255) NOT NULL,
[SONo]				VARCHAR(15) NOT NULL,
[SOOwner]			VARCHAR(255) NOT NULL,
[SOOwnerEmail]		VARCHAR(255) NOT NULL,
[Part]				VARCHAR(15) NOT NULL,
[PartDescription]	VARCHAR(255) NOT NULL,
[CoATest]			VARCHAR(255) NOT NULL,
[Monograph]			VARCHAR(255) NOT NULL,
[Template]			VARCHAR(255) NOT NULL,
[Path]				VARCHAR(255) NOT NULL);


--Query that gets a list of all orders where it has a duty exempt flag of 2 but no authorisation number
INSERT INTO #Tb_Mon_Task16
SELECT DISTINCT
	G.[ID],
	G.[CreatedOn],
	U.[Surname] + ', ' + U.[Forenames] 						AS [CreatedBy],
	ISNULL(CONVERT(VARCHAR(15),O.[OrderNum]),'')			AS [SONo],
	ISNULL(U2.[Surname] + ', ' + U2.[Forenames],'')			AS [SOOwner],
	ISNULL(U2.[Email],'')									AS [SOOwnerEmail],
	P.[Part]												AS [Part],
	P.[Description1] + ' ' + ISNULL(P.[Description2],'')	AS [PartDescription],
	T.[BatchRef]											AS [CoATest],
	M.[Name]												AS [Monograph],
	PM.[Filename]											AS [Template],
	(SELECT [Value] FROM [Tb_Config] WHERE [Name] = 'CoAOutputFolder') + G.[Path]		AS [Path]	
FROM 
				[Tb_CoA_Generations]			G
LEFT OUTER JOIN	[Tb_Users]						U	ON	G.[CreatedBy]		= U.[ID]
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]				P	ON	G.[Part]			= P.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_Orders]			O	ON	G.[SONo]			= O.[OrderNum]
LEFT OUTER JOIN [vw_ASC_LIVE_SystemPeople]		U2	ON	O.[OrderEnteredBy]	= U2.[Code]
LEFT OUTER JOIN [Tb_CoA_Tests]					T	ON	G.[Test]			= T.[ID]
LEFT OUTER JOIN [Tb_CoA_Monographs]				M	ON	G.[Monograph]		= M.[ID]
LEFT OUTER JOIN [Tb_CoA_PrintMaps]				PM	ON	G.[Template]		= PM.[ID]
WHERE 
	G.[ID] NOT IN (SELECT [Ref] FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = 16);


If (Select Count([ID]) From #Tb_Mon_Task16) > 0
Begin

    DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int
	
	set @EMailBody =	'<p>The following CoA certificates have been generated since the last time this report was sent out.</p>' +
						'<p><table>' +  
					    '<tr><th>Sales Order</th><th>Owner</th><th>Part</th><th>Monograph</th><th>Certificate</th></tr>' +  
						CAST((SELECT	[SONo]								AS [td],'',
										[SOOwner]							AS [td],'',
										[Part] + ': ' + [PartDescription]	AS [td],'',
										[Monograph]							AS [td],'',
										'<a href="' + [Path] + '">Here</a>' AS [td],''
							  FROM #Tb_Mon_Task16
							  ORDER BY [SOOwner],[SONo]
							  FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>';
	set @EMailBody = REPLACE(@EMailBody,'&lt;','<')
	set @EMailBody = REPLACE(@EMailBody,'&gt;','>')
	set @EMailBody = REPLACE(@EMailBody,'&quot;','"')

	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('HICS','','CoAs generated',@EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [ID] FROM [#Tb_Mon_Task16];

End;

DROP TABLE #Tb_Mon_Task16;


GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task17]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task17]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task17') IS NOT NULL
	DROP TABLE #Tb_Mon_Task17;

--Create temp table
CREATE TABLE #Tb_Mon_Task17
([ID]				INT NOT NULL,
[CreatedOn]			DATETIME NOT NULL,
[CreatedBy]			VARCHAR(255) NOT NULL,
[Customer]			VARCHAR(255) NOT NULL,
[SONo]				VARCHAR(15) NOT NULL,
[SOOwner]			VARCHAR(255) NOT NULL,
[SOOwnerEmail]		VARCHAR(255) NOT NULL,
[Part]				VARCHAR(15) NOT NULL,
[PartDescription]	VARCHAR(255) NOT NULL,
[CoATest]			VARCHAR(255) NOT NULL,
[Monograph]			VARCHAR(255) NOT NULL,
[Template]			VARCHAR(255) NOT NULL,
[Path]				VARCHAR(255) NOT NULL,
[Processed]			BIT NOT NULL);


--Query that gets a list of all orders where it has a duty exempt flag of 2 but no authorisation number
INSERT INTO #Tb_Mon_Task17
SELECT 
	G.[ID],
	G.[CreatedOn],
	U.[FullName] 									AS [CreatedBy],
	ISNULL(C.[Name],'')								AS [Customer],
	ISNULL(CONVERT(VARCHAR(15),O.[OrderNum]),'')	AS [SONo],
	ISNULL(U2.[Surname] + ', ' + U2.[Forenames],'')	AS [SOOwner],
	ISNULL(U2.[Email],'support@hgcompany.co.uk')	AS [SOOwnerEmail],
	P.[Part]										AS [Part],
	P.[Description1] + ' ' + ISNULL(P.[Description2],'')	AS [PartDescription],
	T.[BatchRef]									AS [CoATest],
	M.[Name]										AS [Monograph],
	PM.[Filename]									AS [Template],
	(SELECT [Value] FROM [Tb_Config] WHERE [Name] = 'CoAOutputFolder') + G.[Path]		AS [Path],
	0												AS [Processed]
FROM 
				[Tb_CoA_Generations]			G
LEFT OUTER JOIN	[vw_HICS_Rep_Users]				U	ON	G.[CreatedBy]		= U.[ID]
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts] 			P	ON	G.[Part]			= P.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_Orders]			O	ON	G.[SONo]			= O.[OrderNum]
LEFT OUTER JOIN [vw_ASC_LIVE_SystemPeople]		U2	ON	O.[OrderEnteredBy]	= U2.[Code]	
LEFT OUTER JOIN [Tb_CoA_Tests]					T	ON	G.[Test]			= T.[ID]
LEFT OUTER JOIN [Tb_CoA_Monographs]				M	ON	G.[Monograph]		= M.[ID]
LEFT OUTER JOIN [Tb_CoA_PrintMaps]				PM	ON	G.[Template]		= PM.[ID]
LEFT OUTER JOIN [vw_ASC_LIVE_Customers]			C	ON	O.[CustomerCode]	= C.[Code]
WHERE 
	G.[ID] NOT IN (SELECT [Ref] FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID);

--Loop through temp table processing each entry, grouped by email address
While (Select Count(*) From #Tb_Mon_Task17 Where [Processed] = 0) > 0
Begin
  
    DECLARE @Email varchar(355)
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	Select Top 1 @Email = [SOOwnerEmail] From #Tb_Mon_Task17 Where [Processed] = 0;
		
	set @EMailBody =	'<p>The following CoA certificates have been generated for your orders.</p>' +
						'<p><table>' +  
					    '<tr><th>Customer</th><th>Sales Order</th><th>Part</th><th>Monograph</th><th>Certificate</th></tr>' +  
						CAST((SELECT	[Customer]							AS [td],'',
										[SONo]								AS [td],'',
										[Part] + ': ' + [PartDescription]	AS [td],'',
										[Monograph]							AS [td],'',
										'<a href="' + [Path] + '">Here</a>' AS [td],''
							  FROM #Tb_Mon_Task17
							  WHERE [SOOwnerEmail] = @Email
							  ORDER BY [Customer],[SoNo]
							  FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>';
	
	set @EMailBody = REPLACE(@EMailBody,'&lt;','<')
	set @EMailBody = REPLACE(@EMailBody,'&gt;','>')
	set @EMailBody = REPLACE(@EMailBody,'&quot;','"')

	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('HICS',@Email,'CoAs for your orders',@EMailBody,0,@RunID);
	--INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('HICS','garye@hgcompany.co.uk','CoAs for your orders',@EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [ID] FROM #Tb_Mon_Task17 WHERE [SOOwnerEmail] = @Email;
		
	Update #Tb_Mon_Task17 Set [Processed] = 1 Where [SOOwnerEmail] = @Email 
	
End;

DROP TABLE #Tb_Mon_Task17;


GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task18]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task18]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task18_Users') IS NOT NULL
	DROP TABLE #Tb_Mon_Task18_Users;
	
--Create temp table
CREATE TABLE #Tb_Mon_Task18_Users
([UserID]			INT NOT NULL,
[Processed]			BIT NOT NULL);

--Get a list of all people that need to be alerted
INSERT INTO #Tb_Mon_Task18_Users
SELECT 
	T1.[User],0
FROM 
(select 
	UTG.[LnkUserID] AS [User],
	COUNT(SJ.[ID])	AS [Jobs]
from 
				[Tb_PPM_UsersToGroups]	UTG
LEFT OUTER JOIN	[Tb_PPM_Groups]			G	ON	G.[ID] = UTG.[LnkGroupID]
LEFT OUTER JOIN [Tb_PPM_ScheduleJobs]	SJ	ON	SJ.[LnkGroupID] = UTG.[LnkGroupID]
WHERE
	G.[Deleted] = 0
AND SJ.[Deleted] = 0
AND SJ.[Closed] = 0
AND DATEDIFF(DAY, convert(date,SYSDATETIME()),SJ.[Schedule]) IN (14, 7, 0, -7, -14)
GROUP BY
	UTG.[LnkUserID]) T1

IF (Select Count([UserID]) From [#Tb_Mon_Task18_Users]) > 0
BEGIN
	DECLARE @UserID		AS INT
	DECLARE @MultiGroup	AS BIT
	DECLARE @EmailBody	AS VARCHAR(MAX)
	DECLARE @EmailTo	AS VARCHAR(MAX)
	DECLARE @EmailID	AS INT

	IF OBJECT_ID('tempdb..#Tb_Mon_Task18') IS NOT NULL
	DROP TABLE #Tb_Mon_Task18;

	CREATE TABLE #Tb_Mon_Task18
	([Group]			VARCHAR(255) NOT NULL,
	[User]				INT NOT NULL,
	[Due]				INT NOT NULL,
	[SchedID]			INT NOT NULL,
	[Name]				VARCHAR(255)
	);

	INSERT INTO [#Tb_Mon_Task18]
	SELECT 
		G.[Name]													AS [Group],
		UTG.[LnkUserID]												AS [User],
		DATEDIFF(DAY, CONVERT(DATE,SYSDATETIME()),SJ.[Schedule])	AS [Due],
		SJ.[ID]														AS [SchedID],
		SJ.[Name]
	FROM
					[Tb_PPM_ScheduleJobs]	SJ
	LEFT OUTER JOIN	[Tb_PPM_Groups]			G	ON G.[ID] = SJ.[LnkGroupID]
	LEFT OUTER JOIN	[Tb_PPM_UsersToGroups]	UTG	ON UTG.[LnkGroupID] = G.[ID]
	WHERE
		SJ.[Deleted] = 0
	AND SJ.[Closed] = 0
	AND G.[Deleted] = 0
	AND DATEDIFF(DAY, convert(date,SYSDATETIME()),SJ.[Schedule]) IN (14, 7, 0, -7, -14)

	While (Select Count([UserID]) From [#Tb_Mon_Task18_Users] WHERE [Processed] = 0) > 0
	BEGIN
	
		SET @UserID = (SELECT MIN([UserID]) FROM [#Tb_Mon_Task18_Users] WHERE [Processed] = 0)
	
		SET @MultiGroup = (	SELECT 
								CASE COUNT(DISTINCT [Group]) WHEN 1 then 0 ELSE 1 END 
							FROM
								[#Tb_Mon_Task18]
							WHERE 
								[User] = @UserID)

		SET @EmailBody = '<p>The below are overdue, due, or upcoming PPM jobs you are assigned to that may require attention.</p>'

		IF (SELECT COUNT([User]) FROM [#Tb_Mon_Task18] WHERE [Due] = -14 AND [User] = @UserID) > 0 
		BEGIN

			SET @EmailBody = @EmailBody + '<p>The below PPM jobs are now 14 days overdue, this is the last time you will be alerted about them but they will remain on the schedule.</p>'

			IF (@MultiGroup = 1)
			BEGIN
				SET @EmailBody = @EmailBody + '<p><table>' +  
				'<tr><th>Group</th><th>Job</th></tr>' +  
				CAST((	SELECT	
							[Group]		AS [td],'',
							[Name]		AS [td],''
						FROM 
							[#Tb_Mon_Task18]
						WHERE 
							[User] = @UserID
						AND [Due] = -14
						ORDER BY
							[Name]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) + '</table></p>'
			END
			ELSE
			BEGIN
				SET @EmailBody = @EmailBody + '<p><table>' +  
				'<tr><th>Job</th></tr>' +  
				CAST((	SELECT	
							[Name]		AS [td],''
						FROM 
							[#Tb_Mon_Task18]
						WHERE 
							[User] = @UserID
						AND [Due] = -14
						ORDER BY
							[Name]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) + '</table></p>'
			END
		END

		IF (SELECT COUNT([User]) FROM [#Tb_Mon_Task18] WHERE [Due] = -7 AND [User] = @UserID) > 0 
		BEGIN

			SET @EmailBody = @EmailBody + '<p>The below PPM jobs are 7 days overdue.</p>'

			IF (@MultiGroup = 1)
			BEGIN
				SET @EmailBody = @EmailBody + '<p><table>' +  
				'<tr><th>Group</th><th>Job</th></tr>' +  
				CAST((	SELECT	
							[Group]		AS [td],'',
							[Name]		AS [td],''
						FROM 
							[#Tb_Mon_Task18]
						WHERE 
							[User] = @UserID
						AND [Due] = -7
						ORDER BY
							[Name]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) + '</table></p>'
			END
			ELSE
			BEGIN
				SET @EmailBody = @EmailBody + '<p><table>' +  
				'<tr><th>Job</th></tr>' +  
				CAST((	SELECT	
							[Name]		AS [td],''
						FROM 
							[#Tb_Mon_Task18]
						WHERE 
							[User] = @UserID
						AND [Due] = -7
						ORDER BY
							[Name]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) + '</table></p>'
			END

		END

		IF (SELECT COUNT([User]) FROM [#Tb_Mon_Task18] WHERE [Due] NOT IN (-14,-7) AND [User] = @UserID) > 0 
		BEGIN

			SET @EmailBody = @EmailBody + '<p>The below PPM jobs are due within the next 2 weeks. Jobs cam be completed up to 1 week earlier than their due date, any showing as not due for 2 weeks are for reference only in case preperation time is required.</p>'

			IF (@MultiGroup = 1)
			BEGIN
				SET @EmailBody = @EmailBody + '<p><table>' +  
				'<tr><th>Group</th><th>Due</th><th>Job</th></tr>' +  
				CAST((	SELECT	
							[Group]		AS [td],'',
							CASE [Due] 
								WHEN 14 THEN '2 Weeks'
								WHEN 7 THEN '1 Week'
								ELSE 'Today'
							END			AS [td],'',
							[Name]		AS [td],''
						FROM 
							[#Tb_Mon_Task18]
						WHERE 
							[User] = @UserID
						AND [Due] NOT IN (-7, -14)
						ORDER BY
							[Due],
							[Name]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) + '</table></p>'
			END
			ELSE
			BEGIN
				SET @EmailBody = @EmailBody + '<p><table>' +  
				'<tr><th>Due</th><th>Job</th></tr>' +  
				CAST((	SELECT	
							CASE [Due] 
								WHEN 14 THEN '2 Weeks'
								WHEN 7 THEN '1 Week'
								ELSE 'Today'
							END			AS [td],'',
							[Name]		AS [td],''
						FROM 
							[#Tb_Mon_Task18]
						WHERE 
							[User] = @UserID
						AND [Due] NOT IN (-7, -14)
						ORDER BY
							[Due],
							[Name]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) + '</table></p>'
			END

		END

		SET @EmailTo = (SELECT CASE T1.[Email] WHEN '' THEN 'support@hgcompany.co.uk' ELSE T1.[Email] END FROM (SELECT ISNULL(NULLIF([Email],''),'') AS [Email] FROM [vw_HICS_Rep_Users] WHERE [ID] = @UserID) T1)
	
		INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('HICS',@EmailTo,'Planned Preventative Maintenance',@EMailBody,0,@RunID);

		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] where [ReadyToSend] = 0 and [LnkRunID] = @RunID);

		INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID,[SchedID] FROM #Tb_Mon_Task18 WHERE [User] = @UserID;
		
		UPDATE [#Tb_Mon_Task18_Users] Set [Processed] = 1 WHERE [UserID] = @UserID

	END;

	DROP TABLE #Tb_Mon_Task18;

END
DROP TABLE #Tb_Mon_Task18_Users;


GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task19]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task19]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @EmailBody	VARCHAR(MAX)
DECLARE @EmailID	INT

IF OBJECT_ID('#Tb_Mon_Task19') IS NOT NULL
	DROP TABLE #Tb_Mon_Task19;

CREATE TABLE #Tb_Mon_Task19
(
[ID]				INT NOT NULL,
[When]				DATETIME NOT NULL,
[Sequence]			INT NOT NULL,
[User]				VARCHAR(255) NOT NULL,
[Parent]			VARCHAR(15) NOT NULL,
[Part]				VARCHAR(15) NOT NULL,
[Type]				VARCHAR(20) NOT NULL,
[Quantity]			DECIMAL(10,4) NOT NULL);

INSERT INTO #Tb_Mon_Task19
SELECT 
	BA.[ID],
	BA.[CreatedOn],
	BA.[Sequence],
	CASE ISNULL(U.[FullName],'')
		WHEN '' THEN BA.[User] COLLATE Latin1_General_CI_AS
		ELSE U.[FullName]
	END AS [User],
	BA.[Parent],
	BA.[Part],
	--A - Add C - Change D - Delete G - Replaced part H - Replace with partQ - Quantities changed (from action 'Change qty in Bills' (JA))
	CASE BA.[Type]
		WHEN 'A' THEN 'Addition'
		WHEN 'C' THEN 'Change'
		WHEN 'D' THEN 'Deletion'
		WHEN 'G' THEN 'Replaced (Removed)'
		WHEN 'H' THEN 'Replaced (Added)'
		WHEN 'Q' THEN 'Change'
		ELSE BA.[Type]
	END as [Type], 
	BA.[Quantity]
FROM 
					[vw_ASC_LIVE_BoMAudit]			BA
LEFT OUTER JOIN		[vw_HICS_SupplyChainUserLinks]	SCUL	ON	BA.[User] = SCUL.[LnkSYS_PEOPLE_PP_CODE] 
LEFT OUTER JOIN		[vw_HICS_Users]					U		ON	SCUL.[LnkUserID] = U.[ID]
WHERE
	CONVERT(DATE,BA.[When]) > '18/Feb/2022'
AND BA.[ID] NOT IN (SELECT [Ref] FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID);


IF (SELECT COUNT([ID]) FROM [#Tb_Mon_Task19]) > 0
BEGIN


	SET @EMailBody = '<p>Below is a list of changes to BoMs that have happened through Supply Chain since the last time this summary was sent out.</p>' +
					'<p><table>' +  
					'<tr><th>Parent</th><th>Part</th><th>When</th><th>User</th><th>Type</th><th>Quantity</th></tr>' +  
					CAST((SELECT
							[Parent]		AS [td],'',
							[Part]			AS [td],'',
							CONCAT(RIGHT(CONCAT('00',datepart(DAY, [When])),2),'/',
									RIGHT(CONCAT('00',datepart(MONTH, [When])),2),'/',
									DATEPART(YEAR, [When]),' ',
									RIGHT(CONCAT('00',datepart(HOUR, [When])),2),':',
									RIGHT(CONCAT('00',datepart(MINUTE, [When])),2)) 			AS [td],'',
							[User]			AS [td],'',
							[Type]			AS [td],'',
							[Quantity]		AS [td],''
						FROM 
							[#Tb_Mon_Task19] 
						ORDER BY
							[Parent],
							[Part],
							[When],
							[Sequence]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>' +
					'<p>Note: This will only show changes made through Supply Changes, if a bulk update is requested it is not shown here. Previous values can not be shown and values other than ''Quantity'' may have changed in the BoM.</p>'

	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','','','BoM changes', @EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
		
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunId],[Ref]) SELECT DISTINCT @EmailID,@TaskID, @RunID, [ID] FROM #Tb_Mon_Task19
			
END;

DROP TABLE #Tb_Mon_Task19

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task20]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task20]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @EmailBody	VARCHAR(MAX)
DECLARE @EmailID	INT

IF OBJECT_ID('#Tb_Mon_Task20') IS NOT NULL
DROP TABLE #Tb_Mon_Task20;

CREATE TABLE #Tb_Mon_Task20
(
[ID]				INT NOT NULL,
[When]				DATETIME NOT NULL,
[Sequence]			INT NOT NULL,
[User]				VARCHAR(255) NOT NULL,
[Part]				VARCHAR(15) NOT NULL,
[Type]				VARCHAR(15) NOT NULL,
[Field]				VARCHAR(255) NOT NULL,
[Was]				VARCHAR(255) NOT NULL,
[Is]				VARCHAR(255) NOT NULL);

INSERT INTO #Tb_Mon_Task20
SELECT
	PA.[ID],
	PA.[When],
	PA.[Sequence],
	CASE ISNULL(U.[FullName],'')
		WHEN '' THEN PA.[User] 
		ELSE U.[FullName]
	END AS [User],
	PA.[Part],
	CASE PA.[Type]
		WHEN 'A' THEN 'Addition'
		WHEN 'C' THEN 'Change'
		WHEN 'D' THEN 'Deletion'
		ELSE PA.[Type]
	END as [Type], 
	PA.[Field],
	LTRIM(RTRIM(PA.[OldValue]))	AS [Was],
	LTRIM(RTRIM(PA.[NewValue]))	AS [Is]
FROM	
					[vw_ASC_LIVE_PartAudit]			PA 
LEFT OUTER JOIN		[vw_HICS_SupplyChainUserLinks]	SCUL	ON	PA.[User] = SCUL.[LnkSYS_PEOPLE_PP_CODE] 
LEFT OUTER JOIN		[vw_HICS_Users]					U		ON	SCUL.[LnkUserID] = U.[ID]
WHERE
	PA.[When] > '17/Feb/2022'
AND PA.[ID] NOT IN (SELECT [Ref] FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID)
AND PA.[File] = 'IT';



IF (SELECT COUNT([ID]) FROM [#Tb_Mon_Task20]) > 0
BEGIN
	SET @EMailBody = '<p>Below is a list of changes to parts that have happened through Supply Chain since the last time this summary was sent out.</p>' +
					'<p><table>' +  
					'<tr><th>Part</th><th>When</th><th>User</th><th>Type</th><th>Field</th><th>Was</th><th>Is</th></tr>' +  
					CAST((SELECT
							[Part]			AS [td],'',
							CONCAT(RIGHT(CONCAT('00',datepart(DAY, [When])),2),'/',
									RIGHT(CONCAT('00',datepart(MONTH, [When])),2),'/',
									DATEPART(YEAR, [When]),' ',
									RIGHT(CONCAT('00',datepart(HOUR, [When])),2),':',
									RIGHT(CONCAT('00',datepart(MINUTE, [When])),2)) 			AS [td],'',
							[User]			AS [td],'',
							[Type]			AS [td],'',
							[Field]			AS [td],'',
							[Was]			AS [td],'',
							[Is]			AS [td],''
						FROM 
							[#Tb_Mon_Task20] 
						ORDER BY
							[Part],
							[When],
							[Sequence]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>' +
					'<p>Note: This will only show changes made through Supply Changes, if a bulk update is requested it is not shown here.</p>'

	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','','','Part changes', @EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID );
		
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT DISTINCT @EmailID,@TaskID,@RunID,[ID] FROM #Tb_Mon_Task20
			
END;

DROP TABLE #Tb_Mon_Task20

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task21]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_Mon_Task21]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

--Remove trial kits
DELETE FROM [ASC_LIVE].[dbo].[ASC_KIT_TBL] WHERE LEFT(KIT_WO,7) = '** TRIA';

--Remove trailing blank lines in addresses
WHILE (SELECT COUNT(*) FROM [ASC_LIVE].[dbo].[SL_ACCOUNTS] where RIGHT([CUADDRESS],1) = CHAR(13)) > 0
BEGIN
	UPDATE [ASC_LIVE].[dbo].[SL_ACCOUNTS] SET [CUADDRESS] = LEFT([CUADDRESS],LEN([CUADDRESS])-1) WHERE RIGHT([CUADDRESS],1) = CHAR(13)
END
WHILE (SELECT COUNT(*) FROM [ASC_LIVE].[dbo].[SL_ADDRESSES] where RIGHT([AD_ADDRESS],1) = CHAR(13)) > 0
BEGIN
	UPDATE [ASC_LIVE].[dbo].[SL_ADDRESSES] SET [AD_ADDRESS] = LEFT([AD_ADDRESS],LEN([AD_ADDRESS])-1) where RIGHT([AD_ADDRESS],1) = CHAR(13)
END;

--Set the language to English2 for everyone
UPDATE [ASC_LIVE].[dbo].[SYS_USER] SET [USER_LANGUAGE] = 'ENGLISH2' where [USER_LANGUAGE] <> 'ENGLISH2'

--Set account managers on addresses (hmmm not sure about this)
UPDATE 
	[ADD]
SET 
	[ADD].[CUSAD_ANAL_7] = (SELECT [CUS_ANAL_7] FROM [ASC_LIVE].[dbo].[ASC_SL_ACCOUNTS] [ACC] WHERE [ACC].[CUS_CODE] = [ADD].[CUSAD_CODE])
FROM [ASC_LIVE].[dbo].[ASC_SL_ADDRESSES] [ADD]

--Clear the start up screen
UPDATE [ASC_LIVE].[dbo].[SYS_USER] SET [USER_START_WINDOW] = 0 WHERE [USER_START_WINDOW] <> 0

--Update the pilot screen
update [ASC_PILOT].[dbo].[SYS_DATAINFO] set [BACKGROUND_IMAGE_FILENAME] = '\\asc01\DATA\PILOTbackground.png'

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task22]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_Mon_Task22]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task22') IS NOT NULL
BEGIN
    DROP TABLE #Tb_Mon_Task22
END;

CREATE TABLE #Tb_Mon_Task22
([ID]				INT NOT NULL,
[Date Changed]		DATE NOT NULL,
[Type]				VARCHAR(25) NOT NULL,
[Part]				VARCHAR(255) NOT NULL,
[Qty. Adjusted By]	DECIMAL(15,5) NOT NULL,
[Reason]			VARCHAR(255) NOT NULL,
[Value]				DECIMAL(15,5) NOT NULL,
[User]				VARCHAR(255) NOT NULL);

INSERT INTO #Tb_Mon_Task22
SELECT
	H.[ID],
	H.[CreatedOn]																								AS [Date Changed],
	CASE LEFT(H.[Part],1)
		WHEN 'B' THEN 'Bulk'
		WHEN 'F' THEN 'Filled Product'
		WHEN 'G' THEN 'Glass'
		WHEN 'L' THEN 'Label'
		WHEN 'P' THEN 'Packaging'
		ELSE 'Unknown'
	END																											AS [Type],
	ISNULL(P.[Part],H.[Part]) + ': ' + ISNULL(P.[Description1],'') + ' ' + ISNULL(P.[Description2],'')			AS [Part],
	H.[Quantity]																								AS [Qty. Adjusted By],
	H.[Reason]																									AS [Reason],
	ISNULL((P.[MaterialCost]/P.[MaterialCostPer])* H.[Quantity],0)													AS [Value],
	CASE ISNULL(U.[Surname],'') + ISNULL(U.[Forenames],'')
		WHEN '' THEN H.[User] COLLATE Latin1_General_CI_AS
		ELSE ISNULL(U.[Surname],'') + ', ' + ISNULL(U.[Forenames],'')								
	END																												AS [User]
FROM
				[vw_ASC_LIVE_History]			H	
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]				P ON H.[Part]	= P.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_SystemPeople]		U ON H.[User]	= U.[Code] 
WHERE
	H.[ActionTypeCode] = 'AD'
AND H.[ID] NOT IN (SELECT [Ref] FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID);

If (SELECT COUNT(*) FROM [#Tb_Mon_Task22]) > 0
BEGIN
	
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	set @EMailBody =	'<p>Please find below a list of all new stock adjustments for the last week.</p>' +
						'<p><table>' +  
						'<tr><th>Date Changed</th><th>Type</th><th>Part</th><th>Qty. Adjusted By</th><th>Value</th><th>User</th></tr>' +  
						CAST((SELECT 
								CONVERT(VARCHAR(19),[Date Changed],120)	AS [td],'',
								[Type]									AS [td],'',
								[Part]									AS [td],'',
								[Qty. Adjusted By]						AS [td],'',
								[Value]									AS [td],'',
								[User]									AS [td],''
							FROM 
								[#Tb_Mon_Task22]
							ORDER BY
								[Date Changed]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>'
						
	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('Supply Chain','','Stock Adjustments for the last week',@EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [ID] FROM [#Tb_Mon_Task22];

END;

DROP TABLE #Tb_Mon_Task22;


GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task23]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Mon_Task23]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS
DECLARE @TheExec varchar(8000)

--Generate output
Set @TheExec = 'bcp UDEF_PS_Products out "C:\Temp\UDEF_PS_Products.csv" -c -t, -T -S "SQL01" -d "ASC_LIVE"'
exec master..xp_cmdshell @TheExec

--Copy to fileserver
Set @TheExec = 'xcopy "C:\Temp\UDEF_PS_Products.csv" "\\Fileserver\$UDEF_Transfer_Files\" /C /Y'
EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
	exec master..xp_cmdshell @TheExec
REVERT;

--A wait to let file copies complete
WAITFOR DELAY '00:00:05'

--Delete the output
Set @TheExec = 'del "C:\Temp\UDEF_PS_Products.csv" /F /Q'
exec master..xp_cmdshell @TheExec


--Generate output
--Set @TheExec = 'bcp UDEF_PS_Customers out "C:\Temp\UDEF_PS_Customers.csv" -c -t, -T -S "SQL01" -d "ASC_LIVE"'
Set @TheExec = 'bcp UDEF_PS_Customers out "C:\Temp\UDEF_PS_Customers.csv" -c -C ACP -t, -T -S "SQL01" -d "ASC_LIVE"'
exec master..xp_cmdshell @TheExec

--Copy to fileserver
Set @TheExec = 'xcopy "C:\Temp\UDEF_PS_Customers.csv" "\\Fileserver\$UDEF_Transfer_Files\" /C /Y'
EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
	exec master..xp_cmdshell @TheExec
REVERT;

--A wait to let file copies complete
WAITFOR DELAY '00:00:05'

--Delete the output
Set @TheExec = 'del "C:\Temp\UDEF_PS_Customers.csv" /F /Q'
exec master..xp_cmdshell @TheExec



GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task24]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Mon_Task24]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task24') IS NOT NULL
	DROP TABLE #Tb_Mon_Task24

CREATE TABLE #Tb_Mon_Task24
([ID]				INT NOT NULL,
[Date Changed]		DATE NOT NULL,
[Type]				VARCHAR(25) NOT NULL,
[Part]				VARCHAR(255) NOT NULL,
[Qty. Adjusted By]	DECIMAL(15,5) NOT NULL,
[Reason]			VARCHAR(255) NOT NULL,
[Value]				DECIMAL(15,5) NOT NULL,
[User]				VARCHAR(255) NOT NULL);

INSERT INTO #Tb_Mon_Task24
SELECT
	H.[ID],
	H.[CreatedOn]																								AS [Date Changed],
	CASE LEFT(H.[Part],1)
		WHEN 'B' THEN 'Bulk'
		WHEN 'F' THEN 'Filled Product'
		WHEN 'G' THEN 'Glass'
		WHEN 'L' THEN 'Label'
		WHEN 'P' THEN 'Packaging'
		ELSE 'Unknown'
	END																											AS [Type],
	ISNULL(P.[Part],H.[Part]) + ': ' + ISNULL(P.[Description1],'') + ' ' + ISNULL(P.[Description2],'')			AS [Part],
	H.[Quantity]																								AS [Qty. Adjusted By],
	H.[Reason]																									AS [Reason],
	ISNULL((P.[MaterialCost]/P.[MaterialCostPer])* H.[Quantity],0)												AS [Value],
	CASE ISNULL(U.[Surname],'') + ISNULL(U.[Forenames],'')
		WHEN '' THEN H.[User] 
		ELSE ISNULL(U.[Surname],'') + ', ' + ISNULL(U.[Forenames],'')								
	END																												AS [User]
FROM
				[vw_ASC_LIVE_History]			H	
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]				P ON H.[Part]	= P.[Part]
LEFT OUTER JOIN [vw_ASC_LIVE_SystemPeople]		U ON H.[User]	= U.[Code] 
WHERE
	H.[ActionTypeCode] = 'AD'
AND H.[ID] NOT IN (SELECT [Ref] FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID);

If (SELECT COUNT(*) FROM [#Tb_Mon_Task24]) > 0
BEGIN
	
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	set @EMailBody =	'<p>Please find below a list of all new stock adjustments.</p>' +
						'<p><table>' +  
						'<tr><th>Date Changed</th><th>Type</th><th>Part</th><th>Qty. Adjusted By</th><th>Value</th><th>User</th></tr>' +  
						CAST((SELECT 
								CONVERT(VARCHAR(19),[Date Changed],120)	AS [td],'',
								[Type]									AS [td],'',
								[Part]									AS [td],'',
								[Qty. Adjusted By]						AS [td],'',
								[Value]									AS [td],'',
								[User]									AS [td],''
							FROM 
								[#Tb_Mon_Task24]
							ORDER BY
								[Date Changed]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>'
						
	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('Supply Chain','','Stock Adjustments',@EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 and [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [ID] FROM [#Tb_Mon_Task24];

END;

DROP TABLE #Tb_Mon_Task24;

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task25]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_Mon_Task25]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

Exec [ASC_LIVE].[dbo].[UDEF_UPDATE_SALES_SUMMARY_TBL_GE];

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task26]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_Mon_Task26]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

declare @Files_Temp		table ([ID] int IDENTITY,[FileName] varchar(100))
declare @Files			table ([ID] int IDENTITY,[FileName] varchar(100),[Name] VARCHAR(255))
declare @Files2			table ([ID] int IDENTITY,[FileName] varchar(100))
declare @LastImportID	int
declare @ImportID		int
declare @FileName		varchar(100)
declare @ShellCmd		varchar(1000)
declare @Timer			datetime
declare @ImportName1	varchar(500)	= 'Stock'
declare @ImportName2	varchar(500)	= 'NonStock'
declare @ImportPath		varchar(500)	= '\\asc01\DATA\aCould Capture\From Capture\Import_Staging'
declare @BackupPath		varchar(500)	= '\\asc01\DATA\aCould Capture\From Capture\Import_Backup'
declare @ExportPath		varchar(500)	= '\\asc01\DATA\aCould Capture\From Capture\Import'
declare @Path			varchar(500)
declare @Type			varchar(500)

/*
There are several stages to this procedure but as they are largely dependent on Supply Chain\Capture\ADM\Access 
they will all run independently, processing what is available to them each time the procedure is run. For example, 
sending the XML is one step, then a later step of sending the PDF relies on Access processing the XML successfully, 
so rather than wait for the one item to be complete and moving onto the next one, any that are ready for the PDF 
to be moved at that point will be moved.

The steps are: -
1. [PDFFound] Found a PDF for an item
2. [XMLFound] Found a matching XML for an item
3. [XMLSent] Copied the XML to the import folder once steps 1 & 2 are met
4. [XMLGone] The XML file is no longer present in the import folder
5. [PIREntryFound] A correlating entry has been found in Supply chain (meaning the XML was processed successfully)
6. [PDFSent] Copied PDF to import folder
7. [PDFGone] The PDF file is no longer present in the import folder

NOTE: As these run independently and it doesn’t wait for each stage on an item, the date time stamps reflect the time 
the noticed the change ([PDFGone] for example), it may not reflect the exact time it actually happened, it will be as 
accurate as the time in which the procedure is run (i.e. if it is run every minute, it will be accurate to within the 
minute)

I have also created a backup routine so we can keep a copy of every file should we need to revert to it

*/

--Collect a list of files in the staging folders

--Stock
SET @ShellCmd = CONCAT('dir "',@ImportPath,'\',@ImportName1,'" /b')
EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
	INSERT INTO @Files_Temp EXECUTE xp_cmdshell @ShellCmd
REVERT;
DELETE FROM @Files_Temp WHERE [FileName] IS NULL
INSERT INTO @Files ([FileName],[Name]) SELECT [FileName], @ImportName1 FROM @Files_Temp
DELETE FROM @Files_Temp 

--Non-Stock
SET @ShellCmd = CONCAT('dir "',@ImportPath,'\',@ImportName2,'" /b')
EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
	INSERT INTO @Files_Temp EXECUTE xp_cmdshell @ShellCmd
REVERT;
DELETE FROM @Files_Temp WHERE [FileName] IS NULL
INSERT INTO @Files ([FileName],[Name]) SELECT [FileName], @ImportName2 FROM @Files_Temp
DELETE FROM @Files_Temp 

--Step 1: [PDFFound]
--Insert any new PDF files that are not already in the processing table
INSERT INTO [Tb_Cap_Import] ([Item],[PDFFound],[Type]) 
SELECT LEFT([FileName],len([FileName])-4), SYSDATETIME(), [Name] from @Files where right([FileName],4) = '.pdf' and LEFT([FileName],len([FileName])-4) NOT IN (SELECT [Item] FROM [Tb_Cap_Import])

--Step 2: [XMLFound]
--Now set the XMLFound for any new XML files
UPDATE [Tb_Cap_Import] SET [XMLFound] = SYSDATETIME() WHERE [PDFFound] IS NOT NULL AND [XMLFound] IS NULL AND [Item] in (select LEFT([FileName],len([FileName])-4) from @Files where right([FileName],4) = '.xml')

--Step 3: [XMLSent]
--Now loop through and move all XML files that can be but have not been moved have not been moved
SET @LastImportID = 0
WHILE (SELECT COUNT([ID]) from [Tb_Cap_Import] where [PDFFound] IS NOT NULL AND [XMLFound] IS NOT NULL AND [XMLSENT] IS NULL AND [ID] > @LastImportID) > 0
BEGIN

	--Select the ID of one that has not been sent
	SET @ImportID = (SELECT MIN([ID]) from [Tb_Cap_Import] where [PDFFound] IS NOT NULL AND [XMLFound] IS NOT NULL AND [XMLSent] IS NULL AND [ID] > @LastImportID)
	
	--We remember the last import ID as a way of not getting stuck on one item and enabling the parsing of all that need processing
	SET @LastImportID = @ImportID

	--Get the filename and calculate the correct path based on type
	SELECT 
		@FileName = CONCAT([Item], '.xml'),
		@Path = CONCAT(@ImportPath,'\',[Type]),
		@Type = [Type]
	FROM 
		[Tb_Cap_Import] 
	WHERE 
		[ID] = @ImportID
	
	--Build the copy command
	SET @ShellCmd = (SELECT CONCAT('xcopy "', @Path, '\', @FileName, '" "', @ExportPath, '" /C /I /Q /Y'))
	
	--Copy
	EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
		EXECUTE xp_cmdshell @ShellCmd

		--Send to backup as well
		SET @ShellCmd = (SELECT CONCAT('xcopy "', @Path, '\', @FileName, '" "', @BackupPath, '\', @Type, '" /C /I /Q /Y'))
		EXECUTE xp_cmdshell @ShellCmd

	REVERT;

	UPDATE [Tb_Cap_Import] SET [XMLSent] = SYSDATETIME() WHERE [ID] = @ImportID;

	--Give the files system 5 seconds to comply
	WAITFOR DELAY '00:00:05'

	--delete the file
	set @ShellCmd = (SELECT CONCAT('del "', @Path,'\', @FileName,'"'))
	EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
		EXECUTE xp_cmdshell @ShellCmd
	REVERT;

END;


--Step 4: [XMLGone]
--Look for missing XML files implying the it has been ingested

--Collect a list of files in the import folder
SET @ShellCmd = CONCAT('dir "',@ExportPath,'" /b')
EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
	INSERT INTO @Files_Temp execute xp_cmdshell @ShellCmd
REVERT;

DELETE FROM @Files_Temp WHERE [FileName] IS NULL
UPDATE [Tb_Cap_Import] SET [XMLGone] = SYSDATETIME() where [PDFFound] IS NOT NULL AND [XMLFound] IS NOT NULL AND [XMLSent] IS NOT NULL AND [XMLGone] IS NULL AND [Item] NOT IN (SELECT LEFT([FileName],len([FileName])-4) FROM @Files_Temp where right([FileName],4) = '.xml')
DELETE FROM @Files_Temp

--Step 5: [PIREntryFound] 
--A correlating entry has been found in Supply chain (meaning the XML was processed successfully)
UPDATE [Tb_Cap_Import] SET [PIREntryFound] = SYSDATETIME() where [PDFFound] IS NOT NULL AND [XMLFound] IS NOT NULL AND [XMLSent] IS NOT NULL AND [XMLGone] IS NOT NULL AND [PIREntryFound] IS NULL AND [Item] IN (SELECT [File_Name] COLLATE Latin1_General_CI_AS FROM [ASC_LIVE].[dbo].[UDEF_Capture_PIR_Filing_aCloud])


--Step 6: [PDFSent]
--Now loop through and move all PDF files that can be but have not been moved have not been moved
SET @LastImportID = 0
WHILE (SELECT COUNT([ID]) from [Tb_Cap_Import] where [PDFFound] IS NOT NULL AND [XMLFound] IS NOT NULL AND [XMLSent] IS NOT NULL AND [XMLGone] IS NOT NULL AND [PIREntryFound] IS NOT NULL AND [PDFSent] IS NULL AND [ID] > @LastImportID) > 0
BEGIN

	--Select the ID of one that has not been sent
	SET @ImportID = (SELECT MIN([ID]) from [Tb_Cap_Import] where [PDFFound] IS NOT NULL AND [XMLFound] IS NOT NULL AND [XMLSent] IS NOT NULL AND [XMLGone] IS NOT NULL AND [PIREntryFound] IS NOT NULL AND [PDFSent] IS NULL AND [ID] > @LastImportID)
	
	--We remember the last import ID as a way of not getting stuck on one item and enabling the parsing of all that need processing
	SET @LastImportID = @ImportID

	--Get the filename and calculate the correct path based on type
	SELECT 
		@FileName = CONCAT([Item], '.pdf'),
		@Path = CONCAT(@ImportPath,'\',[Type])
	FROM 
		[Tb_Cap_Import] 
	WHERE 
		[ID] = @ImportID
	
	--Build the copy command
	SET @ShellCmd = (SELECT CONCAT('xcopy "', @Path, '\', @FileName, '" "', @ExportPath, '" /C /I /Q /Y'))
	
	--Copy
	EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
		EXECUTE xp_cmdshell @ShellCmd

		--Send to backup as well
		SET @ShellCmd = (SELECT CONCAT('xcopy "', @Path, '\', @FileName, '" "', @BackupPath, '\', @Type, '" /C /I /Q /Y'))
		EXECUTE xp_cmdshell @ShellCmd

	REVERT;

	UPDATE [Tb_Cap_Import] SET [PDFSent] = SYSDATETIME() WHERE [ID] = @ImportID;

	--Give the files system 5 seconds to comply
	WAITFOR DELAY '00:00:05'

	--delete the file
	set @ShellCmd = (SELECT CONCAT('del "', @Path,'\', @FileName,'"'))
	EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
		EXECUTE xp_cmdshell @ShellCmd
	REVERT;

END;


--Step 7: [PDFGone]
--Look for missing PDF files implying the it has been ingested

--Collect a list of files in the import folder
SET @ShellCmd = CONCAT('dir "',@ExportPath,'" /b')
EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
	INSERT INTO @Files_Temp execute xp_cmdshell @ShellCmd
REVERT;

DELETE FROM @Files_Temp WHERE [FileName] IS NULL
UPDATE [Tb_Cap_Import] SET [PDFGone] = SYSDATETIME() where [PDFFound] IS NOT NULL AND [XMLFound] IS NOT NULL AND [XMLSent] IS NOT NULL AND [XMLGone] IS NOT NULL AND [PIREntryFound] IS NOT NULL AND [PDFSent] IS NOT NULL AND [PDFGone] IS NULL AND [Item] NOT IN (SELECT LEFT([FileName],len([FileName])-4) FROM @Files_Temp where right([FileName],4) = '.pdf')
DELETE FROM @Files_Temp

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task27]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_Mon_Task27]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

declare @Path		varchar(500)	= '\\fileserver\fileserver\Accountsop\Aged Debtor Report\'
declare @ShellCmd	varchar(1000)
declare @OldName	varchar(100)	= 'AgedDebtorReport.xlsx'
declare @Files		table (ID int IDENTITY, [FileName] varchar(100))
declare @NewName	varchar(500)	
declare @Dte		datetime		= (SELECT SYSDATETIME())
DECLARE @EMailBody	NVARCHAR(MAX)

--Check if the file exists
execute AS login = 'HAYMAN0\SQLNetworkAccess' 
Set @ShellCmd = CONCAT('dir "',@Path + @OldName,'" /b')
insert into @Files execute xp_cmdshell @ShellCmd
REVERT

IF (SELECT TOP 1 UPPER(LEFT([FileName],1)) FROM @Files) = 'A'
	BEGIN
		--Build the new name
		set @NewName = CONCAT('AgedDebtorReport_', (SELECT CONCAT(CONVERT(VARCHAR(4),YEAR(@Dte)), RIGHT('00' + CONVERT(VARCHAR(2),MONTH(@Dte)),2), RIGHT('00' + CONVERT(VARCHAR(2),DAY(@Dte)),2))), '.xlsx')
		
		--rename it
		execute AS login = 'HAYMAN0\SQLNetworkAccess' 
		Set @ShellCmd = CONCAT('ren "',@Path + @OldName,'" "', @NewName,'"')
		insert into @Files execute xp_cmdshell @ShellCmd
		REVERT

		--Send Email
		set @EMailBody =	'<p>A new aged debtors report has been created, <a href="' + @Path + @NewName + '">click here</a> to access it.</p>';

	INSERT INTO [Tb_Mon_Emails] ([To],[Subject],[Body],[Profile],[ReadyToSend],[LnkRunID]) VALUES ('','Daily Aged Debtors Report',@EMailBody,'Supply Chain',0,@RunID);
	
End;


GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task28]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task28]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

drop table if exists [#Tb_Mon_Task28]
drop table if exists [#Tb_Mon_Task28_Q]

CREATE TABLE [#Tb_Mon_Task28]
(
[Warehouse]			VARCHAR(5) NOT NULL,
[Direction]			VARCHAR(9) NOT NULL,
[LotUpdated]		DATETIME NOT NULL,
[LotUpdated_T]		VARCHAR(20) NULL,
[LotID]				INT NOT NULL,
[Lot]				INT NOT NULL,
[Part]				VARCHAR(16) NOT NULL,
[PartDescription]	VARCHAR(255) NOT NULL,
[Quantity]			DECIMAL(15,5) NOT NULL,
[BatchRef]			VARCHAR(40) NOT NULL,
[LotDescription]	VARCHAR(30) NOT NULL);

CREATE TABLE #Tb_Mon_Task28_Q
(
[Warehouse]			VARCHAR(5) NOT NULL,
[Description]		VARCHAR(255) NOT NULL,
[Monitored]			VARCHAR(3) NOT NULL);


--Get all the quarantine warehouses
INSERT INTO #Tb_Mon_Task28_Q
SELECT 
	LTRIM(RTRIM([SystemCode]))					AS [Warehouse],
	LTRIM(RTRIM(LEFT([SystemDescription],40)))	AS [Description],
	'No'										AS [Monitored]
FROM 
	[vw_ASC_LIVE_SystemCodes] 
where 
	[TypeCode] = 'W' 
AND [EUMemberState] = 'Y'

--Mark which ones we monitor
UPDATE #Tb_Mon_Task28_Q SET [Monitored] = 'Yes' WHERE [Warehouse] IN ('UF', 'RQ', 'WQ')

--Collect all lots that are newly in or still in a monitored quarantine warehouse and also make a note where a lot is no longer in a monitored quarantine warehouse 
--NOTE: We may not have information on that that leave a monitored quarantine warehouse (the lot may have left the system)
INSERT INTO #Tb_Mon_Task28
SELECT
	L.[Warehouse],
	CASE (select COUNT([Ref01]) from [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID AND CONVERT(INT,[Ref01]) = L.[ID])
		WHEN 0 THEN 'In'
		ELSE 'No change'
	END					AS [Direction],
	L.[UpdatedOn]		AS [LotUpdated],
	''					AS [LotUpdated_T],
	L.[ID]				AS [LotID],
	L.[Number]			AS [Lot],
	ISNULL(L.[Part],'')	AS [Part],
	P.[Description1] + case ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END AS [PartDescription],
	L.[Quantity]		AS [Quantity],
	L.[SerialNo]		AS [BatchRef],
	L.[Description]		AS [LotDescription]
FROM
				[vw_ASC_LIVE_Lots]	L
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]	P ON L.[Part] = P.[Part]
WHERE
	LTRIM(RTRIM(L.[Warehouse]))	IN (SELECT [Warehouse] FROM [#Tb_Mon_Task28_Q] where [Monitored] = 'Yes')
UNION ALL
SELECT
	ISNULL(L.[Warehouse],'')				AS [Warehouse],
	'Out'									AS [Direction],
	ISNULL(L.[UpdatedOn],0)					AS [LotUpdated],
	''										AS [LotUpdated_T],
	CONVERT(INT,MC.[Ref01])					AS [LotID],
	CONVERT(INT,MC.[Ref02])					AS [Lot],
	ISNULL(L.[Part],'')						AS [Part],
	ISNULL(P.[Description1],'') + CASE ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END AS [PartDescription],
	ISNULL(L.[Quantity],0)					AS [Quantity],
	ISNULL(L.[SerialNo],'')					AS [BatchRef],
	ISNULL(L.[Description],'')				AS [LotDescription]
FROM 
				[Tb_Mon_Comparisons]		MC
LEFT OUTER JOIN [vw_ASC_LIVE_Lots]			L	ON L.[ID] = CONVERT(INT,MC.[Ref01])
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]			P	ON L.[Part] = P.[Part]
WHERE 
	MC.[LnkTaskID] = @TaskID
AND CONVERT(INT,MC.[Ref01]) NOT IN (SELECT L.[ID] FROM [vw_ASC_LIVE_Lots] L WHERE LTRIM(RTRIM(L.[Warehouse])) IN (SELECT [Warehouse] FROM [#Tb_Mon_Task28_Q] where [Monitored] = 'Yes'))

--Try and get information from lot history in case the lot has gone
UPDATE 
	#Tb_Mon_Task28 
SET 
	[Warehouse] = ISNULL(LH.[Warehouse],''),
	[LotUpdated] = ISNULL(LH.[Date],0),
	[Part] = ISNULL(LH.[Part],''),
	[PartDescription] = ISNULL(P.[Description1],'') + CASE ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END,
	[Quantity] = ISNULL(LH.[Quantity],0),
	[BatchRef] = ISNULL(LH.[SerialNo],''),
	[LotDescription] = ISNULL(LH.[Description],'')
FROM
	#Tb_Mon_Task28 T1
	LEFT OUTER JOIN [vw_ASC_LIVE_LotHistory]	LH	ON LH.[LotNo] = T1.[Lot]
	LEFT OUTER JOIN [vw_ASC_LIVE_Parts]			P	ON P.[Part] = LH.[Part]
WHERE 
	T1.[Part] = ''


-- update the lot updated DTS to be easier to read
UPDATE 
	#Tb_Mon_Task28 
SET 
	[LotUpdated_T] =	RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,[LotUpdated])),2) + '/' + FORMAT([LotUpdated], 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,[LotUpdated])) + ' ' +
						RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,[LotUpdated])),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,[LotUpdated])),2) 
WHERE 
	[LotUpdated] <> 0

--Look for differences and talk if there were any 
If (SELECT COUNT(*) FROM [#Tb_Mon_Task28] WHERE [Direction] <> 'No change') > 0
BEGIN
	
	DECLARE @EMailBody	NVARCHAR(MAX)
	DECLARE @EmailID	INT
	DECLARE @Dte		DATETIME
	DECLARE @CheckDate	VARCHAR(12)
	DECLARE @CheckTime	VARCHAR(6)
	DECLARE @ChangeDate	VARCHAR(12)
	DECLARE @ChangeTime	VARCHAR(6)
	DECLARE @NoChange	INT

	--Get the date the process last run (it can run many times but if there are no differences then nothing is reported)
	SET @Dte = (SELECT [Start] from [Tb_Mon_Runs] WHERE [ID] = (SELECT MAX([ID]) FROM [Tb_Mon_Runs] WHERE [TaskID] = @TaskID AND [ID] < @RunID and [Status] = 2))
	IF @Dte IS NULL
		SET @Dte = sysdatetime()
	
	SET @CheckDate = RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,@Dte)),2) + '/' + FORMAT(@Dte, 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,@Dte))
	SET @CheckTime = RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,@Dte)),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,@Dte)),2)

	--Get the date the process last reported a change
	SET @Dte = (SELECT MAX([CreatedOn]) FROM [Tb_Mon_Emails] WHERE [LnkRunID] IN (SELECT [ID] FROM [Tb_Mon_Runs] WHERE [TaskID] = @TaskID))
	IF @Dte IS NULL
		SET @Dte = sysdatetime()
	
	SET @ChangeDate = RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,@Dte)),2) + '/' + FORMAT(@Dte, 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,@Dte))
	SET @ChangeTime = RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,@Dte)),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,@Dte)),2)

	--Build email body text
	set @EMailBody =	'<p>Please find below a list of lots that have entered, or left the monitored quarantine warehouses. This is a comparison of the location of lots in Supply Chain between now and the previous time this report was run.</p>' 

	IF (@CheckDate = @ChangeDate) AND (@CheckTime = @ChangeTime)
	BEGIN
		set @EMailBody = @EMailBody + '<p>This report was run on ' + @CheckDate + ' at ' + @CheckTime + ' and the below changes have been seen since then.</p>' 
	END
	ELSE					
	BEGIN
		set @EMailBody = @EMailBody + '<p>This report was run on ' + @CheckDate + ' at ' + @CheckTime + ' and the below changes have occurred since the last noted changes on ' + @ChangeDate + ' at ' + @ChangeTime + '.</p>' 
	END

	set @EMailBody = @EMailBody + '<p><table>' +  
	'<tr><th>Warehouse</th><th>Direction</th><th>Lot Updated</th><th>Lot No.</th><th>Part</th><th>Part Description</th><th>Quantity</th><th>Batch</th><th>Lot Description</th></tr>' +  
	CAST((SELECT 
			[Warehouse]							AS [td],'',
			[Direction]							AS [td],'',
			[LotUpdated_T]						AS [td],'',
			[Lot]								AS [td],'',
			[Part]								AS [td],'',
			[PartDescription]					AS [td],'',
			[Quantity]							AS [td],'',
			[BatchRef]							AS [td],'',
			[LotDescription]					AS [td],''
		FROM 
			[#Tb_Mon_Task28]
		WHERE 
			[Direction] <> 'No change'
		ORDER BY
			[Warehouse],[Direction], [LotUpdated] DESC
		FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
	'</table></p>' +
	'<p>Direction denotes the following.</p><ul>' + 
	'<li><b>In</b> - The lot is in a monitored quarantine warehouse and was not on the previous run of this report</li>' +
	'<li><b>Out</b> - The lot has left a monitored quarantine warehouse, the warehouse shows the non-quarantine warehouse it is now in.</li>' +
	'</ul></p><p>NOTE: If a lot enters and leaves a monitored quarantine warehouse in between a report run, it will not be seen in the report.</p>' 
						
	SET @NoChange = (SELECT COUNT(*) FROM [#Tb_Mon_Task28] WHERE [Direction] = 'No change')
	IF @NoChange = 0
	BEGIN
		set @EMailBody = @EMailBody + '<p>There were no lots in a monitored quarantine warehouse previously.</p>' 
	END
	ELSE					
	BEGIN
		IF @NoChange = 1
		BEGIN
			set @EMailBody = @EMailBody + '<p>There is 1 lot that has remained in a monitored quarantine warehouse since this report was last sent.</p>' 
		END
		ELSE					
		BEGIN
			set @EMailBody = @EMailBody + '<p>There are ' + CONVERT(VARCHAR(50),@NoChange) + ' lots that have remained in a monitored quarantine warehouse since this report was last sent.</p>' 
		END
	END
						
	set @EMailBody = @EMailBody + '<p>The below table shows all quarantine warehouses in Supply Chain that this report is monitoring.</p>'
	set @EMailBody = @EMailBody + '<p><table>' +  
	'<tr><th>Warehouse</th><th>Description</th></tr>' +  
	CAST((SELECT 
			[Warehouse]							AS [td],'',
			[Description]						AS [td],''
		FROM 
			[#Tb_Mon_Task28_Q]
		WHERE
			[Monitored] = 'Yes'
		ORDER BY
			[Monitored] DESC, [Warehouse]
		FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
	'</table></p>'

	SET @NoChange = (SELECT COUNT(*) FROM [#Tb_Mon_Task28_Q] WHERE [Monitored] = 'No')
	IF @NoChange = 0
	BEGIN
		set @EMailBody = @EMailBody + '<p>There are no quarantine warehouses that this report is not monitoring.</p>' 
	END
	ELSE					
	BEGIN
		IF @NoChange = 1
		BEGIN
			set @EMailBody = @EMailBody + '<p>There is 1 quarantine warehouse that this report is not monitoring.</p>' 
		END
		ELSE					
		BEGIN
			set @EMailBody = @EMailBody + '<p>There are ' + CONVERT(VARCHAR(50),@NoChange) + ' quarantine warehouses that this report is not monitoring.</p>' 
		END
	END

	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('Supply Chain','','Lots moved through monitored quarantine warehouses', @EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) 
	SELECT @EmailID,@TaskID,@RunID, RIGHT('0000000000' + CONVERT(VARCHAR(10),[LotID]),10) + '|' + RIGHT('0000000000' + CONVERT(VARCHAR(10),[Lot]),10) FROM [#Tb_Mon_Task28] WHERE [Direction] <> 'No Change';

	DELETE FROM [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID
	INSERT INTO [Tb_Mon_Comparisons] ([LnkTaskID],[Ref01],[Ref02]) SELECT @TaskID AS [LnkTaskID], CONVERT(VARCHAR(10),[LotID]) AS [Ref01], CONVERT(VARCHAR(10),[Lot]) AS [Ref02] FROM [#Tb_Mon_Task28] WHERE [Direction] <> 'Out'

END;

--samuelm@hgcompany.co.uk;gemmaw@hgcompany.co.uk;stephaniec@hgcompany.co.uk;wayneb@hgcompany.co.uk;huwb@hgcompany.co.uk;lizl@hgcompany.co.uk;stuarta@hgcompany.co.uk;jamies@hgcompany.co.uk

DROP TABLE #Tb_Mon_Task28;
DROP TABLE #Tb_Mon_Task28_Q;
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task29]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_Mon_Task29]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task29') IS NOT NULL
	DROP TABLE #Tb_Mon_Task29;

CREATE TABLE #Tb_Mon_Task29
([Part]				VARCHAR(30) NOT NULL,
[PartDesc]			VARCHAR(255) NOT NULL,
[InBoMFor]			VARCHAR(30) NOT NULL);

INSERT INTO #Tb_Mon_Task29
SELECT
	P.[Part]									AS [Part],
	P.[Description1] + ' ' + P.[Description2]	AS [PartDesc],
	B.[ParentPart]								AS [InBoMFor]
FROM
			[vw_ASC_LIVE_Parts]		P
INNER JOIN	[vw_ASC_LIVE_BoMs]		B ON P.[Part] = B.[OwnedPart]
WHERE
	P.[ProcurementCode] = '0'
AND B.[ParentPart] NOT IN (SELECT [Part] FROM [vw_ASC_LIVE_Parts] WHERE [ProcurementCode] = '0');

If (SELECT COUNT(*) FROM [#Tb_Mon_Task29]) > 0
BEGIN
	
	DECLARE @EMailBody NVARCHAR(MAX)
	DECLARE @EmailID int

	set @EMailBody =	'<p>Please find below a list of phantomised parts that are in a BoM of a part that is not phantomised.</p>' +
						'<p><table>' +  
						'<tr><th>Part</th><th>Description</th><th>In BoM For</th></tr>' +  
						CAST((SELECT 
								[Part]								AS [td],'',
								[PartDesc]							AS [td],'',
								[InBoMFor]							AS [td],''
							FROM 
								[#Tb_Mon_Task29]
							ORDER BY
								[Part],[InBoMFor]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>' 
						
	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('Supply Chain','','Phantomised parts in active BoMs', @EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [Part] FROM [#Tb_Mon_Task29];

END;

DROP TABLE #Tb_Mon_Task29;

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task30]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task30]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

set quoted_identifier ON;

IF OBJECT_ID('tempdb..#Tb_Mon_Task30') IS NOT NULL
	DROP TABLE #Tb_Mon_Task30;

IF OBJECT_ID('tempdb..#Tb_Mon_Task30_Types') IS NOT NULL
	DROP TABLE #Tb_Mon_Task30_Types;

CREATE TABLE #Tb_Mon_Task30
(
[Order]			INT NOT NULL,
[Name]			VARCHAR(100) NOT NULL,
[From]			VARCHAR(1024) NOT NULL,
[To]			VARCHAR(1024) NOT NULL,
[Fname]			VARCHAR(50) NOT NULL,
[Email]			VARCHAR(255) NOT NULL,
[Processed]		BIT NOT NULL);

CREATE TABLE #Tb_Mon_Task30_Types
(
[Order]				INT NOT NULL,
[Type]				VARCHAR(20) NOT NULL,
[Description]		VARCHAR(500) NOT NULL);

INSERT INTO #Tb_Mon_Task30_Types ([Order],[Type],[Description]) VALUES (1,'Spaces',
	'Space characters are removed (this could be at the end where it is not easily spotted), in certain cases this could hinder tracking')
INSERT INTO #Tb_Mon_Task30_Types ([Order],[Type],[Description]) VALUES (2,'Case',
	'domains are saved as lowercase for readibility (they are not case sensitive)')
INSERT INTO #Tb_Mon_Task30_Types ([Order],[Type],[Description]) VALUES (3,'Seperator',
	'All Multi-domained companies are altered to ensure they are seperated by a comma, not semi-colon, and no spaces')
INSERT INTO #Tb_Mon_Task30_Types ([Order],[Type],[Description]) VALUES (4,'@ Prefix',
	'Any @ symbol at the start of a domain listing is removed, they are not required and can hinder tracking')
INSERT INTO #Tb_Mon_Task30_Types ([Order],[Type],[Description]) VALUES (5,'Email address',
	'If the domain contains an email address, the prefix is removed to leave just the domain (i.e. me@home.com becomes home.com)')
INSERT INTO #Tb_Mon_Task30_Types ([Order],[Type],[Description]) VALUES (6,'Hosted domain',
	'If the domain is hosted then we must not track it this way, it is removed, to track a using a hosted email address you should add them as a contact and use their full email address. A hosted domain is a generic account like gmail.com.')

--the order to process these is carefully orchestrated, do not alter without consideration
--1. Spaces removed
--2. lowercase only (1 and 2 can be swapped)
--3. semi-colon to comma (verified this is the seperator with gold-vision help pages)
--4. @ removal (if at the start), including ,@ (comma and @) for multi domained accounts (this must be done after 3)
--5. conversion of email addresses (this must be done after 4 and before 6)
--6. Removal of hosted domains (e.g. gmail.com)

--The below is done on a seperate schedule, as there are so many of this error and I can not automate a fix, it will require the user to do something....
--7. Query duplicate, if there are mutliple companies with the same domain this should be raised

--1. Spaces removed (now the field may be removed entirely but we can't safely judge that until we have done this)
INSERT INTO #Tb_Mon_Task30 ([Order],[Name],[From],[To],[Fname],[Email],[Processed])
SELECT 
	1									AS [Order],
	A.[NAME]							AS [Name],
	A.[EMAIL_DOMAINS]					AS [From],
	REPLACE(A.[EMAIL_DOMAINS],' ','')	AS [To],
	A.[US_ID_SALES]						AS [Fname],
	'',0
FROM 
		[GoldVisionCRM].[dbo].[ACCOUNTS]	A
WHERE
	A.[AC_DELETED] <> 1
AND CHARINDEX(' ',A.[EMAIL_DOMAINS]) <> 0;

--1. Spaces removed: must do the update as it will look different for the next check
UPDATE	[GoldVisionCRM].[dbo].[ACCOUNTS] 
SET		[EMAIL_DOMAINS] = REPLACE([EMAIL_DOMAINS],' ','')
WHERE	[AC_DELETED] <> 1 
AND		CHARINDEX(' ',[EMAIL_DOMAINS]) <> 0;


----2. lowercase only
INSERT INTO #Tb_Mon_Task30 ([Order],[Name],[From],[To],[Fname],[Email],[Processed])
SELECT 
	2							AS [Order],
	A.[Name]					AS [Name],
	A.[EMAIL_DOMAINS]			AS [From],
	LOWER(A.[EMAIL_DOMAINS])	AS [To],
	A.[US_ID_SALES]				AS [Fname],'',0
FROM 
			[GoldVisionCRM].[dbo].[ACCOUNTS]	A
WHERE
	A.[AC_DELETED] <> 1
AND (CHARINDEX('A',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('B',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('C',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('D',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('E',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('F',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('G',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('H',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('I',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('J',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('K',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('L',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('M',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('O',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('P',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('Q',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('R',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('S',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('T',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('U',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('V',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('W',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('X',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('Y',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('Z',A.[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0);

--2. lowercase only
UPDATE	[GoldVisionCRM].[dbo].[ACCOUNTS]
SET		[EMAIL_DOMAINS] = LOWER([EMAIL_DOMAINS])
WHERE	[AC_DELETED] <> 1
AND (CHARINDEX('A',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('B',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('C',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('D',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('E',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('F',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('G',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('H',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('I',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('J',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('K',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('L',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('M',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('O',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('P',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('Q',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('R',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('S',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('T',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('U',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('V',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('W',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('X',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('Y',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0
	OR CHARINDEX('Z',[EMAIL_DOMAINS] COLLATE Latin1_General_CS_AS) <> 0);


--3. semi-colon to comma
INSERT INTO #Tb_Mon_Task30 ([Order],[Name],[From],[To],[Fname],[Email],[Processed])
SELECT 
	3									AS [Order],
	A.[NAME]							AS [Name],
	A.[EMAIL_DOMAINS]					AS [From],
	REPLACE(A.[EMAIL_DOMAINS],';',',')	AS [To],
	A.[US_ID_SALES]						AS [Fname],'',0
FROM 
			[GoldVisionCRM].[dbo].[ACCOUNTS]	A 
WHERE
	A.[AC_DELETED] <> 1
AND CHARINDEX(';',A.[EMAIL_DOMAINS]) <> 0;

--3. semi-colon to comma
UPDATE	[GoldVisionCRM].[dbo].[ACCOUNTS]
SET		[EMAIL_DOMAINS] = REPLACE([EMAIL_DOMAINS],';',',')
WHERE	[AC_DELETED] <> 1
AND		CHARINDEX(';',[EMAIL_DOMAINS]) <> 0;

--4. @ removal (if at the start), including ,@ (comma and @)
INSERT INTO #Tb_Mon_Task30 ([Order],[Name],[From],[To],[Fname],[Email],[Processed])
SELECT 
	4					AS [Order],
	A.[NAME]			AS [Name],
	A.[EMAIL_DOMAINS]	AS [From],
	CASE LEFT(A.[EMAIL_DOMAINS],1)
		WHEN '@' THEN
			RIGHT(REPLACE(A.[EMAIL_DOMAINS],',@',','),LEN(REPLACE(A.[EMAIL_DOMAINS],',@',','))-1)
		ELSE
			REPLACE(A.[EMAIL_DOMAINS],',@',',')
	END					AS [To],
	A.[US_ID_SALES]		AS [Fname],'',0
FROM 
			[GoldVisionCRM].[dbo].[ACCOUNTS]	A
INNER JOIN	[GoldVisionCRM].[dbo].[USERS]		U ON U.[US_ID] = A.[US_ID_SALES]
WHERE
	A.[AC_DELETED] <> 1
AND (CHARINDEX(',@',A.[EMAIL_DOMAINS]) <> 0
OR	LEFT(A.[EMAIL_DOMAINS],1) = '@');

--4. @ removal (if at the start), including ,@ (comma and @)
UPDATE [GoldVisionCRM].[dbo].[ACCOUNTS]
SET [EMAIL_DOMAINS] =
	CASE LEFT([EMAIL_DOMAINS],1)
		WHEN '@' THEN
			RIGHT(REPLACE([EMAIL_DOMAINS],',@',','),LEN(REPLACE([EMAIL_DOMAINS],',@',','))-1)
		ELSE
			REPLACE([EMAIL_DOMAINS],',@',',')
	END
WHERE
	[AC_DELETED] <> 1
AND (CHARINDEX(',@',[EMAIL_DOMAINS]) <> 0
OR	LEFT([EMAIL_DOMAINS],1) = '@' );


--5. conversion of email addresses
INSERT INTO #Tb_Mon_Task30 ([Order],[Name],[From],[To],[Fname],[Email],[Processed])
SELECT 
	5																				AS [Order],
	[NAME]																			AS [Name],
	[EMAIL_DOMAINS]																	AS [From],
	RIGHT([EMAIL_DOMAINS],LEN([EMAIL_DOMAINS]) - CHARINDEX('@',[EMAIL_DOMAINS]))	AS [To],
	[US_ID_SALES]																	AS [FName],'',0
FROM 
	[GoldVisionCRM].[dbo].[ACCOUNTS] 
WHERE
	[AC_DELETED] <> 1
AND CHARINDEX('@',[EMAIL_DOMAINS]) <> 0;

--5. conversion of email addresses
UPDATE	[GoldVisionCRM].[dbo].[ACCOUNTS]
SET		[EMAIL_DOMAINS] = RIGHT([EMAIL_DOMAINS],LEN([EMAIL_DOMAINS]) - CHARINDEX('@',[EMAIL_DOMAINS]))
WHERE	[AC_DELETED] <> 1
AND		CHARINDEX('@',[EMAIL_DOMAINS]) <> 0;

--6. Removal of hosted domains (e.g. gmail.com)
INSERT INTO #Tb_Mon_Task30 ([Order],[Name],[From],[To],[Fname],[Email],[Processed])
SELECT 
	6				AS [Order],
	[NAME]			as [Name],
	[EMAIL_DOMAINS]	AS [From],
	''				AS [To],
	[US_ID_SALES]	AS [FName],'',0
FROM 
			[GoldVisionCRM].[dbo].[ACCOUNTS] A
INNER JOIN	[Tb_Gold-Vision_HostedDomains] HD ON lower(HD.[Domain]) = A.[EMAIL_DOMAINS]
WHERE
	A.[AC_DELETED] <> 1;

--6. Removal of hosted domains (e.g. gmail.com)
UPDATE [GoldVisionCRM].[dbo].[ACCOUNTS]
SET [EMAIL_DOMAINS] = '' 
WHERE
	[AC_DELETED] <> 1
AND [EMAIL_DOMAINS] IN (SELECT LOWER([Domain]) FROM [Tb_Gold-Vision_HostedDomains]); 

--7. Query duplicate, if there are mutliple companies with the same domain this should be raised
--INSERT INTO #Tb_Mon_Task30
--SELECT 
--	'Duplicate domains',
--	'The domain is used for multiple active companies',
--	[EMAIL_DOMAINS],
--	[Name]
--FROM 
--	ACCOUNTS 
--WHERE
--	EMAIL_DOMAINS IN (
--select
--	T1.EMAIL_DOMAINS
--FROM
--(select 
--	EMAIL_DOMAINS, 
--	count(EMAIL_DOMAINS) as [Domains]
--from 
--	ACCOUNTS 
--where 
--	AC_DELETED <> 1 
--and EMAIL_DOMAINS <> '' 
--and EMAIL_DOMAINS <> 'None' 
--group by 
--	EMAIL_DOMAINS) T1
--where 
--	T1.[Domains] > 1)
--AND AC_DELETED <> 1
--ORDER BY
--	[EMAIL_DOMAINS],
--	[name]


--Collect email addresses
UPDATE T1
SET
	T1.[FName] = U.[FNAME],
	T1.[Email] = U.[EMAIL_ADDRESS]
FROM
	[#Tb_Mon_Task30] T1
INNER JOIN [GoldVisionCRM].[dbo].[USERS] U ON U.[US_ID] = T1.[Fname];

If (SELECT COUNT(*) FROM [#Tb_Mon_Task30]) > 0
BEGIN
	DECLARE @Email		VARCHAR(255)
	DECLARE @EMailBody	NVARCHAR(MAX)
	DECLARE @Fname		VARCHAR(50)
	DECLARE @Type		INT
	DECLARE @EmailID	INT

	WHILE (SELECT Count([Email]) From #Tb_Mon_Task30 Where [Processed] = 0) > 0
	BEGIN
		
		SELECT TOP 1 @Email = [Email] FROM [#Tb_Mon_Task30] WHERE [Processed] = 0
		SELECT TOP 1 @Fname = [Fname] FROM [#Tb_Mon_Task30] WHERE [Email] = @Email

		SET @EMailBody =	'<p>Hi ' + @Fname + ',</p>' + 
					'<p>Some formatting inconsistencies were found with the company domain entry for companies that you are the account manager for in Gold-Vision, ' + 
					'these have been automatically updated and are described below for your reference.</p>' +
					'<p>The types of changes made are: -</p><ul>'

		SET @Type = 1
		WHILE @Type < (SELECT MAX([Order]) FROM [#Tb_Mon_Task30_Types])
		BEGIN
			SET @EMailBody = @EMailBody + 
				CASE
					WHEN (SELECT COUNT([Order]) FROM [#Tb_Mon_Task30] WHERE [Email] = @Email AND [Order] = @Type) > 0 THEN (SELECT '<li><strong>' + [Type] + '</strong> - ' + [Description] + '</li>' FROM [#Tb_Mon_Task30_Types] WHERE [Order] = @Type)
					ELSE ''
				END
			SET @Type = @Type + 1
		END;
				
		SET @EMailBody = @EMailBody + '</ul><p><table>' +  
						'<tr><th>Type</th><th>Company</th><th>From</th><th>To</th></tr>' +  
						CAST((SELECT
								T.[Type]		AS [td],'',
								T1.[Name]		AS [td],'',
								T1.[From]		AS [td],'',
								T1.[To]			AS [td],''
							FROM 
										[#Tb_Mon_Task30] T1
							INNER JOIN	[#Tb_Mon_Task30_Types] T ON T.[Order] = T1.[Order]
							WHERE
								[Email] = @Email
							ORDER BY
								T1.[Order], T1.[Name], T1.[From], T1.[To]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>' 
		
		INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Gold-Vision',@Email,'Gold-Vision domain checks', @EMailBody,0,@RunID);
		
		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
		
		INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [Name] + ', ' + [From] + ', ' + [To] FROM [#Tb_Mon_Task30] where [Email] = @Email;
		
		update [#Tb_Mon_Task30] set [Processed] = 1 WHERE [Email] = @Email
		
	END;

END;

DROP TABLE #Tb_Mon_Task30;
DROP TABLE #Tb_Mon_Task30_Types;

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task31]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Mon_Task31]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @combinedString VARCHAR(1000)
DECLARE @AddConCode		VARCHAR(250)
DECLARE @ID				INT
DECLARE @Difference		INT
DECLARE @OrderNum		VARCHAR(10)
DECLARE @Part			VARCHAR(10)
DECLARE @SentOn			DATETIME
DECLARE @Filename		VARCHAR(255)
DECLARE @Email			VARCHAR(255)
DECLARE @ManagerEmail	VARCHAR(255)
DECLARE @To				VARCHAR(255)
DECLARE @CC				VARCHAR(255)
DECLARE @EmailBody		VARCHAR(MAX)
DECLARE @EmailID		INT
DECLARE @ShellCmd		AS VARCHAR(1000)
DECLARE @DTS			DATETIME
DECLARE @DF				INT
DECLARE @Dur			INT

IF OBJECT_ID('#Tb_Mon_Task31') IS NOT NULL
DROP TABLE #Tb_Mon_Task31;

IF OBJECT_ID('#Tb_Mon_Task31_Differences') IS NOT NULL
DROP TABLE #Tb_Mon_Task31_Differences;

CREATE TABLE #Tb_Mon_Task31
(
[ID]					INT IDENTITY(1,1) NOT NULL,
[Customer Ref]			VARCHAR(MAX) NOT NULL,
[Collection Date]		VARCHAR(10) NOT NULL,
[Collection Name]		VARCHAR(MAX) NOT NULL,
[Collection Addr 1]		VARCHAR(MAX) NOT NULL,
[Collection Addr 2]		VARCHAR(MAX) NOT NULL,
[Collection Addr 3]		VARCHAR(MAX) NOT NULL,
[Collection Town]		VARCHAR(MAX) NOT NULL,
[Collection County]		VARCHAR(MAX) NOT NULL,
[Collection Country]	VARCHAR(MAX) NOT NULL,
[Collection PostCode]	VARCHAR(MAX) NOT NULL,
[Collection Contact]	VARCHAR(MAX) NOT NULL,
[Collection Telephone]	VARCHAR(MAX) NOT NULL,
[Collection Time]		VARCHAR(5) NOT NULL,
[Collection Notes]		VARCHAR(MAX) NOT NULL,
[Delivery Date]			VARCHAR(10) NOT NULL,
[Return Date]			DATETIME NULL,
[Delivery Name]			VARCHAR(MAX) NOT NULL,
[Delivery Address 1]	VARCHAR(MAX) NOT NULL,
[Delivery Address 2]	VARCHAR(MAX) NOT NULL,
[Delivery Address 3]	VARCHAR(MAX) NOT NULL,
[Delivery Town]			VARCHAR(MAX) NOT NULL,
[Delivery County]		VARCHAR(MAX) NOT NULL,
[Delivery Country]		VARCHAR(MAX) NOT NULL,
[Delivery PostCode]		VARCHAR(MAX) NOT NULL,
[Delivery Contact]		VARCHAR(MAX) NOT NULL,
[Del Phone]				VARCHAR(MAX) NOT NULL,
[Del Mobile]			VARCHAR(MAX) NOT NULL,
[Del Time]				VARCHAR(5) NOT NULL,
[Del Notes]				VARCHAR(MAX) NOT NULL,
[Cust Paperwork]		VARCHAR(3) NOT NULL,
[Service Code]			VARCHAR(MAX) NOT NULL,
[Surcharges]			VARCHAR(MAX) NOT NULL,
[Pallet Type A]			VARCHAR(MAX) NOT NULL,
[Type A Quantity]		VARCHAR(MAX) NOT NULL,
[Type A Weight]			VARCHAR(MAX) NOT NULL,
[Pallet Type B]			VARCHAR(MAX) NOT NULL,
[Type B Quantity]		VARCHAR(MAX) NOT NULL,
[Pallet Type B Weight]	VARCHAR(MAX) NOT NULL,
[Pallet Type C]			VARCHAR(MAX) NOT NULL,
[Type C Quantity]		VARCHAR(MAX) NOT NULL,
[Pallet Type C Weight]	VARCHAR(MAX) NOT NULL,
[Goods Desc]			VARCHAR(MAX) NOT NULL,
[UN No.]				VARCHAR(4) NOT NULL,
[Del Email]				VARCHAR(MAX) NOT NULL,
[Volume]				VARCHAR(MAX) NOT NULL,
[Job Type]				VARCHAR(MAX) NOT NULL,
[Haz Tunnel Code]		VARCHAR(3) NOT NULL,
[Haz Packin]			VARCHAR(MAX) NOT NULL,
[Haz Weigh]				VARCHAR(MAX) NOT NULL,
[Haz Quantity]			VARCHAR(MAX) NOT NULL,
[AddressConCode]		VARCHAR(MAX) NOT NULL,
[OrderNum]				VARCHAR(10) NOT NULL,
[Part]					VARCHAR(10) NOT NULL,
[Email]					VARCHAR(1024) NOT NULL,
[ManagerEmail]			VARCHAR(1024) NOT NULL,
[ItemsToReturn]			INT NOT NULL,
[Status]				INT NOT NULL
);

/*
1 = Monday
2 = Tuesday
3 = Wednesday
4 = Thursday
5 = Friday
6 = Saturday
7 = Sunday
*/
set @DF = @@DATEFIRST
SET DATEFIRST 1;
SELECT @Dur =	CASE 
					WHEN datepart(WEEKDAY, getdate()) IN (5) THEN 3
					ELSE 1
				END;
SET DATEFIRST @DF;

INSERT INTO [#Tb_Mon_Task31]

SELECT
	CONCAT('OO:', O.[OrderNum],' CC:', C.[Code], ' CO:', O.[CustomerOrderRef] COLLATE Latin1_General_CI_AS)	AS [Customer Ref],
	CONCAT(RIGHT(CONCAT('00',datepart(DAY, O.[ExpectedDueDate])),2),'/',RIGHT(CONCAT('00',datepart(MONTH, O.[ExpectedDueDate])),2),'/',datepart(YEAR, O.[ExpectedDueDate])) AS [Collection Date],
	'HG & CO Ltd'						AS [Collection Name],
	'Eastways Park'						AS [Collection Addr 1],
	''									AS [Collection Addr 2],
	''									AS [Collection Addr 3],
	'Witham'							AS [Collection Town],
	'Essex'								AS [Collection County],
	''									AS [Collection Country],
	'CM8 3YE'							AS [Collection PostCode],
	ISNULL(U.FullName,'')				AS [Collection Contact],
	'01376 517517'						AS [Collection Telephone],
	LEFT('',5)							AS [Collection Time],
	''									AS [Collection Notes],
	CONCAT(RIGHT(CONCAT('00',datepart(DAY, O.[CustomerDue])),2),'/',RIGHT(CONCAT('00',datepart(MONTH, O.[CustomerDue])),2),'/',datepart(YEAR, O.[CustomerDue])) AS [Delivery Date],
	DATEADD(DAY,5,O.[CustomerDue])			AS [Return Date],
	D.[CustomerName]		AS [Delivery Name],
	LTRIM(RTRIM(REPLACE(CASE CHARINDEX(char(13),D.[AddLine1])
		WHEN 0 THEN D.[AddLine1]
		ELSE left(D.[AddLine1],CHARINDEX(char(13),D.[AddLine1])-1)
	END,char(10),'')))						AS [Delivery Address 1],
	LTRIM(RTRIM(REPLACE(CASE CHARINDEX(char(13),D.[AddLine1])
		WHEN 0 THEN ''
		ELSE REPLACE(RIGHT(D.[AddLine1],len(D.[AddLine1])-len(left(D.[AddLine1],CHARINDEX(char(13),D.[AddLine1])+1))),char(13),', ')
	END,char(10),'')))						AS [Delivery Address 2],
	''							AS [Delivery Address 3],
	LTRIM(RTRIM(D.[AddLine3]))	AS [Delivery Town],
	LTRIM(RTRIM(D.[AddLine4]))	AS [Delivery County],
	''							AS [Delivery Country],
	D.[Postcode]				AS [Delivery PostCode],
case 
when O.[Duty] = 0 and O.[DutyReason] in (1,7) then 'UNDER BOND'
else
''
END				AS [Delivery Contact], --Duty Reason,
	''							AS [Del Phone],
	--CASE ISNULL(D.[DeliveryTel],'')
	--	WHEN '' THEN ISNULL(D.[Tel],'')
	--	ELSE D.[DeliveryTel]
	--END							AS [Del Phone],
	''							AS [Del Mobile],
	LEFT('',5)					AS [Del Time],
	'Lookup Incomplete'			AS [Del Notes], --Recurse, max 250
	LEFT('Yes',3)				AS [Cust Paperwork],
	'48'						AS [Service Code], --24 = next day, 48 = Economy, 72 = 3 day delivery area, 3-5 = 3-5 day delivery area
	CASE D.[TransportCode]
		WHEN  '' THEN	CASE C4.[TransRoute]
							WHEN 'CBI' THEN 'BI'
							WHEN 'CTL' THEN 'TL'
							WHEN 'TFTL' THEN 'TL' --Legacy (Should not be used)
							WHEN 'CTLBI' THEN 'TL BI'
							ELSE ''
						END
		WHEN 'CBI' THEN 'BI'
		WHEN 'CTL' THEN 'TL'
		WHEN 'TFTL' THEN 'TL' --Legacy (should not be used)
		WHEN 'CTLBI' THEN 'TL BI'
		ELSE ''
	END							AS [Surcharges], --TA = Pre 10:00, AM = Pre 12:00, PM = 12:00 onward delv, TB = Timed specific delv, BI = Booking In, Sat = Sat delv (AM only), TL = Tail Lift’
	CASE
		WHEN O.[Analysis2] IN ('CANS','CASES','C25') AND O.[QuantityDelivered] < 5 THEN 'PARCELS'
		--WHEN O.[Analysis2] IN ('CANS','CASES','C25') AND O.[QuantityDelivered] < 5 AND ((O.[QuantityOrdered] - O.[QuantityDelivered]) * (CASE P.[WeightPer] WHEN 0 THEN P.[Weight] ELSE P.[Weight] / P.[WeightPer] END)) < 500 THEN 'PALLETS' --Used to be 'HALF PALLETS' (I then noticed this line is obsolte due to the line above it!)
		WHEN O.[Analysis2] IN ('MIXED PALLETS','PALLETISED','NO OVERHANG','BAGS ON DRUM','DRUMS') THEN 'PALLETS'
		WHEN O.[Analysis2] = '' THEN 'UNSPECIFIED'
		ELSE O.[Analysis2] 
	END							AS [Pallet Type A],
	CEILING(CASE P.[QuantityPerPallet]
		WHEN 0 then (O.[QuantityOrdered] - O.[QuantityDelivered]) 
		ELSE (O.[QuantityOrdered] - O.[QuantityDelivered]) / P.[QuantityPerPallet] 
	END)						AS [Type A Quantity],
	(O.[QuantityOrdered] - O.[QuantityDelivered]) * 
	(CASE P.[WeightPer]
		WHEN 0 THEN P.[Weight]
		ELSE P.[Weight] * P.[WeightPer]
	END)						AS [Type A Weight],
	''							AS [Pallet Type B],
	''							AS [Type B Quantity],
	''							AS [Pallet Type B Weight],
	''							AS [Pallet Type C],
	''							AS [Type C Quantity],
	''							AS [Pallet Type C Weight],
	CONCAT(AC2.[AnalysisDescription],' ',AC10.[AnalysisDescription])		AS [Goods Desc],
	--CONCAT(CONVERT(INT,P.[QuantityPerPallet]),' X ',CONVERT(DECIMAL(10,2),	CASE P.[CapacityPer]
	--																			WHEN 0 THEN P.[Capacity]
	--																			ELSE P.[Capacity] / P.[CapacityPer]
	--																		END),' ',AC2.[AnalysisDescription],' ',ac10.[AnalysisDescription])	AS [Goods Desc],
	LEFT(CASE CONVERT(INT,P.[AllocRule1])
		WHEN 0 THEN ''
		ELSE CONVERT(VARCHAR(4),CONVERT(INT,P.[AllocRule1]))
	END,4)						AS [UN No.],
	''							AS [Del Email],
	''							AS [Volume],
	''							AS [Job Type],
	CASE 
		WHEN CONVERT(INT,ISNULL(P.[AllocRule2],0)) > 0 THEN 'D/E'
		ELSE ''
	END							AS [Haz Tunnel Code],
	CASE 
		WHEN CONVERT(INT,ISNULL(P.[AllocRule2],0)) IN (1,2,3) THEN 'PG II'
		WHEN CONVERT(INT,ISNULL(P.[AllocRule2],0)) = 4 THEN 'PG III'
		ELSE ''
	END							AS [Haz Packin],
	CONVERT(DECIMAL(10,2),	CASE P.[CapacityPer]
								WHEN 0 THEN P.[Capacity]
								ELSE P.[Capacity] / P.[CapacityPer]
							END)													AS [Haz Weigh],
	(O.[QuantityOrdered] - O.[QuantityDelivered])									AS [Haz Quantity],
	D.[AddressConCode],
	O.[OrderNum],
	P.[Part],
	ISNULL(U.[Email],'')		AS [Email],
	ISNULL(UM.[Email],'')		AS [ManagerEmail],
	CASE (SELECT COUNT(O2.[ID]) FROM [vw_ASC_LIVE_Orders] O2 WHERE O2.[OrderNum] = O.[OrderNum] AND O2.[Part] IN ('E100002','E100003','E100005','E100007','E100008','E100009','E100039','E100061','E100062','E100102','E100103'))
		WHEN 0 THEN 0
		ELSE 1
	END							AS [ItemsToReturn],
	0 AS [Status]
FROM 
				[vw_ASC_LIVE_Orders]			O
LEFT OUTER JOIN [vw_ASC_LIVE_Parts]				P		ON	P.[Part] = O.[Part]
LEFT OUTER JOIN	[vw_ASC_LIVE_SystemCodes]		SC		ON	SC.[SystemCode] = P.[SalesUoM]
LEFT OUTER JOIN [vw_ASC_LIVE_OrderDelAdd]		D		ON	D.[OrderRef] = O.[OrderRef]
LEFT OUTER JOIN [vw_ASC_LIVE_Customers]			C		ON	C.[Code] = O.[CustomerCode] collate Latin1_General_CI_AS
LEFT OUTER JOIN [vw_ASC_LIVE_Customers4]		C4		ON	C4.[CustomerCode] = O.[CustomerCode]
LEFT OUTER JOIN [vw_HICS_SupplyChainUserLinks]	SCUL	ON	SCUL.[LnkSYS_PEOPLE_PP_CODE] = O.[OrderEnteredBy] collate Latin1_General_CI_AS
LEFT OUTER JOIN [vw_HICS_Rep_Users]				U		ON	U.[ID] = SCUL.[LnkUserID]
LEFT OUTER JOIN [vw_HICS_Rep_Users]				UM		ON	UM.[ID] = U.[Manager]
LEFT OUTER JOIN [vw_ASC_LIVE_AnalysisCodes]		AC2		ON	AC2.[TypeCode] = 'I' 
														AND	AC2.[LabelCode] = '2'
														AND AC2.[AnalysisCode] = P.[Analysis2]
LEFT OUTER JOIN [vw_ASC_LIVE_AnalysisCodes]		AC10	ON	AC10.[TypeCode] = 'I' 
														AND	AC10.[LabelCode] = '0'
														AND AC10.[AnalysisCode] = P.[Analysis10]
WHERE 
	O.[OrderType] NOT IN ('ST','ZP')
AND O.[Status] NOT IN ('C','H')
AND LEFT(O.[Part],1) IN ('D','F','G','L','P')
AND O.[Analysis2] <> 'OTHER HAULIER'
AND O.[CustomerDue] > '01/Jan/2015'
AND O.[Analysis7] = 'NEW'
AND LTRIM(RTRIM(SC.[TypeCode])) = 'Y'
AND (CASE D.[TransportCode]
		WHEN '' THEN LEFT(C4.[TransRoute],2)
		ELSE LEFT(D.[TransportCode],2)
	END = 'TF' --Legacy (Should not be used)
	OR
	CASE D.[TransportCode]
		WHEN '' THEN C4.[TransRoute]
		ELSE D.[TransportCode]
	END IN ('C','CBI','CTL','CTLBI')
	)
--AND CONVERT(DATE,O.[ExpectedDueDate]) = CONVERT(DATE,'31/Jan/2023')
AND (O.[QuantityOrdered] - O.[QuantityDelivered]) > 0
AND CONVERT(DATE,O.[ExpectedDueDate]) <= CONVERT(DATE,DATEADD(DAY,@Dur,getdate())) --This is the filter that captures the next business day

--Address line fix
update 
	#Tb_Mon_Task31
SET
	[Delivery Address 2] =	LTRIM(RTRIM(CASE CHARINDEX(',',[Delivery Address 2])
								WHEN 0 THEN [Delivery Address 2]
								ELSE left([Delivery Address 2],CHARINDEX(',',[Delivery Address 2])-1)
							END)),
	[Delivery Address 3]  =	LTRIM(RTRIM(CASE CHARINDEX(',',[Delivery Address 2])
								WHEN 0 THEN ''
								ELSE RIGHT([Delivery Address 2],len([Delivery Address 2])-len(left([Delivery Address 2],CHARINDEX(',',[Delivery Address 2])+1)))
							END))
WHERE
	CHARINDEX(',',[Delivery Address 2]) > 0

--Build delivery notes from extra text
WHILE (SELECT COUNT([AddressConCode]) FROM #Tb_Mon_Task31 WHERE [Del Notes] = 'Lookup Incomplete') > 0
BEGIN
	set @combinedString = ''	
	SELECT Top 1 @AddConCode = [AddressConCode] FROM #Tb_Mon_Task31 WHERE [Del Notes] = 'Lookup Incomplete'
	SELECT @combinedString = @combinedString + CASE @combinedString WHEN '' THEN '' ELSE ', ' END + LTRIM(RTRIM([Text])) from [vw_ASC_LIVE_ExtraText] where [ActionFlag11] = 'Y' AND [KeyType] = 'CU' AND [ActionFlag2] = 'Y' AND [FileRef] = @AddConCode ORDER BY [Number]
	UPDATE #Tb_Mon_Task31 SET [Del Notes] = @combinedString WHERE [AddressConCode] = @AddConCode
END;

--Truncate fields
UPDATE 
	#Tb_Mon_Task31 
SET 
	[Customer Ref] = CASE WHEN LEN([Customer Ref]) > 50 THEN LEFT([Customer Ref],47) + '...' ELSE [Customer Ref] END,
	[Collection Name] = CASE WHEN LEN([Collection Name]) > 48 THEN LEFT([Collection Name],45) + '...' ELSE [Collection Name] END,
	[Collection Addr 1] = CASE WHEN LEN([Collection Addr 1]) > 35 THEN LEFT([Collection Addr 1],32) + '...' ELSE [Collection Addr 1] END,
	[Collection Addr 2] = CASE WHEN LEN([Collection Addr 2]) > 35 THEN LEFT([Collection Addr 2],32) + '...' ELSE [Collection Addr 2] END,
	[Collection Addr 3] = CASE WHEN LEN([Collection Addr 3]) > 35 THEN LEFT([Collection Addr 3],32) + '...' ELSE [Collection Addr 3] END,
	[Collection Town] = CASE WHEN LEN([Collection Town]) > 35 THEN LEFT([Collection Town],32) + '...' ELSE [Collection Town] END,
	[Collection County] = CASE WHEN LEN([Collection County]) > 35 THEN LEFT([Collection County],32) + '...' ELSE [Collection County] END,
	[Collection Country] = CASE WHEN LEN([Collection Country]) > 35 THEN LEFT([Collection Country],32) + '...' ELSE [Collection Country] END,
	[Collection PostCode] = CASE WHEN LEN([Collection PostCode]) > 35 THEN LEFT([Collection PostCode],32) + '...' ELSE [Collection PostCode] END,
	[Collection Telephone] = CASE WHEN LEN([Collection Telephone]) > 40 THEN LEFT([Collection Telephone],37) + '...' ELSE [Collection Telephone] END,
	[Collection Notes] = CASE WHEN LEN([Collection Notes]) > 250 THEN LEFT([Collection Notes],247) + '...' ELSE [Collection Notes] END,
	[Delivery Name] = CASE WHEN LEN([Delivery Name]) > 48 THEN LEFT([Delivery Name],45) + '...' ELSE [Delivery Name] END,
	[Delivery Address 1] = CASE WHEN LEN([Delivery Address 1]) > 35 THEN LEFT([Delivery Address 1],32) + '...' ELSE [Delivery Address 1] END,
	[Delivery Address 2] = CASE WHEN LEN([Delivery Address 2]) > 35 THEN LEFT([Delivery Address 2],32) + '...' ELSE [Delivery Address 2] END,
	[Delivery Address 3] = CASE WHEN LEN([Delivery Address 3]) > 35 THEN LEFT([Delivery Address 3],32) + '...' ELSE [Delivery Address 3] END,
	[Delivery Town] = CASE WHEN LEN([Delivery Town]) > 35 THEN LEFT([Delivery Town],32) + '...' ELSE [Delivery Town] END,
	[Delivery County] = CASE WHEN LEN([Delivery County]) > 35 THEN LEFT([Delivery County],32) + '...' ELSE [Delivery County] END,
	[Delivery Country] = CASE WHEN LEN([Delivery Country]) > 35 THEN LEFT([Delivery Country],32) + '...' ELSE [Delivery Country] END,
	[Delivery PostCode] = CASE WHEN LEN([Delivery PostCode]) > 35 THEN LEFT([Delivery PostCode],32) + '...' ELSE [Delivery PostCode] END,
	[Del Phone] = CASE WHEN LEN([Del Phone]) > 40 THEN LEFT([Del Phone],37) + '...' ELSE [Del Phone] END,
	[Del Mobile] = CASE WHEN LEN([Del Mobile]) > 40 THEN LEFT([Del Mobile],37) + '...' ELSE [Del Mobile] END,
	[Del Notes] = CASE WHEN LEN([Del Notes]) > 250 THEN LEFT([Del Notes],247) + '...' ELSE [Del Notes] END;

--Now add the Items to return where ever they may be required
INSERT INTO #Tb_Mon_Task31
([Customer Ref],
[Collection Date],
[Collection Name],
[Collection Addr 1],
[Collection Addr 2],
[Collection Addr 3],
[Collection Town],
[Collection County],
[Collection Country],
[Collection PostCode],
[Collection Contact],
[Collection Telephone],
[Collection Time],
[Collection Notes],
[Delivery Date],
[Delivery Name],
[Delivery Address 1],
[Delivery Address 2],
[Delivery Address 3],
[Delivery Town],
[Delivery County],
[Delivery Country],
[Delivery PostCode],
[Delivery Contact],
[Del Phone],
[Del Mobile],
[Del Time],
[Del Notes],
[Cust Paperwork],
[Service Code],
[Surcharges],
[Pallet Type A],
[Type A Quantity],
[Type A Weight],
[Pallet Type B],
[Type B Quantity],
[Pallet Type B Weight],
[Pallet Type C],
[Type C Quantity],
[Pallet Type C Weight],
[Goods Desc],
[UN No.],
[Del Email],
[Volume],
[Job Type],
[Haz Tunnel Code],
[Haz Packin],
[Haz Weigh],
[Haz Quantity],
[AddressConCode],
[OrderNum],
[Part],
[Email],
[ManagerEmail],
[ItemsToReturn],
[Status]
)
SELECT
	CASE 
		WHEN LEN(REPLACE([Customer Ref],' CC:','_R CC:')) > 50 THEN LEFT(REPLACE([Customer Ref],' CC:','_R CC:'),47) + '...' 
		ELSE REPLACE([Customer Ref],' CC:','_R CC:')
	END									AS [Customer Ref],
	[Delivery Date]						AS [Collection Date],
	[Delivery Name]						AS [Collection Name],
	[Delivery Address 1]				AS [Collection Addr 1],
	[Delivery Address 2]				AS [Collection Addr 2],
	[Delivery Address 3]				AS [Collection Addr 3],
	[Delivery Town]						AS [Collection Town],
	[Delivery County]					AS [Collection County],
	[Delivery Country]					AS [Collection Country],
	[Delivery PostCode]					AS [Collection PostCode],
	''									AS [Collection Contact],
	--[Del Phone]							AS [Collection Telephone],
	''								AS [Collection Telephone],
	''									AS [Collection Time],
	'Collection for empty returnable items'	AS [Collection Notes],
	CONCAT(RIGHT(CONCAT('00',datepart(DAY, [Return Date])),2),'/',RIGHT(CONCAT('00',datepart(MONTH, [Return Date])),2),'/',datepart(YEAR, [Return Date])) AS [Delivery Date],
	[Collection Name]					AS [Delivery Name],
	[Collection Addr 1]					AS [Delivery Address 1],
	[Collection Addr 2]					AS [Delivery Address 2],
	[Collection Addr 3]					AS [Delivery Address 3],
	[Collection Town]					AS [Delivery Town],
	[Collection County]					AS [Delivery County],
	[Collection Country]				AS [Delivery Country],
	[Collection PostCode]				AS [Delivery PostCode],
	''									AS [Delivery Contact],
	[Collection Telephone]				AS [Del Phone],
	''									AS [Del Mobile],
	''									AS [Del Time],
	''									AS [Del Notes],
	'No'								AS [Cust Paperwork],
	'48'								AS [Service Code],
	''									AS [Surcharges],
	[Pallet Type A],
	[Type A Quantity],
	'0'									AS [Type A Weight],
	''									AS [Pallet Type B],
	''									AS [Type B Quantity],
	''									AS [Pallet Type B Weight],
	''									AS [Pallet Type C],
	''									AS [Type C Quantity],
	''									AS [Pallet Type C Weight],
	[Goods Desc],
	[UN No.],
	''									AS [Del Email],
	''									AS [Volume],
	'Col'								AS [Job Type],
	[Haz Tunnel Code],
	[Haz Packin],
	''									AS [Haz Weigh],
	[Haz Quantity],
	''									AS [AddressConCode],
	CONCAT([OrderNum],'_R')				AS [OrderNum],
	[Part],
	[Email],
	[ManagerEmail],
	'2'									AS [ItemsToReturn],
	'0'									AS [Status]
FROM
	#Tb_Mon_Task31
WHERE
	[ItemsToReturn] = 1;

--Now check for and email any differences
CREATE TABLE #Tb_Mon_Task31_Differences
(
[OrderNum]				VARCHAR(10) NOT NULL,
[Part]					VARCHAR(10) NOT NULL,
[SentOn]				DATETIME NOT NULL,
[Filename]				VARCHAR(255) NOT NULL,
[Attribute]				VARCHAR(255) NOT NULL,
[Was]					VARCHAR(MAX) NOT NULL,
[Is]					VARCHAR(MAX) NOT NULL,
[Email]					VARCHAR(1024) NOT NULL,
[ManagerEmail]			VARCHAR(1024) NOT NULL,
);

DECLARE @CustomerRef_Was		 VARCHAR(MAX)
DECLARE @CustomerRef_Is			 VARCHAR(MAX)
DECLARE @CollectionDate_Was		 VARCHAR(10)
DECLARE @CollectionDate_Is		 VARCHAR(10)
DECLARE @CollectionName_Was		 VARCHAR(MAX)
DECLARE @CollectionName_Is		 VARCHAR(MAX)
DECLARE @CollectionAddr1_Was	 VARCHAR(MAX)
DECLARE @CollectionAddr1_Is		 VARCHAR(MAX)
DECLARE @CollectionAddr2_Was	 VARCHAR(MAX)
DECLARE @CollectionAddr2_Is		 VARCHAR(MAX)
DECLARE @CollectionAddr3_Was	 VARCHAR(MAX)
DECLARE @CollectionAddr3_Is		 VARCHAR(MAX)
DECLARE @CollectionTown_Was		 VARCHAR(MAX)
DECLARE @CollectionTown_Is		 VARCHAR(MAX)
DECLARE @CollectionCounty_Was	 VARCHAR(MAX)
DECLARE @CollectionCounty_Is	 VARCHAR(MAX)
DECLARE @CollectionCountry_Was	 VARCHAR(MAX)
DECLARE @CollectionCountry_Is	 VARCHAR(MAX)
DECLARE @CollectionPostCode_Was	 VARCHAR(MAX)
DECLARE @CollectionPostCode_Is	 VARCHAR(MAX)
DECLARE @CollectionContact_Was	 VARCHAR(MAX)
DECLARE @CollectionContact_Is	 VARCHAR(MAX)
DECLARE @CollectionTelephone_Was VARCHAR(MAX)
DECLARE @CollectionTelephone_Is	 VARCHAR(MAX)
DECLARE @CollectionTime_Was		 VARCHAR(5)
DECLARE @CollectionTime_Is		 VARCHAR(5)
DECLARE @CollectionNotes_Was	 VARCHAR(MAX)
DECLARE @CollectionNotes_Is		 VARCHAR(MAX)
DECLARE @DeliveryDate_Was		 VARCHAR(10)
DECLARE @DeliveryDate_Is		 VARCHAR(10)
DECLARE @DeliveryName_Was		 VARCHAR(MAX)
DECLARE @DeliveryName_Is		 VARCHAR(MAX)
DECLARE @DeliveryAddress1_Was	 VARCHAR(MAX)
DECLARE @DeliveryAddress1_Is	 VARCHAR(MAX)
DECLARE @DeliveryAddress2_Was	 VARCHAR(MAX)
DECLARE @DeliveryAddress2_Is	 VARCHAR(MAX)
DECLARE @DeliveryAddress3_Was	 VARCHAR(MAX)
DECLARE @DeliveryAddress3_Is	 VARCHAR(MAX)
DECLARE @DeliveryTown_Was		 VARCHAR(MAX)
DECLARE @DeliveryTown_Is		 VARCHAR(MAX)
DECLARE @DeliveryCounty_Was		 VARCHAR(MAX)
DECLARE @DeliveryCounty_Is		 VARCHAR(MAX)
DECLARE @DeliveryCountry_Was	 VARCHAR(MAX)
DECLARE @DeliveryCountry_Is		 VARCHAR(MAX)
DECLARE @DeliveryPostCode_Was	 VARCHAR(MAX)
DECLARE @DeliveryPostCode_Is	 VARCHAR(MAX)
DECLARE @DeliveryContact_Was	 VARCHAR(MAX)
DECLARE @DeliveryContact_Is		 VARCHAR(MAX)
DECLARE @DelPhone_Was			 VARCHAR(MAX)
DECLARE @DelPhone_Is			 VARCHAR(MAX)
DECLARE @DelMobile_Was			 VARCHAR(MAX)
DECLARE @DelMobile_Is			 VARCHAR(MAX)
DECLARE @DelTime_Was			 VARCHAR(5)
DECLARE @DelTime_Is				 VARCHAR(5)
DECLARE @DelNotes_Was			 VARCHAR(MAX)
DECLARE @DelNotes_Is			 VARCHAR(MAX)
DECLARE @CustPaperwork_Was		 VARCHAR(3)
DECLARE @CustPaperwork_Is		 VARCHAR(3)
DECLARE @ServiceCode_Was		 VARCHAR(MAX)
DECLARE @ServiceCode_Is			 VARCHAR(MAX)
DECLARE @Surcharges_Was			 VARCHAR(MAX)
DECLARE @Surcharges_Is			 VARCHAR(MAX)
DECLARE @PalletTypeA_Was		 VARCHAR(MAX)
DECLARE @PalletTypeA_Is			 VARCHAR(MAX)
DECLARE @TypeAQuantity_Was		 VARCHAR(MAX)
DECLARE @TypeAQuantity_Is		 VARCHAR(MAX)
DECLARE @TypeAWeight_Was		 VARCHAR(MAX)
DECLARE @TypeAWeight_Is			 VARCHAR(MAX)
DECLARE @PalletTypeB_Was		 VARCHAR(MAX)
DECLARE @PalletTypeB_Is			 VARCHAR(MAX)
DECLARE @TypeBQuantity_Was		 VARCHAR(MAX)
DECLARE @TypeBQuantity_Is		 VARCHAR(MAX)
DECLARE @PalletTypeBWeight_Was	 VARCHAR(MAX)
DECLARE @PalletTypeBWeight_Is	 VARCHAR(MAX)
DECLARE @PalletTypeC_Was		 VARCHAR(MAX)
DECLARE @PalletTypeC_Is			 VARCHAR(MAX)
DECLARE @TypeCQuantity_Was		 VARCHAR(MAX)
DECLARE @TypeCQuantity_Is		 VARCHAR(MAX)
DECLARE @PalletTypeCWeight_Was	 VARCHAR(MAX)
DECLARE @PalletTypeCWeight_Is	 VARCHAR(MAX)
DECLARE @GoodsDesc_Was			 VARCHAR(MAX)
DECLARE @GoodsDesc_Is			 VARCHAR(MAX)
DECLARE @UNNo_Was				 VARCHAR(4)
DECLARE @UNNo_Is				 VARCHAR(4)
DECLARE @DelEmail_Was			 VARCHAR(MAX)
DECLARE @DelEmail_Is			 VARCHAR(MAX)
DECLARE @Volume_Was				 VARCHAR(MAX)
DECLARE @Volume_Is				 VARCHAR(MAX)
DECLARE @JobType_Was			 VARCHAR(MAX)
DECLARE @JobType_Is				 VARCHAR(MAX)
DECLARE @HazTunnelCode_Was		 VARCHAR(3)
DECLARE @HazTunnelCode_Is		 VARCHAR(3)
DECLARE @HazWeigh_Was			 VARCHAR(MAX)
DECLARE @HazWeigh_Is			 VARCHAR(MAX)
DECLARE @HazPackin_Was			 VARCHAR(MAX)
DECLARE @HazPackin_Is			 VARCHAR(MAX)
DECLARE @HazQuantity_Was		 VARCHAR(MAX)
DECLARE @HazQuantity_Is			 VARCHAR(MAX)
DECLARE @AddressConCode_Was		 VARCHAR(MAX)
DECLARE @AddressConCode_Is		 VARCHAR(MAX)

--Status
-- 0 = not checked
-- 1 = not sent before (OK, Send)
-- 2 = sent before, no change (OK, don't send)
-- 3 = Sent before, differences (Not OK, don't send, email)

WHILE (SELECT COUNT([Status]) FROM #Tb_Mon_Task31 WHERE [Status] = 0) > 0
BEGIN
	SELECT TOP 1 @ID = [ID], @OrderNum = [OrderNum], @Part = [Part] FROM #Tb_Mon_Task31 WHERE [Status] = 0
	
	SET @Difference = 0
	
	IF (SELECT COUNT([ID]) FROM [Tb_TransportData] WHERE [OrderNum] = @OrderNum AND [Part] = @Part) = 0
		BEGIN
			SET @Difference = 1
		END;
	ELSE
		BEGIN
			SET @Difference = 2;

			SELECT 
				@CustomerRef_Was			= T2.[Customer Ref], @CustomerRef_Is = T1.[Customer Ref],
				@CollectionDate_Was			= T2.[Collection Date], @CollectionDate_Is	= T1.[Collection Date],
				@CollectionName_Was			= T2.[Collection Name], @CollectionName_Is	= T1.[Collection Name],
				@CollectionAddr1_Was		= T2.[Collection Addr 1], @CollectionAddr1_Is	= T1.[Collection Addr 1],
				@CollectionAddr2_Was		= T2.[Collection Addr 2], @CollectionAddr2_Is	= T1.[Collection Addr 2],
				@CollectionAddr3_Was		= T2.[Collection Addr 3], @CollectionAddr3_Is	= T1.[Collection Addr 3],
				@CollectionTown_Was			= T2.[Collection Town], @CollectionTown_Is	= T1.[Collection Town],
				@CollectionCounty_Was		= T2.[Collection County], @CollectionCounty_Is	= T1.[Collection County],
				@CollectionCountry_Was		= T2.[Collection Country], @CollectionCountry_Is	= T1.[Collection Country],
				@CollectionPostCode_Was		= T2.[Collection PostCode], @CollectionPostCode_Is	= T1.[Collection PostCode],
				@CollectionContact_Was		= T2.[Collection Contact], @CollectionContact_Is	= T1.[Collection Contact],
				@CollectionTelephone_Was	= T2.[Collection Telephone], @CollectionTelephone_Is	= T1.[Collection Telephone],
				@CollectionTime_Was			= T2.[Collection Time], @CollectionTime_Is	= T1.[Collection Time],
				@CollectionNotes_Was	 	= T2.[Collection Notes], @CollectionNotes_Is	= T1.[Collection Notes],
				@DeliveryDate_Was			= T2.[Delivery Date], @DeliveryDate_Is	= T1.[Delivery Date],
				@DeliveryName_Was			= T2.[Delivery Name], @DeliveryName_Is	= T1.[Delivery Name],
				@DeliveryAddress1_Was		= T2.[Delivery Address 1], @DeliveryAddress1_Is	= T1.[Delivery Address 1],
				@DeliveryAddress2_Was		= T2.[Delivery Address 2], @DeliveryAddress2_Is	= T1.[Delivery Address 2],
				@DeliveryAddress3_Was		= T2.[Delivery Address 3], @DeliveryAddress3_Is	= T1.[Delivery Address 3],
				@DeliveryTown_Was			= T2.[Delivery Town], @DeliveryTown_Is	= T1.[Delivery Town],
				@DeliveryCounty_Was			= T2.[Delivery County], @DeliveryCounty_Is	= T1.[Delivery County],
				@DeliveryCountry_Was		= T2.[Delivery Country], @DeliveryCountry_Is	= T1.[Delivery Country],
				@DeliveryPostCode_Was		= T2.[Delivery PostCode], @DeliveryPostCode_Is	= T1.[Delivery PostCode],
				@DeliveryContact_Was		= T2.[Delivery Contact], @DeliveryContact_Is	= T1.[Delivery Contact],
				@DelPhone_Was				= T2.[Del Phone], @DelPhone_Is	= T1.[Del Phone],
				@DelMobile_Was				= T2.[Del Mobile], @DelMobile_Is	= T1.[Del Mobile],
				@DelTime_Was				= T2.[Del Time], @DelTime_Is	= T1.[Del Time],
				@DelNotes_Was				= T2.[Del Notes], @DelNotes_Is	= T1.[Del Notes],
				@CustPaperwork_Was			= T2.[Cust Paperwork], @CustPaperwork_Is	= T1.[Cust Paperwork],
				@ServiceCode_Was			= T2.[Service Code], @ServiceCode_Is	= T1.[Service Code],
				@Surcharges_Was				= T2.[Surcharges], @Surcharges_Is	= T1.[Surcharges],
				@PalletTypeA_Was			= T2.[Pallet Type A], @PalletTypeA_Is	= T1.[Pallet Type A],
				@TypeAQuantity_Was			= T2.[Type A Quantity], @TypeAQuantity_Is	= T1.[Type A Quantity],
				@TypeAWeight_Was			= T2.[Type A Weight], @TypeAWeight_Is	= T1.[Type A Weight],
				@PalletTypeB_Was			= T2.[Pallet Type B], @PalletTypeB_Is	= T1.[Pallet Type B],
				@TypeBQuantity_Was			= T2.[Type B Quantity], @TypeBQuantity_Is	= T1.[Type B Quantity],
				@PalletTypeBWeight_Was		= T2.[Pallet Type B Weight], @PalletTypeBWeight_Is	= T1.[Pallet Type B Weight],
				@PalletTypeC_Was			= T2.[Pallet Type C], @PalletTypeC_Is	= T1.[Pallet Type C],
				@TypeCQuantity_Was			= T2.[Type C Quantity], @TypeCQuantity_Is	= T1.[Type C Quantity],
				@PalletTypeCWeight_Was		= T2.[Pallet Type C Weight], @PalletTypeCWeight_Is	= T1.[Pallet Type C Weight],
				@GoodsDesc_Was				= T2.[Goods Desc], @GoodsDesc_Is	= T1.[Goods Desc],
				@UNNo_Was					= T2.[UN No.], @UNNo_Is	= T1.[UN No.],
				@DelEmail_Was				= T2.[Del Email], @DelEmail_Is	= T1.[Del Email],
				@Volume_Was					= T2.[Volume], @Volume_Is	= T1.[Volume],
				@JobType_Was				= T2.[Job Type], @JobType_Is	= T1.[Job Type],
				@HazTunnelCode_Was			= T2.[Haz Tunnel Code], @HazTunnelCode_Is	= T1.[Haz Tunnel Code],
				@HazPackin_Was				= T2.[Haz Packin], @HazPackin_Is	= T1.[Haz Packin],
				@HazWeigh_Was				= T2.[Haz Weigh], @HazWeigh_Is	= T1.[Haz Weigh],
				@HazQuantity_Was			= T2.[Haz Quantity], @HazQuantity_Is	= T1.[Haz Quantity],
				@SentOn						= T2.[SentOn],
				@Filename					= T2.[Filename],
				@Email						= T1.[Email],
				@ManagerEmail				= T1.[ManagerEmail],
				@Part						= T1.[Part]
			FROM 
						#Tb_Mon_Task31			T1
			INNER JOIN	[Tb_TransportData]	T2	ON	T2.[OrderNum]	= T1.[OrderNum] 
												AND T2.[Part]		= T1.[Part]
			WHERE
				T1.[ID] = @ID;

			IF ((@CustomerRef_Was <> @CustomerRef_Is) OR 
				(@CollectionDate_Was <> @CollectionDate_Is) OR 
				(@CollectionName_Was <> @CollectionName_Is) OR 
				(@CollectionAddr1_Was <> @CollectionAddr1_Is) OR 
				(@CollectionAddr2_Was <> @CollectionAddr2_Is) OR 
				(@CollectionAddr3_Was <> @CollectionAddr3_Is) OR 
				(@CollectionTown_Was <> @CollectionTown_Is) OR 
				(@CollectionCounty_Was <> @CollectionCounty_Is) OR 
				(@CollectionCountry_Was <> @CollectionCountry_Is) OR 
				(@CollectionPostCode_Was <> @CollectionPostCode_Is) OR 
				(@CollectionContact_Was <> @CollectionContact_Is) OR 
				(@CollectionTelephone_Was <> @CollectionTelephone_Is) OR 
				(@CollectionTime_Was <> @CollectionTime_Is) OR 
				(@CollectionNotes_Was <> @CollectionNotes_Is) OR 
				(@DeliveryDate_Was <> @DeliveryDate_Is) OR 
				(@DeliveryName_Was <> @DeliveryName_Is) OR 
				(@DeliveryAddress1_Was <> @DeliveryAddress1_Is) OR 
				(@DeliveryAddress2_Was <> @DeliveryAddress2_Is) OR 
				(@DeliveryAddress3_Was <> @DeliveryAddress3_Is) OR 
				(@DeliveryTown_Was <> @DeliveryTown_Is) OR 
				(@DeliveryCounty_Was <> @DeliveryCounty_Is) OR 
				(@DeliveryCountry_Was <> @DeliveryCountry_Is) OR 
				(@DeliveryPostCode_Was <> @DeliveryPostCode_Is) OR 
				(@DeliveryContact_Was <> @DeliveryContact_Is) OR 
				(@DelPhone_Was <> @DelPhone_Is) OR 
				(@DelMobile_Was <> @DelMobile_Is) OR 
				(@DelTime_Was <> @DelTime_Is) OR 
				(@DelNotes_Was <> @DelNotes_Is) OR 
				(@CustPaperwork_Was <> @CustPaperwork_Is) OR 
				(@ServiceCode_Was <> @ServiceCode_Is) OR 
				(@Surcharges_Was <> @Surcharges_Is) OR 
				(@PalletTypeA_Was <> @PalletTypeA_Is) OR 
				(@TypeAQuantity_Was <> @TypeAQuantity_Is) OR 
				(@TypeAWeight_Was <> @TypeAWeight_Is) OR 
				(@PalletTypeB_Was <> @PalletTypeB_Is) OR 
				(@TypeBQuantity_Was <> @TypeBQuantity_Is) OR 
				(@PalletTypeBWeight_Was <> @PalletTypeBWeight_Is) OR 
				(@PalletTypeC_Was <> @PalletTypeC_Is) OR 
				(@TypeCQuantity_Was <> @TypeCQuantity_Is) OR 
				(@PalletTypeCWeight_Was <> @PalletTypeCWeight_Is) OR 
				(@GoodsDesc_Was <> @GoodsDesc_Is) OR 
				(@UNNo_Was <> @UNNo_Is) OR 
				(@DelEmail_Was <> @DelEmail_Is) OR 
				(@Volume_Was <> @Volume_Is) OR 
				(@JobType_Was <> @JobType_Is) OR 
				(@HazTunnelCode_Was <> @HazTunnelCode_Is) OR 
				(@HazPackin_Was <> @HazPackin_Is) OR 
				(@HazWeigh_Was <> @HazWeigh_Is) OR 
				(@HazQuantity_Was <> @HazQuantity_Is))
				BEGIN
					SET @Difference = 3;
						
					IF @CustomerRef_Was <> @CustomerRef_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Customer Ref',@CustomerRef_Was,@CustomerRef_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionDate_Was <> @CollectionDate_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Date',@CollectionDate_Was,@CollectionDate_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionName_Was <> @CollectionName_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Name',@CollectionName_Was,@CollectionName_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionAddr1_Was <> @CollectionAddr1_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Addr 1',@CollectionAddr1_Was,@CollectionAddr1_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionAddr2_Was <> @CollectionAddr2_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Addr 2',@CollectionAddr2_Was,@CollectionAddr2_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionAddr3_Was <> @CollectionAddr3_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Addr 3',@CollectionAddr3_Was,@CollectionAddr3_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionTown_Was <> @CollectionTown_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Town',@CollectionTown_Was,@CollectionTown_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionCounty_Was <> @CollectionCounty_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection County',@CollectionCounty_Was,@CollectionCounty_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionCountry_Was <> @CollectionCountry_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Country',@CollectionCountry_Was,@CollectionCountry_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionPostCode_Was <> @CollectionPostCode_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection PostCode',@CollectionPostCode_Was,@CollectionPostCode_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionContact_Was <> @CollectionContact_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Contact',@CollectionContact_Was,@CollectionContact_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionTelephone_Was <> @CollectionTelephone_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Telephone',@CollectionTelephone_Was,@CollectionTelephone_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionTime_Was <> @CollectionTime_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Time',@CollectionTime_Was,@CollectionTime_Is,@Email,@ManagerEmail,@Part);
					IF @CollectionNotes_Was <> @CollectionNotes_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Collection Notes',@CollectionNotes_Was,@CollectionNotes_Is,@Email,@ManagerEmail,@Part);
					IF @DeliveryDate_Was <> @DeliveryDate_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Delivery Date',@DeliveryDate_Was,@DeliveryDate_Is,@Email,@ManagerEmail,@Part);
					IF @DeliveryName_Was <> @DeliveryName_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Delivery Name',@DeliveryName_Was,@DeliveryName_Is,@Email,@ManagerEmail,@Part);
					IF @DeliveryAddress1_Was <> @DeliveryAddress1_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Delivery Address 1',@DeliveryAddress1_Was,@DeliveryAddress1_Is,@Email,@ManagerEmail,@Part);
					IF @DeliveryAddress2_Was <> @DeliveryAddress2_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Delivery Address 2',@DeliveryAddress2_Was,@DeliveryAddress2_Is,@Email,@ManagerEmail,@Part);
					IF @DeliveryAddress3_Was <> @DeliveryAddress3_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'DeliveryAddress 3',@DeliveryAddress3_Was,@DeliveryAddress3_Is,@Email,@ManagerEmail,@Part);
					IF @DeliveryTown_Was <> @DeliveryTown_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Delivery Town',@DeliveryTown_Was,@DeliveryTown_Is,@Email,@ManagerEmail,@Part);
					IF @DeliveryCounty_Was <> @DeliveryCounty_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Delivery County',@DeliveryCounty_Was,@DeliveryCounty_Is,@Email,@ManagerEmail,@Part);
					IF @DeliveryCountry_Was <> @DeliveryCountry_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Delivery Country',@DeliveryCountry_Was,@DeliveryCountry_Is,@Email,@ManagerEmail,@Part);
					IF @DeliveryPostCode_Was <> @DeliveryPostCode_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Delivery PostCode',@DeliveryPostCode_Was,@DeliveryPostCode_Is,@Email,@ManagerEmail,@Part);
					IF @DeliveryContact_Was <> @DeliveryContact_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Delivery Contact',@DeliveryContact_Was,@DeliveryContact_Is,@Email,@ManagerEmail,@Part);
					IF @DelPhone_Was <> @DelPhone_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Del Phone',@DelPhone_Was,@DelPhone_Is,@Email,@ManagerEmail,@Part);
					IF @DelMobile_Was <> @DelMobile_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Del Mobile',@DelMobile_Was,@DelMobile_Is,@Email,@ManagerEmail,@Part);
					IF @DelTime_Was <> @DelTime_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Del Time',@DelTime_Was,@DelTime_Is,@Email,@ManagerEmail,@Part);
					IF @DelNotes_Was <> @DelNotes_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Del Notes',@DelNotes_Was,@DelNotes_Is,@Email,@ManagerEmail,@Part);
					IF @CustPaperwork_Was <> @CustPaperwork_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Cust Paperwork',@CustPaperwork_Was,@CustPaperwork_Is,@Email,@ManagerEmail,@Part);
					IF @ServiceCode_Was <> @ServiceCode_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Service Code',@ServiceCode_Was,@ServiceCode_Is,@Email,@ManagerEmail,@Part);
					IF @Surcharges_Was <> @Surcharges_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Surcharges',@Surcharges_Was,@Surcharges_Is,@Email,@ManagerEmail,@Part);
					IF @PalletTypeA_Was <> @PalletTypeA_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Pallet Type A',@PalletTypeA_Was,@PalletTypeA_Is,@Email,@ManagerEmail,@Part);
					IF @TypeAQuantity_Was <> @TypeAQuantity_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Type A Quantity',@TypeAQuantity_Was,@TypeAQuantity_Is,@Email,@ManagerEmail,@Part);
					IF @TypeAWeight_Was <> @TypeAWeight_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Type A Weight',@TypeAWeight_Was,@TypeAWeight_Is,@Email,@ManagerEmail,@Part);
					IF @PalletTypeB_Was <> @PalletTypeB_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Pallet Type B',@PalletTypeB_Was,@PalletTypeB_Is,@Email,@ManagerEmail,@Part);
					IF @TypeBQuantity_Was <> @TypeBQuantity_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Type B Quantity',@TypeBQuantity_Was,@TypeBQuantity_Is,@Email,@ManagerEmail,@Part);
					IF @PalletTypeBWeight_Was <> @PalletTypeBWeight_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Pallet Type B Weight',@PalletTypeBWeight_Was,@PalletTypeBWeight_Is,@Email,@ManagerEmail,@Part);
					IF @PalletTypeC_Was <> @PalletTypeC_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Pallet Type C',@PalletTypeC_Was,@PalletTypeC_Is,@Email,@ManagerEmail,@Part);
					IF @TypeCQuantity_Was <> @TypeCQuantity_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Type C Quantity',@TypeCQuantity_Was,@TypeCQuantity_Is,@Email,@ManagerEmail,@Part);
					IF @PalletTypeCWeight_Was <> @PalletTypeCWeight_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Pallet Type C Weight',@PalletTypeCWeight_Was,@PalletTypeCWeight_Is,@Email,@ManagerEmail,@Part);
					IF @GoodsDesc_Was <> @GoodsDesc_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Goods Desc',@GoodsDesc_Was,@GoodsDesc_Is,@Email,@ManagerEmail,@Part);
					IF @UNNo_Was <> @UNNo_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'UN No.',@UNNo_Was,@UNNo_Is,@Email,@ManagerEmail,@Part);
					IF @DelEmail_Was <> @DelEmail_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Del Email',@DelEmail_Was,@DelEmail_Is,@Email,@ManagerEmail,@Part);
					IF @Volume_Was <> @Volume_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Volume',@Volume_Was,@Volume_Is,@Email,@ManagerEmail,@Part);
					IF @JobType_Was <> @JobType_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Job Type',@JobType_Was,@JobType_Is,@Email,@ManagerEmail,@Part);
					IF @HazTunnelCode_Was <> @HazTunnelCode_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Haz Tunnel Code',@HazTunnelCode_Was,@HazTunnelCode_Is,@Email,@ManagerEmail,@Part);
					IF @HazPackin_Was <> @HazPackin_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Haz Packin',@HazPackin_Was,@HazPackin_Is,@Email,@ManagerEmail,@Part);
					IF @HazWeigh_Was <> @HazWeigh_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Haz Weigh',@HazWeigh_Was,@HazWeigh_Is,@Email,@ManagerEmail,@Part);
					IF @HazQuantity_Was <> @HazQuantity_Is INSERT INTO #Tb_Mon_Task31_Differences ([SentOn],[Filename],[OrderNum],[Attribute],[Was],[Is],[Email],[ManagerEmail],[Part]) VALUES (@SentOn,@Filename,@OrderNum,'Haz Quantity',@HazQuantity_Was,@HazQuantity_Is,@Email,@ManagerEmail,@Part);
						
				END;
		END;
	
	UPDATE #Tb_Mon_Task31 set [Status] = @Difference WHERE [ID] = @ID
END;

-- 2 = sent before, no change (OK, don't send)
DELETE FROM #Tb_Mon_Task31 WHERE [Status] = 2

--This ensures we only report once
DELETE FROM #Tb_Mon_Task31_Differences WHERE CONCAT([OrderNum],',',[Part],',',[Attribute],',',[Was],',',[Is]) IN (SELECT [Ref] FROM  [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID)

--Now send the email of the difference
WHILE (SELECT COUNT([Email]) FROM #Tb_Mon_Task31_Differences) > 0
BEGIN
	
	SELECT TOP 1 @Email = [Email], @ManagerEmail = [ManagerEmail] FROM #Tb_Mon_Task31_Differences 

	--This should be Tracey at Cammack (was claire@cammack.co.uk until 26/09/22 - GQ)
	--SET @To = 'Tracey.McLean@cammack.co.uk'
	SET @To = '' --This is now set in tb_mon_tasks

	--Also add our CST operative
	--IF @Email <> '' SET @To = CONCAT(@To,';',@Email)
	IF @Email <> '' SET @To = @Email

	-- Add the manager (Keeping myself in for a little bit)
	SET @CC = ''
	--IF @ManagerEmail <> '' SET @CC = CONCAT(@CC,';',@ManagerEmail)
	IF @ManagerEmail <> '' SET @CC = @ManagerEmail
		

	SET @EMailBody = '<p>A difference between data that has been sent to Cammack and its current values within Hayman has been identified, this may require attention. ' + 
				'The table below shows the differences. This will only be reported once.</p>' +
				'<p><table>' +  
					'<tr><th>Order No.</th><th>Part</th><th>Sent</th><th>Filename</th><th>Attribute</th><th>Was</th><th>Is</th></tr>' +  
					CAST((SELECT
							[OrderNum]			AS [td],'',
							[Part]				AS [td],'',
							CONCAT(RIGHT(CONCAT('00',datepart(DAY, [SentOn])),2),'/',
									RIGHT(CONCAT('00',datepart(MONTH, [SentOn])),2),'/',
									DATEPART(YEAR, [SentOn]),' ',
									RIGHT(CONCAT('00',datepart(HOUR, [SentOn])),2),':',
									RIGHT(CONCAT('00',datepart(MINUTE, [SentOn])),2)) 			AS [td],'',
							[Filename]			AS [td],'',
							[Attribute]			AS [td],'',
							[Was]				AS [td],'',
							[Is]				AS [td],''
						FROM 
							[#Tb_Mon_Task31_Differences] 
						WHERE
							[Email] = @Email
						ORDER BY
							[OrderNum],
							[Part],
							[Attribute] 
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>'  

	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain',@To,@CC,'Data send discrepancy', @EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID );
		
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, concat([OrderNum],',',[Part],',',[Attribute],',',[Was],',',[Is]) FROM #Tb_Mon_Task31_Differences WHERE [Email] = @Email
			
	DELETE FROM #Tb_Mon_Task31_Differences WHERE [Email] = @Email;
END;

--Now to insert the good data to be sent over
IF (SELECT COUNT([ID]) FROM #Tb_Mon_Task31 WHERE [status] = 1) > 0 
BEGIN
	INSERT INTO Tb_TransportData (
	[OrderNum],
	[Part],
	[Customer Ref],
	[Collection Date],
	[Collection Name],
	[Collection Addr 1],
	[Collection Addr 2],
	[Collection Addr 3],
	[Collection Town],
	[Collection County],
	[Collection Country],
	[Collection Postcode],
	[Collection Contact],
	[Collection Telephone],
	[Collection Time],
	[Collection Notes],
	[Delivery Date],
	[Delivery Name],
	[Delivery Address 1],
	[Delivery Address 2],
	[Delivery Address 3],
	[Delivery Town],
	[Delivery County],
	[Delivery Country],
	[Delivery PostCode],
	[Delivery Contact],
	[Del Phone],
	[Del Mobile],
	[Del Time],
	[Del Notes],
	[Cust Paperwork],
	[Service Code],
	[Surcharges],
	[Pallet Type A],
	[Type A Quantity],
	[Type A Weight],
	[Pallet Type B],
	[Type B Quantity],
	[Pallet Type B Weight],
	[Pallet Type C],
	[Type C Quantity],
	[Pallet Type C Weight],
	[Goods Desc],
	[UN No.],
	[Del Email],
	[Volume],
	[Job Type],
	[Haz Tunnel Code],
	[Haz Packin],
	[Haz Weigh],
	[Haz Quantity]
	)
	SELECT
		[OrderNum],
		[Part],
		[Customer Ref],
		[Collection Date],
		[Collection Name],
		[Collection Addr 1],
		[Collection Addr 2],
		[Collection Addr 3],
		[Collection Town],
		[Collection County],
		[Collection Country],
		[Collection Postcode],
		[Collection Contact],
		[Collection Telephone],
		[Collection Time],
		[Collection Notes],
		[Delivery Date],
		[Delivery Name],
		[Delivery Address 1],
		[Delivery Address 2],
		[Delivery Address 3],
		[Delivery Town],
		[Delivery County],
		[Delivery Country],
		[Delivery PostCode],
		[Delivery Contact],
		[Del Phone],
		[Del Mobile],
		[Del Time],
		[Del Notes],
		[Cust Paperwork],
		[Service Code],
		[Surcharges],
		[Pallet Type A],
		[Type A Quantity],
		[Type A Weight],
		[Pallet Type B],
		[Type B Quantity],
		[Pallet Type B Weight],
		[Pallet Type C],
		[Type C Quantity],
		[Pallet Type C Weight],
		[Goods Desc],
		[UN No.],
		[Del Email],
		[Volume],
		[Job Type],
		[Haz Tunnel Code],
		[Haz Packin],
		[Haz Weigh],
		[Haz Quantity]
	FROM
		#Tb_Mon_Task31
	WHERE
		[Status] = 1;
END;

drop table #Tb_Mon_Task31;
drop table #Tb_Mon_Task31_Differences;

--Create the file
IF (SELECT COUNT([ID]) FROM [Tb_TransportData] WHERE [SentOn] IS NULL) > 0 
BEGIN
	SET @DTS = GETDATE()

	--bcp "SELECT * FROM [vw_HICS_Rep_TransportData]" queryout "C:\Temp\TransportData.csv" -c -t, -T -S "SQL01" -d "HICS"

	SELECT @Filename = CONCAT(DATEPART(YEAR, @DTS) ,RIGHT(CONCAT('00', DATEPART(MONTH, @DTS)),2),RIGHT(CONCAT('00', DATEPART(DAY, @DTS)),2),'_',RIGHT(CONCAT('00', DATEPART(HOUR, @DTS)),2),RIGHT(CONCAT('00', DATEPART(MINUTE, @DTS)),2),'.csv')

	--SELECT @CMDstring = CONCAT('MOVE C:\Temp\TransportData.csv \\IT\Public\TransportData_',DATEPART(YEAR, @DTS) ,RIGHT(CONCAT('00', DATEPART(MONTH, @DTS)),2),RIGHT(CONCAT('00', DATEPART(DAY, @DTS)),2),'_',RIGHT(CONCAT('00', DATEPART(HOUR, @DTS)),2),RIGHT(CONCAT('00', DATEPART(MINUTE, @DTS)),2),'.csv')
	SELECT @ShellCmd = CONCAT('bcp "SELECT * FROM [vw_HICS_Rep_TransportData]" queryout "C:\Temp\',@Filename,'" -c -t, -T -S "SQL01" -d "HICS"')

	execute AS login = 'HAYMAN0\SQLNetworkAccess' 
	execute xp_cmdshell @ShellCmd
	REVERT;

	SELECT @ShellCmd = CONCAT('MOVE "C:\Temp\',@Filename,'" "\\fileserver\fileserver\Despatch\Cammack\System files\To Send\"')

	execute AS login = 'HAYMAN0\SQLNetworkAccess' 
	execute xp_cmdshell @ShellCmd
	REVERT;

	update Tb_TransportData set [SentOn] = @DTS, [Filename] = @Filename where [SentOn] IS NULL;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task32]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_Mon_Task32]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task32') IS NOT NULL
DROP TABLE #Tb_Mon_Task32;

CREATE TABLE #Tb_Mon_Task32
(
--[Link]			VARCHAR(1024) NOT NULL,
[Name]			VARCHAR(1024) NOT NULL,
[Domain]		VARCHAR(1024) NOT NULL,
[Fname]			VARCHAR(1024) NOT NULL,
[Summary]		VARCHAR(1024) NOT NULL,
[Email]			VARCHAR(1024) NOT NULL,
[Processed]		BIT NOT NULL);

INSERT INTO [#Tb_Mon_Task32]
SELECT
	--'<a href="https://crm.hgcompany.co.uk/Home/Index/#{%22DesignId%22:%22ab1d383e-583c-ea11-80f7-00155d47492e%22,%22IsItem%22:%22true%22,%22ItemId%22:%22' + CONVERT(VARCHAR(100),T1.[AC_ID]) + '%22,%22IsPopOut%22:%22True%22}' + '" target="_top">' + T1.[NAME] + '</a>' AS [Link],
	T1.[NAME]			AS [Name],
	T1.[EMAIL_DOMAINS]	AS [Domain],
	T1.[FNAME]			AS [Fname],
	T1.[SUMMARY]		AS [Summary],
	T1.[EMAIL_ADDRESS]	AS [Email],
	0					AS [Processed]
FROM
	(SELECT 
		--A.[AC_ID],
		A.[Name],
		A.[EMAIL_DOMAINS],
		U.[FNAME],
		U.[SUMMARY],
		U.[EMAIL_ADDRESS],
		(SELECT COUNT([AC_ID]) FROM [GoldVisionCRM].[dbo].[ACCOUNTS] WHERE [EMAIL_DOMAINS] = A.[EMAIL_DOMAINS] AND [AC_DELETED] <> 1) as [Count]
	FROM
					[GoldVisionCRM].[dbo].[ACCOUNTS]	A
	LEFT OUTER JOIN	[GoldVisionCRM].[dbo].[USERS]		U	ON U.[US_ID] = A.[US_ID_SALES]
	WHERE
		A.[AC_DELETED] <> 1
	AND A.[EMAIL_DOMAINS] <> ''
	AND LEFT(A.[EMAIL_DOMAINS],4) <> 'none') T1
WHERE
	T1.[Count] > 1
	
If (SELECT COUNT(*) FROM [#Tb_Mon_Task32]) > 0
BEGIN
	DECLARE @Email		VARCHAR(255)
	DECLARE @EMailBody	NVARCHAR(MAX)
	DECLARE @Fname		VARCHAR(50)
	DECLARE @Type		INT
	DECLARE @EmailID	INT
	DECLARE @Summary	VARCHAR(255)

	WHILE (SELECT Count([Email]) From #Tb_Mon_Task32 Where [Processed] = 0) > 0
	BEGIN
		
		SELECT TOP 1 @Email = [Email] FROM [#Tb_Mon_Task32] WHERE [Processed] = 0
		SELECT TOP 1 @Fname = [Fname], @Summary = [Summary] FROM [#Tb_Mon_Task32] WHERE [Email] = @Email
		

		SET @EMailBody =	'<p>Hi ' + @Fname + ',</p>' + 
					'<p>Some formatting inconsistencies were found with the company domain entry for companies that you are the account manager for in Gold-Vision. ' + 
					'There are companies that have the same email domain, this should be changed as soon as possible as tracking will fail or be inconsistent between companies.</p>' +
					'<p>Options to correct these are: -</p><ul>' +
					'<li><strong>Correct</strong> - There may be an error in the domain for the company and a correction will make them unique</li>' +
					'<li><strong>Delete</strong> - If one record is obsolete\unused, discuss with the other account managers (if applicable) about deleting the records that are no longer required</li>' +
					'<li><strong>Merge</strong> - If the companies are the same company, discuss with the other account managers (if applicable) about merging the records (this can be raised with the helpdesk to be completed, stating which one(s) should be merged into a kept one)</li>' +
					'<li><strong>Remove domain</strong> - If the companies are the same company but do need different records in Gold-Vision, discuss with the other account managers (if applicable) about removing the email domain from the company records and using contact email addresses (contacts within the company record) to track emails</li>' +
					'</ul><p>The below tables shows all duplicates that were found in the system, correction of these can not be automated and will require your input to resolve. A company should have its own unique email domain or no email domain listed.</p>' +
					'<p><table>' +  
						'<tr><th>Domain(s)</th><th>Company</th><th>Account Manager</th></tr>' +  
						CAST((SELECT
								[Domain]		AS [td],'',
								[Name]			AS [td],'',
								CASE [Summary]
									WHEN @Summary THEN 'You'
									ELSE [Summary]
								END				AS [td],''
							FROM 
								[#Tb_Mon_Task32] 
							WHERE
								[Domain] in (SELECT [Domain] FROM #Tb_Mon_Task32 WHERE [Email] = @Email)
							ORDER BY
								[Domain], [Name],	CASE [Summary]
														WHEN @Summary THEN 'You'
														ELSE [Summary]
													END
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>' 
		
		INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Gold-Vision',@Email,'Gold-Vision domain checks (Duplicates)', @EMailBody,0,@RunID);
		
		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
		
		INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [Domain] + ', ' + [Name] + ', ' + CASE [Summary] WHEN @Summary THEN 'You' ELSE [Summary] END FROM [#Tb_Mon_Task32] where [Domain] in (SELECT [Domain] FROM #Tb_Mon_Task32 WHERE [Email] = @Email);
		
		update [#Tb_Mon_Task32] set [Processed] = 1 WHERE [Email] = @Email
		
	END;

END;

DROP TABLE #Tb_Mon_Task32;


GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task33]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Mon_Task33]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task33') IS NOT NULL
DROP TABLE #Tb_Mon_Task33;

CREATE TABLE #Tb_Mon_Task33
(
[Type]						VARCHAR(1024) NOT NULL,
[OrderNumber]				VARCHAR(1024) NOT NULL,
[Part]						VARCHAR(1024) NOT NULL,
[OrderQuantity]				VARCHAR(1024) NOT NULL,
[PicknoteNumber]			VARCHAR(1024) NOT NULL,
[PicknoteQuantity]			VARCHAR(1024) NOT NULL,
[PicknoteStatus]			VARCHAR(1024) NOT NULL,
[OrderEnteredBy]			VARCHAR(1024) NOT NULL,
[OrderEnteredByFullName]	VARCHAR(1024) NOT NULL,
[OrderEnteredByManager]		VARCHAR(1024) NOT NULL,
[Encoded]					VARCHAR(1024) NOT NULL,
[Processed]					BIT NOT NULL constraint DF_Processed default(0));

INSERT INTO [#Tb_Mon_Task33]
SELECT 
	T2.[Type],
	T2.[OrderNumber],
	T2.[Part],
	T2.[OrderQuantity],
	T2.[PicknoteNumber],
	T2.[PicknoteQuantity],
	T2.[PicknoteStatus],
	T2.[OrderEnteredBy],
	T2.[OrderEnteredByFullName],
	T2.[OrderEnteredByManager],
	[Type] + ': ' + CASE [Type] 
						WHEN 'Item added' THEN [OrderNumber] + ',' + [Part] + ',' + [OrderQuantity]
						WHEN 'Item removed' THEN [PicknoteNumber] + ',' + [PicknoteQuantity]
						WHEN 'Quantity decreased' THEN [OrderNumber] + ',' + [Part] + ',' + [OrderQuantity] + ',' + [PicknoteNumber] + ',' + [PicknoteQuantity]
						WHEN 'Quantity increased' THEN [OrderNumber] + ',' + [Part] + ',' + [OrderQuantity] + ',' + [PicknoteNumber] + ',' + [PicknoteQuantity]
						ELSE  [OrderNumber] + ',' + [Part] + ',' + [OrderQuantity] + ',' + [PicknoteNumber] + ',' + [PicknoteQuantity]
					END AS [Encoded],
	0 AS [Processed]
FROM 
	(SELECT 
		ISNULL(T1.[Type],'')															AS [Type],
		ISNULL(CONVERT(VARCHAR(10),T1.[OrderNumber]),'')								AS [OrderNumber],
		ISNULL(T1.[Part],'')															AS [Part],
		CONVERT(VARCHAR(10),CONVERT(DECIMAL(10,0),T1.[OrderQuantity]))					AS [OrderQuantity],
		ISNULL(CONVERT(VARCHAR(10),T1.[PicknoteNumber]),'')								AS [PicknoteNumber],
		CONVERT(VARCHAR(10),CONVERT(DECIMAL(10,0),T1.[PicknoteQuantity]))				AS [PicknoteQuantity],
		CASE T1.[PicknoteStatus]	
			WHEN 0 THEN 'No actions carried out'
			WHEN 1 THEN 'Printed'
			WHEN 2 THEN 'Confirmed'
			WHEN 3 THEN 'Reverse confirmed'
			ELSE ''
		END																				AS [PicknoteStatus],
		ISNULL(T1.[OrderEnteredBy],'')													AS [OrderEnteredBy],
		ISNULL(T1.[OrderEnteredByFullName],'')											AS [OrderEnteredByFullName],
		ISNULL(T1.[OrderEnteredByManager],'')											AS [OrderEnteredByManager]
	FROM 
		(SELECT
			CASE 
				WHEN P.[Number] IS NULL THEN 'Item added'
				WHEN O.[QuantityOrdered] <> P.[Quantity] THEN CASE WHEN O.[QuantityOrdered] > P.[Quantity] THEN 'Quantity increased' ELSE 'Quantity decreased' END
				ELSE 'Unknown'
			END																			AS [Type],
			CONVERT(VARCHAR(1024),O.[OrderNum])											AS [OrderNumber],
			O.[Part]																	AS [Part],
			ISNULL(O.[QuantityOrdered],0)												AS [OrderQuantity],
			CASE ISNULL(CONVERT(VARCHAR(1024),P.[Number]),'')
				WHEN '' THEN CONVERT(VARCHAR(1024),(SELECT ISNULL(MAX([Number]),0) FROM [vw_ASC_LIVE_Picknotes] WHERE [OrderID] IN (SELECT [ID] FROM [vw_ASC_LIVE_Orders] WHERE [OrderNum] = O.[OrderNum]))) + '*'
				ELSE CONVERT(VARCHAR(1024),P.[Number])
			END																			AS [PicknoteNumber],
			ISNULL(P.[Quantity],0)														AS [PicknoteQuantity],
			ISNULL(P.[Status],99)														AS [PicknoteStatus],
			U.[Email]																	AS [OrderEnteredBy],
			U.[FullName]																AS [OrderEnteredByFullName],
			UM.[Email]																	AS [OrderEnteredByManager]
		FROM 
						[vw_ASC_LIVE_Orders]			O
		LEFT OUTER JOIN	[vw_ASC_LIVE_Picknotes]			P		ON	P.[OrderID] = O.[ID]
																AND P.[Status] < 4
		LEFT OUTER JOIN [vw_HICS_SupplyChainUserLinks]	SCUL	ON	SCUL.[LnkSYS_PEOPLE_PP_CODE] = O.[OrderEnteredBy] COLLATE Latin1_General_CI_AS
		LEFT OUTER JOIN [vw_HICS_Rep_Users]				U		ON	U.[ID] = SCUL.[LnkUserID]
		LEFT OUTER JOIN [vw_HICS_Rep_Users]				UM		ON	UM.[ID] = U.[Manager]
		WHERE 
			O.[OrderNum] IN (	SELECT DISTINCT 
									O.[OrderNum] 
								FROM
									vw_ASC_LIVE_Orders O
								WHERE
									O.[ID] in (SELECT DISTINCT [OrderID] FROM [vw_ASC_LIVE_Picknotes] WHERE [Status] < 4))
		AND O.[OrderRef] NOT IN (SELECT DISTINCT [SONumber] FROM [vw_ASC_LIVE_Invoices])
		AND O.[Status] <> 'C'
		AND (O.[QuantityOrdered] <> P.[Quantity]
			OR
			P.[Number] IS NULL)
		AND (P.[Number] IS NULL
			OR
			P.[Number] IN (	SELECT DISTINCT 
								T1.[PN] 
							FROM 
								(SELECT 
									MAX(P.[Number]) [PN], 
									O.[OrderNum]
								FROM 
												[vw_ASC_LIVE_Picknotes] P
								INNER JOIN [vw_ASC_LIVE_Orders]	O ON O.[ID] = P.[OrderID]
								GROUP BY O.[OrderNum]) T1))
		UNION
		SELECT
			T1.*
		FROM 
			(SELECT
				'Item removed'															AS [Type],
				CASE ISNULL(CONVERT(VARCHAR(1024),O.[OrderNum]),'')
					WHEN '' THEN CONVERT(VARCHAR(1024),(SELECT ISNULL(MAX([OrderNum]),0) FROM [vw_ASC_LIVE_Orders] WHERE [ID] IN (SELECT [OrderID] FROM [vw_ASC_LIVE_Picknotes] WHERE [Number] = P.[Number]))) + '*'
					ELSE CONVERT(VARCHAR(1024),O.[OrderNum])
				END																		AS [OrderNumber],
				O.[Part]																AS [Part],
				ISNULL(O.[QuantityOrdered],0)											AS [OrderQuantity],
				ISNULL(CONVERT(VARCHAR(1024),P.[Number]),0)								AS [PicknoteNumber],
				ISNULL(P.[Quantity],0)													AS [PicknoteQuantity],
				ISNULL(P.[Status],99)													AS [PicknoteStatus],
				CASE ISNULL(U.[Email],'')
					WHEN '' THEN (SELECT TOP 1 [Email] FROM [vw_HICS_Rep_Users] WHERE [ID] in (SELECT [LnkUserID] FROM [vw_HICS_SupplyChainUserLinks] WHERE [LnkSYS_PEOPLE_PP_CODE] IN 
									(SELECT MAX([OrderEnteredBy]) COLLATE Latin1_General_CI_AS FROM [vw_ASC_LIVE_Orders] WHERE [ID] IN (SELECT [OrderID] FROM [vw_ASC_LIVE_Picknotes] WHERE [Number] = P.[Number]))))
					ELSE U.[Email]
				END																		AS [OrderEnteredBy],
				CASE ISNULL(U.[FullName],'')
					WHEN '' THEN (SELECT TOP 1 [FullName] FROM [vw_HICS_Rep_Users] WHERE [ID] in (SELECT [LnkUserID] FROM [vw_HICS_SupplyChainUserLinks] WHERE [LnkSYS_PEOPLE_PP_CODE] IN 
									(SELECT MAX([OrderEnteredBy]) COLLATE Latin1_General_CI_AS FROM [vw_ASC_LIVE_Orders] WHERE [ID] IN (SELECT [OrderID] FROM [vw_ASC_LIVE_Picknotes] WHERE [Number] = P.[Number])))) + '*'
					ELSE U.[Email]
				END																		AS [OrderEnteredByFullName],
				CASE ISNULL(UM.[Email],'')
					WHEN '' THEN (SELECT TOP 1 [Email] FROM [vw_HICS_Rep_Users] WHERE [ID] IN (SELECT [Manager] FROM [vw_HICS_Rep_Users] WHERE [ID] in (SELECT [LnkUserID] FROM [vw_HICS_SupplyChainUserLinks] WHERE [LnkSYS_PEOPLE_PP_CODE] IN 
									(SELECT MAX([OrderEnteredBy]) COLLATE Latin1_General_CI_AS FROM [vw_ASC_LIVE_Orders] WHERE [ID] IN (SELECT [OrderID] FROM [vw_ASC_LIVE_Picknotes] WHERE [Number] = P.[Number]))))) 
					ELSE UM.[Email]
				END																		AS [OrderEnteredByManager]
			FROM 
							[vw_ASC_LIVE_Picknotes]			P
			LEFT OUTER JOIN	[vw_ASC_LIVE_Orders]			O		ON	O.[ID] = P.[OrderID]
			LEFT OUTER JOIN [vw_HICS_SupplyChainUserLinks]	SCUL	ON	SCUL.[LnkSYS_PEOPLE_PP_CODE] = O.[OrderEnteredBy] COLLATE Latin1_General_CI_AS
			LEFT OUTER JOIN [vw_HICS_Rep_Users]				U		ON	U.[ID] = SCUL.[LnkUserID]
			LEFT OUTER JOIN [vw_HICS_Rep_Users]				UM		ON	UM.[ID] = U.[Manager]
			WHERE 
				P.[Status] < 4
			AND	O.[ID] IS NULL) T1
WHERE
	NOT T1.[OrderNumber] IS NULL) T1) T2

DELETE FROM #Tb_Mon_Task33 WHERE [Encoded] IN (SELECT [Ref] FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID);
	
If (SELECT COUNT(*) FROM [#Tb_Mon_Task33]) > 0
BEGIN
	DECLARE @To			VARCHAR(255)
	DECLARE @CC			VARCHAR(255)
	DECLARE @EMailBody	NVARCHAR(MAX)
	DECLARE @Fname		VARCHAR(50)
	DECLARE @Type		INT
	DECLARE @EmailID	INT
	DECLARE @Summary	VARCHAR(255)

	UPDATE [#Tb_Mon_Task33] SET [OrderEnteredBy] = 'support@hgcompany.co.uk', [OrderEnteredByManager] = '' WHERE [OrderEnteredBy] = ''
	
	WHILE (SELECT COUNT([OrderEnteredBy]) From #Tb_Mon_Task33 Where [Processed] = 0) > 0
	BEGIN
		
		SELECT TOP 1 @To = [OrderEnteredBy], @CC = [OrderEnteredByManager] FROM [#Tb_Mon_Task33] WHERE [Processed] = 0;

		IF (@To = 'support@hgcompany.co.uk') 
			SET @EMailBody = '<p>No user information was found for this record to be sent to, Supply Chain and HICS should be investigated to correct the user linking so alerts go to the correct user (SQL JOB 33).</p>'
		ELSE
			SET @EMailBody = '';

		SET @EMailBody = @EMailBody + '<p>A difference between a pick note and its correlating sales order has been identified meaning they no longer reconcile in full, this may require attention. ' + 
					'The table below shows the differences, this will only be reported once.</p>' +
					'<p>Types are: -</p><ul>' +
					'<li><strong>Item added</strong> - A new item has been added to the order</li>' +
					'<li><strong>Item removed</strong> - An item has been removed from the order</li>' +
					'<li><strong>Quantity decreased</strong> - The amount of an existing item on the order has increased</li>' +
					'<li><strong>Quantity increased</strong> - The amount of an existing item on the order has decreased</li></ul>' +
					
					'<p><table>' +  
						'<tr><th>Type</th><th>Order</th><th>Pick note</th><th>Pick note status</th><th>Description</th></tr>' +  
						CAST((SELECT
								[Type]				AS [td],'',
								[OrderNumber]		AS [td],'',
								[PicknoteNumber]	AS [td],'',
								[PicknoteStatus]	AS [td],'',
								CASE [Type]
									WHEN 'Item added' THEN CONCAT('The item ''',[Part],''' has been added to the order.')
									WHEN 'Item removed' THEN 'An item has been removed from the order.'
									WHEN 'Quantity decreased' THEN 'The quantity of item ''' + [Part] + ''' has been decreased by ' + CONVERT(VARCHAR(1024),CONVERT(INT,[PicknoteQuantity]) - CONVERT(INT,[OrderQuantity])) + ' to ' + [OrderQuantity] + '.'
									WHEN 'Quantity increased' THEN 'The quantity of item ''' + [Part] + ''' has been increased by ' + CONVERT(VARCHAR(1024),CONVERT(INT,[OrderQuantity]) - CONVERT(INT,[PicknoteQuantity])) + ' to ' + [OrderQuantity] + '.'
									ELSE ''
								END				AS [td],''
							FROM 
								[#Tb_Mon_Task33] 
							WHERE
								[OrderEnteredBy] = @To
							ORDER BY
								[PicknoteNumber]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
						'</table></p>'  +
						'<p>* = This value has been predicted based on surrounding information (E.g. The order number is assumed based on other items on the pick note, or the pick note is assumed based on other item on the order).</p>' +
						'<br><p>Pick notes for orders that have been invoiced or are marked as completed are not included and pick note items that are marked as despatched are not included</p>' +
						'<p>This information has also been sent to the relevant pick note operatives.</p>'
		
		INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunId]) VALUES ('Supply Chain',@To,@CC,'Sales order and picknote discrepancy',@EMailBody,0,@RunID);
		
		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID );
		
		INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT 
																										@EmailID,
																										@TaskID,
																										@RunID,
																										[Encoded]
																									FROM 
																										[#Tb_Mon_Task33] 
																									where 
																										[OrderEnteredBy] = @To;

																							
		
		UPDATE [#Tb_Mon_Task33] SET [Processed] = 1 WHERE [OrderEnteredBy] = @To
		
	END;

	--Note to send on to despatch
	--SET @To = 'Despatch@hayman.co.uk;DuncanH@hgcompany.co.uk;AndyD@hgcompany.co.uk;HuwB@hgcompany.co.uk';
	SET @To = 'Despatch@hayman.co.uk;HuwB@hgcompany.co.uk;samuelm@hgcompany.co.uk';

	-- Copy me in during testing
	SET @CC = '';
	--SET @CC = 'garye@hgcompany.co.uk';

	SET @EMailBody = '<p>A difference between a pick note and its correlating sales order has been identified meaning they no longer reconcile in full, this may require attention. ' + 
				'The table below shows the differences, this will only be reported once.</p>' +
				'<p>Types are: -</p><ul>' +
				'<li><strong>Item added</strong> - A new item has been added to the order</li>' +
				'<li><strong>Item removed</strong> - An item has been removed from the order</li>' +
				'<li><strong>Quantity decreased</strong> - The amount of an existing item on the order has increased</li>' +
				'<li><strong>Quantity increased</strong> - The amount of an existing item on the order has decreased</li></ul>' +
					
				'<p><table>' +  
					'<tr><th>Type</th><th>Order</th><th>Pick note</th><th>Pick note status</th><th>Description</th><th>CST Op.</th></tr>' +  
					CAST((SELECT
							[Type]						AS [td],'',
							[OrderNumber]				AS [td],'',
							[PicknoteNumber]			AS [td],'',
							[PicknoteStatus]			AS [td],'',
							CASE [Type]
								WHEN 'Item added' THEN CONCAT('The item ''',[Part],''' has been added to the order.')
								WHEN 'Item removed' THEN 'An item has been removed from the order.'
								WHEN 'Quantity decreased' THEN 'The quantity of item ''' + [Part] + ''' has been decreased by ' + CONVERT(VARCHAR(1024),CONVERT(INT,[PicknoteQuantity]) - CONVERT(INT,[OrderQuantity])) + ' to ' + [OrderQuantity] + '.'
								WHEN 'Quantity increased' THEN 'The quantity of item ''' + [Part] + ''' has been increased by ' + CONVERT(VARCHAR(1024),CONVERT(INT,[OrderQuantity]) - CONVERT(INT,[PicknoteQuantity])) + ' to ' + [OrderQuantity] + '.'
								ELSE ''
							END							AS [td],'',
							[OrderEnteredByFullName]	AS [td],''
						FROM 
							[#Tb_Mon_Task33] 
						ORDER BY
							[PicknoteNumber]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>'  +
					'<p>* = This value has been predicted based on surrounding information (E.g. The order number is assumed based on other items on the pick note, or the pick note is assumed based on other item on the order).</p>' +
					'<br><p>Pick notes for orders that have been invoiced or are marked as completed are not included and pick note items that are marked as despatched are not included</p>' +
					'<p>This information has also been sent to the relevant CST operatives.</p>'
		
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain',@To,@CC,'Sales order and picknote discrepancy', @EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
		
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT 
																						@EmailID,
																						@TaskID, 
																						@RunID,
																						[Encoded]
																					FROM 
																						[#Tb_Mon_Task33];

END;

DROP TABLE #Tb_Mon_Task33;

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task34]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[sp_Mon_Task34]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @EmailBody	VARCHAR(MAX)
DECLARE @EmailID	INT

IF OBJECT_ID('#Tb_Mon_Task34') IS NOT NULL
DROP TABLE #Tb_Mon_Task34;

CREATE TABLE #Tb_Mon_Task34
(
[ID]					INT NOT NULL,
[SentOn]				DATETIME NOT NULL,
[Filename]				VARCHAR(50) NOT NULL,
[Ref]					VARCHAR(1000) NOT NULL);

INSERT INTO #Tb_Mon_Task34
SELECT 
	[ID],
	[SentOn], 
	[Filename],
	[Customer Ref]  AS [Ref]
FROM 
	[Tb_TransportData]
WHERE
	[Customer Ref] not in (select [ref] from [Tb_Mon_Email_Items] where [LnkTaskID] = @TaskID)

IF (SELECT COUNT([ID]) FROM [#Tb_Mon_Task34]) > 0
BEGIN
	SET @EMailBody = '<p>Below is a list of items that have been sent over to Cammack since the last time this summary was sent out.</p>' +
				'<p><table>' +  
					'<tr><th>Sent On</th><th>Filename</th><th>Ref</th></tr>' +  
					CAST((SELECT
							CONCAT(RIGHT(CONCAT('00',datepart(DAY, [SentOn])),2),'/',
									RIGHT(CONCAT('00',datepart(MONTH, [SentOn])),2),'/',
									DATEPART(YEAR, [SentOn]),' ',
									RIGHT(CONCAT('00',datepart(HOUR, [SentOn])),2),':',
									RIGHT(CONCAT('00',datepart(MINUTE, [SentOn])),2)) 			AS [td],'',
							[Filename]			AS [td],'',
							[Ref]				AS [td],''
						FROM 
							[#Tb_Mon_Task34] 
						ORDER BY
							[Filename],
							[Ref]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>' + '<p>These files can be found at ''F:\Despatch\Cammack\Sent items\'' if required.</p>'

	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','','','Cammack data send summary', @EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [HICSDEV].[dbo].[Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
		
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID,[Ref] FROM #Tb_Mon_Task34 
			
END;

DROP TABLE #Tb_Mon_Task34

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task35]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_Mon_Task35]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @EmailBody	VARCHAR(MAX)
DECLARE @EmailID	INT

IF OBJECT_ID('#Tb_Mon_Task35') IS NOT NULL
DROP TABLE #Tb_Mon_Task35;

CREATE TABLE #Tb_Mon_Task35
(
[ModifiedOn]			DATETIME NOT NULL,
[CusAdd]				VARCHAR(11) NOT NULL,
[Type]					VARCHAR(10) NOT NULL,
[Flags_Was]				VARCHAR(15) NOT NULL,
[Flags_Is]				VARCHAR(15) NOT NULL,
[Text_Was]				VARCHAR(66) NOT NULL,
[Text_Is]				VARCHAR(66) NOT NULL,
[Order_Was]				VARCHAR(11) NOT NULL,
[Order_Is]				VARCHAR(11) NOT NULL,
[String]				VARCHAR(1000) NOT NULL);

INSERT INTO #Tb_Mon_Task35
SELECT
	T4.*
FROM
	(SELECT
		T3.[ModifiedOn],
		T3.[CusAdd],
		CASE ISNULL(MP.[Ref],'')
			WHEN '' THEN 'Addition'
			ELSE 'Update'
		END						AS [Type],
		CASE ISNULL(MP.[Ref],'')
			WHEN '' THEN ''
			ELSE SUBSTRING(MP.[Ref],22,15)
		END						AS [Flags_Was],
		T3.[Flags_Is],
		CASE ISNULL(MP.[Ref],'')
			WHEN '' THEN ''
			ELSE RTRIM(SUBSTRING(MP.[Ref],37,66))
		END						AS [Text_Was],
		T3.[Text_Is],
		CASE ISNULL(MP.[Ref],'')
			WHEN '' THEN ''
			ELSE RTRIM(SUBSTRING(MP.[Ref],103,5))
		END						AS [Order_Was],
		T3.[Order_Is],
		T3.[String_Is]			AS [String]
	FROM
		(SELECT
			T2.[ID],
			T2.[ModifiedOn],
			T2.[CusAdd],
			T2.[Flags_Is],
			T2.[Text_Is],
			T2.[Order_Is],
			CONCAT(
					LEFT(CONCAT(T2.[ID] ,REPLICATE(' ',10)),10),
					LEFT(CONCAT(T2.[CusAdd] ,REPLICATE(' ',11)),11),
					LEFT(CONCAT(T2.[Flags_Is] ,REPLICATE(' ',15)),15),
					LEFT(CONCAT(T2.[Text_Is] ,REPLICATE(' ',66)),66),
					LEFT(CONCAT(T2.[Order_Is] ,REPLICATE(' ',5)),5)) [String_Is]--This is the column size in Supply Chain
		FROM
			(SELECT
				T1.[ID],
				T1.[ModifiedOn],
				T1.[Customer] + 
				CASE T1.[Customer Address]
					WHEN '' THEN ''
					ELSE '\' +T1.[Customer Address]
				END AS [CusAdd],
				CONCAT(T1.[Flag1],T1.[Flag2],T1.[Flag3],T1.[Flag4],T1.[Flag5],T1.[Flag6],T1.[Flag7],T1.[Flag8],T1.[Flag9],T1.[Flag10],T1.[Flag11],T1.[Flag12],T1.[Flag13],T1.[Flag14],T1.[Flag15]) AS [Flags_Is],
				T1.[Text] AS [Text_Is],
				T1.[Order] AS [Order_Is]
			FROM 
				(SELECT
					ET.[ID],
					ET.[ModifiedOn],
					CASE ET.[KeyType]
						WHEN 'BM' THEN 'Bill of Materials'
						WHEN 'CU' THEN CASE 
											WHEN LEN(ET.[fileref]) > 5 THEN 'Customer Address'
											ELSE 'Customer'
										END
						WHEN 'IT' THEN 'Product'
						WHEN 'PO' THEN CASE 
											WHEN ET.[Item] = '' THEN 'Purchase order'
											ELSE 'Purchase order item'
										END
						WHEN 'SO' THEN CASE 
											WHEN ET.[Item] = '' THEN 'Sales order'
											ELSE 'Sales order item'
										END
						WHEN 'WO' THEN 'Works Order'
						ELSE ET.[KeyType]
					END		AS [Type],
					CASE 
						WHEN ET.[KeyType] = 'CU' THEN LEFT(ET.[FileRef],5)
						ELSE ''
					END					AS [Customer],
					LTRIM(RTRIM(CASE 
						WHEN ET.[KeyType] = 'CU' AND LEN(ET.[FileRef]) > 5 THEN RIGHT(ET.[FileRef],LEN(ET.[FileRef])-5)
						ELSE ''
					END))					AS [Customer Address],
					ET.[Number]			AS [Order],
					CASE ET.[ActionFlag1] WHEN '' THEN ' ' ELSE ET.[ActionFlag1] END	AS [Flag1],
					CASE ET.[ActionFlag2] WHEN '' THEN ' ' ELSE ET.[ActionFlag2] END	AS [Flag2],
					CASE ET.[ActionFlag3] WHEN '' THEN ' ' ELSE ET.[ActionFlag3] END	AS [Flag3],
					CASE ET.[ActionFlag4] WHEN '' THEN ' ' ELSE ET.[ActionFlag4] END	AS [Flag4],
					CASE ET.[ActionFlag5] WHEN '' THEN ' ' ELSE ET.[ActionFlag5] END	AS [Flag5],
					CASE ET.[ActionFlag6] WHEN '' THEN ' ' ELSE ET.[ActionFlag6] END	AS [Flag6],
					CASE ET.[ActionFlag7] WHEN '' THEN ' ' ELSE ET.[ActionFlag7] END	AS [Flag7],
					CASE ET.[ActionFlag8] WHEN '' THEN ' ' ELSE ET.[ActionFlag8] END	AS [Flag8],
					CASE ET.[ActionFlag9] WHEN '' THEN ' ' ELSE ET.[ActionFlag9] END	AS [Flag9],
					CASE ET.[ActionFlag10] WHEN '' THEN ' ' ELSE ET.[ActionFlag10] END	AS [Flag10],
					CASE ET.[ActionFlag11] WHEN '' THEN ' ' ELSE ET.[ActionFlag11] END	AS [Flag11],
					CASE ET.[ActionFlag12] WHEN '' THEN ' ' ELSE ET.[ActionFlag12] END	AS [Flag12],
					CASE ET.[ActionFlag13] WHEN '' THEN ' ' ELSE ET.[ActionFlag13] END	AS [Flag13],
					CASE ET.[ActionFlag14] WHEN '' THEN ' ' ELSE ET.[ActionFlag14] END	AS [Flag14],
					CASE ET.[ActionFlag15] WHEN '' THEN ' ' ELSE ET.[ActionFlag15] END	AS [Flag15],
					RTRIM(ET.[Text])													AS [Text]
				FROM
								[vw_ASC_LIVE_ExtraText] ET
				LEFT OUTER JOIN	[vw_ASC_LIVE_Customers]	C	ON	C.[Code] = LEFT(ET.[FileRef],5) 
															AND	ET.[KeyType] = 'CU'	
				LEFT OUTER JOIN [vw_ASC_LIVE_CusAdd1]	CA	ON	CA.[AddressCode] = ET.[FileRef] 
															AND	ET.[KeyType] = 'CU'	
				WHERE
					ET.[ModifiedOn] > '03/Dec/2021'
				AND	ET.[KeyType] = 'CU'
				AND LEFT(ET.[FileRef],1) = '1') T1) T2) T3
	LEFT OUTER JOIN	(
					SELECT 
						LEFT([Ref],10) AS [ETID],
						[Ref] 
					FROM 
						[Tb_Mon_Email_Items] 
					WHERE
						[ID] IN (
					SELECT
						MAX(ID) as [ID]
					FROM 
						[Tb_Mon_Email_Items] 
					WHERE 
						[LnkTaskID] = @TaskID
					GROUP BY
						LEFT([Ref],10))
					)	MP	ON	MP.[ETID]	=	LEFT(T3.[String_Is],10)) T4
WHERE
	T4.[Flags_Was] <> T4.[Flags_Is] 
OR T4.[Text_Was] <> T4.[Text_Is] 
OR T4.[Order_Was] <> T4.[Order_Is]

UPDATE #Tb_Mon_Task35 SET [Flags_Was] = '', [Flags_Is] = '' WHERE [Flags_Was] = [Flags_Is]
UPDATE #Tb_Mon_Task35 SET [Text_Was] = '', [Text_Is] = '' WHERE [Text_Was] = [Text_Is]
UPDATE #Tb_Mon_Task35 SET [Order_Was] = '', [Order_Is] = '' WHERE [Order_Was] = [Order_Is]


IF (SELECT COUNT([String]) FROM [#Tb_Mon_Task35]) > 0
BEGIN
	SET @EMailBody = '<p>Below is a list of Supply Chain extra text that has been update or added since the last time this summary was sent out.</p>' +
					'<p>This list is filtered to: -</p>' +
					'<p><ul><li>Created after 03/Dec/2021</li>' +
					'<li>Is extra text Type of ''Customer'' (including ''Customer Address'')</li>' + 
					'<li>The customer code begins with ''1''</li></ul></p>' + 
					'<p><table>' +  
					'<tr><th>Modified</th><th>Customer\Add</th><th>Type</th><th>Flags(Was)</th><th>Flags(Is)</th><th>Text(Was)</th><th>Text(Is)</th><th>Order(Was)</th><th>Order(Is)</th></tr>' +  
					CAST((SELECT
							CONCAT(RIGHT(CONCAT('00',datepart(DAY, [ModifiedOn])),2),'/',
									RIGHT(CONCAT('00',datepart(MONTH, [ModifiedOn])),2),'/',
									DATEPART(YEAR, [ModifiedOn]),' ',
									RIGHT(CONCAT('00',datepart(HOUR, [ModifiedOn])),2),':',
									RIGHT(CONCAT('00',datepart(MINUTE, [ModifiedOn])),2)) 			AS [td],'',
							[CusAdd]			AS [td],'',
							[Type]				AS [td],'',
							[Flags_Was]			AS [td],'',
							[Flags_Is]			AS [td],'',
							[Text_Was]			AS [td],'',
							[Text_Is]			AS [td],'',
							[Order_Was]			AS [td],'',
							[Order_Is]			AS [td],''
						FROM 
							[#Tb_Mon_Task35] 
						ORDER BY
							[CusAdd],
							[Type],
							[Order_Is]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>' +
					'<p>Note: If the before and afer were the same the values will not be shown.</p>'

	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','','','Extra text changes', @EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
		
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT DISTINCT @EmailID,@TaskID,@RunID,[String] FROM #Tb_Mon_Task35
			
END;

DROP TABLE #Tb_Mon_Task35

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task36]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task36]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

IF OBJECT_ID('tempdb..#Tb_Mon_Task36_Files') IS NOT NULL
DROP TABLE #Tb_Mon_Task36_Files;
IF OBJECT_ID('tempdb..##Tb_Mon_Task36_Raw') IS NOT NULL
DROP TABLE #Tb_Mon_Task36_Raw;
IF OBJECT_ID('tempdb..#Tb_Mon_Task36_Data') IS NOT NULL
DROP TABLE #Tb_Mon_Task36_Data;
IF OBJECT_ID('tempdb..#Tb_Mon_Task36_NSLookup') IS NOT NULL
DROP TABLE #Tb_Mon_Task36_Data;

CREATE TABLE #Tb_Mon_Task36_Files (
	[ID]				INT IDENTITY,
	[FileName]			VARCHAR(100)
);

CREATE TABLE #Tb_Mon_Task36_NSLookup (
	[ID]				INT IDENTITY,
	[NSLookup]			VARCHAR(255)
);

CREATE TABLE ##Tb_Mon_Task36_Raw (
	[Username]			VARCHAR(100) NOT NULL,
	[PageCount]			VARCHAR(100) NOT NULL,
	[Computer]			VARCHAR(100) NOT NULL,
	[DTS]				VARCHAR(100) NOT NULL,
	[RecID]				VARCHAR(100) NOT NULL,
	[Printer]			VARCHAR(100) NOT NULL
);

CREATE TABLE #Tb_Mon_Task36_Data (
	[ID]				INT IDENTITY,
	[Username]			VARCHAR(100) NOT NULL,
	[PageCount]			INT NOT NULL,
	[Computer]			VARCHAR(100) NOT NULL,
	[DTS]				DATETIME NOT NULL,
	[RecID]				INT NOT NULL,
	[Printer]			VARCHAR(100) NOT NULL,
	[Processed]			INT NOT NULL
);

DECLARE @ShellCmd		VARCHAR(1000)
DECLARE @Path			VARCHAR(255) = '\\Print02\printlog$\'
DECLARE @File			VARCHAR(255) = 'Microsoft-Windows-PrintService_Operational.csv'
DECLARE @DTE			DATETIME
DECLARE @UserID			INT
DECLARE @Counter		INT
DECLARE @FileID			INT
DECLARE @From			INT
DECLARE @To				INT
DECLARE @ID				INT
DECLARE @Note			VARCHAR(100)
DECLARE @IPAdd			VARCHAR(100)
DECLARE @ComputerName	VARCHAR(100)
DECLARE @LogMsg			VARCHAR(500)

SET @UserID = (SELECT [ID] FROM [Tb_Users] WHERE [ADUsername] = SUSER_NAME())

exec sp_Log @LogSrc,@LogCat,@LogProc ,'Print log Import process started'

--Look to see if there is a file to import
SET @ShellCmd = CONCAT('dir "',@Path,'" /b')
EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
	INSERT INTO #Tb_Mon_Task36_Files EXECUTE xp_cmdshell @ShellCmd
REVERT;

IF (SELECT COUNT([FileName]) FROM #Tb_Mon_Task36_Files WHERE [FileName] = @File) = 0
BEGIN
	set @LogMsg = 'File not found at ' + '' + @Path + @File + ''
	exec sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
END
ELSE
BEGIN
	
	--Use BCP to import the data, lets not talk about how it skipped the first 2 rows without being told :s
	exec sp_Log @LogSrc,@LogCat,@LogProc,'File found, importing'

	SET @ShellCmd = CONCAT('bcp [##Tb_Mon_Task36_Raw] IN "', @Path, @File, '" -S "SQL01" -d "tempdb" -c -t , -T')
	EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
		EXECUTE xp_cmdshell @ShellCmd
	REVERT;

	--Delete the header row
	DELETE FROM ##Tb_Mon_Task36_Raw WHERE [PageCount] = '"PageCount"'

	--move the data into the other temp table and cleans it on the way, convert to the right values and remove the double-quotes
	set @LogMsg = CONVERT(VARCHAR(10),(SELECT COUNT(*) FROM ##Tb_Mon_Task36_Raw)) + ' rows collected'
	exec sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

	update ##Tb_Mon_Task36_Raw set Computer = REPLACE([Computer],'"','');

	IF (SELECT COUNT([Computer]) FROM ##Tb_Mon_Task36_Raw WHERE LEFT([Computer],2) = '\\') > 0 
	BEGIN
		exec sp_Log @LogSrc,@LogCat,@LogProc,'Resolving print jobs with IP addresses'
	END;

	WHILE (SELECT COUNT([Computer]) FROM ##Tb_Mon_Task36_Raw WHERE LEFT([Computer],2) = '\\') > 0 
	BEGIN
		
		SELECT TOP 1 @IPAdd = [Computer] FROM ##Tb_Mon_Task36_Raw WHERE LEFT([Computer],2) = '\\'
		SET @ShellCmd = CONCAT('nslookup ',REPLACE(@IPAdd,'\',''))
		EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
			INSERT INTO #Tb_Mon_Task36_NSLookup EXECUTE xp_cmdshell @ShellCmd
		REVERT;
		
		IF (SELECT ISNULL([NSLookup],'') FROM #Tb_Mon_Task36_NSLookup WHERE ID = 4) = '' or (SELECT LEFT(ISNULL([NSLookup],''),3) FROM #Tb_Mon_Task36_NSLookup WHERE ID = 4) = '***'
		BEGIN
			set @LogMsg = 'Unable to resolve ' + '' + REPLACE(@IPAdd,'\','') + ''
			exec sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
			set @ComputerName = REPLACE(@IPAdd,'\','')
		END;
		ELSE
		BEGIN
			set @ComputerName = (SELECT REPLACE(UPPER(LTRIM(RTRIM(RIGHT([NSLookup],LEN([NSLookup])-5)))),'.HAYMAN.LOCAL','') FROM #Tb_Mon_Task36_NSLookup WHERE ID = 4);
			set @LogMsg = 'Resolved ' + '' + REPLACE(@IPAdd,'\','') + '' + '  to ' + '' + @ComputerName + ''
			exec sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
			
		END;
		UPDATE ##Tb_Mon_Task36_Raw SET [Computer] = @ComputerName WHERE [Computer] = @IPAdd;
		
	END
	
	exec sp_Log @LogSrc,@LogCat,@LogProc,'Converting the collection to valid data types'
	
	INSERT INTO #Tb_Mon_Task36_Data ([Username],[PageCount],[Computer],[DTS],[RecID],[Printer],[Processed]) 
	SELECT
		REPLACE([Username],'"','') AS [Username],
		CONVERT(INT,replace([PageCount],'"','')) AS [PageCount],
		[Computer],
		CONVERT(DATETIME,REPLACE(LEFT([DTS],4) + 
									CASE CONVERT(INT,SUBSTRING([DTS],5,2)) 
										WHEN 1 THEN 'Jan' 
										WHEN 2 THEN 'Feb' 
										WHEN 3 THEN 'Mar' 
										WHEN 4 THEN 'Apr' 
										WHEN 5 THEN 'May' 
										WHEN 6 THEN 'Jun' 
										WHEN 7 THEN 'Jul' 
										WHEN 8 THEN 'Aug' 
										WHEN 9 THEN 'Sep' 
										WHEN 10 THEN 'Oct' 
										WHEN 11 THEN 'Nov' 
										ELSE 'Dec' 
									END + 
									RIGHT([DTS],len([DTS])-6),'"','')) AS [DTS],
		CONVERT(INT,replace([RecID],'"','')) AS [RecID],
		REPLACE([Printer],'"','') AS [Printer],
		0 AS [Processed]
	FROM 
		##Tb_Mon_Task36_Raw

	--Remove any that have been imported before
	exec sp_Log @LogSrc,@LogCat,@LogProc,'Removing items that have been imported previously'
	
	DELETE FROM #Tb_Mon_Task36_Data WHERE
	CONVERT(VARCHAR(10),[RecID]) + '_' + CONVERT(VARCHAR(4),DATEPART(YYYY, [DTS])) + RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(MM, [DTS])),2) + RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(DD, [DTS])),2) 
	IN (SELECT CONVERT(VARCHAR(10),[EventRecID]) + '_' + CONVERT(VARCHAR(4),DATEPART(YYYY, [PrintTime])) + RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(MM, [PrintTime])),2) + RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(DD, [PrintTime])),2) FROM [Tb_PrinterLog]);

	set @LogMsg = CONVERT(VARCHAR(10),(SELECT COUNT(*) FROM #Tb_Mon_Task36_Data)) + ' new items remain'
	exec sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
			
	--If the user accounts do not exist (can't imagine but you never know, then they need to be added so they can be linked to)
	exec sp_Log @LogSrc,@LogCat,@LogProc,'Validating users'
	
	INSERT INTO [Tb_Users] ([ADUsername]) SELECT DISTINCT 'HAYMAN0\' + [Username] FROM #Tb_Mon_Task36_Data WHERE 'HAYMAN0\' + [Username] NOT IN (SELECT [ADUsername] FROM [Tb_users])

	--Insert into the main print log where the record has not be inserted before, bases on the print date and event record id
	exec sp_Log @LogSrc,@LogCat,@LogProc,'Inserting new items'
	
	--We are having to insert them one by one as we need to do checks on each one
	WHILE (SELECT COUNT([ID]) from #Tb_Mon_Task36_Data where [Processed] = 0) <> 0
	BEGIN
		SET @ID  = (SELECT MIN([ID]) FROM #Tb_Mon_Task36_Data WHERE [Processed] = 0)
		SET @From = 0
		SET @To = 0
		SET @Note = ''

		IF (SELECT COUNT([ID]) from [Tb_AR] where [LnkARID] = 1 AND [Deleted] = 0 AND [Name] = (SELECT replace([Computer],'\','') FROM #Tb_Mon_Task36_Data WHERE [ID] = @ID)) = 0
		BEGIN
			set @LogMsg = 'Unable to find the source computer ' + '' + (SELECT [Computer] FROM #Tb_Mon_Task36_Data WHERE [ID] = @ID) + ''
			exec sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
	
			SET @Note = @Note + 'From: ' + (SELECT [Computer] FROM #Tb_Mon_Task36_Data WHERE [ID] = @ID) + '. '
		END;
		ELSE
		BEGIN
			set @From = (SELECT MAX([ID]) from [Tb_AR] where [LnkARID] = 1 AND [Deleted] = 0 AND [Name] = (SELECT replace([Computer],'\','') FROM #Tb_Mon_Task36_Data WHERE [ID] = @ID))
		END;

		IF (SELECT COUNT([ID]) from [Tb_AR] where [LnkARID] = 1 AND [Deleted] = 0 AND [PrinterName] = (SELECT replace([Printer],'\','') FROM #Tb_Mon_Task36_Data WHERE [ID] = @ID)) = 0
		BEGIN
			set @LogMsg = 'Unable to find the destination printer ' + '' + (SELECT [Printer] FROM #Tb_Mon_Task36_Data WHERE [ID] = @ID) + ''
			exec sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
	
			SET @Note = @Note + 'To: ' + (SELECT [Printer] FROM #Tb_Mon_Task36_Data WHERE [ID] = @ID) + '. '
		END;
		ELSE
		BEGIN
			set @To = (SELECT MAX([ID]) from [Tb_AR] where [LnkARID] = 1 AND [Deleted] = 0 AND [PrinterName] = (SELECT replace([Printer],'\','') FROM #Tb_Mon_Task36_Data WHERE [ID] = @ID))
		END;

		INSERT INTO [Tb_PrinterLog] ([EventRecID],[LnkUserID_By],[LnkAssetID_From],[LnkAssetID_To],[PrintTime],[Pages],[Note])
		SELECT 
			T1.[RecID] as [EventRecID],
			(SELECT MAX([ID]) AS [ID] FROM [Tb_Users] where [ADUsername] = 'HAYMAN0\' + T1.[Username]) AS [LnkUserID_By],
			@From AS [LnkAssetID_From],
			@To AS [LnkAssetID_To],
			CONVERT(DATETIME,T1.[DTS]) AS [PrintTime],
			T1.[PageCount] AS [Pages],
			LTRIM(RTRIM(@Note)) AS [Note]
		FROM 
			#Tb_Mon_Task36_Data T1
		WHERE
			T1.[ID] = @ID;

		update #Tb_Mon_Task36_Data set [Processed] = CASE @Note WHEN '' THEN 1 ELSE 2 END WHERE [id] = @ID;

	END;

	--Copy the imported file to the archive folder
	exec sp_Log @LogSrc,@LogCat,@LogProc,'Archiving imported print log file'
	
	SET @ShellCmd = (SELECT CONCAT('xcopy "', @Path, @File, '" "', @Path, 'Archive\"  /C /I /Q /Y'))
	EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
		EXECUTE xp_cmdshell @ShellCmd
		
		--Then rename it to the date
		SET @ShellCmd = (SELECT CONCAT('REN "', @Path,'Archive\', @File, '" "', 
		(CONVERT(VARCHAR(4),DATEPART(YYYY, SYSDATETIME())) + 
		RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(MM, SYSDATETIME())),2) + 
		RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(DD, SYSDATETIME())),2)),'.csv'))
		EXECUTE xp_cmdshell @ShellCmd
	REVERT;

	--Give the files system 5 seconds to comply
	WAITFOR DELAY '00:00:05'

	--Delete the original file
	set @ShellCmd = (SELECT CONCAT('del "', @Path, @File,'"'))
	EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
		EXECUTE xp_cmdshell @ShellCmd
	REVERT;

	If (SELECT COUNT([ID]) FROM [#Tb_Mon_Task36_Data] WHERE [Processed] = 2) > 0
	BEGIN
		
		exec sp_Log @LogSrc,@LogCat,@LogProc,'Sending email about unlinked items'
			
		DECLARE @EMailBody NVARCHAR(MAX)
		DECLARE @EmailID int

		set @EMailBody =	'<p>Below is a list of items that could not be found in the asset register, it may be there is no asset (from) or the printer name (to) is not set up.</p>' +
							'<p><table>' +  
							'<tr><th>From</th><th>To</th></tr>' +  
							CAST((SELECT DISTINCT
									REPLACE([Computer],'\','')			AS [td],'',
									[Printer]							AS [td],''
								FROM 
									[#Tb_Mon_Task36_Data]
								WHERE
									[Processed] = 2
								ORDER BY
									REPLACE([Computer],'\',''),
									[Printer]
								FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
							'</table></p>' 
						
		INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('HICS','','Missing printer information', @EMailBody,0,@RunID);
	
		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID );

		INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [Computer] + ', ' + [Printer] FROM [#Tb_Mon_Task36_Data];

	END;
END;

--Ensure we never hold more than a year of print log imports
exec sp_Log @LogSrc,@LogCat,@LogProc,'Managing print log archive folder'
	
delete from #Tb_Mon_Task36_Files
SET @ShellCmd = CONCAT('dir "',@Path,'Archive\" /b')
EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
	INSERT INTO #Tb_Mon_Task36_Files EXECUTE xp_cmdshell @ShellCmd
REVERT;

delete from #Tb_Mon_Task36_Files where [FileName] is null OR right([FileName],4) <> '.csv';

update #Tb_Mon_Task36_Files set [FileName] = left([FileName],len([FileName])-4) where right([FileName],4) = '.csv';

set @DTE = convert(date,DATEADD(yyyy,-1,sysdatetime()));
set @Counter = 0

WHILE (SELECT COUNT(T1.[ID]) FROM (select * from #Tb_Mon_Task36_Files where ISNUMERIC([FileName]) = 1) T1 WHERE CONVERT(INT,T1.[FileName]) < CONVERT(INT,CONVERT(VARCHAR(4),DATEPART(YYYY, @DTE)) + RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(MM, @DTE)),2) + RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(DD, @DTE)),2))) > 0
BEGIN
	SET @FileID = (SELECT MIN(T1.[ID]) FROM (select * from #Tb_Mon_Task36_Files where ISNUMERIC([FileName]) = 1) T1 WHERE CONVERT(INT,T1.[FileName]) < CONVERT(INT,CONVERT(VARCHAR(4),DATEPART(YYYY, @DTE)) + RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(MM, @DTE)),2) + RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(DD, @DTE)),2)))
	SET @File = (SELECT CONVERT(VARCHAR(4),DATEPART(YYYY, [FileName])) + RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(MM, [FileName])),2) + RIGHT('00' + CONVERT(VARCHAR(2),DATEPART(DD, [FileName])),2) + '.csv' FROM #Tb_Mon_Task36_Files WHERE [ID] = @FileID)
	
	set @ShellCmd = (SELECT CONCAT('del "', @Path, 'Archive\', @File, '" /F'))
	EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
		EXECUTE xp_cmdshell @ShellCmd
	REVERT;
	Set @Counter = @Counter + 1

	DELETE FROM #Tb_Mon_Task36_Files WHERE [id] = @FileID

END;

if @Counter = 0
BEGIN
	exec sp_Log @LogSrc,@LogCat,@LogProc,'No files required removing'
END;
ELSE
BEGIN
	if @Counter = 1
	BEGIN
		exec sp_Log @LogSrc,@LogCat,@LogProc,'1 file required removing'
	END;
	ELSE
	BEGIN
		SET @LogMsg = CONVERT(VARCHAR(10),@Counter) + ' Files required removing'
		exec sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
	END;	
END;

--remove temp tables
DROP TABLE #Tb_Mon_Task36_NSLookup;
DROP TABLE #Tb_Mon_Task36_Files;
DROP TABLE ##Tb_Mon_Task36_Raw;
DROP TABLE #Tb_Mon_Task36_Data;

exec sp_Log @LogSrc,@LogCat,@LogProc,'Print log import finished'

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task37]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task37]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @ShellCmd				VARCHAR(1000)
DECLARE @StrSourcePath			VARCHAR(500) = '\\ASC01\Files\System\Inbox\'
DECLARE @StrDestinationPathRoot	VARCHAR(500) = '\\ASC01\Files\'
DECLARE @StrDestinationPath		VARCHAR(500) 
DECLARE @StrContainer			VARCHAR(500)
DECLARE @StrUser				VARCHAR(500)
DECLARE @StrSource				VARCHAR(500)
DECLARE @StrDestination			VARCHAR(500)
DECLARE @StrSuffix				VARCHAR(500)
DECLARE @LngID					INT
DECLARE @StrID					VARCHAR(30)
DECLARE @StrIDFull				VARCHAR(30)
DECLARE @StrItemID				VARCHAR(30)
DECLARE @StrDate				VARCHAR(8)
DECLARE @StrTime				VARCHAR(5)
DECLARE	@StrType				VARCHAR(2)
DECLARE	@StrType2				VARCHAR(2)
DECLARE @LngCounter				INT
DECLARE @StrName				VARCHAR(50)
DECLARE @LogMsg					VARCHAR(500)
DECLARE @StrWOName				VARCHAR(128)

drop table if exists #Tb_Mon_Task37_File
drop table if exists #Tb_Mon_Task37_Files 

CREATE TABLE #Tb_Mon_Task37_Files (
	[ID]				INT IDENTITY,
	[FileName]			VARCHAR(500)
);

CREATE TABLE #Tb_Mon_Task37_File (
	[ID]				INT IDENTITY,
	[FileName]			VARCHAR(500)
);

--See if there are any files in the folder
SET @ShellCmd = CONCAT('dir "',@StrSourcePath,'" /Q /ON')
EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
	INSERT INTO #Tb_Mon_Task37_Files EXECUTE xp_cmdshell @ShellCmd
REVERT;

--Delete excess rows from the data that is returned
delete from #Tb_Mon_Task37_Files where UPPER(right([FileName],4)) <> '.PDF' or [FileName] IS NULL

--Talk if there is any work to do
SELECT @LngCounter = COUNT([ID]) FROM [#Tb_Mon_Task37_Files]
IF @LngCounter = 1 	
BEGIN
	set @LogMsg = '1 File to be processed'
	EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
END
ELSE
BEGIN
	IF @LngCounter <> 0
	BEGIN
		set @LogMsg = CONVERT(VARCHAR(4),@LngCounter) + ' Files to be processed'
		EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
	END
END

--Start doing work if there is work to do
WHILE (SELECT COUNT([ID]) FROM [#Tb_Mon_Task37_Files]) > 0
BEGIN
	
	--Seletc the first item and work on it
	SELECT @LngID = MIN([ID]) FROM [#Tb_Mon_Task37_Files]
	SELECT @StrContainer = [FileName] from #Tb_Mon_Task37_Files where [ID] = @LngID

	--Cut off the suffix
	set @StrSuffix = ''
	WHILE RIGHT(@StrContainer,1) <> '.'
	BEGIN
		SET @StrSuffix = right(@StrContainer, 1) + @StrSuffix
		SET @StrContainer = left(@StrContainer, len(@StrContainer)-1)
	END
	SET @StrContainer = left(@StrContainer ,len(@StrContainer)-1)
	
	--trim away data we do not need
	SET @StrContainer = right(@StrContainer,len(@StrContainer) - (CHARINDEX('HAYMAN0\',@StrContainer)+22))

	--the source is the file name (with suffix alone)
	set @StrSource = @StrContainer + '.' + @StrSuffix 
	
	--if the file starts with DN_# then it is a supply chain issue the Access are not fixing, I have built a work around for it but it must be renamed
	--to enter that workaround
	IF CHARINDEX('DN_#',@StrSource) = 0
	BEGIN
		
		--Pull of the first 2 characters (considered the type)
		set @StrType = left(@StrContainer,2)

		--Only work if we are aware of the type (stop unknown types being processed)
		IF @StrType IN ('CA','DN','IN','PI','PN','PO','SA','WO') 
		--IF @StrType IN ('CA','DN','IN','PO','SA','PN','PI','WO') 
		--IF @StrType IN ('DN','IN','PO','SA','PN','PI','WO') 
		BEGIN
			
			--Talk
			SET @LogMsg = 'Processing ' + @StrSource
			EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

			--Cut of the type
			SET @StrContainer = right(@StrContainer,len(@StrContainer)-3)

			--Get the ID and Full ID (the leading zeros) from the files name
			set @StrIDFull = ''
			WHILE LEFT(@StrContainer,1) = '0'
			BEGIN
				SET @StrContainer = right(@StrContainer ,len(@StrContainer)-1)
				set @StrIDFull = @StrIDFull + '0'
			END

			SET @StrID = ''
			WHILE LEFT(@StrContainer,1) <> '_'
			BEGIN
				SET @StrID = @StrID + LEFT(@StrContainer, 1) 
				SET @StrContainer = RIGHT(@StrContainer, len(@StrContainer)-1)
			END
			SET @StrContainer = RIGHT(@StrContainer ,len(@StrContainer)-1)

			SET @StrIDFull = @StrIDFull + @StrID
			SET @StrItemID = @StrID

			--Different types need different lookup and changes to the IDs to make the link as desired
			If @StrType = 'DN'
			BEGIN
				--get the order reference from the despatch reference
				select @StrIDFull = CONVERT(VARCHAR(20),MAX([OrderRef])) from [vw_ASC_LIVE_ToBeInvoiced] where DesptachNum = CONVERT(INT,@StrID)
				SET @StrID = @StrIDFull;
				WHILE LEFT(@StrID,1) = '0'
				BEGIN
					SET @StrID = right(@StrID ,len(@StrID)-1);
				END
			END

			If @StrType = 'IN'
			BEGIN
				--A type of IN (Invoice) could be a credit note
				--get the order reference from the invoice\credit note reference
				IF LEFT(@StrID,1) = '9'
				BEGIN
					set @StrType = 'CN'
				END
				select @StrIDFull = MAX([SONumber]) from [vw_ASC_LIVE_Invoices] where [SINumber] = CONVERT(INT,@StrID)
				SET @StrID = @StrIDFull;
				WHILE LEFT(@StrID,1) = '0'
				BEGIN
					SET @StrID = right(@StrID ,len(@StrID)-1);
				END
			END

			If @StrType = 'PN'
			BEGIN
				--get the order reference from the pick note reference
				select @StrIDFull = MAX(O.[OrderRef]) from [vw_ASC_LIVE_Picknotes] P LEFT OUTER JOIN [vw_ASC_LIVE_Orders] O ON O.[ID] = P.[OrderID] WHERE P.[Number] = CONVERT(INT,@StrID)
				SET @StrID = @StrIDFull;
				WHILE LEFT(@StrID,1) = '0'
				BEGIN
					SET @StrID = right(@StrID ,len(@StrID)-1);
				END
			END

			If @StrType = 'PI'
			BEGIN
				--get the full ID order reference from the order number
				SELECT @StrIDFull = CONVERT(VARCHAR(20),MAX([OrderRef])) FROM [vw_ASC_LIVE_Orders] WHERE [OrderNum] = CONVERT(INT,@StrID)
			END

			If @StrType = 'WO'
			BEGIN
				--For works order we are also appending the part and sales order reference into the file name to enable better searching in 
				--Documents (on HICS)... Not sure I agree with this.
				SELECT @StrWOName = LTRIM(RTRIM(MAX([SalesOrder]))) FROM [vw_ASC_LIVE_WorksOrders] WHERE [WorksOrderNo] = @StrID
				IF @StrWOName <> '' 
				BEGIN
					SET @StrWOName = (SELECT '_' + CONVERT(VARCHAR(20),MAX([OrderNum])) FROM [vw_ASC_LIVE_Orders] WHERE [OrderRef] = @StrWOName)
				END
				SET @StrItemID = @StrItemID + '_' + (SELECT MAX([Part]) FROM [vw_ASC_LIVE_WorksOrders] WHERE [WorksOrderNo] = @StrID) + @StrWOName
				
			END

			If @StrType = 'CA'
			BEGIN
				--For CoAs we need to add the leading zeros
				SET @StrIDFull = RIGHT('0000000000000' + @StrIDFull, 13)
			END

			--Collect the date from the file name
			SET @StrDate = LEFT(@StrContainer,8)

			--Collect the time from the file name
			SET @StrTime = SUBSTRING(@StrContainer,9,2) + ':' + SUBSTRING(@StrContainer,11,2)
	
			--Define the folder for the destination
			SET @StrDestinationPath = @StrDestinationPathRoot +	CASE  
																	WHEN @StrType IN ('CA','SA','DN','IN','CN','PN','PI') THEN 'Orders'
																	WHEN @StrType IN ('WO') THEN 'Works orders'
																	WHEN @StrType IN ('PO') THEN 'Purchases'
																	ELSE 'UNKNOWN'
																END + '\'

			--Create the folder if required
			SET @ShellCmd = CONCAT('MKDIR "',@StrDestinationPath,'"')
			EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
				EXECUTE xp_cmdshell @ShellCmd
			REVERT;

			--Define the folder for the item
			SET @StrDestinationPath = @StrDestinationPath + @StrID + '\'

			--Create the folder if required
			SET @ShellCmd = CONCAT('MKDIR "',@StrDestinationPath,'"')
			EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
				EXECUTE xp_cmdshell @ShellCmd
			REVERT;

			--This uses powershell to get the creator of the file
			delete from [#Tb_Mon_Task37_File]
			SET @ShellCmd = CONCAT('powershell.exe Get-ACL ''', @StrSourcePath,@StrSource,'''')
			EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
				INSERT INTO #Tb_Mon_Task37_File EXECUTE xp_cmdshell @ShellCmd
			REVERT;

			--Get rid of unrequired rows returned
			delete from #Tb_Mon_Task37_File where [FileName] not like '% HAYMAN0\%' or [FileName] is null

			--Trim the returned data down to just the username
			select top 1 @StrUser = [FileName] from #Tb_Mon_Task37_File

			--set @StrUser = right(@StrUser,len(@StrUser) - charindex(' ',@StrUser ))
			--set @StrUser = left(@StrUser,charindex(' ',@StrUser )-1)
			--set @StrUser = right(@StrUser,len(@StrUser) - charindex('\',@StrUser ))
			SET @StrUser = SUBSTRING(@StrUser,charindex('hayman0\',@StrUser)+8,len(@StrUser))
			SET @StrUser = lower(left(@StrUser,charindex(' ',@StrUser)-1))

			--Build the destination file name
			set @StrDestination = @StrType + '_' + @StrItemID + '_' + @StrDate + '_' + @StrUser 

			--See the the destination file exists
			delete from [#Tb_Mon_Task37_File]
			SET @ShellCmd = CONCAT('DIR "',@StrDestinationPath,@StrDestination,'.',@StrSuffix, '" /B')
			EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
				INSERT INTO #Tb_Mon_Task37_File EXECUTE xp_cmdshell @ShellCmd
			REVERT;

			--This will add a number suffix to the file if it did already exists to ensure we have unique files
			SET @LngCounter = 0
			IF (SELECT TOP 1 UPPER([FileName]) FROM [#Tb_Mon_Task37_File]) = 'FILE NOT FOUND' 
			BEGIN
				set @StrDestination = @StrDestination + '.' + @StrSuffix 
			END
			ELSE
			BEGIN
				WHILE ((SELECT TOP 1 UPPER([FileName]) FROM [#Tb_Mon_Task37_File]) <> 'FILE NOT FOUND')
				BEGIN
					DELETE FROM [#Tb_Mon_Task37_File]
					SET @LngCounter = @LngCounter + 1
					SET @ShellCmd = CONCAT('DIR "',@StrDestinationPath,@StrDestination,'_',RIGHT('00' + CONVERT(VARCHAR(2),@LngCounter),2),'.',@StrSuffix, '" /B')
					EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
						INSERT INTO [#Tb_Mon_Task37_File] EXECUTE xp_cmdshell @ShellCmd
					REVERT;
				END
				SET @StrDestination = @StrDestination + '_' + RIGHT('00' + CONVERT(VARCHAR(2),@lngCounter),2) + '.' + @StrSuffix
			END

			--Move the file (was previously copy but move retains the file creator)
			SET @ShellCmd = CONCAT('MOVE "',@StrSourcePath,@StrSource,'" "',@StrDestinationPath,@StrDestination,'"')
			EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
				EXECUTE xp_cmdshell @ShellCmd
			REVERT;
	
			--Calculate the type to be entered into supply chain
			if @StrType IN ('CA','CN','DN','IN','PI','PN','SA')
				set @StrType2 = 'SO'
			ELSE
				if @StrType = 'WO'
					set @StrType2 = 'WO'
				ELSE
					set @StrType2 = 'PO'

			--Build the description to be shown in Supply Chain
			SET @LngCounter = 1
			SET @StrName = @StrDate + '_' + @StrTime + '_' + @StrUser 
			IF (SELECT COUNT([FLO_SUB]) FROM [ASC_LIVE].[dbo].[ASC_FLO_TBL] WHERE [FLO_KEY_TYPE] = @StrType2 AND [FLO_FILE_REF] = @StrIDFull AND [FLO_CATEGORY_TYPE] = @StrType AND [FLO_DESC] = @StrName) > 0
			BEGIN
				WHILE ((SELECT COUNT([FLO_SUB]) FROM [ASC_LIVE].[dbo].[ASC_FLO_TBL] WHERE [FLO_KEY_TYPE] = @StrType2 AND [FLO_FILE_REF] = @StrIDFull AND [FLO_CATEGORY_TYPE] = @StrType AND [FLO_DESC] = @StrName + '_' + RIGHT('00' + CONVERT(VARCHAR(2),@LngCounter),2)) > 0)
				BEGIN
					SET @LngCounter = @LngCounter + 1
				END
				SET @StrName = @StrName + '_' + RIGHT('00' + CONVERT(VARCHAR(2),@LngCounter),2)
			END

			--Insert into Supply Chain
			INSERT INTO [ASC_LIVE].[dbo].[ASC_FLO_TBL] ([FLO_KEY_TYPE],[FLO_FILE_REF],[FLO_CATEGORY_TYPE],[FLO_SUB],[FLO_FILE_PATH],[FLO_DESC])
			VALUES
			(@StrType2,@StrIDFull,@StrType,
			(SELECT ISNULL(MAX([FLO_SUB]) + 1,0) FROM  [ASC_LIVE].[dbo].[ASC_FLO_TBL] WHERE [FLO_KEY_TYPE] = @StrType2 AND [FLO_FILE_REF] = @StrIDFull AND [FLO_CATEGORY_TYPE] = @StrType),
			@StrDestinationPath + @StrDestination, @StrName 
			)
			
		END
		ELSE
		BEGIN
			--P1 and P2 are types generated by Supply Chain but the VBS needs to do work to make them useable
			--This means they are unknown types from a processing point of view but are known types, so we dont talk about them
			IF (@StrType <> 'P1') AND (@StrType <> 'P2')
			BEGIN
				set @LogMsg = 'Skipping unknown type ' + @StrType
				EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
			END
		END
	END
	ELSE
	BEGIN
		--There is an issue in Supply Chain whereby it doesnt convert variables into their name for the file so DN_#9_#YYYY#MM#DD comes out as just that
		--instead of DN_0000123456_20221130 (for example). If this occurs it renames the files and the VBS corrects the issue so the can be imported still
		set @LogMsg = 'Renaming file with DN_# in (' + @StrSource + ')'
		EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

		SET @StrDestinationPath = @StrDestinationPathRoot +	'System\Inbox\'

		SET @StrDestination = 'D#__'
		SET @LngCounter = 0

		DELETE FROM [#Tb_Mon_Task37_File]
		SET @ShellCmd = CONCAT('DIR "',@StrDestinationPath,@StrDestination,RIGHT('000' + CONVERT(VARCHAR(3),@LngCounter),3),'.',@StrSuffix, '" /B')
		EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
			INSERT INTO #Tb_Mon_Task37_File EXECUTE xp_cmdshell @ShellCmd
		REVERT;

		IF (SELECT TOP 1 UPPER([FileName]) FROM [#Tb_Mon_Task37_File]) = 'FILE NOT FOUND' 
		BEGIN
			set @StrDestination = @StrDestination + RIGHT('000' + CONVERT(VARCHAR(3),@LngCounter),3) + '.' + @StrSuffix 
		END
		ELSE
		BEGIN
			WHILE ((SELECT TOP 1 UPPER([FileName]) FROM [#Tb_Mon_Task37_File]) <> 'FILE NOT FOUND')
			BEGIN
				DELETE FROM [#Tb_Mon_Task37_File]
				SET @LngCounter = @LngCounter + 1
				SET @ShellCmd = CONCAT('DIR "',@StrDestinationPath,@StrDestination,RIGHT('000' + CONVERT(VARCHAR(3),@LngCounter),3),'.',@StrSuffix, '" /B')
				EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
					INSERT INTO [#Tb_Mon_Task37_File] EXECUTE xp_cmdshell @ShellCmd
				REVERT;
			END
			SET @StrDestination = @StrDestination + RIGHT('000' + CONVERT(VARCHAR(3),@lngCounter),3) + '.' + @StrSuffix
		END

		SET @ShellCmd = CONCAT('MOVE "',@StrSourcePath,@StrSource,'" "',@StrDestinationPath,@StrDestination,'"')
		EXECUTE AS login = 'HAYMAN0\SQLNetworkAccess' 
			EXECUTE xp_cmdshell @ShellCmd
		REVERT;

	END

	--Delete the itme to start processing the next one
	delete from [#Tb_Mon_Task37_Files] where [ID] = @LngID

END

drop table #Tb_Mon_Task37_File
drop table #Tb_Mon_Task37_Files 

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task39]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Mon_Task39]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

Exec ASC_LIVE.dbo.UDEF_UPDATE_SALES_SUMMARY_TBL_HISTORICAL;
Exec ASC_LIVE.dbo.UDEF_UPDATE_SALES_SUMMARY_TBL_HISTORICAL_GE;

--use asc_live
--GRANT SELECT ON [ASC_LIVE].[dbo].[UDEF_SALES_SUMMARY_TBL_HISTORICAL] TO [ASC_SUPPLYCHAIN_R];
--GRANT SELECT ON [ASC_LIVE].[dbo].[UDEF_SALES_SUMMARY_TBL_HISTORICAL_GE] TO [ASC_SUPPLYCHAIN_R];
--These commands were placed into the executed stored procedures instead so the database context would be correct

INSERT INTO [Tb_Mon_Emails] ([LnkRunID],[Profile],[To],[Subject],[Body],[ReadyToSend])	VALUES (@RunID,'Supply Chain','','Sales Summary update','<p>The sales summary tables update has completed successfully.</p>',0);


GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task40]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Mon_Task40]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

declare @Files			table ([ID] int IDENTITY, [FileName] varchar(200))
declare @Files2			table ([ID] int IDENTITY, [FileName] varchar(200))
declare @Files3			table ([ID] int IDENTITY, [FileName] varchar(200), [Age] INT)
declare @FileID			int
declare @FileName		varchar(100)
declare @ShellCmd		varchar(1000)
declare @Source			varchar(500)	= 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup'
declare @Instance		varchar(100)	= 'SQL01'
declare @Destination	varchar(500)	= '\\storage02\Backup\SQL\'
declare @UserID			int
declare @Count			int
declare @DteStart		datetime
declare @Retention		int
DECLARE @LogMsg			VARCHAR(500)
DECLARE @RunInfo		VARCHAR(5000)

SET @UserID = (SELECT [ID] FROM [Tb_Users] WHERE [ADUsername] = SUSER_NAME())
SET @DteStart = (SELECT SYSDATETIME())

--How many days to keep backups for
set @Retention = 14

--Talk
set @LogMsg = 'Moving SQL backup file(s) from SQL server to offsite storage'
EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

--Collect a list of files in the Pre-Import folder
execute AS login = 'HAYMAN0\SQLNetworkAccess' 
Set @ShellCmd = CONCAT('dir "',@Source,'" /b')
insert into @Files execute xp_cmdshell @ShellCmd
REVERT

--Delete rows we do not need
delete from @Files where [FileName] is null or UPPER([FileName]) = 'FILE NOT FOUND'

--Count how many files there are to process
set @Count = (SELECT COUNT([ID]) FROM @Files)

--Assume all is ok
SET @RunInfo = ''

IF @Count = 0 
BEGIN
	--Talk
	set @LogMsg = 'There are no files to move, there should be files generated by the backups every night, if this wasn''t a test then it will need investigating'
	
	SET	@RunInfo = @LogMsg

END
ELSE
BEGIN 
	--Talk
	IF @Count = 1
		set @LogMsg = CONVERT(VARCHAR(10),@Count) + ' File to move';
	ELSE
		set @LogMsg = CONVERT(VARCHAR(10),@Count) + ' Files to move';
	
END

EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg


--Now loop through and move them all, this will take some time and this one logs to the log table
WHILE (SELECT COUNT([ID]) from @Files) > 0
BEGIN
	
	--Get an item to process
	set @FileID = (SELECT MIN([ID]) from @Files)
	set @FileName = (SELECT [FileName] from @Files WHERE [ID] = @FileID)
	
	--Prep to copy it across
	set @ShellCmd = (SELECT CONCAT('xcopy "', @Source, '\', @FileName, '" "', @Destination, @Instance, '" /C /I /Q /Y'))
	
	--Talk
	set @LogMsg = RIGHT('000' + CONVERT(VARCHAR(10),@FileID),3) + ': Copying ' + @FileName
	EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

	--Copy - xp_cmdshell holds the process until it has finished copying which is good
	execute AS login = 'HAYMAN0\SQLNetworkAccess' 
	execute xp_cmdshell @ShellCmd
	
	--Check the file has made it
	Set @ShellCmd = CONCAT('dir "',@Destination + @Instance,'" /b')
	insert into @Files2 execute xp_cmdshell @ShellCmd
	REVERT
	
	--If we can see the file at the destination then delete the source
	IF (SELECT COUNT([ID]) FROM @Files2 WHERE [FileName] = @FileName) > 0 
	BEGIN 
			
		--Talk
		set @LogMsg = RIGHT('000' + CONVERT(VARCHAR(10),@FileID),3) + ': Copy complete, deleting source'
		EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

		--Delete source
		set @ShellCmd = (SELECT CONCAT('del "', @Source,'\', @FileName))
		execute AS login = 'HAYMAN0\SQLNetworkAccess' 
		execute xp_cmdshell @ShellCmd
		REVERT

	END
	ELSE
	BEGIN
		--Talk... Should probably raise this better... In fact I will
		set @LogMsg = RIGHT('000' + CONVERT(VARCHAR(10),@FileID),3) + ': Copy failed, not deleting the source'
		EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

		--Mark the error down
		IF @RunInfo <> ''
			SET @RunInfo = @RunInfo + CHAR(10) + CHAR(13)

		SET	@RunInfo = @RunInfo + 'Copying from  ' + @Source + '\' + @FileName + ' to ' + @Destination + @Instance + ' failed'
	END
	

	DELETE FROM @Files WHERE [ID] = @FileID
	DELETE FROM @Files2

END

If @RunInfo <> ''
BEGIN
	set @LogMsg = 'There were errors during the copy process, these will be escalated and the process will not stop'
	EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
END
ELSE
BEGIN

	--Talk
	set @LogMsg = 'Deleting backup files over ' + CONVERT(VARCHAR(10),@Retention) + ' days old'
	EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

	--Now delete all files that are older than the retention duration (this was previously set at 30, changed on 20211026)
	--Collect a list of files in the destincation folder
	execute AS login = 'HAYMAN0\SQLNetworkAccess' 
	Set @ShellCmd = CONCAT('dir "',@Destination + @Instance)
	insert into @Files execute xp_cmdshell @ShellCmd
	REVERT

	--ignore files that are not .BAK files
	delete from @Files where UPPER(right(rtrim([FileName]),4)) <> '.BAK' or [FileName] IS NULL
	
	--Calculate ages of files
	insert into @Files3 ([FileName],[Age]) SELECT REVERSE(LEFT(REVERSE([FileName]),CHARINDEX(' ' ,REVERSE([FileName]))-1)) AS [FileName], DATEDIFF(d, DATEFROMPARTS(SUBSTRING([FileName],7,4), SUBSTRING([FileName],4,2), LEFT([FileName],2)),SYSDATETIME()) AS [Age] FROM @Files
	
	--Talk
	set @LogMsg = CONCAT((SELECT COUNT([Age]) FROM @Files3),' File(s), ',(SELECT COUNT([Age]) FROM @Files3 WHERE [Age] > @Retention), ' are to be deleted')
	EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

	WHILE (SELECT COUNT([Age]) FROM @Files3 WHERE [Age] > @Retention) > 0
	BEGIN
	
		--Get a Row
		set @FileID = (SELECT MIN([ID]) from @Files3 WHERE [Age] > @Retention)
		set @FileName = (SELECT [FileName] from @Files3 WHERE [ID] = @FileID)
		
		--Prep to delete
		set @ShellCmd = (SELECT CONCAT('del "', @Destination, @Instance, '\', @FileName, '" /F'))

		--Talk
		set @LogMsg = CONCAT('Deleting ',@FileName)
		EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

		--Delete
		execute AS login = 'HAYMAN0\SQLNetworkAccess' 
		execute xp_cmdshell @ShellCmd
		REVERT

		--Check the file has gone
		Set @ShellCmd = CONCAT('dir "',@Destination, @Instance,'\',@FileName, '" /b')
		insert into @Files2 execute xp_cmdshell @ShellCmd
		REVERT

		IF (SELECT COUNT([ID]) FROM @Files2 WHERE [FileName] = @FileName) > 0 
		BEGIN 
			--Talk
			set @LogMsg = 'Deletion of old file backup failed'
			EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

			--Mark the error down
			IF @RunInfo <> ''
				SET @RunInfo = @RunInfo + CHAR(10) + CHAR(13);

			SET	@RunInfo = @RunInfo + 'Deletion of old backup file ' + @Destination + @Instance + '\' + @FileName + ' failed'
		END


		--Delete the row we just processed
		DELETE FROM @Files3 WHERE [ID] = @FileID

	END
END

IF @RunInfo <> '' 
BEGIN
	set @RunInfo = 'There were errors while copying the SQL backups to the offste storage location. Below are the following errors that were recorded.' + CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + @RunInfo
	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('HICS','','SQL backup shipping', @RunInfo,0,@RunID);
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task41]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task41]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @EmailBody	VARCHAR(MAX)
DECLARE @EmailID	INT

drop table if exists #Tb_Mon_Task41

CREATE TABLE #Tb_Mon_Task41
(
[ID]					INT NOT NULL,
[ARC]					VARCHAR(20) NOT NULL,
[OrderNo]				INT NOT NULL,
[DespatchDate]			DATETIME NOT NULL,
[DespatchDate_T]		VARCHAR(30) NOT NULL,
[DespatchNo]			DECIMAL(10,0) NOT NULL);

INSERT INTO #Tb_Mon_Task41
SELECT DISTINCT
	T1.[ID],
	T1.[ARC],
	CONVERT(INT,TBI.[OrderRef]) AS [OrderNo],
	T1.[DespatchDate],
	''							AS [DespatchDate_T],
	T1.[DespatchNo]
FROM
	(SELECT
		D.[ID],
		D.[Number]							AS [DespatchNo],
		D.[UpdatedOn]						AS [DespatchDate],
		LTRIM(RTRIM(UPPER(D.[PalletType]))) AS [ARC],
		(SELECT COUNT([ID]) FROM [vw_ASC_LIVE_Despatches] WHERE LTRIM(RTRIM(UPPER([PalletType]))) = LTRIM(RTRIM(UPPER(D.[PalletType])))) AS [Count]
	FROM
					[vw_ASC_LIVE_Despatches] D 
	WHERE
		D.[PalletType] <> ''
	AND D.[UpdatedOn] >= (SELECT ISNULL(MAX([Start]),0) FROM [Tb_Mon_Runs] WHERE [TaskID] = @TaskID AND [status] = 2)) T1
LEFT OUTER JOIN [vw_ASC_LIVE_ToBeInvoiced] TBI ON T1.[DespatchNo] = TBI.[DesptachNum]
WHERE
	T1.[Count] > 1

	-- update the lot updated test to be easier to read
UPDATE 
	#Tb_Mon_Task41 
SET 
	[DespatchDate_T] =	RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,[DespatchDate])),2) + '/' + FORMAT([DespatchDate], 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,[DespatchDate])) + ' ' +
						RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,[DespatchDate])),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,[DespatchDate])),2) 


IF (SELECT COUNT([ID]) FROM [#Tb_Mon_Task41]) > 0
BEGIN
	SET @EMailBody = '<p>A duplicate ARC number has been discovered in Supply Chain. ARC numbers should always be unique. Please review the below orders and correct as required <b><u>BEFORE</u></b> the order leaves the site.</p>' + 
					'<p><table>' +  
					'<tr><th>ARC</th><th>OrderNo</th><th>DespatchDate</th><th>DespatchNo</th></tr>' +  
					CAST((SELECT
							[ARC] 				AS [td],'',
							[OrderNo]			AS [td],'',
							[DespatchDate_T]	AS [td],'',
							[DespatchNo]		AS [td],''
						FROM 
							[#Tb_Mon_Task41] 
						ORDER BY
							[ARC],
							[OrderNo] DESC
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>' 

	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','','','Duplicate ARC number detected', @EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
		
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT DISTINCT @EmailID,@TaskID,@RunID,[ARC] + ': ' + CONVERT(VARCHAR(10),[DespatchNo])  FROM #Tb_Mon_Task41
			
END;

DROP TABLE #Tb_Mon_Task41

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task42]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_Mon_Task42]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

drop table if exists #Tb_Mon_Task42
drop table if exists #Tb_Mon_Task42_Q

CREATE TABLE #Tb_Mon_Task42
(
[Warehouse]			VARCHAR(5) NOT NULL,
[Direction]			VARCHAR(9) NOT NULL,
[LotID]				INT NOT NULL,
[LotUpdated]		DATETIME NOT NULL,
[LotUpdated_T]		VARCHAR(20) NULL,
[Lot]				VARCHAR(30) NOT NULL,
[Part]				VARCHAR(16) NOT NULL,
[PartDescription]	VARCHAR(255) NOT NULL,
[Quantity]			DECIMAL(15,5) NOT NULL,
[BatchRef]			VARCHAR(40) NOT NULL,
[LotDescription]	VARCHAR(30) NOT NULL);

CREATE TABLE #Tb_Mon_Task42_Q
(
[Warehouse]			VARCHAR(5) NOT NULL,
[Description]		VARCHAR(255) NOT NULL,
[Monitored]			VARCHAR(3) NOT NULL);

--Get all the quarantine warehouses
INSERT INTO #Tb_Mon_Task42_Q
SELECT 
	LTRIM(RTRIM([SystemCode]))					AS [Warehouse],
	LTRIM(RTRIM(LEFT([SystemDescription],40)))	AS [Description],
	'No'										AS [Monitored]
FROM 
	[vw_ASC_LIVE_SystemCodes] 
where 
	[TypeCode] = 'W' 
AND [EUMemberState] = 'Y'

--Mark which ones we monitor
UPDATE #Tb_Mon_Task42_Q SET [Monitored] = 'Yes' WHERE [Warehouse] IN ('WQ')

--Collect all lots that are newly in or still in a monitored quarantine warehouse and also make a note where a lot is no longer in a monitored quarantine warehouse 
--NOTE: We may not have information on that that leave a monitored quarantine warehouse (the lot may have left the system)
INSERT INTO #Tb_Mon_Task42
SELECT
	L.[Warehouse],
	CASE (select COUNT([Ref01]) from [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID AND CONVERT(INT,[Ref02]) = L.[Number])
	--CASE (select COUNT([Ref01]) from [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID AND CONVERT(INT,[Ref01]) = L.[ID])
	--CASE (select COUNT([Ref]) from [Tb_Mon_Email_Items] WHERE [LnkRunID] = (SELECT MAX([LnkRunID]) FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID) AND [Ref] = CONVERT(VARCHAR(25),L.[Number]))
		WHEN 0 THEN 'In'
		ELSE 'No change'
	END					AS [Direction],
	L.[ID]				AS [LotID],
	L.[UpdatedOn]		AS [LotUpdated],
	''					AS [LotUpdated_T],
	L.[Number]			AS [Lot],
	ISNULL(L.[Part],'')	AS [Part],
	P.[Description1] + case ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END AS [PartDescription],
	L.[Quantity]		AS [Quantity],
	L.[SerialNo]		AS [BatchRef],
	L.[Description]		AS [LotDescription]
FROM
				[vw_ASC_LIVE_Lots]	L
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]	P ON L.[Part] = P.[Part]
WHERE
	LTRIM(RTRIM(L.[Warehouse]))	IN (SELECT [Warehouse] FROM [#Tb_Mon_Task42_Q] where [Monitored] = 'Yes')
UNION ALL
SELECT DISTINCT
	ISNULL(L.[Warehouse],'')		AS [Warehouse],
	'Out'							AS [Direction],
	CONVERT(INT,MC.[Ref01])			AS [LotID],
	ISNULL(L.[UpdatedOn],0)			AS [LotUpdated],
	''								AS [LotUpdated_T],
	CONVERT(INT,MC.[Ref02])			AS [Lot],
	ISNULL(L.[Part],'')				AS [Part],
	ISNULL(P.[Description1],'') + CASE ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END AS [PartDescription],
	ISNULL(L.[Quantity],0)			AS [Quantity],
	ISNULL(L.[SerialNo],'')			AS [BatchRef],
	ISNULL(L.[Description],'')		AS [LotDescription]
FROM 
				[Tb_Mon_Comparisons]		MC
--LEFT OUTER JOIN [vw_ASC_LIVE_Lots]			L	ON L.[ID] = CONVERT(INT,MC.[Ref01])
LEFT OUTER JOIN [vw_ASC_LIVE_Lots]			L	ON L.[Number] = CONVERT(INT,MC.[Ref02])
LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]			P	ON L.[Part] = P.[Part]
WHERE 
	MC.[LnkTaskID] = @TaskID
AND CONVERT(INT,MC.[Ref01]) NOT IN (SELECT L.[ID] FROM [vw_ASC_LIVE_Lots] L WHERE LTRIM(RTRIM(L.[Warehouse])) IN (SELECT [Warehouse] FROM [#Tb_Mon_Task42_Q] where [Monitored] = 'Yes'))

/*
So listen, doing it by ID is the right thing to do, however, when an item leaves lots and goes into lot history it loses the ID.
*/


--Try and get information from lot history in case the lot has gone
UPDATE 
	#Tb_Mon_Task42 
SET 
	[Warehouse] = ISNULL(LH.[Warehouse],''),
	[LotUpdated] = ISNULL(LH.[Date],0),
	[Part] = ISNULL(LH.[Part],''),
	[PartDescription] = ISNULL(P.[Description1],'') + CASE ISNULL(P.[Description2],'') WHEN '' THEN '' ELSE ' ' + P.[Description2] END,
	[Quantity] = ISNULL(LH.[Quantity],0),
	[BatchRef] = ISNULL(LH.[SerialNo],''),
	[LotDescription] = ISNULL(LH.[Description],'')
FROM
	#Tb_Mon_Task42 T1
	LEFT OUTER JOIN [vw_ASC_LIVE_LotHistory]	LH	ON LH.[LotNo] = T1.[Lot]
	LEFT OUTER JOIN [vw_ASC_LIVE_Parts]			P	ON P.[Part] = LH.[Part]
WHERE 
	T1.[Part] = ''


-- update the lot updated time to be easier to read
UPDATE 
	#Tb_Mon_Task42 
SET 
	[LotUpdated_T] =	RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,[LotUpdated])),2) + '/' + FORMAT([LotUpdated], 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,[LotUpdated])) + ' ' +
						RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,[LotUpdated])),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,[LotUpdated])),2) 
WHERE 
	[LotUpdated] <> 0

--Look for items that have left and talk if there were any 
If (SELECT COUNT([LotID]) FROM [#Tb_Mon_Task42] WHERE [Direction] <> 'No change') > 0
BEGIN
	
	DECLARE @EMailBody	NVARCHAR(MAX)
	DECLARE @EmailID	INT
	DECLARE @Dte		DATETIME
	DECLARE @CheckDate	VARCHAR(12)
	DECLARE @CheckTime	VARCHAR(6)
	DECLARE @ChangeDate	VARCHAR(12)
	DECLARE @ChangeTime	VARCHAR(6)
	DECLARE @NoChange	INT

	--Get the date the process last run (it can run many times but if there are no differences then nothing is reported)
	SET @Dte = (SELECT [Start] from [Tb_Mon_Runs] WHERE [ID] = (SELECT MAX([ID]) FROM [Tb_Mon_Runs] WHERE [TaskID] = @TaskID AND [ID] < @RunID and [Status] = 2))
	IF @Dte IS NULL
		SET @Dte = sysdatetime()

	SET @CheckDate = RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,@Dte)),2) + '/' + FORMAT(@Dte, 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,@Dte))
	SET @CheckTime = RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,@Dte)),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,@Dte)),2)

	
	--Get the date the process last reported a change
	SET @Dte = (SELECT [Start] from [Tb_Mon_Runs] WHERE [ID] = (SELECT MAX([LnkRunID]) FROM [Tb_Mon_Email_Items] WHERE [LnkTaskID] = @TaskID))
	IF @Dte IS NULL
		SET @Dte = sysdatetime()

	SET @ChangeDate = RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,@Dte)),2) + '/' + FORMAT(@Dte, 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,@Dte))
	SET @ChangeTime = RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,@Dte)),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,@Dte)),2)

	--Build email body text
	set @EMailBody =	'<p>Please find below a list of lots that have entered or left the monitored quarantined warehouses. This is a comparison of the location of lots in Supply Chain between now and the previous time this report was run.</p>' 

	IF (@CheckDate = @ChangeDate) AND (@CheckTime = @ChangeTime)
	BEGIN
		set @EMailBody = @EMailBody + '<p>This report was run on ' + @CheckDate + ' at ' + @CheckTime + ' and the below changes have been seen since then.</p>' 
	END
	ELSE					
	BEGIN
		set @EMailBody = @EMailBody + '<p>This report was run on ' + @CheckDate + ' at ' + @CheckTime + ' and the below changes have occured since the last noted changes on ' + @ChangeDate + ' at ' + @ChangeTime + '.</p>' 
	END
						
	set @EMailBody = @EMailBody + '<p><table>' +  
	'<tr><th>Direction</th><th>Warehouse</th><th>Lot Updated</th><th>Lot No.</th><th>Part</th><th>Part Description</th><th>Quantity</th><th>Batch</th><th>Lot Description</th></tr>' +  
	CAST((SELECT 
			[Direction]							AS [td],'',
			[Warehouse]							AS [td],'',
			[LotUpdated_T]						AS [td],'',
			[Lot]								AS [td],'',
			[Part]								AS [td],'',
			[PartDescription]					AS [td],'',
			[Quantity]							AS [td],'',
			[BatchRef]							AS [td],'',
			[LotDescription]					AS [td],''
		FROM 
			[#Tb_Mon_Task42]
		WHERE 
			[Direction] <> 'No change'
		ORDER BY
			[Warehouse],[Direction], [LotUpdated] DESC
		FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
	'</table></p>' +
	'<p>The warehouse shows the non-quarantine warehouse that the lot left quarantine and went to.</p>'
					
	SET @NoChange = (SELECT COUNT(*) FROM [#Tb_Mon_Task42] WHERE [Direction] = 'No change')
	IF @NoChange = 0
	BEGIN
		set @EMailBody = @EMailBody + '<p>There were no lots in a monitored quarantined warehouse previously.</p>' 
	END
	ELSE					
	BEGIN
		IF @NoChange = 1
		BEGIN
			set @EMailBody = @EMailBody + '<p>There is 1 lot that has remained in a monitored quarantined warehouse since this report was last sent.</p>' 
		END
		ELSE					
		BEGIN
			set @EMailBody = @EMailBody + '<p>There are ' + CONVERT(VARCHAR(50),@NoChange) + ' lots that have remained in a monitored quarantined warehouse since this report was last sent.</p>' 
		END
	END
						
	set @EMailBody = @EMailBody + '<p>The below table shows all quarantine warehouses in Supply Chain that this report is monitoring.</p>'
	set @EMailBody = @EMailBody + '<p><table>' +  
	'<tr><th>Warehouse</th><th>Description</th></tr>' +  
	CAST((SELECT 
			[Warehouse]							AS [td],'',
			[Description]						AS [td],''
		FROM 
			[#Tb_Mon_Task42_Q]
		WHERE
			[Monitored] = 'Yes'
		ORDER BY
			[Warehouse]
		FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
	'</table></p>'

	SET @NoChange = (SELECT COUNT(*) FROM [#Tb_Mon_Task42_Q] WHERE [Monitored] = 'No')
	IF @NoChange = 0
	BEGIN
		set @EMailBody = @EMailBody + '<p>There are no quarantined warehouses that this report is not monitoring.</p>' 
	END
	ELSE					
	BEGIN
		IF @NoChange = 1
		BEGIN
			set @EMailBody = @EMailBody + '<p>There is 1 quarantined warehouse that this report is not monitoring.</p>' 
		END
		ELSE					
		BEGIN
			set @EMailBody = @EMailBody + '<p>There are ' + CONVERT(VARCHAR(50),@NoChange) + ' quarantined warehouses that this report is not monitoring.</p>' 
		END
	END

	INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('Supply Chain','','Lot movement through monitored quarantine warehouses', @EMailBody,0,@RunID);
	
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

	--INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [Lot] FROM [#Tb_Mon_Task42] where [Direction] <> 'Out';
	INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) 
	SELECT @EmailID,@TaskID,@RunID, RIGHT('0000000000' + CONVERT(VARCHAR(10),[LotID]),10) + '|' + RIGHT('0000000000' + CONVERT(VARCHAR(10),[Lot]),10) FROM [#Tb_Mon_Task42] WHERE [Direction] <> 'No Change';

	DELETE FROM [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID
	INSERT INTO [Tb_Mon_Comparisons] ([LnkTaskID],[Ref01],[Ref02]) SELECT @TaskID AS [LnkTaskID], CONVERT(VARCHAR(10),[LotID]) AS [Ref01], CONVERT(VARCHAR(10),[Lot]) AS [Ref02] FROM [#Tb_Mon_Task42] WHERE [Direction] <> 'Out'

END;

DROP TABLE #Tb_Mon_Task42;
DROP TABLE #Tb_Mon_Task42_Q;
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task43]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_Mon_Task43]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

/*
Statuses
1 = Initial values
2 = Value change
3 = Final values (including despatch date)

Stages
1. Delete any order lines from the monitoring table if the order line no longer exists in Supply Chain
2. Insert any order lines from Supply Chain into the monitoring table that were not there already and are greater than the start date and do not have a delivered date
3. Insert initial value line into the audit table for any order line in the monitoring table that did not have an initial value entry
4. Insert amended values in the the audit table for any line items where the values have changed
5. Update the monitoring table with the new values
6. Insert final values in the the audit table for any line items that have a delivered date
7. Delete any order lines from the monitoring table that now have a delivery date
 
*/

--1. Delete any order lines from the monitoring table if the order line no longer exists in Supply Chain
DELETE FROM [Tb_SC_Order_Audit_Monitor] WHERE [OrderID] NOT IN (select [ID] from [vw_ASC_LIVE_Orders]);
DELETE FROM [Tb_SC_Order_Audit] WHERE [OrderID] NOT IN (select [ID] from [vw_ASC_LIVE_Orders]);

--2. Insert any order lines from Supply Chain into the monitoring table that were not there already and are greater than the start date and do not have a delivered date
INSERT INTO [Tb_SC_Order_Audit_Monitor] 
([OrderID],[QuantityOrdered],[DeliveryDate],[ReqdDespatchDate]) 
SELECT
	O.[ID],
	O.[QuantityOrdered],
	O.[CustomerDue],
	O.[ExpectedDueDate]
FROM	
	[vw_ASC_LIVE_Orders]		O
WHERE
O.[Status] <> 'C'
AND O.[ID] NOT IN (SELECT [OrderID] FROM [Tb_SC_Order_Audit_Monitor])
AND O.[OrderRef] NOT IN (SELECT [OrderRef] FROM [vw_ASC_LIVE_ToBeInvoiced] WHERE [OrderRef] = O.[OrderRef] AND [Part] = O.[Part])
AND O.[QuantityOrdered] > 0

--3. Insert initial value line into the audit table for any order line in the monitoring table that did not have an initial value entry
INSERT INTO [Tb_SC_Order_Audit] 
([Type],[OrderID],[QuantityOrdered],[DeliveryDate],[ReqdDespatchDate]) 
SELECT
	1,
	[OrderID],
	[QuantityOrdered],
	[DeliveryDate],
	[ReqdDespatchDate]
FROM	
	[Tb_SC_Order_Audit_Monitor]
WHERE
	[OrderID] NOT IN (SELECT [OrderID] FROM [Tb_SC_Order_Audit])

--4. Insert amended values in the the audit table for any line items where the values have changed

--Create a table to compare
drop table if exists #Tb_Mon_Task43

CREATE TABLE #Tb_Mon_Task43
(
[ID]					INT NOT NULL,
[OrderID]				INT NOT NULL,
[QuantityOrdered_Was]	DECIMAL(15,5) NULL,
[QuantityOrdered_Is]	DECIMAL(15,5) NULL,
[DeliveryDate_Was]		DATETIME NULL,
[DeliveryDate_Is]		DATETIME NULL,
[ReqdDespatchDate_Was]	DATETIME NULL,
[ReqdDespatchDate_Is]	DATETIME NULL,
[Delivered_Was]			DATETIME NULL,
[Delivered_Is]			DATETIME NULL);

--Collect the was data
INSERT INTO #Tb_Mon_Task43 ([ID],[OrderID],[QuantityOrdered_Was],[DeliveryDate_Was],[ReqdDespatchDate_Was],[Delivered_Was])
SELECT 
	[ID],
	[OrderID],
	[QuantityOrdered]	AS [QuantityOrdered_Was],
	[DeliveryDate]		AS [DeliveryDate_Was],
	[ReqdDespatchDate]	AS [ReqdDespatchDate_Was],
	[Delivered]			AS [Delivered_Was]
FROM 
	[Tb_SC_Order_Audit_Monitor]


--Add the is data
UPDATE 
	#Tb_Mon_Task43
SET 
	[QuantityOrdered_Is]	= O.[QuantityOrdered],
	[DeliveryDate_Is]		= O.[CustomerDue],
	[ReqdDespatchDate_Is]	= O.[ExpectedDueDate],
	--[Delivered_Is]			= (SELECT MAX([DeliveryDate]) FROM [vw_ASC_LIVE_ToBeInvoiced] WHERE [CreatedOn] >= @StartDate AND [OrderRef] = O.[OrderRef] AND [Part] = O.[Part]) 
	[Delivered_Is]			= (SELECT MIN([DeliveryDate]) FROM [vw_ASC_LIVE_ToBeInvoiced] WHERE [OrderRef] = O.[OrderRef] AND [Part] = O.[Part]) 
FROM
				[#Tb_Mon_Task43]		T1
LEFT OUTER JOIN [vw_ASC_LIVE_Orders]	O	ON O.[ID]	= T1.[OrderID]

--select * from #Tb_Mon_Task43

--Delete those that have not had a change
DELETE FROM 
	#Tb_Mon_Task43 
WHERE 
	ISNULL([QuantityOrdered_Was],0)		= ISNULL([QuantityOrdered_Is],0)
AND ISNULL([DeliveryDate_Was],'')		= ISNULL([DeliveryDate_Is],'')
AND ISNULL([ReqdDespatchDate_Was],'')	= ISNULL([ReqdDespatchDate_Is],'')
AND ISNULL([Delivered_Was],'')			= ISNULL([Delivered_Is],'')			

--select * from #Tb_Mon_Task43

IF (SELECT COUNT([ID]) FROM #Tb_Mon_Task43) > 0 
BEGIN


	--4. Insert amended values in the the audit table for any line items where the values have changed
	INSERT INTO 
		[Tb_SC_Order_Audit] 
		([Type],[OrderID],[QuantityOrdered],[DeliveryDate],[ReqdDespatchDate]) 
	SELECT
		2,
		[OrderID],
		[QuantityOrdered_Is],
		[DeliveryDate_Is],
		[ReqdDespatchDate_Is]
	FROM	
		[#Tb_Mon_Task43]
	WHERE
		[Delivered_Is] IS NULL;


	--5. Update the monitoring table with the new values
	UPDATE 
		[Tb_SC_Order_Audit_Monitor]
	SET 
		[QuantityOrdered]		= T43.[QuantityOrdered_Is],
		[DeliveryDate]			= T43.[DeliveryDate_Is],
		[ReqdDespatchDate]		= T43.[ReqdDespatchDate_Is],
		[Delivered]				= T43.[Delivered_Is]
	FROM
				[Tb_SC_Order_Audit_Monitor]	T1
	INNER JOIN	[#Tb_Mon_Task43]			T43	ON T43.[OrderID]	= T1.[OrderID]


	--6. Insert final values in the the audit table for any line items that have a delivered date
	INSERT INTO 
		[Tb_SC_Order_Audit] 
		([Type],[OrderID],[QuantityOrdered],[DeliveryDate],[ReqdDespatchDate],[Delivered]) 
	SELECT
		3,
		[OrderID],
		[QuantityOrdered_Is],
		[DeliveryDate_Is],
		[ReqdDespatchDate_Is],
		[Delivered_Is]
	FROM	
		[#Tb_Mon_Task43]
	WHERE
		NOT [Delivered_Is] IS NULL;

	--7. Delete any order lines from the monitoring table that now have a delivery date
	DELETE FROM [Tb_SC_Order_Audit_Monitor] WHERE NOT [Delivered] IS NULL

END;

DROP TABLE #Tb_Mon_Task43;
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task44]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task44]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

drop table if exists #Tb_Mon_Task44

CREATE TABLE #Tb_Mon_Task44
(
[SRID]				INT NOT NULL,
[SROwner]			INT NOT NULL,
[MATStatus]			INT NOT NULL,
[MATApprovedDTS]	DATETIME NOT NULL,
[MATApprover]		NVARCHAR(50) NOT NULL,
[MATApproverID]		INT NOT NULL,
[Processed]			BIT NOT NULL);

--Get all items that are in testing in SR and failed/passed in Matrix
INSERT INTO #Tb_Mon_Task44
SELECT 
	SR.[ID]				AS [SRID],
	SR.[CreatedByID]	AS [SROwner],
	CASE 
		WHEN S.[SampleText6] = 'Validated' THEN 1
		WHEN LEFT(S.[SampleText6],8) = 'Reject -' THEN 2
		ELSE 3
	END					AS [MATStatus],
	DATEADD(MINUTE, [ApprovalTime], CONVERT(DATETIME,RIGHT([ApprovalDate],2) + '/' + datename(MONTH,dateadd(MONTH,CONVERT(INT,SUBSTRING(CONVERT(VARCHAR(8),[ApprovalDate]),5,2))-1,0)) + '/' + LEFT([ApprovalDate],4))) AS [MATApprovedDTS],
	S.[ApprovalUser]	AS [MATApprover],
	0					AS [MATApproverID],
	0					AS [Processed]
FROM 
				[vw_HICS_Rep_SR]	SR
LEFT OUTER JOIN	[vw_MAT_Samples]	S	ON CONVERT(NVARCHAR(255),SR.[ID]) = S.[SampleText1] 
WHERE
	SR.[Status] IN ('To be tested','In testing')
AND S.[AuditFlag] = 0					--Current record
AND S.[SampleStatus] = 60				--Finished
AND ISNULL(S.[SampleText6] ,'') <> ''	--Output to review

--AND ISNULL(S.[SampleNum3],0) <> 1		--Not rejected

--Look for items and talk if there were any 
IF (SELECT COUNT(*) FROM [#Tb_Mon_Task44]) > 0
BEGIN
	
	DECLARE @EMailBody	NVARCHAR(MAX)
	DECLARE @EmailID	INT
	DECLARE @SROwner	INT
	DECLARE @Count		INT 

	--passed messages
	WHILE (SELECT COUNT(*) FROM [#Tb_Mon_Task44] WHERE [Processed] = 0 AND [MATStatus] = 1) > 0
	BEGIN
	
		SET @SROwner = (SELECT MIN([SROwner]) FROM [#Tb_Mon_Task44] WHERE [Processed] = 0 AND [MATStatus] = 1)

		--Ensure there is an entry in TB_Users
		INSERT INTO [Tb_Users] ([ADUsername],[HideFromList],[Locked]) SELECT [MATApprover],1,1 FROM [#Tb_Mon_Task44] WHERE [MATApprover] NOT IN (SELECT [ADUsername] FROM [Tb_Users]) AND [SROwner] = @SROwner;

		--Get the user ID
		UPDATE 
			[#Tb_Mon_Task44]
		SET 
			[MATApproverID] = U.[ID]
		FROM [#Tb_Mon_Task44] AS T44  
		INNER JOIN [Tb_Users] AS U  
		ON UPPER(T44.[MATApprover]) = UPPER(U.[ADUsername])
		WHERE
			T44.[SROwner] = @SROwner
		AND T44.[MATStatus] = 1

		--Update and pass the test
		UPDATE 
			[Tb_SR_Tests]
		SET 
			[Accepted] = 1,
			[AcceptedWho] = T44.[MATApproverID],
			[Locked] = 1,
			[LockedWho] =T44.[MATApproverID],
			[AcceptedViaMatrix] = 1
		FROM [Tb_SR_Tests] AS T
		INNER JOIN [#Tb_Mon_Task44] AS T44  
		ON T44.[SRID] = t.[SR]
		WHERE
			T44.[SROwner] = @SROwner
		AND T44.[MATStatus] = 1

		SET @Count = (SELECT COUNT([SRID]) FROM [#Tb_Mon_Task44] WHERE [SROwner] = @SROwner AND [MATStatus] = 1)

		if @Count = 1
			set @EMailBody = '<p>One of your Stock Register entries has passed validation in the lab and can now be used.</p>' 
		else
			set @EMailBody = '<p>' + CONVERT(VARCHAR(5),@Count) + ' of your Stock Register entries have passed validation in the lab and can now be used.</p>' 
		
		set @EMailBody = @EMailBody + '<p><table>' +  
		'<tr><th>Serial Ref</th><th>Created</th><th>Type</th><th>Product</th><th>Source</th><th>Approved</th></tr>' +  
		CAST((SELECT 
				SR.[SerialRefFull]							AS [td],'',
				RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,SR.[CreatedOn])),2) + '/' + FORMAT(SR.[CreatedOn], 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,SR.[CreatedOn])) + ' ' +
				RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,SR.[CreatedOn])),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,SR.[CreatedOn])),2) AS [td],'',
				SR.[TypeDesc]								AS [td],'',
				SR.[Product] + ': ' + SR.[ProductDesc]		AS [td],'',
				SR.[SourceType] + ': ' + SR.[Source]		AS [td],'',
				RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,T44.[MATApprovedDTS])),2) + '/' + FORMAT(T44.[MATApprovedDTS], 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,T44.[MATApprovedDTS])) + ' ' +
				RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,T44.[MATApprovedDTS])),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,T44.[MATApprovedDTS])),2) AS [td],''
			FROM	
							[vw_HICS_Rep_SR]	AS SR
			LEFT OUTER JOIN [#Tb_Mon_Task44]	AS T44	ON T44.[SRID] = SR.[ID]
			WHERE
				T44.[SROwner] = @SROwner
			AND [MATStatus] = 1
			ORDER BY
				SR.[SerialRefFull]
			FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
		'</table></p>' 

		INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('HICS',(SELECT ISNULL([Email],'') FROM [Tb_Users] WHERE [ID] = @SROwner),'Stock Register entries available', @EMailBody,0,@RunID);
	
		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

		INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [SRID] FROM [#Tb_Mon_Task44] WHERE [SROwner] = @SROwner AND [MATStatus] = 1;

		--Update the list
		UPDATE [#Tb_Mon_Task44] SET [Processed] = 1 WHERE [SROwner] = @SROwner and [MATStatus] = 1

	END

	--failed messages
	WHILE (SELECT COUNT(*) FROM [#Tb_Mon_Task44] WHERE [Processed] = 0 AND [MATStatus] = 2) > 0
	BEGIN
	
		SET @SROwner = (SELECT MIN([SROwner]) FROM [#Tb_Mon_Task44] WHERE [Processed] = 0 AND [MATStatus] = 2)

		--Ensure there is an entry in TB_Users
		INSERT INTO [Tb_Users] ([ADUsername],[HideFromList],[Locked]) SELECT [MATApprover],1,1 FROM [#Tb_Mon_Task44] WHERE [MATApprover] NOT IN (SELECT [ADUsername] FROM [Tb_Users]) AND [SROwner] = @SROwner;

		--Get the user ID
		UPDATE 
			[#Tb_Mon_Task44]
		SET 
			[MATApproverID] = U.[ID]
		FROM [#Tb_Mon_Task44] AS T44  
		INNER JOIN [Tb_Users] AS U  
		ON UPPER(T44.[MATApprover]) = UPPER(U.[ADUsername])
		WHERE
			T44.[SROwner] = @SROwner
		AND T44.[MATStatus] = 2

		--Update and pass the test
		UPDATE 
			[Tb_SR_Tests]
		SET 
			[Accepted] = 0,
			[AcceptedWho] = T44.[MATApproverID],
			[Locked] = 1,
			[LockedWho] =T44.[MATApproverID],
			[AcceptedViaMatrix] = 1
		FROM [Tb_SR_Tests] AS T
		INNER JOIN [#Tb_Mon_Task44] AS T44  
		ON T44.[SRID] = t.[SR]
		WHERE
			T44.[SROwner] = @SROwner
		AND T44.[MATStatus] = 2

		SET @Count = (SELECT COUNT([SRID]) FROM [#Tb_Mon_Task44] WHERE [SROwner] = @SROwner AND [MATStatus] = 2)

		if @Count = 1
			set @EMailBody = '<p>One of your Stock Register entries has failed validation in the lab and needs to be reviewed.</p>' 
		else
			set @EMailBody = '<p>' + CONVERT(VARCHAR(5),@Count) + ' of your Stock Register entries have failed validation in the lab and needs to be reviewed.</p>' 
		
		set @EMailBody = @EMailBody + '<p><table>' +  
		'<tr><th>Serial Ref</th><th>Created</th><th>Type</th><th>Product</th><th>Source</th><th>Approved</th></tr>' +  
		CAST((SELECT 
				SR.[SerialRefFull]							AS [td],'',
				RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,SR.[CreatedOn])),2) + '/' + FORMAT(SR.[CreatedOn], 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,SR.[CreatedOn])) + ' ' +
				RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,SR.[CreatedOn])),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,SR.[CreatedOn])),2) AS [td],'',
				SR.[TypeDesc]								AS [td],'',
				SR.[Product] + ': ' + SR.[ProductDesc]		AS [td],'',
				SR.[SourceType] + ': ' + SR.[Source]		AS [td],'',
				RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,T44.[MATApprovedDTS])),2) + '/' + FORMAT(T44.[MATApprovedDTS], 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,T44.[MATApprovedDTS])) + ' ' +
				RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,T44.[MATApprovedDTS])),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,T44.[MATApprovedDTS])),2) AS [td],''
			FROM	
							[vw_HICS_Rep_SR]	AS SR
			LEFT OUTER JOIN [#Tb_Mon_Task44]	AS T44	ON T44.[SRID] = SR.[ID]
			WHERE
				T44.[SROwner] = @SROwner
			AND [MATStatus] = 2
			ORDER BY
				SR.[SerialRefFull]
			FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
		'</table></p>' 

		INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('HICS',(SELECT ISNULL([Email],'') FROM [Tb_Users] WHERE [ID] = @SROwner),'Stock Register test failure(s)', @EMailBody,0,@RunID);
	
		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);

		INSERT INTO [Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [SRID] FROM [#Tb_Mon_Task44] WHERE [SROwner] = @SROwner AND [MATStatus] = 2;

		--Update the list
		UPDATE [#Tb_Mon_Task44] SET [Processed] = 1 WHERE [SROwner] = @SROwner and [MATStatus] = 2

	END
	
	--New things
	WHILE (SELECT COUNT(*) FROM [#Tb_Mon_Task44] WHERE [Processed] = 0 AND [MATStatus] = 3) > 0
	BEGIN
	
		set @EMailBody = '<p>There were unexpect output from Matrix that need to be reviewed so they are captured, Please review Task 44.</p>' 
		
		INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID])	VALUES ('HICS','Support@hgcompany.co.uk','Stock Register unexpected test outcomes', @EMailBody,0,@RunID);
	
		--Update the list
		UPDATE [#Tb_Mon_Task44] SET [Processed] = 1 WHERE [MATStatus] = 3

	END

END;

DROP TABLE #Tb_Mon_Task44;

GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task45]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task45]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DROP TABLE IF EXISTS [#Tb_Mon_Task45];

CREATE TABLE [#Tb_Mon_Task45] (
	[Type]			VARCHAR(20) NULL,
	[WONo]			VARCHAR(16) NOT NULL,
	[ID]			INT	NOT NULL,
	[Part]			VARCHAR(16) NULL,
	[Qty_Was]		DECIMAL(15,5) NULL,
	[Qty_Is]		DECIMAL(15,5) NULL
);

--Get the now data
INSERT INTO [#Tb_Mon_Task45] ([Type],[WONo],[ID],[Part],[Qty_Is])
SELECT
 	''			AS [Type],
	K.[WONo],
	K.[ID]		AS [ID],
	K.[Part]	AS [Part],
	K.[Qty]		AS [Qty_Is]
FROM
				[vw_ASC_LIVE_Kit] K
LEFT OUTER JOIN	[vw_ASC_LIVE_WorksOrders] WO ON K.[WONo] = WO.[WorksOrderNo]
WHERE
	K.[Status] <> 'M'
AND	WO.[Status] <> 'C';

IF (SELECT COUNT([ID]) FROM [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID) = 0
BEGIN
	--01 = Kit ID
	--02 = WO No
	--03 = Part
	--04 = Qty
	INSERT INTO [Tb_Mon_Comparisons] ([LnkTaskID],[Ref01],[Ref02],[Ref03],[Ref04]) SELECT @TaskID AS [LnkTaskID], [ID] AS [Ref01], [WONo] AS [Ref02], [Part] AS [Ref03], [Qty_Is] AS [Ref04] FROM [#Tb_Mon_Task45]
END

--Update with known previous values
UPDATE 
	[#Tb_Mon_Task45]
SET 
	[Qty_Was] = MC.[Ref04]
FROM 
			[#Tb_Mon_Task45]		AS T45
INNER JOIN	[Tb_Mon_Comparisons]	AS MC	ON	MC.[LnkTaskID] = @TaskID
											AND	MC.[Ref01] = T45.[ID]

UPDATE [#Tb_Mon_Task45] SET [Type] = 'Change'	WHERE [Qty_Was] <> [Qty_Is] AND NOT [Qty_Was] IS NULL
UPDATE [#Tb_Mon_Task45] SET [Type] = 'Addition' WHERE [Qty_Was] IS NULL AND [WONo] IN (SELECT DISTINCT [Ref02] FROM [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID)
UPDATE [#Tb_Mon_Task45] SET [Type] = 'New'		WHERE [Type] = ''

--Insert values that may have been deleted since the last run
INSERT INTO [#Tb_Mon_Task45] ([Type],[WONo],[ID],[Part],[Qty_Was])
SELECT
 	'Removal'		AS [Type],
	MC.[Ref02]		AS [WONo],
	MC.[Ref01]		AS [ID],
	MC.[Ref03]		AS [Part],
	MC.[Ref04]		AS [Qty_Was]
FROM
	[Tb_Mon_Comparisons] MC
WHERE
	MC.[LnkTaskID] = @TaskID
AND	MC.[Ref01] NOT IN (SELECT [ID] FROM [#Tb_Mon_Task45])
AND MC.[Ref02] NOT IN (SELECT [WorksOrderNo] FROM [vw_ASC_LIVE_WorksOrders] WHERE [Status] = 'C')

--Delete those with no changes or new to the report
DELETE FROM [#Tb_Mon_Task45] WHERE [Qty_Was] = [Qty_Is] OR [Type] = 'New'

--Anything you want to chat about?
IF (SELECT COUNT(*) FROM [#Tb_Mon_Task45]) > 0
BEGIN
	
	DECLARE @EMailBody		VARCHAR(MAX)
	DECLARE @LastRun_DTE	DATETIME
	DECLARE @LastRun		VARCHAR(50)
	DECLARE @EmailID		INT

	SET @LastRun_DTE = (select ISNULL(MAX([Start]),sysdatetime()) from [Tb_Mon_Runs] WHERe [Status] = 2 AND [TaskID] = @TaskID)
	SET @LastRun = (SELECT RIGHT('00' + CONVERT(VARCHAR(2),datepart(DAY,@LastRun_DTE)),2) + '/' + FORMAT(@LastRun_DTE, 'MMM') + '/' + CONVERT(VARCHAR(4),datepart(YEAR,@LastRun_DTE)) + ' ' +
				RIGHT('00' + CONVERT(VARCHAR(2),datepart(HOUR,@LastRun_DTE)),2) + ':' + RIGHT('00' + CONVERT(VARCHAR(2),datepart(MINUTE,@LastRun_DTE)),2))

	SET @EMailBody = '<p>Below is a list of kit differences between now and the last time this report was run (' + @LastRun + '). This report looks at Works Orders that are not ' +
						'completed and will not consider a new Works Order as an addition.</p>' +
					'<p><table>' +  
					'<tr><th>Type</th><th>WO No.</th><th>Part</th><th>Qty Was</th><th>Qty Is</th></tr>' +  
					CAST((SELECT
							[Type]			AS [td],'',
							[WONo]			AS [td],'',
							[Part]			AS [td],'',
							ISNULL(CONVERT(VARCHAR(16),[Qty_Was]),'')		AS [td],'',
							ISNULL(CONVERT(VARCHAR(16),[Qty_Is]),'')		AS [td],''
						FROM 
							[#Tb_Mon_Task45] 
						ORDER BY
							[WONo],
							[Type],
							[Part]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>' 

	SET @EMailBody = @EMailBody + '<p>Below is the Works Order details for reference.</p>' +
					'<p><table>' +  
					'<tr><th>Wo No.</th><th>Making Part</th></tr>' +  
					CAST((	select 
								WO.[WorksOrderNo]												AS [td], '',
								WO.[Part] + ': ' + P.[Description1] + ' ' + P.Description2		AS [td], ''
							from 
											[vw_ASC_LIVE_WorksOrders]	WO
							LEFT OUTER JOIN	[vw_ASC_LIVE_Parts]			P	ON Wo.[Part] = P.[Part]	
							WHERE
								WO.[WorksOrderNo] in (SELECT DISTINCT [WONo] FROM [#Tb_Mon_Task45])
							ORDER BY
								WO.[WorksOrderNo]
							FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>' 


	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','','','Kit changes', @EMailBody,0,@RunID);

	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
		
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunId],[Ref]) SELECT DISTINCT @EmailID, @TaskID, @RunID, [ID] FROM #Tb_Mon_Task45
	
	DELETE FROM [Tb_Mon_Comparisons] where LnkTaskID = @TaskID
	INSERT INTO [Tb_Mon_Comparisons] ([LnkTaskID],[Ref01],[Ref02],[Ref03],[Ref04]) 
	SELECT
 		@TaskID			AS [LnkTaskID],
		K.[ID]			AS [Ref01],
		K.[WONo]		AS [Ref02],
		K.[Part]		AS [Ref03],
		K.[Qty]			AS [Ref04]
	FROM
					[vw_ASC_LIVE_Kit] K
	LEFT OUTER JOIN	[vw_ASC_LIVE_WorksOrders] WO ON K.[WONo] = WO.[WorksOrderNo]
	WHERE
		K.[Status] <> 'M'
	AND	WO.[Status] <> 'C';
	
END

DROP TABLE #Tb_Mon_Task45;
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task46]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task46]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @SupportEmail	AS	VARCHAR(23) = 'support@hgcompany.co.uk'
DECLARE @Tolerance 		AS	DECIMAL(10,5) = 1
DECLARE @UserID			INT
DECLARE @LogMsg			VARCHAR(100)

--Enabled during testing
set @LogMsg = 'Process started'
exec sp_log @LogSrc, @LogCat,@LogProc ,@LogMsg

DROP TABLE IF EXISTS [#Tb_Mon_Task46];

CREATE TABLE [#Tb_Mon_Task46] (
	[CusCode]		VARCHAR(10)		NOT NULL,
	[CusName]		NVARCHAR(40)	NOT NULL,
	[CusCL]			DECIMAL(24,2)	NOT NULL,
	[CusBal]		DECIMAL(24,2)	NOT NULL,
	[OrdNum]		DECIMAL(13,0)	NOT NULL,
	[OrdVal]		DECIMAL(24,2)	NOT NULL,
	[OthVal]		DECIMAL(24,2)	NOT NULL,
	[Available]		DECIMAL(24,2)	NOT NULL,
	[ModifiedOn]	DATETIME		NOT NULL,
	[CST]			VARCHAR(1026)	NOT NULL,
	[CSTEmail]		VARCHAR(512)	NOT NULL,
	[Processed]		BIT				NOT NULL,
	[Status]		VARCHAR(30)		NOT NULL
);

--This is used for greater logging now in place
IF (SELECT COUNT([ID]) FROM [Tb_Users] WHERE [ADUsername] = SUSER_NAME()) = 0 
	INSERT INTO [Tb_Users] ([ADUsername]) VALUES (SUSER_NAME());
	
SELECT @UserID = (SELECT TOP 1 [ID] FROM [Tb_Users] WHERE [ADUsername] = SUSER_NAME());

--Get the data
INSERT INTO [#Tb_Mon_Task46] ([CusCode],[CusName],[CusCL],[CusBal],[OrdNum],[OrdVal],[OthVal],[Available],[ModifiedOn],[CST],[CSTEmail],[Processed],[Status])
SELECT
	ISNULL(T3.[CustomerCode],'')								AS [CusCode],
	ISNULL(C1.[Name],'')										AS [CusName],
	CONVERT(DECIMAL(24,2),ROUND(ISNULL(T3.[CreditLimit],0),2))	AS [CusCL],
	CONVERT(DECIMAL(24,2),ROUND(ISNULL(T3.[Balance],0),2))		AS [CusBal],
	ISNULL(T3.[OrderNum],0)										AS [OrdNum],
	T3.[OrdVal],
	T3.[OthVal],
	CONVERT(DECIMAL(24,2),ROUND(ISNULL(T3.[Available],0),2))	AS [Available],
	ISNULL(T3.[ModifiedOn],0)									AS [ModifiedOn],
	ISNULL(T3.[CST],'')											AS [CST],
	T3.[CSTEmail],
	0															AS [Processed],
	CASE 
		WHEN ISNULL(TN.[OrderNum],0) <> 0 THEN 'Too new'
		WHEN ISNULL(C.[ID],0) = 0 THEN 
			CASE
				WHEN ISNULL(FH.[OrderNum],0) = 0 THEN  'New'
				ELSE 'New - Held'
			END
		WHEN T3.[OrdVal] > CONVERT(DECIMAL(18,5),C.[Ref02]) THEN 
			CASE ISNULL(FH.[OrderNum],0)
				WHEN 0 THEN
					CASE 
						WHEN (ABS((CONVERT(DECIMAL(18,5),C.[Ref02]) / T3.[OrdVal]) - 1) * 100) >= @Tolerance THEN  'Increased'
						ELSE 'Increased - Tolerate'
					END
				ELSE 'Increased - Held'
			END
		WHEN T3.[OrdVal] < CONVERT(DECIMAL(18,5),C.[Ref02]) THEN 'Decreased'
		ELSE ''
	END															AS [Status]
FROM
	(SELECT 
		T2.[CustomerCode],
		T2.[CreditLimit],
		T2.[Balance],
		T2.[OrderNum],
		CONVERT(DECIMAL(24,2),ROUND(ISNULL(T2.[ThisGross],0),2))	AS [OrdVal],
		CONVERT(DECIMAL(24,2),ROUND(ISNULL(T2.[OtherGross],0),2))	AS [OthVal],
		T2.[CreditLimit] - (T2.[Balance] + T2.[ThisGross] + T2.[OtherGross]) AS [Available],
		(SELECT MAX(O2.[ModifiedOn]) FROM [vw_ASC_LIVE_Orders] O2 WHERE O2.[OrderNum] = T2.[OrderNum]) AS [ModifiedOn],
		CASE ISNULL(U.[FullName],'')
			WHEN '' THEN O.[OrderEnteredBy]
			ELSE U.[FullName]
		END	AS [CST],
		CASE ISNULL(U.[Email],'')
			WHEN '' THEN @SupportEmail
			ELSE U.[Email]
		END	AS [CSTEmail]
	FROM
		(SELECT
			C1.[CustomerCode],
			CT.[CreditLimit],
			C1.[Balance],
			T1.[OrderNum],
			T1.[ThisGross],
			SUM(CASE T1.[OrderNum]	
					WHEN O.[OrderNum] THEN 0 
					ELSE ((O.[QuantityOrdered] - O.[QuantityInvoiced]) * O.[FinalPrice]) + (((O.[QuantityOrdered] - O.[QuantityInvoiced]) * O.[FinalPrice]) * (VC.[VATRate] / 100)) 
				END)  AS [OtherGross]
		FROM
			(SELECT 
				O.[OrderNum], 
				SUM(((O.[QuantityOrdered] - O.[QuantityInvoiced]) * O.[FinalPrice]) + (((O.[QuantityOrdered] - O.[QuantityInvoiced]) * O.[FinalPrice]) * (VC.[VATRate] / 100))) AS [ThisGross]
			FROM
							[vw_ASC_LIVE_Orders]		O 
			LEFT OUTER JOIN	[vw_ASC_LIVE_VAT_CONTROL]	VC ON O.[VATCode] = VC.[VATCode]
			WHERE 
				O.[Status] <> 'C'
			AND O.[OrderNum] NOT IN (select distinct [OrderNum] from [vw_ASC_LIVE_Orders] where LTRIM([OrderEnteredBy]) = '' OR LTRIM([CustomerCode]) = '')-- OR [CreatedOn] > DATEADD(MINUTE,-5,GETDATE()))
			AND O.[QuantityOrdered] * O.[FinalPrice] > 0
			AND O.[QuantityOrdered] > O.[QuantityInvoiced]
			GROUP BY
				O.[CustomerCode],
				O.[OrderNum]) T1
		LEFT OUTER JOIN	[vw_ASC_LIVE_Orders]		O  ON T1.[OrderNum] = O.[OrderNum]
		LEFT OUTER JOIN	[vw_ASC_LIVE_VAT_CONTROL]	VC ON O.[VATCode] = VC.[VATCode]
		LEFT OUTER JOIN	[vw_ASC_LIVE_Customers1]	C1	ON O.[CustomerCode] = C1.[CustomerCode]
		LEFT OUTER JOIN [vw_ASC_LIVE_CustomerTerms]	CT	ON C1.[TermsLink]	= CT.[ID]
		WHERE 
			ISNULL(CT.[CreditLimit],0) <> 0
		GROUP BY
			C1.[CustomerCode],
			CT.[CreditLimit],
			C1.[Balance],
			T1.[OrderNum],
			T1.[ThisGross]) T2
	LEFT OUTER JOIN (SELECT DISTINCT [OrderNum], [OrderEnteredBy] FROM [vw_ASC_LIVE_Orders])	O	ON T2.[OrderNum] = O.[OrderNum]
	LEFT OUTER JOIN [Tb_SupplyChain_Links]														SCL ON SCL.[LnkSYS_PEOPLE_PP_CODE] = O.[OrderEnteredBy]
	LEFT OUTER JOIN [vw_HICS_Rep_Users]															U	ON U.[ID] = SCL.[LnkUserID]
	WHERE
		T2.[CreditLimit] - (T2.[Balance] + T2.[ThisGross] + T2.[OtherGross]) < 0) T3
LEFT OUTER JOIN [vw_ASC_LIVE_Customers1]	C1 ON C1.[CustomerCode] = T3.[CustomerCode]
LEFT OUTER JOIN [Tb_Mon_Comparisons] C	ON	CONVERT(VARCHAR(MAX),T3.[OrderNum]) = C.[Ref01]
										AND	C.[LnkTaskID] = @TaskID
										AND ISNULL(C.[Ref03],'') = ''
LEFT OUTER JOIN (SELECT DISTINCT [OrderNum] FROM [vw_ASC_LIVE_Orders] 
				GROUP BY [OrderNum] HAVING 
					SUM(CASE [Status] WHEN 'H' THEN 1 ELSE 0 END) > 0
				AND SUM(CASE WHEN [Status] <> 'H' THEN 1 ELSE 0 END) = 0) FH ON T3.[OrderNum] = FH.[OrderNum]
LEFT OUTER JOIN (SELECT DISTINCT [OrderNum] FROM [vw_ASC_LIVE_Orders] WHERE [CreatedOn] > DATEADD(MINUTE,-5,GETDATE())) TN ON T3.[OrderNum] = TN.[OrderNum]
--The 5 minute rule is to stop the alert triggering while someone is still filling out the order. Not a bullet proof way but its what we have

--We only need to talk about new and increased statuses
UPDATE [#Tb_Mon_Task46] set [Processed] = 1 where [Status] NOT IN ('New', 'Increased')

--Anything you want to chat about?
IF (SELECT COUNT([Processed]) FROM [#Tb_Mon_Task46] where [Processed] = 0) > 0
BEGIN
	
	DECLARE @EMailBody		VARCHAR(MAX)
	DECLARE @EmailID		INT
	DECLARE @EmailTo		VARCHAR(1026)
	DECLARE @Count			INT
	DECLARE @OrdNum			DECIMAL(13,0)
	DECLARE @OrdNumStr		VARCHAR(10)
	DECLARE @Status			VARCHAR(10)
	
	--Enabled during testing
	set @LogMsg = (SELECT CONVERT(VARCHAR(10), COUNT([Processed])) + ' orders to process' FROM [#Tb_Mon_Task46] where [Processed] = 0)
	exec sp_log @LogSrc, @LogCat,@LogProc ,@LogMsg

	WHILE (SELECT COUNT([Processed]) FROM [#Tb_Mon_Task46] WHERE [Processed] = 0) > 0
	BEGIN
		
		SET @EmailTo = (SELECT MIN([CSTEmail]) FROM [#Tb_Mon_Task46] WHERE [Processed] = 0)

		--This section puts them on hold
		DECLARE C1 CURSOR FOR SELECT [OrdNum], [Status] FROM [#Tb_Mon_Task46] WHERE [Processed] = 0 AND [CSTEmail] = @EmailTo ORDER BY [OrdNum]
		
		OPEN C1
		FETCH NEXT FROM C1 INTO @OrdNum, @Status

		WHILE @@FETCH_STATUS = 0
		BEGIN
			set @LogMsg = 'Placing order ' + CONVERT(VARCHAR(100),@OrdNum) + ' on hold (' + @Status + ' and ' + CASE @Status WHEN 'New' THEN '' ELSE 'now ' END + 'exceeds the cusotmers credit limit)'
 			exec sp_log @LogSrc, @LogCat,@LogProc ,@LogMsg

			--Disabled during testing
			--UPDATE [ASC_LIVE].[dbo].[ASC_COR_TBL] SET [COR_ORDER_STATUS] = 'H' WHERE [COR_OUR_NUMBER_N] = @OrdNum
						
			FETCH NEXT FROM C1 INTO @OrdNum, @Status

		END;

		CLOSE C1
		DEALLOCATE C1

		SET @Count = (SELECT COUNT([OrdNum]) FROM [#Tb_Mon_Task46] WHERE [Processed] = 0 AND [CSTEmail] = @EmailTo)

		IF @Count = 1
			BEGIN
				SET @EMailBody = '<p>The below order was not held and not approved but appears to infringe the customers credit limit, it has been put on hold and will be reviewed on the next Held List review.</p>' 
				SET @OrdNumStr = (SELECT [OrdNum] FROM [#Tb_Mon_Task46] WHERE [Processed] = 0 AND [CSTEmail] = @EmailTo)
			END
		ELSE
			SET @EMailBody = '<p>The below orders were not held and not approved but appear to infringe the customers credit limit, they have been put on hold and will be reviewed on the next Held List review.</p>' 

		--This adds a user s column if it is going to support so it can be looked into further if required, although suport should be able to find this info out anyway
		SET @EMailBody = @EMailBody + '<p><table>' +  
						CASE 
							WHEN @EmailTo = @SupportEmail THEN 
								'<tr><th>Status<br></th><th>Customer<br></th><th>Credit Limit<br>(1)</th><th>Balance<br>(2)</th><th>Order<br></th><th>Value<br>(3)</th><th>Others<br>(4)</th><th>Available<br>(1-(2+3+4))</th><th>CST Member</th></tr>' +  
								CAST((SELECT DISTINCT
									[Status]							AS [td],'',
									[CusName] + ' (' + [CusCode] + ')'	AS [td],'',
									[CusCL]								AS [td],'',
									[CusBal]							AS [td],'',
									[OrdNum]							AS [td],'',
									[OrdVal]							AS [td],'',
									[OthVal]							AS [td],'',
									[Available]							AS [td],'',
									[CST]								AS [td],''
								FROM 
									[#Tb_Mon_Task46] 
								WHERE
									[CSTEmail] = @EmailTo
								AND [Processed] = 0
								ORDER BY
									[Status] Desc,
									[CusName] + ' (' + [CusCode] + ')',
									[OrdNum]
								FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX))
							ELSE 
								'<tr><th>Status<br></th><th>Customer<br></th><th>Credit Limit<br>(1)</th><th>Balance<br>(2)</th><th>Order<br></th><th>Value<br>(3)</th><th>Others<br>(4)</th><th>Available<br>(1-(2+3+4))</th></tr>' +  
								CAST((SELECT DISTINCT
									[Status]							AS [td],'',
									[CusName] + ' (' + [CusCode] + ')'	AS [td],'',
									[CusCL]								AS [td],'',
									[CusBal]							AS [td],'',
									[OrdNum]							AS [td],'',
									[OrdVal]							AS [td],'',
									[OthVal]							AS [td],'',
									[Available]							AS [td],''
								FROM 
									[#Tb_Mon_Task46] 
								WHERE
									[CSTEmail] = @EmailTo
								AND [Processed] = 0
								ORDER BY
									[Status] Desc,
									[CusName] + ' (' + [CusCode] + ')',
									[OrdNum]
								FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX))
						END +
						
						'</table></p>' + 
						'<p>A status of <b>new</b> means the order is new to this credit limit infringement process and exceeds the customers credit limit.<br>A status of <b>increased</b> means the order value increased and now exceeds the customers credit limit.</p>' +
						'<p>The finance department has also been informed.</p>'
	
		--INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain',@EmailTo,'','Credit limit infringement' + (SELECT CASE @Count WHEN 1 THEN ' - Order ' + @OrdNumStr + ' held' ELSE 's - Orders held' END), @EMailBody,0,@RunID);
		INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','garye@hgcompany.co.uk','','Credit limit infringement' + (SELECT CASE @Count WHEN 1 THEN ' - Order ' + @OrdNumStr + ' held' ELSE 's - Orders held' END), @EMailBody,0,@RunID);
		
		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
	
		INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunId],[Ref]) SELECT DISTINCT @EmailID, @TaskID, @RunID, [OrdNum] FROM [#Tb_Mon_Task46] WHERE [CSTEmail] = @EmailTo AND [Processed] = 0
		
		UPDATE [#Tb_Mon_Task46] SET [Processed] = 1 WHERE [CSTEmail] = @EmailTo AND [Processed] = 0

	END;

	--SET @EmailTo = 'edb@hgcompany.co.uk'
	SET @EmailTo = 'garye@hgcompany.co.uk'

	SET @Count = (SELECT COUNT([OrdNum]) FROM [#Tb_Mon_Task46] WHERE [Status] IN ('New','Increased'))

	IF @Count = 1
			SET @EMailBody = '<p>The below order was not held and not approved but infringed the customers credit limit, it has been put on hold.</p>' 
		ELSE
			SET @EMailBody = '<p>The below orders were not held and not approved but infringed the customers credit limit, they have been put on hold.</p>' 

	SET @EMailBody = @EMailBody  + '<p><table>' +  
					'<tr><th>Status<br></th><th>Customer<br></th><th>Credit Limit<br>(1)</th><th>Balance<br>(2)</th><th>Order<br></th><th>Value<br>(3)</th><th>Others<br>(4)</th><th>Available<br>(1-(2+3+4))</th><th>CST Member<br></th></tr>' +  
					CAST((SELECT
							[Status]							AS [td],'',
							[CusName] + ' (' + [CusCode] + ')'	AS [td],'',
							[CusCL]								AS [td],'',
							[CusBal]							AS [td],'',
							[OrdNum]							AS [td],'',
							[OrdVal]							AS [td],'',
							[OthVal]							AS [td],'',
							[Available]							AS [td],'',
							[CST]								AS [td],''
						FROM 
							[#Tb_Mon_Task46] 
						WHERE
							[Status] IN ('New','Increased')
						ORDER BY
							[Status] Desc,
							[CusName] + ' (' + [CusCode] + ')',
							[OrdNum]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>' + 
					'<p>A status of <b>new</b> means the order is new to this credit limit infringement process and exceeds the customers credit limit.<br>A status of <b>increased</b> means the order value increased and now exceeds the customers credit limit.</p>' +
					'<p>The CST member who raised the order has also been been informed.</p>'
	
	IF (SELECT COUNT([OrdNum]) FROM [#Tb_Mon_Task46] WHERE [Status] = 'Increased - Tolerate') > 0
	BEGIN
		SET @EMailBody = @EMailBody  + '<p>The below table shows orders whos value increased but under the tolerance of ' + CAST(@Tolerance AS FLOAT) +'%(+/-).</p><p><table>' +  
					'<tr><th>Customer<br></th><th>Credit Limit<br>(1)</th><th>Balance<br>(2)</th><th>Order<br></th><th>Value<br>(3)</th><th>Others<br>(4)</th><th>Available<br>(1-(2+3+4))</th><th>CST Member<br></th></tr>' +  
					CAST((SELECT
							[CusName] + ' (' + [CusCode] + ')'	AS [td],'',
							[CusCL]								AS [td],'',
							[CusBal]							AS [td],'',
							[OrdNum]							AS [td],'',
							[OrdVal]							AS [td],'',
							[OthVal]							AS [td],'',
							[Available]							AS [td],'',
							[CST]								AS [td],''
						FROM 
							[#Tb_Mon_Task46] 
						WHERE
							[Status] = 'Increased - Tolerate'
						ORDER BY
							[CusName] + ' (' + [CusCode] + ')',
							[OrdNum]
						FOR XML PATH('tr'), TYPE) AS NVARCHAR(MAX)) +
					'</table></p>' + 
					'<p>These order have not been checked for an infrindgement as the order value change was within the tolerance, the CST memeber has not be notified about this difference.</p>'
	END
	
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain',@EmailTo,'','Credit limit infringement' + (SELECT CASE @Count WHEN 1 THEN ' - Order held' ELSE 's - Orders held' END), @EMailBody,0,@RunID);
		
	SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID);
	
	INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunId],[Ref]) SELECT DISTINCT @EmailID, @TaskID, @RunID, [OrdNum] FROM [#Tb_Mon_Task46] WHERE [Status] IN ('New','Increased','Increased - Tolerate')

	--Delete ones no longer being monitored
	INSERT INTO [Tb_Log] ([CreatedBy],[Computer],[Source],[Environment],[Category],[Process],[Message]) 
	SELECT 
		@UserID,HOST_NAME(),@LogSrc,'Live',@LogCat,@LogProc,'Order ' + C.[Ref01] + ' is no longer being monitored' 
	FROM 
		[Tb_Mon_Comparisons] C 
	WHERE 
		C.[LnkTaskID] = @TaskID 
	AND C.[Ref01] not in (SELECT CONVERT(VARCHAR(MAX),[OrdNum]) FROM [#Tb_Mon_Task46]) 
	AND C.[Ref03] = ''
	
	--First it updates to show finished
	UPDATE [Tb_Mon_Comparisons] 
		SET [Ref03] = 'Finished' 
	WHERE 
		[LnkTaskID] = @TaskID 
	AND [Ref01] not in (SELECT CONVERT(VARCHAR(MAX),[OrdNum]) FROM [#Tb_Mon_Task46]) 
	AND [Ref03] = ''

	--Delete ones that have been at a state of finished for over a month
	DELETE FROM [Tb_Mon_Comparisons] 
	WHERE 
		[LnkTaskID] = @TaskID 
	AND [Ref01] IN (SELECT DISTINCT [Ref01] FROM [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID AND [Ref03] = 'Finished' AND CONVERT(DATE,[CreatedOn]) > CONVERT(DATE,DATEADD(MONTH,-1,GETDATE())))
	AND [Ref01] NOT IN (SELECT DISTINCT [Ref01] FROM [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID AND [Ref03] = '')

	--old way of doing the above
	--DELETE FROM [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID AND [Ref01] not in (SELECT CONVERT(VARCHAR(MAX),[OrdNum]) FROM [#Tb_Mon_Task46])
	
	INSERT INTO [Tb_Log] ([CreatedBy],[Computer],[Source],[Environment],[Category],[Process],[Message]) 
	SELECT 
		@UserID,HOST_NAME(),@LogSrc,'Live',@LogCat,@LogProc,'Now monitoring order ' + CONVERT(VARCHAR(MAX),T1.[OrdNum]) + ' (' + T1.[Status] + ')' 
	FROM 
		[#Tb_Mon_Task46] T1
	WHERE 
		CONVERT(VARCHAR(MAX),T1.[OrdNum]) NOT IN (SELECT [Ref01] FROM [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID)
	AND T1.[Status] <> 'Too new'

	--Update items where their value has changed
	Update [Tb_Mon_Comparisons] 
		SET [Ref03] = 'Superseded'
	WHERE 
		[ID] IN (SELECT 
					C.[ID] 
				FROM 
							[Tb_Mon_Comparisons]	C 
				INNER JOIN	[#Tb_Mon_Task46]		T1 ON CONVERT(VARCHAR(MAX),T1.[OrdNum]) = C.[Ref01] 
				WHERE 
					C.[LnkTaskID] = @TaskID 
				AND C.[Ref02] <> CONVERT(VARCHAR(MAX),T1.[OrdVal])
				AND T1.[Status] <> 'Too new'
				AND C.[Ref03] = '')

	--Old way of doing the above
	--Delete items where their value has changed
	--DELETE FROM [Tb_Mon_Comparisons] 
	--WHERE 
	--	[ID] IN (SELECT 
	--				C.[ID] 
	--			FROM 
	--						[Tb_Mon_Comparisons]	C 
	--			INNER JOIN	[#Tb_Mon_Task46]		T1 ON CONVERT(VARCHAR(MAX),T1.[OrdNum]) = C.[Ref01] 
	--			WHERE 
	--				C.[LnkTaskID] = @TaskID 
	--			AND C.[Ref02] <> CONVERT(VARCHAR(MAX),T1.[OrdVal])
	--			AND T1.[Status] <> 'Too new')

	--Old way of doing the above
	--DELETE FROM [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID AND [Ref01] in (SELECT CONVERT(VARCHAR(MAX),[OrdNum]) FROM [#Tb_Mon_Task46] WHERE [Status] IN ('Decreased','Increased','Increased - Held'))
	
	--Insert all the new and changed items ready for the next review
	INSERT INTO [Tb_Mon_Comparisons] 
	([LnkTaskID],[Ref01],[Ref02],[Ref03],[Ref04]) 
	SELECT 
		@TaskID,
		CONVERT(VARCHAR(MAX),T1.[OrdNum]),
		CONVERT(VARCHAR(MAX),T1.[OrdVal]),
		'',
		[Status]
	FROM 
		[#Tb_Mon_Task46] T1
	WHERE 
		CONVERT(VARCHAR(MAX),T1.[OrdNum]) NOT IN (SELECT [Ref01] FROM [Tb_Mon_Comparisons] WHERE [LnkTaskID] = @TaskID AND [Ref03] = '')
	AND T1.[Status] <> 'Too new'
	
	--Old way of doing the above
	--INSERT INTO [Tb_Mon_Comparisons] ([LnkTaskID],[Ref01],[Ref02]) SELECT @TaskID,CONVERT(VARCHAR(MAX),[OrdNum]),CONVERT(VARCHAR(MAX),[OrdVal]) FROM [#Tb_Mon_Task46] WHERE [Status] <> '' and [Status] <> 'Too new'

END

DROP TABLE #Tb_Mon_Task46;

--Enabled during testing
set @LogMsg = 'Process finished'
exec sp_log @LogSrc, @LogCat,@LogProc ,@LogMsg
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task47]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task47]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DROP TABLE IF EXISTS [#Tb_Mon_Task47];
DROP TABLE IF EXISTS [#Tb_Mon_Task47_Tasks];

CREATE TABLE [#Tb_Mon_Task47] (
	[JobID]			INT				NOT NULL,
	[LastRun]		DATE			NULL,
	[Processed]		BIT				NOT NULL
);


--Get the data
INSERT INTO [#Tb_Mon_Task47] ([JobID],[LastRun],[Processed])
SELECT 
	T1.[ID]								AS [JobID],
	CONVERT(DATE,T1.[LastSchedule])		AS [LastRun],
	0									AS [Processed]
FROM
	(select 
		J.[ID],
		(SELECT COUNT([ID]) FROM [Tb_PPM_ScheduleJobs] WHERE [Deleted] = 0 AND [LnkJobID] = J.[ID] AND [Closed] = 0) AS [HasSchedule],
		(SELECT MAX([ClosedOn]) FROM [Tb_PPM_ScheduleJobs] WHERE [Deleted] = 0 AND [LnkJobID] = J.[ID] AND [Closed] = 1) AS [LastSchedule]
	from 
		[Tb_PPM_Jobs] J 
	where 
		J.[Deleted] = 0 
	AND J.[Enabled] = 1) T1
	--AND J.[StartDate] <= CONVERT(DATE,SYSDATETIME())) T1
WHERE
	T1.[HasSchedule] = 0 ;

--Anything to do?
IF (SELECT COUNT([JobID]) FROM [#Tb_Mon_Task47]) > 0
BEGIN
	
	DECLARE @JobID		AS INT
	DECLARE @GroupID	AS INT
	DECLARE @Name		AS VARCHAR(255)
	DECLARE @Location	AS VARCHAR(255)
	DECLARE @LastRun	AS DATE
	DECLARE @NextRun	AS DATE
	DECLARE @Freq		AS INT
	DECLARE @FreqVal	AS INT
	DECLARE @ReqDoc		AS BIT
	DECLARE @RunBefore	AS BIT
	
	DECLARE @SchedJobID	AS INT
	DECLARE @Position	AS INT
	DECLARE @TaskID2	AS INT

	CREATE TABLE [#Tb_Mon_Task47_Tasks] (
	[ID]			INT IDENTITY(1,1)	NOT NULL,
	[SchedJobID]	INT					NOT NULL,
	[LnkTaskID]		INT					NOT NULL,
	[Type]			INT					NOT NULL,
	[LnkJobAssetID]	INT					NULL,
	[ReqDoc]		BIT					NOT NULL,
	[Name]			VARCHAR(255)		NOT NULL,
	[Processed]		BIT					NOT NULL
);

	WHILE (SELECT COUNT([JobID]) FROM [#Tb_Mon_Task47] WHERE [Processed] = 0) > 0
	BEGIN
		
		SET @JobID = (SELECT MIN([JobID]) FROM [#Tb_Mon_Task47] WHERE [Processed] = 0);

		SELECT 
			@LastRun	= CONVERT(DATE,CASE WHEN T1.[LastRun] IS NULL THEN J.[StartDate] ELSE T1.[LastRun] END),
			@Freq		= J.[Freq],
			@FreqVal	= J.[FreqValue],
			@ReqDoc		= J.[ReqDocOnComp],
			@GroupID	= J.[LnkGroupID],
			@Name		= J.[Name],
			@Location	= ISNULL(J.[Location],''),
			@RunBefore	= CASE WHEN T1.[LastRun] IS NULL THEN 0 ELSE 1 END
		FROM 
						[#Tb_Mon_Task47] T1 
		LEFT OUTER JOIN [Tb_PPM_Jobs] J ON J.[ID] = T1.[JobID] 
		WHERE 
			T1.[JobID] = @JobID;

		SET @NextRun = @LastRun;

		IF @RunBefore = 1 
		BEGIN
			WHILE (@NextRun = @LastRun) OR (@NextRun <= CONVERT(DATE,SYSDATETIME()))
			BEGIN
				/*
				Frequency		
				0 = Days
				1 = Weeks
				2 = Month
				3 = Years
				*/
				IF @Freq = 0
					Set @NextRun = DATEADD(DAY,@FreqVal,@NextRun)
				ELSE 
					IF @Freq = 1
						Set @NextRun = DATEADD(DAY,(@FreqVal*7),@NextRun)
					ELSE 
						IF @Freq = 2
							Set @NextRun = DATEADD(MONTH,@FreqVal,@NextRun)
						ELSE 
							IF @Freq = 3
								Set @NextRun = DATEADD(YEAR,@FreqVal,@NextRun)
			END;
		END;

		INSERT INTO [Tb_PPM_ScheduleJobs] ([LnkGroupID],[LnkJobID],[ReqDoc],[OriginalSchedule],[Schedule],[Name],[Location]) VALUES (@GroupID,@JobID,@ReqDoc,@NextRun,@NextRun,@Name,@Location);
		
		SET @SchedJobID = (SELECT MAX([ID]) FROM [Tb_PPM_ScheduleJobs] WHERE [Deleted] = 0 AND [LnkJobID] = @JobID AND [Closed] = 0)
		
		DELETE FROM [#Tb_Mon_Task47_Tasks]

		INSERT INTO [#Tb_Mon_Task47_Tasks] ([SchedJobID],[LnkTaskID],[Type],[ReqDoc],[Name],[Processed]) 
		SELECT @SchedJobID,[ID],0,[ReqDocOnComp],[Name],0 FROM [Tb_PPM_Tasks] WHERE [LnkJobID] = @JobID AND [Type] = 0 AND [Deleted] = 0 AND [Enabled] = 1 ORDER BY [Position]

		INSERT INTO [#Tb_Mon_Task47_Tasks] ([SchedJobID],[LnkTaskID],[Type],[LnkJobAssetID],[ReqDoc],[Name],[Processed]) 
		SELECT 
			@SchedJobID,T.[ID],1,JA.[ID],T.[ReqDocOnComp],T.[Name],0
		FROM
						[Tb_PPM_Tasks]		T 
		LEFT OUTER JOIN	[Tb_PPM_JobAssets]	JA	ON	T.[LnkJobID]	=	JA.[LnkJobID]
		LEFT OUTER JOIN [Tb_AR]				AR	ON	AR.[ID]			=	JA.[LnkAssetID]
		WHERE 
			T.[Deleted] = 0 
		AND T.[Enabled] = 1 
		AND T.[Type] = 1
		AND T.[LnkJobID] = @JobID
		AND JA.[Deleted] = 0 
		AND JA.[Enabled] = 1
		ORDER BY
			AR.[Number],
			T.[Position];

		SET @Position = 1;

		WHILE (SELECT COUNT([ID]) FROM [#Tb_Mon_Task47_Tasks] WHERE [Processed] = 0) > 0
		BEGIN
			SET @TaskID2 = (SELECT MIN([ID]) FROM [#Tb_Mon_Task47_Tasks] WHERE [Processed] = 0)

			INSERT INTO [Tb_PPM_ScheduleTasks] ([LnkScheduleJobID],[LnkTaskID],[Type],[LnkJobAssetID],[ReqDoc],[Position],[Name])
			SELECT [SchedJobID],[LnkTaskID],[Type],[LnkJobAssetID],[ReqDoc],@Position,[Name] FROM [#Tb_Mon_Task47_Tasks] WHERE [ID] = @TaskID2;

			SET @Position = @Position + 1;
			UPDATE [#Tb_Mon_Task47_Tasks] SET [Processed] = 1 WHERE [ID] = @TaskID2;
		END;

		UPDATE [#Tb_Mon_Task47] SET [Processed] = 1 WHERE [JobID] = @JobID

	END;

	DROP TABLE #Tb_Mon_Task47_Tasks;

END;

DROP TABLE #Tb_Mon_Task47;
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task48]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task48]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS
DECLARE @LogMsg				AS VARCHAR(500)
DECLARE @ServerFolder 		AS VARCHAR(MAX)
DECLARE @ServerFolder_Dest 	AS VARCHAR(MAX)
DECLARE @ShellCmd			AS VARCHAR(1000)
DECLARE @IntCounter			AS INT
DECLARE @Folders			AS TABLE ([ID] int IDENTITY, [Folder] varchar(200))
DECLARE @Files				AS TABLE ([ID] int IDENTITY, [File] varchar(200))
DECLARE @Process			AS TABLE ([ID] int IDENTITY, [From_Folder] varchar(255), [To_Folder] varchar(255),[File] varchar(255))
DECLARE @Folder				AS VARCHAR(255)
DECLARE @User				AS VARCHAR(255)
DECLARE @File				AS VARCHAR(255)
DECLARE @ID					AS INT
DECLARE @From				AS VARCHAR(255)
DECLARE @To					AS VARCHAR(255)

SET @ServerFolder		= (SELECT ISNULL([TypeSpecific],'') FROM [SOTI02_MobiControlDB].[dbo].[DepRule] WHERE [RuleName] = 'Camera Uploads')

IF @ServerFolder <> '' 
BEGIN
	
	SET @ServerFolder		= RIGHT(@ServerFolder,LEN(@ServerFolder)-(CHARINDEX(';SvrFolder=',@ServerFolder) + 10))
	SET @ServerFolder		= LEFT(@ServerFolder,CHARINDEX(';',@ServerFolder) - 1)

	SET @IntCounter = 2
	WHILE CHARINDEX('\',@ServerFolder,@IntCounter) <> 0
		SET @IntCounter = CHARINDEX('\',@ServerFolder,@IntCounter)+1

	SET @ServerFolder_Dest  = LEFT(@ServerFolder,@IntCounter-2)

	--Collect a list of files in the Pre-Import folder
	execute AS login = 'HAYMAN0\SQLNetworkAccess' 
	Set @ShellCmd = CONCAT('dir "',@ServerFolder,'" /b')
	insert into @Folders execute xp_cmdshell @ShellCmd
	REVERT

	delete from @Folders where [Folder] IS NULL
	delete from @Folders where UPPER([Folder]) = 'FILE NOT FOUND'

	WHILE (SELECT COUNT([ID]) FROM @Folders) > 0
	BEGIN
		SET @Folder = (SELECT [Folder] FROM @Folders WHERE [ID] = (SELECT MIN([ID]) FROM @Folders))
		
		execute AS login = 'HAYMAN0\SQLNetworkAccess' 
		Set @ShellCmd = CONCAT('dir "',CONCAT(@ServerFolder,'\',@Folder) ,'" /b')
		insert into @Files execute xp_cmdshell @ShellCmd
		REVERT

		DELETE FROM @Files WHERE [File] IS NULL
		DELETE FROM @Files WHERE CHARINDEX('.',[File]) = 0

		IF (SELECT COUNT([ID]) FROM @Files) > 0 
		BEGIN
			
			SET @User = (SELECT ISNULL([LoginName],'') FROM [SOTI02_MobiControlDB].[dbo].[person] WHERE [PersonID] = (SELECT top 1 [CurrentPersonId] FROM [SOTI02_MobiControlDB].[dbo].[DevInfo] WHERE LTRIM(RTRIM([DevId])) = @Folder))
            IF @User = '' 
				SET @User = (SELECT ISNULL([DevName],'') FROM [SOTI02_MobiControlDB].[dbo].[DevInfo] WHERE LTRIM(RTRIM([DevId])) = @Folder)
                            
			IF @User = '' 
				SET @User = 'Unknown'

			WHILE (SELECT COUNT([ID]) FROM @Files) > 0
			BEGIN
				SET @File = (SELECT [File] FROM @Files WHERE [ID] = (SELECT MIN([ID]) FROM @Files))
				INSERT INTO @Process ([From_Folder],[To_Folder],[File]) VALUES (CONCAT(@ServerFolder,'\',@Folder,'\'),CONCAT(@ServerFolder_Dest,'\',@User,'\'),@File) 
				DELETE FROM @Files WHERE [File] = @File
			END

			DELETE FROM @Files

		END

		DELETE FROM @Folders WHERE [Folder] = @Folder
	
	END

	DELETE FROM @Process WHERE RIGHT(UPPER([File]),4) = '.TMP'

	SET @IntCounter = (SELECT COUNT([ID]) FROM @Process)

	IF @IntCounter > 0
	BEGIN
		
		IF @IntCounter = 1
			set @LogMsg = '1 File to process';
		ELSE
			set @LogMsg = CONVERT(VARCHAR(10),@IntCounter) + ' Files to process';

		EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

		WHILE (SELECT COUNT([ID]) FROM @Process) > 0
		BEGIN
			SET @ID = (SELECT MIN([ID]) FROM @Process)

			SELECT @From = [From_Folder], @To = [To_Folder], @File = [File] FROM @Process WHERE [ID] = @ID

			IF LEFT(UPPER(@File),8) = '.TRASHED'
			BEGIN
				set @LogMsg = (SELECT CONCAT('Deleting ',@From,@File))
				EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg
			END
			ELSE
			BEGIN

				set @LogMsg = (SELECT CONCAT('Moving ',@From,@File,' to ',@To,@File))
				EXEC sp_Log @LogSrc,@LogCat,@LogProc,@LogMsg

				--Prep to copy it across
				set @ShellCmd = (SELECT CONCAT('echo F|xcopy "', @From, @File, '" "', @To, @File, '" /C /I /Q /Y'))
	
				--Copy - xp_cmdshell holds the process until it has finished copying which is good
				execute AS login = 'HAYMAN0\SQLNetworkAccess' 
				EXECUTE xp_cmdshell @ShellCmd
				REVERT

				--Check the file has made it
				Set @ShellCmd = CONCAT('dir "',@To , @File,'" /b')
				execute AS login = 'HAYMAN0\SQLNetworkAccess' 
				INSERT INTO @Files EXECUTE xp_cmdshell @ShellCmd
				REVERT
	
				--If we can see the file at the destination then delete the source
				IF (SELECT COUNT([ID]) FROM @Files WHERE [File] = @File) > 0 
				BEGIN
					--Delete source
					set @ShellCmd = (SELECT CONCAT('del "', @From, @File,'"'))
					execute AS login = 'HAYMAN0\SQLNetworkAccess' 
					execute xp_cmdshell @ShellCmd
					REVERT
			
				END

			END
			DELETE FROM @Process WHERE [ID] = @ID

		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Mon_Task49]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Mon_Task49]
	@LogSrc			AS [VARCHAR](50),
	@LogCat			AS [VARCHAR](50),
	@LogProc		AS [VARCHAR](50),
	@TaskID			AS [INT],
	@RunID			AS [INT]
AS

DECLARE @Variant		AS VARCHAR(10)
DECLARE @VariantDesc	AS VARCHAR(255)
DECLARE @FileName		AS VARCHAR(255)
DECLARE @ShellCmd		AS VARCHAR(1000)
DECLARE @EmailID		AS INT
DECLARE @EmailBody		AS VARCHAR(MAX)
DECLARE @Destination	AS VARCHAR(255)

DROP TABLE IF EXISTS [#Tb_Mon_Task49];
DROP TABLE IF EXISTS [#Tb_Mon_Task47_Tasks];

CREATE TABLE [#Tb_Mon_Task49] (
	[Variant]		VARCHAR(10)		NOT NULL
);

/*
From Emily Bill 20231024
307 McCormick
309 Chivas
384 Inverhouse
418 Adnams
388 AI Brands

Please add these 5 and if any more come on in the future, we will ask you to add them. Is that ok? ;)

This is done in the view for performance reasons but can be moved to here if required
*/

--Get the data
--INSERT INTO [#Tb_Mon_Task49] ([Variant]) VALUES ('309') --Chivas
--INSERT INTO [#Tb_Mon_Task49] ([Variant]) VALUES ('403') --M&S

INSERT INTO [#Tb_Mon_Task49] ([Variant]) SELECT DISTINCT [VariantCode] FROM [vw_ASC_LIVE_Rep_ProductionReport24hr]

WHILE (SELECT COUNT([Variant]) FROM [#Tb_Mon_Task49]) > 0
BEGIN
select * from vw_HICS_Rep_TransportData

	SET @Variant = (SELECT MIN([Variant]) FROM [#Tb_Mon_Task49])

	IF (SELECT COUNT([VariantCode]) FROM [vw_ASC_LIVE_Rep_ProductionReport24hr] WHERE [VariantCode] = @Variant) > 0
	BEGIN

		SET @VariantDesc = (SELECT ISNULL([AnalysisDescription],'UNKNOWN') FROM [vw_ASC_LIVE_AnalysisCodes] WHERE [TypeCode] = 'I' AND [LabelCode] = '3' AND [AnalysisCode] = @Variant)

		SET @EMailBody =	'<p>Attached is the Production Report for ' + @Variant + ' (' + @VariantDesc + ').</p>'  

		INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Emails] ([Profile],[To],[CC],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('Supply Chain','','','Production Report (' + @VariantDesc + ')', @EMailBody,0,@RunID);

		SET @EmailID = (SELECT MAX([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 0 AND [LnkRunID] = @RunID );
		
		INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Items] ([LnkEmailID],[LnkTaskID],[LnkRunID],[Ref]) SELECT @EmailID,@TaskID,@RunID, [LotNo] FROM [vw_ASC_LIVE_Rep_ProductionReport24hr] WHERE [VariantCode] = @Variant 

		SELECT @Filename = CONCAT('ProductionReport_', @VariantDesc, '.csv')

		--SELECT @ShellCmd = CONCAT('bcp "SELECT * FROM [vw_ASC_LIVE_Rep_ProductionReport24hr_Data] WHERE [VariantCode] LIKE = ''%VariantCode%'' OR [VariantCode] LIKE = ''%'+ @Variant +'%''" queryout "C:\Temp\',@Filename,'" -c -t, -T -S "SQL01" -d "HICS"')
		SELECT @ShellCmd = CONCAT('bcp "SELECT * FROM [vw_ASC_LIVE_Rep_ProductionReport24hr_Data] WHERE [VariantCode] LIKE ''%%VariantCode%%'' OR [VariantCode] LIKE ''%%' + @Variant + '%%''" queryout "C:\Temp\',@Filename,'" -c -t, -T -S "SQL01" -d "HICS"')

		--SELECT * FROM [vw_ASC_LIVE_Rep_ProductionReport24hr_Data] WHERE [VariantCode] LIKE '%VariantCode%'

		execute AS login = 'HAYMAN0\SQLNetworkAccess' 
		execute xp_cmdshell @ShellCmd
		REVERT;

		SET @Destination = CONCAT('\\SS02\HICS\Mon\Email Attachments\',YEAR(SYSDATETIME()),'\',MONTH(SYSDATETIME()),'\', @EmailID, '\')
		
		SELECT @ShellCmd = CONCAT('MKDIR "' , @Destination , '"')

		execute AS login = 'HAYMAN0\SQLNetworkAccess' 
		execute xp_cmdshell @ShellCmd
		REVERT;

		SELECT @ShellCmd = CONCAT('MOVE "C:\Temp\',@Filename,'" "',@Destination,'"')

		execute AS login = 'HAYMAN0\SQLNetworkAccess' 
		execute xp_cmdshell @ShellCmd
		REVERT;

		INSERT INTO [HICSDEV].[dbo].[Tb_Mon_Email_Attachments] ([LnkEmailID],[LnkTaskID],[LnkRunID],[File]) VALUES (@EmailID,@TaskID,@RunID, CONCAT(@Destination,@FileName))

	END

	DELETE FROM [#Tb_Mon_Task49] WHERE [Variant] = @Variant

END

DROP TABLE [#Tb_Mon_Task49];
GO
/****** Object:  StoredProcedure [dbo].[Sp_Mon_Tasks_Add]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Mon_Tasks_Add]
@TaskID		INT
AS
DECLARE @Status AS INT = 0
DECLARE @Wait	AS VARCHAR(8)

/*
Run Statuses
0 =	To do
1 = In progress
2 = Completed
3 = Completed (with error)
4 = Superseded (A new request has come in for it)
5 = Suppressed (An instance is still running)
*/

Retry_Update:  
BEGIN TRY  
	UPDATE [Tb_Mon_Runs] SET [Status] = 4 WHERE [Status] = 0 AND [TaskID] = @TaskID;
END TRY  
BEGIN CATCH  
	Set @Wait = '00:00:0' + CONVERT(VARCHAR(1), floor(RAND()*6))
	WAITFOR DELAY @Wait
	GOTO Retry_Update
END CATCH;  

IF (SELECT COUNT([ID]) FROM [Tb_Mon_Runs] WITH (NOLOCK) WHERE [Status] = 1 AND [TaskID] = @TaskID ) <> 0
	SET @Status = 5;

Retry_Insert:  
BEGIN TRY  
	INSERT INTO [Tb_Mon_Runs] ([TaskID],[Status]) VALUES (@TaskID,@Status)
END TRY  
BEGIN CATCH  
	Set @Wait = '00:00:0' + CONVERT(VARCHAR(1), floor(RAND()*6))
	WAITFOR DELAY @Wait
	GOTO Retry_Insert
END CATCH;  



GO
/****** Object:  StoredProcedure [dbo].[Sp_Mon_Tasks_Run]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_Mon_Tasks_Run]
@AgentID	AS [INT]
AS
DECLARE @Runs			AS [INT] = 0
DECLARE @RunLimit		AS [INT] = 10 --The process will process a maximum of this many tasks per run
DECLARE @Log			AS [BIT] = 0 -- 0 Means it will not log, 1 means it will, becuase we have tasks that run every minute, ideal this should only be on when debugging
DECLARE @TaskID			AS [INT]
DECLARE @SQLJobID		AS [UNIQUEIDENTIFIER]
DECLARE @RunID			AS [INT]
DECLARE @Start			AS [DATETIME]
DECLARE @End			AS [DATETIME]
DECLARE @LogSrc			AS [VARCHAR](50) = 'Monitor'
DECLARE @LogCat			AS [VARCHAR](50) = ''
DECLARE @LogCatLcl		AS [VARCHAR](50) = 'Run Tasks'
DECLARE @LogProc		AS [VARCHAR](50) = ''
DECLARE @TheExec		AS [VARCHAR](MAX)
DECLARE @LogMsg			AS [VARCHAR](500)
DECLARE @EmailBody		AS [VARCHAR](MAX)
DECLARE @ProcName		AS [VARCHAR](50)
DECLARE @Success		AS [BIT]
DECLARE @SupportEmail	AS [VARCHAR](1024) = 'support@hgcompany.co.uk'
DECLARE @EmailID		AS [INT]
DECLARE @EmailTo_Was	AS [VARCHAR](1024)
DECLARE @EmailTo_Is		AS [VARCHAR](1024)
DECLARE @EmailCC_Was	AS [VARCHAR](1024)
DECLARE @EmailCC_Is		AS [VARCHAR](1024)
DECLARE @EmailBCC_Was	AS [VARCHAR](1024)
DECLARE @EmailBCC_Is	AS [VARCHAR](1024)

/*
Run Statuses
0 =	To do
1 = In progress
2 = Completed
3 = Completed (with error)
4 = Superseded (A new request has come in for it)
5 = Suppressed (An instance is still running)
*/

WHILE (SELECT COUNT([ID]) FROM [Tb_Mon_Runs] WHERE [Status] = 0) <> 0 AND @Runs < @RunLimit
BEGIN
	

	--Say hello (once)
	IF @Runs = 0 AND @Log = 1
		exec sp_log  @LogSrc, @LogCatLcl, '', 'Run starting'

	--Get a RunID to do
	SELECT @RunID = ISNULL(MIN([ID]),0) FROM [Tb_Mon_Runs] WHERE [Status] = 0

	--If we got a task then run
	IF @RunID = 0 
		SET @Runs = @RunLimit + 1
	ELSE
	BEGIN
		
		SET @Start = SYSDATETIME()

		--Mark it as in progress
		UPDATE [Tb_Mon_Runs] SET [Status] = 1, [AgentID] = @AgentID, [Start] = @Start WHERE [ID] = @RunID
		
		--Get Task ID
		SELECT @TaskID = [TaskID] FROM [Tb_Mon_Runs] WHERE [ID] = @RunID
		
		--Collect the linked SQL JobID to pull information from it
		SELECT 
			@SQLJobID = [SQLJobID]
		FROM 
			[Tb_Mon_Tasks] 
		WHERE 
			[ID] = @TaskID

		--Go to the SQL job and get the name (used for logging)
		SELECT @LogCat = LTRIM(RTRIM([name])) FROM msdb..sysjobs where [job_id] = @SQLJobID

		--Strip off 'Mon:' if that prefix was there
		IF LEFT(@LogCat,4) = 'Mon:'
		SET @LogCat = LTRIM(RIGHT(@LogCat,LEN(@LogCat)-4))
		
		--Create the run name as T[TaskNumber]R[RunNumber]
		SET @LogProc = CONCAT('T', CONVERT(VARCHAR(10), @TaskID),'R', CONVERT(VARCHAR(10), @RunID)) 
	
		--Log the work
		IF @Log = 1
		BEGIN
			SET @LogMsg = 'Running task ' + CONVERT(VARCHAR(10),@TaskID)
			exec sp_log  @LogSrc, @LogCatLcl, @LogProc, @LogMsg
		END
			
		SET @Success = 0

		--ATM is all procedure based
		BEGIN TRY
			
			--SET @ProcName = 'sp_Mon_Task' + CONVERT(VARCHAR(10),@TaskID)
			IF OBJECT_ID('sp_Mon_Task' + RIGHT('00' + CONVERT(VARCHAR(10),@TaskID),2)) IS NULL
			BEGIN
				SET @ProcName = 'sp_mon_Task' + CONVERT(VARCHAR(10),@TaskID)
			END
			ELSE
			BEGIN
				SET @ProcName = 'sp_mon_Task' + RIGHT('00' + CONVERT(VARCHAR(10),@TaskID),2)
			END
			
			SET @TheExec = 'exec ' + @ProcName + ' ''' + @LogSrc + ''', ''' + @LogCat + ''', ''' + @LogProc + ''', ' + CONVERT(VARCHAR(10),@TaskID) + ', ' + CONVERT(VARCHAR(10),@RunID) 
			

			--execute AS login = 'HAYMAN0\SQLNetworkAccess' 
			EXEC (@TheExec)
			--REVERT
			
			--If we are here it was a success
			SET @Success = 1

			--Update the status
			UPDATE [Tb_Mon_Runs] SET [Status] = 2, [End] = SYSDATETIME() WHERE [ID] = @RunID

			--Talk
			IF @Log = 1
				exec sp_log  @LogSrc, @LogCatLcl, @LogProc, 'Task completed successfully'

		END TRY
		BEGIN CATCH
				
			--If we are here it failed
				
			Set @End = SYSDATETIME()

			--Update the status
			UPDATE [Tb_Mon_Runs] SET [Status] = 3, [End] = @End WHERE [ID] = @RunID

			--Talk
			IF @Log = 1
				exec sp_log  @LogSrc, @LogCatLcl, @LogProc, 'Task failed, emailing error to support'

			set @EMailBody =	'<p>Monitor encountered error. Full details are listed below.</p>' +
								'<p><table>' +  
								'<tr><th>Item</th><th>Value</th></tr>' +  
								'<tr><th>Start Date\Time</th><th>' + ISNULL(CONVERT(VARCHAR(23),@Start),'[NULL]') + '</th></tr>' +  
								'<tr><th>Error Date\Time</th><th>' + ISNULL(CONVERT(VARCHAR(23),@End),'[NULL]') + '</th></tr>' +  
								'<tr><th>Task</th><th>' + ISNULL(CONVERT(VARCHAR(10),@TaskID),'[NULL]') + ' (' + ISNULL(@LogCat,'[NULL]') + ')</th></tr>' +  
								'<tr><th>Run</th><th>' + ISNULL(CONVERT(VARCHAR(10),@RunID),'[NULL]') + '</th></tr>' +  
								'<tr><th>Procedure</th><th>' + ISNULL(@ProcName,'[NULL]') + '</th></tr>' +  
								'<tr><th>SQL error number</th><th>' + CONVERT(VARCHAR(MAX),(SELECT ISNULL(ERROR_NUMBER(),'[NULL]'))) + '</th></tr>' +  
								'<tr><th>SQL error severity</th><th>' +CONVERT(VARCHAR(MAX),(SELECT ISNULL(ERROR_SEVERITY(),'[NULL]'))) + '</th></tr>' +  
								'<tr><th>SQL error state</th><th>' + CONVERT(VARCHAR(MAX),(SELECT ISNULL(ERROR_STATE(),'[NULL]'))) + '</th></tr>' +  
								'<tr><th>SQL error procedure</th><th>' + CONVERT(VARCHAR(MAX),(SELECT ISNULL(ERROR_PROCEDURE(),'[NULL]'))) + '</th></tr>' +  
								'<tr><th>SQL error line</th><th>' + CONVERT(VARCHAR(MAX),(SELECT ISNULL(ERROR_LINE(),'[NULL]'))) + '</th></tr>' +  
								'<tr><th>SQL error message</th><th>' + CONVERT(VARCHAR(MAX),(SELECT ISNULL(ERROR_MESSAGE(),'[NULL]'))) + '</th></tr>' +  
								'</table></p>';

			INSERT INTO [Tb_Mon_Emails] ([Profile],[To],[Subject],[Body],[ReadyToSend],[LnkRunID]) VALUES ('HICS',@SupportEmail,'Monitor encountered an error',@EMailBody,1,@RunID);
				
		END CATCH

		--If there are any emails, add additional email addresses and set them to send
		WHILE (SELECT COUNT([ID]) FROM [Tb_Mon_Emails] WHERE [LnkRunID] = @RunID AND [ReadyToSend] = 0) > 0
		BEGIN
			SET @EmailID = (SELECT MIN([ID]) FROM [Tb_Mon_Emails] WHERE [LnkRunID] = @RunID and [ReadyToSend] = 0)
					
			SELECT 
				@EmailTo_Was = ISNULL([To],''),
				@EmailCC_Was = ISNULL([CC],''),
				@EmailBCC_Was = ISNULL([BCC],'')
			FROM 
				[Tb_Mon_Emails] 
			WHERE
				[ID] = @EmailID;

			SELECT 
				@EmailTo_Is = ISNULL([To],''),
				@EmailCC_Is = ISNULL([CC],''),
				@EmailBCC_Is = ISNULL([BCC],'')
			FROM 
				[Tb_Mon_Tasks] 
			WHERE
				[ID] = @TaskID;

			IF @EmailTo_Was <> '' AND @EmailTo_Is <> '' 
				SET @EmailTo_Was = CONCAT(@EmailTo_Was ,';')
					
			IF @EmailCC_Was <> '' AND @EmailCC_Is <> '' 
				SET @EmailCC_Was = CONCAT(@EmailCC_Was ,';')
					
			IF @EmailBCC_Was <> '' AND @EmailBCC_Is <> '' 
				SET @EmailBCC_Was = CONCAT(@EmailBCC_Was ,';')
					
			set @EmailTo_Is = CONCAT(@EmailTo_Was,@EmailTo_Is)
			set @EmailCC_Is = CONCAT(@EmailCC_Was,@EmailCC_Is)
			set @EmailBCC_Is = CONCAT(@EmailBCC_Was,@EmailBCC_Is)

			IF @Success = 0
			BEGIN
				IF @EmailCC_Is <> '' 
					SET @EmailCC_Is = CONCAT(@EmailCC_Is ,';')
					
				set @EmailCC_Is = CONCAT(@EmailCC_Is,@SupportEmail)

				UPDATE 
					[Tb_Mon_Emails] 
				SET
					[Body] = CONCAT('<p><b>There was an error while creating this message, it has been logged with support.</b></p>', [Body])
				WHERE
					[ID] = @EmailID;
			END

			UPDATE 
				[Tb_Mon_Emails] 
			SET
				[To] = @EmailTo_Is,
				[CC] = @EmailCC_Is,
				[BCC] = @EmailBCC_Is,
				[ReadyToSend] = 1
			WHERE 
				[ID] = @EmailID;

		END;
		
		--Update how many tasks we have processed
		SET @Runs = @Runs + 1

		--Update the task statistics (with the average sample size of 100)
		UPDATE 
			[Tb_Mon_Tasks] 
		SET 
			[LastRun] = @Start,
			[LastStatus] = (SELECT [Status] FROM [Tb_Mon_Runs] WHERE [ID] = @RunID),
			[Runs] = (SELECT COUNT([ID]) FROM [Tb_Mon_Runs] WHERE [TaskID] = @TaskID AND NOT [Start] IS NULL AND NOT [End] IS NULL),
			[Emails] = (SELECT COUNT([ID]) FROM [Tb_Mon_Emails] WHERE [LnkRunID] IN (SELECT [ID] FROM [Tb_Mon_Runs] WHERE [TaskID] = @TaskID)),
			[LastRunDuration] = (SELECT	CONVERT(DECIMAL(15,3),CONVERT(DECIMAL(15,5),DATEDIFF(MS,[Start],[End])) / 1000) FROM [Tb_Mon_Runs] WHERE [ID] = @RunID),
			[AverageRunDuration] = (SELECT 
										CONVERT(DECIMAL(15,3),SUM(CONVERT(DECIMAL(15,5),DATEDIFF(MS,T1.[Start],T1.[End])) / 1000) /
										(SELECT COUNT(T2.[ID]) FROM (SELECT TOP 100 [ID] FROM [Tb_Mon_Runs] WHERE [TaskID] = @TaskID AND NOT [Start] IS NULL AND NOT [End] IS NULL ORDER BY [ID] DESC) T2))
									FROM
										(SELECT TOP 100 [Start], [End] FROM [Tb_Mon_Runs] WHERE [TaskID] = @TaskID AND NOT [Start] IS NULL AND NOT [End] IS NULL ORDER BY ID DESC) T1)
										
		WHERE
			[ID] = @TaskID;

	END
	
	WAITFOR DELAY '00:00:01'
	
END

--This looks if there are any emails to send if there the are it schedules the tasks to send them
SELECT @EmailID = COUNT([ID]) FROM [Tb_Mon_Emails] WHERE [ReadyToSend] = 1 and [Processed] IS NULL
IF @EmailID > 0 AND (SELECT COUNT([ID]) from [Tb_Mon_Runs] WHERE [TaskID] = 1 AND [Status] = 0) = 0
BEGIN
	if @EmailID = 1 
		begin
			set @LogMsg = 'There is an email to send, scheduling the email task to run'
			exec sp_log  @LogSrc, @LogCatLcl, '',@LogMsg
		end
	else
		begin
			set @LogMsg = CONCAT('There are ',CONVERT(varchar(10),@EmailID), ' emails to send, scheduling the email task to run')
			exec sp_log  @LogSrc, @LogCatLcl, '',@LogMsg
		end

	exec [Sp_Mon_Tasks_Add] 1
END

--Say goodbye
IF @Runs <> 0 AND @Log = 1
	exec sp_log  @LogSrc, @LogCatLcl, '','Run finished'

GO
/****** Object:  StoredProcedure [dbo].[sp_SET_DATA]    Script Date: 30/11/2023 11:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:			Gary Evans (garye@hayman-group.co.uk)
-- Create date:		20190529
-- Modified Date:	20190627
-- Description:		We don't want people to see the tables because that is a risk, but to be able to input they need to see them.
--					The workaround is this procedure, it will run the updates,inserts,deletes, and log it. 
-- =============================================
CREATE PROCEDURE [dbo].[sp_SET_DATA]
	-- Name is the name of the view it will be running to get the data
	@Query		varchar(MAX),
	@Log		bit = 1
AS
BEGIN
	DECLARE @DTS		as datetime2 = sysdatetime()
	DECLARE @Name		AS VARCHAR(10)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	set @Query = replace(@Query,'','''')

	execute (@Query)
	
	IF (LEFT(UPPER(REPLACE(@Query,' ','')),18) <> 'INSERTINTO[TB_LOG]') AND (LEFT(UPPER(REPLACE(@Query,' ','')),28) <> 'INSERTINTO[TB_MONITOR_USAGE]') AND (@Log = 1)
		BEGIN 
			
			SET @Name = CASE LEFT(LTRIM(@Query),1)
							WHEN 'D' THEN 'Delete'
							WHEN 'E' THEN 'Execute'
							WHEN 'I' THEN 'Insert'
							WHEN 'U' THEN 'Update'
							ELSE 'Unclassified'
						END
			
			INSERT INTO [Tb_Mon_Usage] ([Name],[Type],[Query],[Duration]) VALUES (@Name,'Set Data',@Query, CONVERT(DECIMAL(15,5),CONVERT(DECIMAL(20,0),datediff(ms,@DTS,SYSDATETIME()))/1000))

		END
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Archive adjustments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'Arc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Archive adjustments, Reports' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'ArcR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Access Supply Chain, Adjust vat table (Edit)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'ASCAVTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Access Supply Chain, Adjust vat table (View only)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'ASCAVTV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Access Supply Chain, Booking in' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'ASCBI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Access Supply Chain, Inactivate me' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'ASCIM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Access Supply Chain, Inactivate users' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'ASCIU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Certificate of Analysis, Administration' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'COAA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Certificate of Analysis, Input' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'COAI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Certificate of Analysis, Input (Locked by)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'COAI_L'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Certificate of Analysis, Input (Tested by)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'COAI_T'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Certificate of Analysis, Input (Verified by)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'COAI_V'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Certificate of Analysis, Print' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'COAP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Certificate of Analysis, Sent register' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'COASR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IT, Asset register' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'ITAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Planned Preventative Maintenance, Administration (Entities and Groups)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'PPMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Planned Preventative Maintenance, Administration (Jobs and Tasks)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'PPMR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Planned Preventative Maintenance, Input' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'PPMI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'To be deleted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tb_Permissions', @level2type=N'COLUMN',@level2name=N'HICS_UM'
GO
USE [master]
GO
ALTER DATABASE [HICSDEV] SET  READ_WRITE 
GO
