CREATE PROCEDURE GetUsers
    @FilterValue NVARCHAR(100),
    @PageNumber INT,
    @MaxPageSize INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StartRow INT, @EndRow INT;

    -- Calculate the starting row index based on paging
    SET @StartRow = (@PageNumber - 1) * @MaxPageSize + 1;

    -- Calculate the ending row index
    SET @EndRow = @StartRow + @MaxPageSize - 1;

SELECT [ID]
      ,[CreatedOn]
      ,[CreatedBy]
      ,[ModifiedOn]
      ,[ModifiedBy]
      ,[Deleted]
      ,[DeletedOn]
      ,[DeletedBy]
      ,[Locked]
      ,[LockedOn]
      ,[LockedBy]
      ,[OpenedLast]
      ,[OpenedCount]
      ,[ADUsername]
      ,[Forenames]
      ,[Surname]
      ,[P_LastPage]
      ,[P_LastButton]
      ,[P_LastEnvironment]
      ,[Email]
      ,[HideFromList]
      ,[ADCreatedOn]
      ,[ADDisabled]
      ,[Online]
      ,[LastOnline]
      ,[Department]
      ,[DistinguishedName]
      ,[DistinguishedManager]
      ,[Manager]
      ,[Office]
      ,[Title]
      ,[P_CoAI_FontSize]
      ,[P_CoAI_SortOrder]
      ,[ADGUID]
      ,[GVGUID]
      ,[P_WEDI_SortOrder]
      ,[P_WEDI_SearchInData]
      ,[P_ITAR_OrderBy]
      ,[P_ITAR_OrderDirection]
      ,[P_ITAR_ActiveOnly]
      ,[P_SR_OrderBy]
      ,[P_SR_OrderDirection]
      ,[P_SR_ThisYearOnly]
      ,[P_SRLT_IncludeCompleted]
      ,[P_SR_HideSuperseded]
      ,[P_BI_Printer]
      ,[P_SR_Printer]
      ,[P_SR_HideClosed]
      ,[P_PM_HidePhantomised]
      ,[P_SBU_SkipProductChecks]
      ,[PO_CanRaise]
      ,[PO_Limit]
      ,[PO_Approver]
      ,[P_DOCS_LastSearch]
      ,[P_SR_OnlyMe]
      ,[P_AR_FilterAdd]
      ,[P_AR_FilterType]
      ,[P_AR_FilterSupplier]
      ,[P_AR_FilterStatus]
      ,[P_AR_OrderBy]
      ,[P_AR_OrderDirection]
      ,[P_AR_IncludeDisabled]
      ,[P_ARA_MineOnly]
FROM (
        SELECT *,
               ROW_NUMBER() OVER (ORDER BY ADUsername) AS RowNum
        FROM [tb_Users]
        WHERE 
            (LOWER(ADUsername) LIKE '%' + LOWER(@FilterValue) + '%' OR
            LOWER(Forenames) LIKE '%' + LOWER(@FilterValue) + '%' OR
            LOWER(Surname) LIKE '%' + LOWER(@FilterValue) + '%') AND 
            [Deleted] = 0
    ) AS TempTable
    WHERE RowNum BETWEEN @StartRow AND @EndRow;
END;