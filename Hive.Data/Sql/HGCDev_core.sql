/****** Object:  Table [dbo].[Tb_Users]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Users]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_Log]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Log]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  View [dbo].[vw_HICS_Rep_Log]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_SR_Types]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Matrix_StockRegister_Types]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_CoA_Monographs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_CoA_Monographs]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  View [dbo].[vw_HICS_Rep_Users]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_Countries]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Addresses]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Locations]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_Locations]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_VC_Vats]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_VC_Valves]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_VC_Valves]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_CoA_Questions]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_CoA_Questions]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_CoA_TestAnswers]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_CoA_TestAnswers]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  View [dbo].[vw_HICS_Rep_CoA_QuestionAnswers]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_TransportData]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_TransportData]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_SupplyChain_Links]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_SupplyChainUserLinks]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_Cap_Import]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_Capture_Import]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_CoA_PrintMaps]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_CoA_PrintMap]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_ASC_Licences]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_Rep_ASCLicenceCheck]    Script Date: 12/12/2023 10:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vw_HICS_Rep_ASCLicenceCheck] as 


select * from [Tb_ASC_Licences] WITH (NOLOCK)
GO
/****** Object:  Table [dbo].[Tb_EPRs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HICS_EPRs]    Script Date: 12/12/2023 10:32:52 ******/
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
/****** Object:  Table [dbo].[Tb_AR]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_Audit]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_BSMs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_BSMTypes]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_Shares]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_Statuses]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_AR_Suppliers]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Arc_Log]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Arc_Sessions]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ARs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ARs_Links]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ARs_Users]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ASC_Licences2]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ASCPPM_Imports]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_ASCPPM_Sessions]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_BU]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_BU_Sessions]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_BU_Status]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_BU_Types]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Cap_Import_Events]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Cap_Import_Events_Files]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_CoA_Generations]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_CoA_PartMaps]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_CoA_PartMaps_Naming]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_CoA_ProductsToMonographs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_CoA_QuestionsToMonographs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_CoA_Tests]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Config]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Environments]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ShortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_EPR_Categories]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_EPR_PackagingTypes]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Gold-Vision_COQuery]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Gold-Vision_COQuery_Files]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Gold-Vision_COQuery_Recip]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Gold-Vision_HostedDomains]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Gold-Vision_Links]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_HICS_VersionInfo]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_HoL]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Licencing]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Licencing_DSV]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Log_Archive]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Messages]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Comparisons]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Email_Attachments]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Email_Items]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Emails]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Runs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Runs_Archive]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Tasks]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Mon_Usage]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_OSs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Permissions]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PO_UsersToNominals]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_Files]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_Groups]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_JobAssets]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_Jobs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_ScheduleJobs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_ScheduleTasks]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_Tasks]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PPM_UsersToGroups]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_PrinterLog]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SBI_Data]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SBI_Header]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SC_Order_Audit]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SC_Order_Audit_Monitor]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SC_Parts]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SC_Parts_Audit]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SIMs]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Audit]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_List_Items]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Lists]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Nosings]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Test_Results]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Test_Types]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_Tests]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_SR_TypeLinks]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_VC_States]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_VI_Data]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_VI_Header]    Script Date: 12/12/2023 10:32:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
