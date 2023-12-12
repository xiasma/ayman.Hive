using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Hive.Data.Models;

public partial class HiveDbContext : DbContext
{
    public HiveDbContext()
    {
    }

    public HiveDbContext(DbContextOptions<HiveDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TbAddress> TbAddresses { get; set; }

    public virtual DbSet<TbAr> TbArs { get; set; }

    public virtual DbSet<TbAr1> TbArs1 { get; set; }

    public virtual DbSet<TbArAudit> TbArAudits { get; set; }

    public virtual DbSet<TbArBsm> TbArBsms { get; set; }

    public virtual DbSet<TbArBsmtype> TbArBsmtypes { get; set; }

    public virtual DbSet<TbArShare> TbArShares { get; set; }

    public virtual DbSet<TbArStatus> TbArStatuses { get; set; }

    public virtual DbSet<TbArSupplier> TbArSuppliers { get; set; }

    public virtual DbSet<TbArcLog> TbArcLogs { get; set; }

    public virtual DbSet<TbArcSession> TbArcSessions { get; set; }

    public virtual DbSet<TbArsLink> TbArsLinks { get; set; }

    public virtual DbSet<TbArsUser> TbArsUsers { get; set; }

    public virtual DbSet<TbAscLicence> TbAscLicences { get; set; }

    public virtual DbSet<TbAscLicences2> TbAscLicences2s { get; set; }

    public virtual DbSet<TbAscppmImport> TbAscppmImports { get; set; }

    public virtual DbSet<TbAscppmSession> TbAscppmSessions { get; set; }

    public virtual DbSet<TbBu> TbBus { get; set; }

    public virtual DbSet<TbBuSession> TbBuSessions { get; set; }

    public virtual DbSet<TbBuStatus> TbBuStatuses { get; set; }

    public virtual DbSet<TbBuType> TbBuTypes { get; set; }

    public virtual DbSet<TbCapImport> TbCapImports { get; set; }

    public virtual DbSet<TbCapImportEvent> TbCapImportEvents { get; set; }

    public virtual DbSet<TbCapImportEventsFile> TbCapImportEventsFiles { get; set; }

    public virtual DbSet<TbCoAGeneration> TbCoAGenerations { get; set; }

    public virtual DbSet<TbCoAMonograph> TbCoAMonographs { get; set; }

    public virtual DbSet<TbCoAPartMap> TbCoAPartMaps { get; set; }

    public virtual DbSet<TbCoAPartMapsNaming> TbCoAPartMapsNamings { get; set; }

    public virtual DbSet<TbCoAPrintMap> TbCoAPrintMaps { get; set; }

    public virtual DbSet<TbCoAProductsToMonograph> TbCoAProductsToMonographs { get; set; }

    public virtual DbSet<TbCoAQuestion> TbCoAQuestions { get; set; }

    public virtual DbSet<TbCoAQuestionsToMonograph> TbCoAQuestionsToMonographs { get; set; }

    public virtual DbSet<TbCoATest> TbCoATests { get; set; }

    public virtual DbSet<TbCoATestAnswer> TbCoATestAnswers { get; set; }

    public virtual DbSet<TbConfig> TbConfigs { get; set; }

    public virtual DbSet<TbCountry> TbCountries { get; set; }

    public virtual DbSet<TbEnvironment> TbEnvironments { get; set; }

    public virtual DbSet<TbEpr> TbEprs { get; set; }

    public virtual DbSet<TbEprCategory> TbEprCategories { get; set; }

    public virtual DbSet<TbEprPackagingType> TbEprPackagingTypes { get; set; }

    public virtual DbSet<TbGoldVisionCoquery> TbGoldVisionCoqueries { get; set; }

    public virtual DbSet<TbGoldVisionCoqueryFile> TbGoldVisionCoqueryFiles { get; set; }

    public virtual DbSet<TbGoldVisionCoqueryRecip> TbGoldVisionCoqueryRecips { get; set; }

    public virtual DbSet<TbGoldVisionHostedDomain> TbGoldVisionHostedDomains { get; set; }

    public virtual DbSet<TbGoldVisionLink> TbGoldVisionLinks { get; set; }

    public virtual DbSet<TbHicsVersionInfo> TbHicsVersionInfos { get; set; }

    public virtual DbSet<TbHoL> TbHoLs { get; set; }

    public virtual DbSet<TbLicencing> TbLicencings { get; set; }

    public virtual DbSet<TbLicencingDsv> TbLicencingDsvs { get; set; }

    public virtual DbSet<TbLocation> TbLocations { get; set; }

    public virtual DbSet<TbLog> TbLogs { get; set; }

    public virtual DbSet<TbLogArchive> TbLogArchives { get; set; }

    public virtual DbSet<TbMessage> TbMessages { get; set; }

    public virtual DbSet<TbMonComparison> TbMonComparisons { get; set; }

    public virtual DbSet<TbMonEmail> TbMonEmails { get; set; }

    public virtual DbSet<TbMonEmailAttachment> TbMonEmailAttachments { get; set; }

    public virtual DbSet<TbMonEmailItem> TbMonEmailItems { get; set; }

    public virtual DbSet<TbMonRun> TbMonRuns { get; set; }

    public virtual DbSet<TbMonRunsArchive> TbMonRunsArchives { get; set; }

    public virtual DbSet<TbMonTask> TbMonTasks { get; set; }

    public virtual DbSet<TbMonUsage> TbMonUsages { get; set; }

    public virtual DbSet<TbOss> TbOsses { get; set; }

    public virtual DbSet<TbPermission> TbPermissions { get; set; }

    public virtual DbSet<TbPoUsersToNominal> TbPoUsersToNominals { get; set; }

    public virtual DbSet<TbPpmFile> TbPpmFiles { get; set; }

    public virtual DbSet<TbPpmGroup> TbPpmGroups { get; set; }

    public virtual DbSet<TbPpmJob> TbPpmJobs { get; set; }

    public virtual DbSet<TbPpmJobAsset> TbPpmJobAssets { get; set; }

    public virtual DbSet<TbPpmScheduleJob> TbPpmScheduleJobs { get; set; }

    public virtual DbSet<TbPpmScheduleTask> TbPpmScheduleTasks { get; set; }

    public virtual DbSet<TbPpmTask> TbPpmTasks { get; set; }

    public virtual DbSet<TbPpmUsersToGroup> TbPpmUsersToGroups { get; set; }

    public virtual DbSet<TbPrinterLog> TbPrinterLogs { get; set; }

    public virtual DbSet<TbSbiDatum> TbSbiData { get; set; }

    public virtual DbSet<TbSbiHeader> TbSbiHeaders { get; set; }

    public virtual DbSet<TbScOrderAudit> TbScOrderAudits { get; set; }

    public virtual DbSet<TbScOrderAuditMonitor> TbScOrderAuditMonitors { get; set; }

    public virtual DbSet<TbScPart> TbScParts { get; set; }

    public virtual DbSet<TbScPartsAudit> TbScPartsAudits { get; set; }

    public virtual DbSet<TbSim> TbSims { get; set; }

    public virtual DbSet<TbSr> TbSrs { get; set; }

    public virtual DbSet<TbSrAudit> TbSrAudits { get; set; }

    public virtual DbSet<TbSrList> TbSrLists { get; set; }

    public virtual DbSet<TbSrListItem> TbSrListItems { get; set; }

    public virtual DbSet<TbSrNosing> TbSrNosings { get; set; }

    public virtual DbSet<TbSrTest> TbSrTests { get; set; }

    public virtual DbSet<TbSrTestResult> TbSrTestResults { get; set; }

    public virtual DbSet<TbSrTestType> TbSrTestTypes { get; set; }

    public virtual DbSet<TbSrType> TbSrTypes { get; set; }

    public virtual DbSet<TbSrTypeLink> TbSrTypeLinks { get; set; }

    public virtual DbSet<TbSupplyChainLink> TbSupplyChainLinks { get; set; }

    public virtual DbSet<TbTransportDatum> TbTransportData { get; set; }

    public virtual DbSet<TbUser> TbUsers { get; set; }

    public virtual DbSet<TbVcState> TbVcStates { get; set; }

    public virtual DbSet<TbVcValf> TbVcValves { get; set; }

    public virtual DbSet<TbVcVat> TbVcVats { get; set; }

    public virtual DbSet<TbViDatum> TbViData { get; set; }

    public virtual DbSet<TbViHeader> TbViHeaders { get; set; }

    public virtual DbSet<VwHicsCoAMonograph> VwHicsCoAMonographs { get; set; }

    public virtual DbSet<VwHicsCoAPrintMap> VwHicsCoAPrintMaps { get; set; }

    public virtual DbSet<VwHicsCoAQuestion> VwHicsCoAQuestions { get; set; }

    public virtual DbSet<VwHicsCoATestAnswer> VwHicsCoATestAnswers { get; set; }

    public virtual DbSet<VwHicsEpr> VwHicsEprs { get; set; }

    public virtual DbSet<VwHicsLog> VwHicsLogs { get; set; }

    public virtual DbSet<VwHicsRepAsclicenceCheck> VwHicsRepAsclicenceChecks { get; set; }

    public virtual DbSet<VwHicsRepCaptureImport> VwHicsRepCaptureImports { get; set; }

    public virtual DbSet<VwHicsRepCoAQuestionAnswer> VwHicsRepCoAQuestionAnswers { get; set; }

    public virtual DbSet<VwHicsRepLocation> VwHicsRepLocations { get; set; }

    public virtual DbSet<VwHicsRepLog> VwHicsRepLogs { get; set; }

    public virtual DbSet<VwHicsRepTransportDatum> VwHicsRepTransportData { get; set; }

    public virtual DbSet<VwHicsRepUser> VwHicsRepUsers { get; set; }

    public virtual DbSet<VwHicsRepVcValf> VwHicsRepVcValves { get; set; }

    public virtual DbSet<VwHicsSupplyChainUserLink> VwHicsSupplyChainUserLinks { get; set; }

    public virtual DbSet<VwHicsUser> VwHicsUsers { get; set; }

    public virtual DbSet<VwMatrixStockRegisterType> VwMatrixStockRegisterTypes { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TbAddress>(entity =>
        {
            entity.ToTable("Tb_Addresses");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AddLine1)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.AddLine2)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.AddLine3)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.County)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.Latitude).HasColumnType("decimal(25, 21)");
            entity.Property(e => e.Longitude).HasColumnType("decimal(25, 21)");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Postcode)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.ShortCode)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Town)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbAr>(entity =>
        {
            entity.ToTable("Tb_AR");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Addisabled).HasColumnName("ADDisabled");
            entity.Property(e => e.Adguid)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ADGUID");
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Cost).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.DellEsc)
                .HasMaxLength(11)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("Dell_ESC");
            entity.Property(e => e.DellPpid)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("Dell_PPID");
            entity.Property(e => e.DellSt)
                .HasMaxLength(7)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("Dell_ST");
            entity.Property(e => e.Eid)
                .HasMaxLength(32)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("EID");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.Imei1)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("IMEI_1");
            entity.Property(e => e.Imei2)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("IMEI_2");
            entity.Property(e => e.LnkArid).HasColumnName("LnkARID");
            entity.Property(e => e.LnkBsmid).HasColumnName("LnkBSMID");
            entity.Property(e => e.LnkLocationId).HasColumnName("LnkLocationID");
            entity.Property(e => e.LnkOsid).HasColumnName("LnkOSID");
            entity.Property(e => e.LnkSimid).HasColumnName("LnkSIMID");
            entity.Property(e => e.LnkStatusId).HasColumnName("LnkStatusID");
            entity.Property(e => e.LnkSupplierId).HasColumnName("LnkSupplierID");
            entity.Property(e => e.LnkUserId).HasColumnName("LnkUserID");
            entity.Property(e => e.Mac)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("MAC");
            entity.Property(e => e.ModelRef)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.OrderRef)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.PrinterName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.SerialRef)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.StatusNote)
                .HasMaxLength(500)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbAr1>(entity =>
        {
            entity.ToTable("Tb_ARs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Shortcode)
                .HasMaxLength(2)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbArAudit>(entity =>
        {
            entity.ToTable("Tb_AR_Audit");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ColumnName)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.FromDescription)
                .IsUnicode(false)
                .HasColumnName("From_Description");
            entity.Property(e => e.FromValue).HasColumnName("From_Value");
            entity.Property(e => e.LnkArid).HasColumnName("LnkARID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ToDescription)
                .IsUnicode(false)
                .HasColumnName("To_Description");
            entity.Property(e => e.ToValue).HasColumnName("To_Value");
        });

        modelBuilder.Entity<TbArBsm>(entity =>
        {
            entity.ToTable("Tb_AR_BSMs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Brand)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.BsmtypeId).HasColumnName("BSMTypeID");
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.Model)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Series)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.ShowDellEsc).HasColumnName("Show_Dell_ESC");
            entity.Property(e => e.ShowDellPpid).HasColumnName("Show_Dell_PPID");
            entity.Property(e => e.ShowDellSt).HasColumnName("Show_Dell_ST");
            entity.Property(e => e.ShowEid).HasColumnName("Show_EID");
            entity.Property(e => e.ShowHasDongle).HasColumnName("Show_HasDongle");
            entity.Property(e => e.ShowImei1).HasColumnName("Show_IMEI_1");
            entity.Property(e => e.ShowImei2).HasColumnName("Show_IMEI_2");
            entity.Property(e => e.ShowLabelPrinter).HasColumnName("Show_LabelPrinter");
            entity.Property(e => e.ShowMac).HasColumnName("Show_MAC");
            entity.Property(e => e.ShowModelRef).HasColumnName("Show_ModelRef");
            entity.Property(e => e.ShowName).HasColumnName("Show_Name");
            entity.Property(e => e.ShowOs).HasColumnName("Show_OS");
            entity.Property(e => e.ShowPrinterName).HasColumnName("Show_PrinterName");
            entity.Property(e => e.ShowSim).HasColumnName("Show_SIM");
            entity.Property(e => e.ToolAddisabled).HasColumnName("Tool_ADDisabled");
            entity.Property(e => e.ToolCShare).HasColumnName("Tool_C$Share");
            entity.Property(e => e.ToolDellSupport).HasColumnName("Tool_DellSupport");
            entity.Property(e => e.ToolOnlineStatus).HasColumnName("Tool_OnlineStatus");
            entity.Property(e => e.ToolWebsite).HasColumnName("Tool_Website");
        });

        modelBuilder.Entity<TbArBsmtype>(entity =>
        {
            entity.ToTable("Tb_AR_BSMTypes");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbArShare>(entity =>
        {
            entity.ToTable("Tb_AR_Shares");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.LnkArid).HasColumnName("LnkARID");
            entity.Property(e => e.LnkAssetId).HasColumnName("LnkAssetID");
        });

        modelBuilder.Entity<TbArStatus>(entity =>
        {
            entity.ToTable("Tb_AR_Statuses");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbArSupplier>(entity =>
        {
            entity.ToTable("Tb_AR_Suppliers");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AccMgr)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.AccMgrEmail)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("AccMgr_Email");
            entity.Property(e => e.AccMgrTel)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("AccMgr_Tel");
            entity.Property(e => e.AccRef)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.ScsupRef)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("SCSupRef");
            entity.Property(e => e.Website)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbArcLog>(entity =>
        {
            entity.ToTable("Tb_Arc_Log");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.From).HasColumnType("datetime");
            entity.Property(e => e.LnkSessionId).HasColumnName("LnkSessionID");
            entity.Property(e => e.Note)
                .HasMaxLength(1024)
                .IsUnicode(false);
            entity.Property(e => e.Path)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Size).HasColumnType("decimal(15, 2)");
            entity.Property(e => e.To).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbArcSession>(entity =>
        {
            entity.ToTable("Tb_Arc_Sessions");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.TotalFileSize).HasColumnType("decimal(10, 2)");
        });

        modelBuilder.Entity<TbArsLink>(entity =>
        {
            entity.ToTable("Tb_ARs_Links");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Item)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.LnkArid).HasColumnName("LnkARID");
            entity.Property(e => e.LnkItemId).HasColumnName("LnkItemID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TbArsUser>(entity =>
        {
            entity.ToTable("Tb_ARs_Users");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.LnkArid).HasColumnName("LnkARID");
            entity.Property(e => e.LnkUserId).HasColumnName("LnkUserID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TbAscLicence>(entity =>
        {
            entity.ToTable("Tb_ASC_Licences");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Dts)
                .HasColumnType("datetime")
                .HasColumnName("DTS");
        });

        modelBuilder.Entity<TbAscLicences2>(entity =>
        {
            entity.ToTable("Tb_ASC_Licences2");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Dts)
                .HasColumnType("datetime")
                .HasColumnName("DTS");
            entity.Property(e => e.UserId)
                .HasMaxLength(50)
                .HasColumnName("USER_ID");
            entity.Property(e => e.UserName)
                .HasMaxLength(50)
                .HasColumnName("USER_NAME");
        });

        modelBuilder.Entity<TbAscppmImport>(entity =>
        {
            entity.ToTable("Tb_ASCPPM_Imports");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkSessionId).HasColumnName("LnkSessionID");
            entity.Property(e => e.StatusInfo)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.VenAnyCurrFlag)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_ANY_CURR_FLAG");
            entity.Property(e => e.VenApproved)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_APPROVED");
            entity.Property(e => e.VenCode)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_CODE");
            entity.Property(e => e.VenCurrency)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_CURRENCY");
            entity.Property(e => e.VenDateAmended)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_DATE_AMENDED");
            entity.Property(e => e.VenDateCreated)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_DATE_CREATED");
            entity.Property(e => e.VenDiscount)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_DISCOUNT");
            entity.Property(e => e.VenFromDate)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_FROM_DATE");
            entity.Property(e => e.VenFromQty)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_FROM_QTY");
            entity.Property(e => e.VenJob)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_JOB");
            entity.Property(e => e.VenLead)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_LEAD");
            entity.Property(e => e.VenManuf)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_MANUF");
            entity.Property(e => e.VenManufPartOnly)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_MANUF_PART_ONLY");
            entity.Property(e => e.VenNote)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_NOTE");
            entity.Property(e => e.VenOk)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_OK");
            entity.Property(e => e.VenPartCode)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_PART_CODE");
            entity.Property(e => e.VenPartOnly)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_PART_ONLY");
            entity.Property(e => e.VenPartRefOnly)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_PART_REF_ONLY");
            entity.Property(e => e.VenPrice)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_PRICE");
            entity.Property(e => e.VenPricePer)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_PRICE_PER");
            entity.Property(e => e.VenRating1)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_RATING1");
            entity.Property(e => e.VenRating2)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_RATING2");
            entity.Property(e => e.VenRating3)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_RATING3");
            entity.Property(e => e.VenRating4)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_RATING4");
            entity.Property(e => e.VenRating5)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_RATING5");
            entity.Property(e => e.VenStatus)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_STATUS");
            entity.Property(e => e.VenToDate)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_TO_DATE");
            entity.Property(e => e.VenToQty)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_TO_QTY");
            entity.Property(e => e.VenUnique)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_UNIQUE");
            entity.Property(e => e.VenUom)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_UOM");
            entity.Property(e => e.VenUop)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("VEN_UOP");
        });

        modelBuilder.Entity<TbAscppmSession>(entity =>
        {
            entity.ToTable("Tb_ASCPPM_Sessions");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TbBu>(entity =>
        {
            entity.ToTable("Tb_BU");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkDocId).HasColumnName("LnkDocID");
            entity.Property(e => e.LnkSessionId).HasColumnName("LnkSessionID");
            entity.Property(e => e.LnkStatusId).HasColumnName("LnkStatusID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Part)
                .HasMaxLength(16)
                .IsUnicode(false);
            entity.Property(e => e.SourceFile)
                .HasMaxLength(500)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbBuSession>(entity =>
        {
            entity.ToTable("Tb_BU_Sessions");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FinishedOn).HasColumnType("datetime");
            entity.Property(e => e.LnkTypeId).HasColumnName("LnkTypeID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TbBuStatus>(entity =>
        {
            entity.ToTable("Tb_BU_Status");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ShortName)
                .HasMaxLength(10)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbBuType>(entity =>
        {
            entity.ToTable("Tb_BU_Types");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AllowBmps).HasColumnName("AllowBMPs");
            entity.Property(e => e.AllowDocxs).HasColumnName("AllowDOCXs");
            entity.Property(e => e.AllowJpgs).HasColumnName("AllowJPGs");
            entity.Property(e => e.AllowPdfs)
                .HasDefaultValue(true)
                .HasColumnName("AllowPDFs");
            entity.Property(e => e.AllowPngs).HasColumnName("AllowPNGs");
            entity.Property(e => e.AllowPptxs).HasColumnName("AllowPPTXs");
            entity.Property(e => e.AllowTifs).HasColumnName("AllowTIFs");
            entity.Property(e => e.AllowXlsxs).HasColumnName("AllowXLSXs");
            entity.Property(e => e.CategoryType)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.FileName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.MaxSize).HasDefaultValue(5);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbCapImport>(entity =>
        {
            entity.ToTable("Tb_Cap_Import");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Item)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Pdffound)
                .HasColumnType("datetime")
                .HasColumnName("PDFFound");
            entity.Property(e => e.Pdfgone)
                .HasColumnType("datetime")
                .HasColumnName("PDFGone");
            entity.Property(e => e.Pdfsent)
                .HasColumnType("datetime")
                .HasColumnName("PDFSent");
            entity.Property(e => e.PirentryFound)
                .HasColumnType("datetime")
                .HasColumnName("PIREntryFound");
            entity.Property(e => e.Type)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Xmlfound)
                .HasColumnType("datetime")
                .HasColumnName("XMLFound");
            entity.Property(e => e.Xmlgone)
                .HasColumnType("datetime")
                .HasColumnName("XMLGone");
            entity.Property(e => e.Xmlsent)
                .HasColumnType("datetime")
                .HasColumnName("XMLSent");
        });

        modelBuilder.Entity<TbCapImportEvent>(entity =>
        {
            entity.ToTable("Tb_Cap_Import_Events");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Currency)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Error)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Event)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.EventDate).HasColumnType("datetime");
            entity.Property(e => e.Item)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.LnkFileId).HasColumnName("LnkFileID");
            entity.Property(e => e.Order)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.Part)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.PirUnique).HasColumnName("PIR_UNIQUE");
            entity.Property(e => e.Price).HasColumnType("decimal(15, 5)");
            entity.Property(e => e.Quantity).HasColumnType("decimal(15, 5)");
            entity.Property(e => e.QuantitySup).HasColumnType("decimal(15, 5)");
            entity.Property(e => e.Supplier)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.SupplierRef)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Value).HasColumnType("decimal(15, 5)");
            entity.Property(e => e.Vatcode)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("VATCode");
        });

        modelBuilder.Entity<TbCapImportEventsFile>(entity =>
        {
            entity.ToTable("Tb_Cap_Import_Events_Files");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FileName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.FilePath)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Processed).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbCoAGeneration>(entity =>
        {
            entity.ToTable("Tb_CoA_Generations");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Deleted).HasColumnType("datetime");
            entity.Property(e => e.FileName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Path)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ScbatchNo)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("SCBatchNo");
            entity.Property(e => e.Sent).HasColumnType("datetime");
            entity.Property(e => e.Sono)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("SONo");
        });

        modelBuilder.Entity<TbCoAMonograph>(entity =>
        {
            entity.ToTable("Tb_CoA_Monographs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ConformanceStatement)
                .HasMaxLength(1024)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.DontShowPl)
                .HasDefaultValue(true)
                .HasColumnName("DontShowPL");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.MasterParentId).HasColumnName("MasterParentID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("New Monograph");
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.ShortName)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("NewMono");
            entity.Property(e => e.Version).HasDefaultValue(1);
        });

        modelBuilder.Entity<TbCoAPartMap>(entity =>
        {
            entity.ToTable("Tb_CoA_PartMaps");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkProductId).HasColumnName("LnkProductID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TbCoAPartMapsNaming>(entity =>
        {
            entity.ToTable("Tb_CoA_PartMaps_Naming");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.LnkProductId).HasColumnName("LnkProductID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbCoAPrintMap>(entity =>
        {
            entity.ToTable("Tb_CoA_PrintMaps");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Filename)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.LnkMonographId).HasColumnName("LnkMonographID");
        });

        modelBuilder.Entity<TbCoAProductsToMonograph>(entity =>
        {
            entity.ToTable("Tb_CoA_ProductsToMonographs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkMonographId).HasColumnName("LnkMonographID");
            entity.Property(e => e.LnkProductId).HasColumnName("LnkProductID");
        });

        modelBuilder.Entity<TbCoAQuestion>(entity =>
        {
            entity.ToTable("Tb_CoA_Questions");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.Encoded)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("FR");
            entity.Property(e => e.MasterParentId).HasColumnName("MasterParentID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("New Question");
            entity.Property(e => e.Notes)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.Specification)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("New Question");
        });

        modelBuilder.Entity<TbCoAQuestionsToMonograph>(entity =>
        {
            entity.ToTable("Tb_CoA_QuestionsToMonographs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkMonographId).HasColumnName("LnkMonographID");
            entity.Property(e => e.LnkQuestionId).HasColumnName("LnkQuestionID");
        });

        modelBuilder.Entity<TbCoATest>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Tb_CoA_Tests_New");

            entity.ToTable("Tb_CoA_Tests");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.BatchRef)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DisableComment)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.DisabledOn).HasColumnType("datetime");
            entity.Property(e => e.LockComment)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.LockedOn).HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.SampleDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TbCoATestAnswer>(entity =>
        {
            entity.ToTable("Tb_CoA_TestAnswers");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkQuestionId).HasColumnName("LnkQuestionID");
            entity.Property(e => e.LnkTestId).HasColumnName("LnkTestID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Result)
                .HasMaxLength(512)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbConfig>(entity =>
        {
            entity.ToTable("Tb_Config");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Value)
                .HasMaxLength(500)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbCountry>(entity =>
        {
            entity.ToTable("Tb_Countries");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e._2letter)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasColumnName("2Letter");
            entity.Property(e => e._3letter)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("3Letter");
        });

        modelBuilder.Entity<TbEnvironment>(entity =>
        {
            entity.ToTable("Tb_Environments");

            entity.HasIndex(e => e.ShortName, "UQ__Tb_Envir__A6160FD173A2482D").IsUnique();

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AscDbInstance)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ASC_DB_Instance");
            entity.Property(e => e.AscDbName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ASC_DB_Name");
            entity.Property(e => e.AscDbPassword)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("ASC_DB_Password");
            entity.Property(e => e.AscDbServer)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ASC_DB_Server");
            entity.Property(e => e.AscDbUser)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("ASC_DB_User");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.FullName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Notes)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ShortName)
                .HasMaxLength(10)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbEpr>(entity =>
        {
            entity.ToTable("Tb_EPRs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.RecycledContent).HasColumnType("decimal(7, 3)");
            entity.Property(e => e.Weight).HasColumnType("decimal(7, 3)");
        });

        modelBuilder.Entity<TbEprCategory>(entity =>
        {
            entity.ToTable("Tb_EPR_Categories");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbEprPackagingType>(entity =>
        {
            entity.ToTable("Tb_EPR_PackagingTypes");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbGoldVisionCoquery>(entity =>
        {
            entity.ToTable("Tb_Gold-Vision_COQuery");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CoId).HasColumnName("CO_ID");
        });

        modelBuilder.Entity<TbGoldVisionCoqueryFile>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Gold-Vision_COQuery_Files");

            entity.ToTable("Tb_Gold-Vision_COQuery_Files");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CoId).HasColumnName("CO_ID");
            entity.Property(e => e.CoaId).HasColumnName("COA_ID");
            entity.Property(e => e.FileSizeKb)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("FileSize(KB)");
        });

        modelBuilder.Entity<TbGoldVisionCoqueryRecip>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Gold-Vision_COQuery_Recip");

            entity.ToTable("Tb_Gold-Vision_COQuery_Recip");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CoId).HasColumnName("CO_ID");
            entity.Property(e => e.CorId).HasColumnName("COR_ID");
        });

        modelBuilder.Entity<TbGoldVisionHostedDomain>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Tb_Job30_HostedDomains");

            entity.ToTable("Tb_Gold-Vision_HostedDomains");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Domain)
                .HasMaxLength(1024)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TbGoldVisionLink>(entity =>
        {
            entity.ToTable("Tb_Gold-Vision_Links");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkUserId).HasColumnName("LnkUserID");
            entity.Property(e => e.LnkUsersUsId).HasColumnName("LnkUSERS_US_ID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TbHicsVersionInfo>(entity =>
        {
            entity.ToTable("Tb_HICS_VersionInfo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Heading)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.ReleaseNote)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Version)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbHoL>(entity =>
        {
            entity.ToTable("Tb_HoL");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TbLicencing>(entity =>
        {
            entity.ToTable("Tb_Licencing");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Key)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.LnkAssetId).HasColumnName("LnkAssetID");
            entity.Property(e => e.LnkDsvid).HasColumnName("LnkDSVID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Note)
                .HasMaxLength(500)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbLicencingDsv>(entity =>
        {
            entity.ToTable("Tb_Licencing_DSV");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Developer)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Software)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Version)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("");
        });

        modelBuilder.Entity<TbLocation>(entity =>
        {
            entity.ToTable("Tb_Locations");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AddressId).HasColumnName("AddressID");
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.Latitude).HasColumnType("decimal(25, 21)");
            entity.Property(e => e.Longitude).HasColumnType("decimal(25, 21)");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.ShortCode)
                .HasMaxLength(2)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbLog>(entity =>
        {
            entity.ToTable("Tb_Log");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Category)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Computer)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Environment)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Message)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Process)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Source)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("");
        });

        modelBuilder.Entity<TbLogArchive>(entity =>
        {
            entity.ToTable("Tb_Log_Archive");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Category)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Computer)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Environment)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Message)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Process)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Source)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.SourceCreatedOn).HasColumnType("datetime");
            entity.Property(e => e.SourceId).HasColumnName("SourceID");
        });

        modelBuilder.Entity<TbMessage>(entity =>
        {
            entity.ToTable("Tb_Messages");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Message).HasMaxLength(500);
            entity.Property(e => e.Read).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbMonComparison>(entity =>
        {
            entity.ToTable("Tb_Mon_Comparisons");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkTaskId).HasColumnName("LnkTaskID");
            entity.Property(e => e.Ref01).IsUnicode(false);
            entity.Property(e => e.Ref02).IsUnicode(false);
            entity.Property(e => e.Ref03).IsUnicode(false);
            entity.Property(e => e.Ref04).IsUnicode(false);
            entity.Property(e => e.Ref05).IsUnicode(false);
            entity.Property(e => e.Ref06).IsUnicode(false);
            entity.Property(e => e.Ref07).IsUnicode(false);
            entity.Property(e => e.Ref08).IsUnicode(false);
            entity.Property(e => e.Ref09).IsUnicode(false);
            entity.Property(e => e.Ref10).IsUnicode(false);
        });

        modelBuilder.Entity<TbMonEmail>(entity =>
        {
            entity.ToTable("Tb_Mon_Emails");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Bcc)
                .HasMaxLength(1024)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("BCC");
            entity.Property(e => e.Body).HasDefaultValue("<p>Message content missing</p>");
            entity.Property(e => e.Cc)
                .HasMaxLength(1024)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("CC");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkRunId).HasColumnName("LnkRunID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Processed).HasColumnType("datetime");
            entity.Property(e => e.Profile)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("Default");
            entity.Property(e => e.ReadyToSend).HasDefaultValue(true);
            entity.Property(e => e.Subject)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.To)
                .HasMaxLength(1024)
                .IsUnicode(false)
                .HasDefaultValue("support@hgcompany.co.uk");
        });

        modelBuilder.Entity<TbMonEmailAttachment>(entity =>
        {
            entity.ToTable("Tb_Mon_Email_Attachments");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.File).IsUnicode(false);
            entity.Property(e => e.LnkEmailId).HasColumnName("LnkEmailID");
            entity.Property(e => e.LnkRunId).HasColumnName("LnkRunID");
            entity.Property(e => e.LnkTaskId).HasColumnName("LnkTaskID");
        });

        modelBuilder.Entity<TbMonEmailItem>(entity =>
        {
            entity.ToTable("Tb_Mon_Email_Items");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkEmailId).HasColumnName("LnkEmailID");
            entity.Property(e => e.LnkRunId).HasColumnName("LnkRunID");
            entity.Property(e => e.LnkTaskId).HasColumnName("LnkTaskID");
            entity.Property(e => e.Ref).IsUnicode(false);
        });

        modelBuilder.Entity<TbMonRun>(entity =>
        {
            entity.ToTable("Tb_Mon_Runs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AgentId).HasColumnName("AgentID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.End).HasColumnType("datetime");
            entity.Property(e => e.Start).HasColumnType("datetime");
            entity.Property(e => e.TaskId).HasColumnName("TaskID");
        });

        modelBuilder.Entity<TbMonRunsArchive>(entity =>
        {
            entity.ToTable("Tb_Mon_Runs_Archive");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AgentId).HasColumnName("AgentID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.End).HasColumnType("datetime");
            entity.Property(e => e.SourceCreatedOn).HasColumnType("datetime");
            entity.Property(e => e.SourceId).HasColumnName("SourceID");
            entity.Property(e => e.Start).HasColumnType("datetime");
            entity.Property(e => e.TaskId).HasColumnName("TaskID");
        });

        modelBuilder.Entity<TbMonTask>(entity =>
        {
            entity.ToTable("Tb_Mon_Tasks");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AverageRunDuration).HasColumnType("decimal(15, 3)");
            entity.Property(e => e.Bcc)
                .HasMaxLength(512)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("BCC");
            entity.Property(e => e.Cc)
                .HasMaxLength(512)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("CC");
            entity.Property(e => e.Comment)
                .HasMaxLength(512)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LastRun).HasColumnType("datetime");
            entity.Property(e => e.LastRunDuration).HasColumnType("decimal(15, 3)");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.SqljobId).HasColumnName("SQLJobID");
            entity.Property(e => e.To)
                .HasMaxLength(512)
                .IsUnicode(false)
                .HasDefaultValue("");
        });

        modelBuilder.Entity<TbMonUsage>(entity =>
        {
            entity.ToTable("Tb_Mon_Usage");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Duration)
                .HasDefaultValue(0m)
                .HasColumnType("decimal(15, 5)");
            entity.Property(e => e.Name)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Query).IsUnicode(false);
            entity.Property(e => e.Type)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbOss>(entity =>
        {
            entity.ToTable("Tb_OSs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Developer)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Version)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbPermission>(entity =>
        {
            entity.ToTable("Tb_Permissions");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Ara).HasColumnName("ARA");
            entity.Property(e => e.Arc).HasComment("Archive adjustments");
            entity.Property(e => e.ArcR).HasComment("Archive adjustments, Reports");
            entity.Property(e => e.Ascavte)
                .HasComment("Access Supply Chain, Adjust vat table (Edit)")
                .HasColumnName("ASCAVTE");
            entity.Property(e => e.Ascavtv)
                .HasComment("Access Supply Chain, Adjust vat table (View only)")
                .HasColumnName("ASCAVTV");
            entity.Property(e => e.Ascbi)
                .HasComment("Access Supply Chain, Booking in")
                .HasColumnName("ASCBI");
            entity.Property(e => e.Ascdar).HasColumnName("ASCDAR");
            entity.Property(e => e.Ascdocs).HasColumnName("ASCDOCS");
            entity.Property(e => e.AscdocsBot).HasColumnName("ASCDOCS_BOT");
            entity.Property(e => e.AscdocsBu).HasColumnName("ASCDOCS_BU");
            entity.Property(e => e.Ascim)
                .HasDefaultValue(1)
                .HasComment("Access Supply Chain, Inactivate me")
                .HasColumnName("ASCIM");
            entity.Property(e => e.Asciu)
                .HasComment("Access Supply Chain, Inactivate users")
                .HasColumnName("ASCIU");
            entity.Property(e => e.Ascpme).HasColumnName("ASCPME");
            entity.Property(e => e.Ascpmv).HasColumnName("ASCPMV");
            entity.Property(e => e.Ascppm).HasColumnName("ASCPPM");
            entity.Property(e => e.Ascsbu).HasColumnName("ASCSBU");
            entity.Property(e => e.Ascvu).HasColumnName("ASCVU");
            entity.Property(e => e.Ascwedi).HasColumnName("ASCWEDI");
            entity.Property(e => e.AscwediSend).HasColumnName("ASCWEDI_Send");
            entity.Property(e => e.Cie).HasColumnName("CIE");
            entity.Property(e => e.Coaa)
                .HasComment("Certificate of Analysis, Administration")
                .HasColumnName("COAA");
            entity.Property(e => e.Coai)
                .HasComment("Certificate of Analysis, Input")
                .HasColumnName("COAI");
            entity.Property(e => e.CoaiD).HasColumnName("COAI_D");
            entity.Property(e => e.CoaiL)
                .HasComment("Certificate of Analysis, Input (Locked by)")
                .HasColumnName("COAI_L");
            entity.Property(e => e.CoaiT)
                .HasComment("Certificate of Analysis, Input (Tested by)")
                .HasColumnName("COAI_T");
            entity.Property(e => e.CoaiV)
                .HasComment("Certificate of Analysis, Input (Verified by)")
                .HasColumnName("COAI_V");
            entity.Property(e => e.Coap)
                .HasComment("Certificate of Analysis, Print")
                .HasColumnName("COAP");
            entity.Property(e => e.Coasr)
                .HasComment("Certificate of Analysis, Sent register")
                .HasColumnName("COASR");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Epra).HasColumnName("EPRA");
            entity.Property(e => e.Epri).HasColumnName("EPRI");
            entity.Property(e => e.HicsUm)
                .HasComment("To be deleted")
                .HasColumnName("HICS_UM");
            entity.Property(e => e.Itar)
                .HasComment("IT, Asset register")
                .HasColumnName("ITAR");
            entity.Property(e => e.Itara).HasColumnName("ITARA");
            entity.Property(e => e.Itmon).HasColumnName("ITMon");
            entity.Property(e => e.Its).HasColumnName("ITS");
            entity.Property(e => e.Itsr).HasColumnName("ITSR");
            entity.Property(e => e.Itup).HasColumnName("ITUP");
            entity.Property(e => e.LnkUserId).HasColumnName("LnkUserID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Msg).HasColumnName("MSG");
            entity.Property(e => e.Poa).HasColumnName("POA");
            entity.Property(e => e.Pop).HasColumnName("POP");
            entity.Property(e => e.Ppma)
                .HasComment("Planned Preventative Maintenance, Administration (Entities and Groups)")
                .HasColumnName("PPMA");
            entity.Property(e => e.Ppmi)
                .HasComment("Planned Preventative Maintenance, Input")
                .HasColumnName("PPMI");
            entity.Property(e => e.Ppmr)
                .HasComment("Planned Preventative Maintenance, Administration (Jobs and Tasks)")
                .HasColumnName("PPMR");
            entity.Property(e => e.Sra).HasColumnName("SRA");
            entity.Property(e => e.Sre).HasColumnName("SRE");
            entity.Property(e => e.Srlte).HasColumnName("SRLTE");
            entity.Property(e => e.Srltn).HasColumnName("SRLTN");
            entity.Property(e => e.Srltv).HasColumnName("SRLTV");
            entity.Property(e => e.Srv).HasColumnName("SRV");
            entity.Property(e => e.Vca).HasColumnName("VCA");
        });

        modelBuilder.Entity<TbPoUsersToNominal>(entity =>
        {
            entity.ToTable("Tb_PO_UsersToNominals");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.LnkUserId).HasColumnName("LnkUSerID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Nominal)
                .HasMaxLength(15)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbPpmFile>(entity =>
        {
            entity.ToTable("Tb_PPM_Files");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.FileName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.StoredAs)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.TypeId).HasColumnName("TypeID");
            entity.Property(e => e.TypeId2).HasColumnName("TypeID2");
            entity.Property(e => e.UploadedFrom)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbPpmGroup>(entity =>
        {
            entity.ToTable("Tb_PPM_Groups");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Colour)
                .HasMaxLength(11)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("New Group");
        });

        modelBuilder.Entity<TbPpmJob>(entity =>
        {
            entity.ToTable("Tb_PPM_Jobs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.Freq).HasDefaultValue(2);
            entity.Property(e => e.FreqValue).HasDefaultValue(1);
            entity.Property(e => e.LnkGroupId).HasColumnName("LnkGroupID");
            entity.Property(e => e.Location)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("New Job");
            entity.Property(e => e.StartDate).HasDefaultValueSql("(getdate())");
        });

        modelBuilder.Entity<TbPpmJobAsset>(entity =>
        {
            entity.ToTable("Tb_PPM_JobAssets");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.LnkAssetId).HasColumnName("LnkAssetID");
            entity.Property(e => e.LnkJobId).HasColumnName("LnkJobID");
            entity.Property(e => e.Location)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<TbPpmScheduleJob>(entity =>
        {
            entity.ToTable("Tb_PPM_ScheduleJobs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ClosedOn).HasColumnType("datetime");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.LnkGroupId).HasColumnName("LnkGroupID");
            entity.Property(e => e.LnkJobId).HasColumnName("LnkJobID");
            entity.Property(e => e.Location)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Notes)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.OriginalSchedule).HasColumnType("datetime");
            entity.Property(e => e.Schedule).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbPpmScheduleTask>(entity =>
        {
            entity.ToTable("Tb_PPM_ScheduleTasks");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ClosedOn).HasColumnType("datetime");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.LnkJobAssetId).HasColumnName("LnkJobAssetID");
            entity.Property(e => e.LnkScheduleJobId).HasColumnName("LnkScheduleJobID");
            entity.Property(e => e.LnkTaskId).HasColumnName("LnkTaskID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Notes)
                .HasMaxLength(512)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbPpmTask>(entity =>
        {
            entity.ToTable("Tb_PPM_Tasks");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.LnkJobId).HasColumnName("LnkJobID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("New Task");
        });

        modelBuilder.Entity<TbPpmUsersToGroup>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Tb_PPM_UserToGroups");

            entity.ToTable("Tb_PPM_UsersToGroups");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkGroupId).HasColumnName("LnkGroupID");
            entity.Property(e => e.LnkUserId).HasColumnName("LnkUserID");
        });

        modelBuilder.Entity<TbPrinterLog>(entity =>
        {
            entity.ToTable("Tb_PrinterLog");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.EventRecId).HasColumnName("EventRecID");
            entity.Property(e => e.LnkAssetIdFrom).HasColumnName("LnkAssetID_From");
            entity.Property(e => e.LnkAssetIdTo).HasColumnName("LnkAssetID_To");
            entity.Property(e => e.LnkUserIdBy).HasColumnName("LnkUserID_By");
            entity.Property(e => e.Note)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.PrintTime).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbSbiDatum>(entity =>
        {
            entity.ToTable("Tb_SBI_Data");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Analysis1)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Analysis10)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Analysis2)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Analysis3)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Analysis4)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Analysis5)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Analysis6)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Analysis7)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Analysis8)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Analysis9)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Customer)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.LnkHeaderId).HasColumnName("LnkHeaderID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.P10quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P10Quantity");
            entity.Property(e => e.P10value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P10Value");
            entity.Property(e => e.P11quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P11Quantity");
            entity.Property(e => e.P11value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P11Value");
            entity.Property(e => e.P12quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P12Quantity");
            entity.Property(e => e.P12value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P12Value");
            entity.Property(e => e.P13quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P13Quantity");
            entity.Property(e => e.P13value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P13Value");
            entity.Property(e => e.P1quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P1Quantity");
            entity.Property(e => e.P1value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P1Value");
            entity.Property(e => e.P2quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P2Quantity");
            entity.Property(e => e.P2value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P2Value");
            entity.Property(e => e.P3quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P3Quantity");
            entity.Property(e => e.P3value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P3Value");
            entity.Property(e => e.P4quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P4Quantity");
            entity.Property(e => e.P4value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P4Value");
            entity.Property(e => e.P5quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P5Quantity");
            entity.Property(e => e.P5value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P5Value");
            entity.Property(e => e.P6quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P6Quantity");
            entity.Property(e => e.P6value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P6Value");
            entity.Property(e => e.P7quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P7Quantity");
            entity.Property(e => e.P7value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P7Value");
            entity.Property(e => e.P8quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P8Quantity");
            entity.Property(e => e.P8value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P8Value");
            entity.Property(e => e.P9quantity)
                .HasColumnType("decimal(15, 5)")
                .HasColumnName("P9Quantity");
            entity.Property(e => e.P9value)
                .HasColumnType("decimal(18, 5)")
                .HasColumnName("P9Value");
            entity.Property(e => e.Part)
                .HasMaxLength(16)
                .IsUnicode(false);
            entity.Property(e => e.Scuser)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("SCUser");
            entity.Property(e => e.Year)
                .HasMaxLength(2)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbSbiHeader>(entity =>
        {
            entity.ToTable("Tb_SBI_Header");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Imported).HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Stagged).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbScOrderAudit>(entity =>
        {
            entity.ToTable("Tb_SC_Order_Audit");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Delivered).HasColumnType("datetime");
            entity.Property(e => e.DeliveryDate).HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.QuantityOrdered).HasColumnType("decimal(15, 5)");
            entity.Property(e => e.ReqdDespatchDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbScOrderAuditMonitor>(entity =>
        {
            entity.ToTable("Tb_SC_Order_Audit_Monitor");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Delivered).HasColumnType("datetime");
            entity.Property(e => e.DeliveryDate).HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.QuantityOrdered).HasColumnType("decimal(15, 5)");
            entity.Property(e => e.ReqdDespatchDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TbScPart>(entity =>
        {
            entity.ToTable("Tb_SC_Parts");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.GroupedBarcode)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.LnkPartId).HasColumnName("LnkPartID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.PrintedLotNumberPosition)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.UnitBarcode)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbScPartsAudit>(entity =>
        {
            entity.ToTable("Tb_SC_Parts_Audit");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Field)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.From)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Part)
                .HasMaxLength(35)
                .IsUnicode(false);
            entity.Property(e => e.To)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbSim>(entity =>
        {
            entity.ToTable("Tb_SIMs");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.Mobile)
                .HasMaxLength(13)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Note)
                .HasMaxLength(512)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Sim)
                .HasMaxLength(19)
                .IsUnicode(false)
                .HasColumnName("SIM");
        });

        modelBuilder.Entity<TbSr>(entity =>
        {
            entity.ToTable("Tb_SR");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AdditionalRef)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.BondedState)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.CancelledComment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.CancelledOn).HasColumnType("datetime");
            entity.Property(e => e.ClosedOn).HasColumnType("datetime");
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Level1).HasDefaultValue(0);
            entity.Property(e => e.Level2).HasDefaultValue(0);
            entity.Property(e => e.Level3).HasDefaultValue(0);
            entity.Property(e => e.Level4).HasDefaultValue(0);
            entity.Property(e => e.Level5).HasDefaultValue(0);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Sample).HasDefaultValue(1);
        });

        modelBuilder.Entity<TbSrAudit>(entity =>
        {
            entity.ToTable("Tb_SR_Audit");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Area)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FromDescription)
                .IsUnicode(false)
                .HasColumnName("From_Description");
            entity.Property(e => e.FromValue).HasColumnName("From_Value");
            entity.Property(e => e.ItemDescription)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("Item_Description");
            entity.Property(e => e.ItemValue).HasColumnName("Item_Value");
            entity.Property(e => e.Sr).HasColumnName("SR");
            entity.Property(e => e.ToDescription)
                .IsUnicode(false)
                .HasColumnName("To_Description");
            entity.Property(e => e.ToValue).HasColumnName("To_Value");
        });

        modelBuilder.Entity<TbSrList>(entity =>
        {
            entity.ToTable("Tb_SR_Lists");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Type)
                .HasMaxLength(1)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbSrListItem>(entity =>
        {
            entity.ToTable("Tb_SR_List_Items");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Value)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbSrNosing>(entity =>
        {
            entity.ToTable("Tb_SR_Nosings");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Sr).HasColumnName("SR");
        });

        modelBuilder.Entity<TbSrTest>(entity =>
        {
            entity.ToTable("Tb_SR_Tests");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LockedOn).HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Sr).HasColumnName("SR");
        });

        modelBuilder.Entity<TbSrTestResult>(entity =>
        {
            entity.ToTable("Tb_SR_Test_Results");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Result)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbSrTestType>(entity =>
        {
            entity.ToTable("Tb_SR_Test_Types");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbSrType>(entity =>
        {
            entity.ToTable("Tb_SR_Types");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AppendNumber).HasDefaultValue(true);
            entity.Property(e => e.CanSupersede).HasDefaultValue(true);
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.DestinationCus).HasColumnName("DestinationCUS");
            entity.Property(e => e.DestinationPo).HasColumnName("DestinationPO");
            entity.Property(e => e.DestinationSup).HasColumnName("DestinationSUP");
            entity.Property(e => e.DestinationVat).HasColumnName("DestinationVAT");
            entity.Property(e => e.DestinationWo).HasColumnName("DestinationWO");
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.Gmp).HasColumnName("GMP");
            entity.Property(e => e.Label)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ReqTesting).HasDefaultValue(true);
            entity.Property(e => e.SourceCus).HasColumnName("SourceCUS");
            entity.Property(e => e.SourcePo).HasColumnName("SourcePO");
            entity.Property(e => e.SourceSup).HasColumnName("SourceSUP");
            entity.Property(e => e.SourceVat).HasColumnName("SourceVAT");
            entity.Property(e => e.SourceWo).HasColumnName("SourceWO");
            entity.Property(e => e.Version).HasDefaultValue(1);
        });

        modelBuilder.Entity<TbSrTypeLink>(entity =>
        {
            entity.ToTable("Tb_SR_TypeLinks");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
        });

        modelBuilder.Entity<TbSupplyChainLink>(entity =>
        {
            entity.ToTable("Tb_SupplyChain_Links");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkSysPeoplePpCode)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("LnkSYS_PEOPLE_PP_CODE");
            entity.Property(e => e.LnkUserId).HasColumnName("LnkUserID");
        });

        modelBuilder.Entity<TbTransportDatum>(entity =>
        {
            entity.ToTable("Tb_TransportData");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CollectionAddr1)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection Addr 1");
            entity.Property(e => e.CollectionAddr2)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection Addr 2");
            entity.Property(e => e.CollectionAddr3)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection Addr 3");
            entity.Property(e => e.CollectionContact)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection Contact");
            entity.Property(e => e.CollectionCountry)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection Country");
            entity.Property(e => e.CollectionCounty)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection County");
            entity.Property(e => e.CollectionDate)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Collection Date");
            entity.Property(e => e.CollectionName)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection Name");
            entity.Property(e => e.CollectionNotes)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection Notes");
            entity.Property(e => e.CollectionPostCode)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection PostCode");
            entity.Property(e => e.CollectionTelephone)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection Telephone");
            entity.Property(e => e.CollectionTime)
                .HasMaxLength(5)
                .IsUnicode(false)
                .HasColumnName("Collection Time");
            entity.Property(e => e.CollectionTown)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Collection Town");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CustPaperwork)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("Cust Paperwork");
            entity.Property(e => e.CustomerRef)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Customer Ref");
            entity.Property(e => e.DelEmail)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Del Email");
            entity.Property(e => e.DelMobile)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Del Mobile");
            entity.Property(e => e.DelNotes)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Del Notes");
            entity.Property(e => e.DelPhone)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Del Phone");
            entity.Property(e => e.DelTime)
                .HasMaxLength(5)
                .IsUnicode(false)
                .HasColumnName("Del Time");
            entity.Property(e => e.DeliveryAddress1)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Delivery Address 1");
            entity.Property(e => e.DeliveryAddress2)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Delivery Address 2");
            entity.Property(e => e.DeliveryAddress3)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Delivery Address 3");
            entity.Property(e => e.DeliveryContact)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Delivery Contact");
            entity.Property(e => e.DeliveryCountry)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Delivery Country");
            entity.Property(e => e.DeliveryCounty)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Delivery County");
            entity.Property(e => e.DeliveryDate)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Delivery Date");
            entity.Property(e => e.DeliveryName)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Delivery Name");
            entity.Property(e => e.DeliveryPostCode)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Delivery PostCode");
            entity.Property(e => e.DeliveryTown)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Delivery Town");
            entity.Property(e => e.Filename)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.GoodsDesc)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Goods Desc");
            entity.Property(e => e.HazPackin)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Haz Packin");
            entity.Property(e => e.HazQuantity)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Haz Quantity");
            entity.Property(e => e.HazTunnelCode)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("Haz Tunnel Code");
            entity.Property(e => e.HazWeigh)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Haz Weigh");
            entity.Property(e => e.JobType)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Job Type");
            entity.Property(e => e.OrderNum)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.PalletTypeA)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Pallet Type A");
            entity.Property(e => e.PalletTypeB)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Pallet Type B");
            entity.Property(e => e.PalletTypeBWeight)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Pallet Type B Weight");
            entity.Property(e => e.PalletTypeC)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Pallet Type C");
            entity.Property(e => e.PalletTypeCWeight)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Pallet Type C Weight");
            entity.Property(e => e.Part)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.SentOn).HasColumnType("datetime");
            entity.Property(e => e.ServiceCode)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Service Code");
            entity.Property(e => e.Surcharges)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.TypeAQuantity)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Type A Quantity");
            entity.Property(e => e.TypeAWeight)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Type A Weight");
            entity.Property(e => e.TypeBQuantity)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Type B Quantity");
            entity.Property(e => e.TypeCQuantity)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("Type C Quantity");
            entity.Property(e => e.UnNo)
                .HasMaxLength(4)
                .IsUnicode(false)
                .HasColumnName("UN No.");
            entity.Property(e => e.Volume)
                .HasMaxLength(250)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TbUser>(entity =>
        {
            entity.ToTable("Tb_Users");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AdcreatedOn)
                .HasColumnType("datetime")
                .HasColumnName("ADCreatedOn");
            entity.Property(e => e.Addisabled).HasColumnName("ADDisabled");
            entity.Property(e => e.Adguid)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ADGUID");
            entity.Property(e => e.Adusername)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("ADUsername");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Department)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.DistinguishedManager)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.DistinguishedName)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.Email)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.Forenames)
                .HasMaxLength(512)
                .IsUnicode(false)
                .HasDefaultValue("Unknown");
            entity.Property(e => e.Gvguid)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("GVGUID");
            entity.Property(e => e.LastOnline).HasColumnType("datetime");
            entity.Property(e => e.LockedOn).HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Office)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
            entity.Property(e => e.OpenedCount).HasDefaultValue(0);
            entity.Property(e => e.OpenedLast).HasColumnType("datetime");
            entity.Property(e => e.PArFilterAdd)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("P_AR_FilterAdd");
            entity.Property(e => e.PArFilterStatus).HasColumnName("P_AR_FilterStatus");
            entity.Property(e => e.PArFilterSupplier).HasColumnName("P_AR_FilterSupplier");
            entity.Property(e => e.PArFilterType)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("P_AR_FilterType");
            entity.Property(e => e.PArIncludeDisabled).HasColumnName("P_AR_IncludeDisabled");
            entity.Property(e => e.PArOrderBy)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("P_AR_OrderBy");
            entity.Property(e => e.PArOrderDirection).HasColumnName("P_AR_OrderDirection");
            entity.Property(e => e.PAraMineOnly).HasColumnName("P_ARA_MineOnly");
            entity.Property(e => e.PBiPrinter)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("P_BI_Printer");
            entity.Property(e => e.PCoAiFontSize)
                .HasDefaultValue(1)
                .HasColumnName("P_CoAI_FontSize");
            entity.Property(e => e.PCoAiSortOrder)
                .HasDefaultValue(10)
                .HasColumnName("P_CoAI_SortOrder");
            entity.Property(e => e.PDocsLastSearch)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("P_DOCS_LastSearch");
            entity.Property(e => e.PItarActiveOnly).HasColumnName("P_ITAR_ActiveOnly");
            entity.Property(e => e.PItarOrderBy)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("P_ITAR_OrderBy");
            entity.Property(e => e.PItarOrderDirection).HasColumnName("P_ITAR_OrderDirection");
            entity.Property(e => e.PLastButton)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("P_LastButton");
            entity.Property(e => e.PLastEnvironment)
                .HasDefaultValue(0)
                .HasColumnName("P_LastEnvironment");
            entity.Property(e => e.PLastPage)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("")
                .HasColumnName("P_LastPage");
            entity.Property(e => e.PPmHidePhantomised).HasColumnName("P_PM_HidePhantomised");
            entity.Property(e => e.PSbuSkipProductChecks)
                .HasDefaultValue(0)
                .HasColumnName("P_SBU_SkipProductChecks");
            entity.Property(e => e.PSrHideClosed).HasColumnName("P_SR_HideClosed");
            entity.Property(e => e.PSrHideSuperseded).HasColumnName("P_SR_HideSuperseded");
            entity.Property(e => e.PSrOnlyMe)
                .HasDefaultValue(0)
                .HasColumnName("P_SR_OnlyMe");
            entity.Property(e => e.PSrOrderBy)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("P_SR_OrderBy");
            entity.Property(e => e.PSrOrderDirection).HasColumnName("P_SR_OrderDirection");
            entity.Property(e => e.PSrPrinter)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("P_SR_Printer");
            entity.Property(e => e.PSrThisYearOnly).HasColumnName("P_SR_ThisYearOnly");
            entity.Property(e => e.PSrltIncludeCompleted).HasColumnName("P_SRLT_IncludeCompleted");
            entity.Property(e => e.PWediSearchInData)
                .HasDefaultValue(true)
                .HasColumnName("P_WEDI_SearchInData");
            entity.Property(e => e.PWediSortOrder).HasColumnName("P_WEDI_SortOrder");
            entity.Property(e => e.PoApprover).HasColumnName("PO_Approver");
            entity.Property(e => e.PoCanRaise).HasColumnName("PO_CanRaise");
            entity.Property(e => e.PoLimit).HasColumnName("PO_Limit");
            entity.Property(e => e.Surname)
                .HasMaxLength(512)
                .IsUnicode(false)
                .HasDefaultValue("Unknown");
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
        });

        modelBuilder.Entity<TbVcState>(entity =>
        {
            entity.ToTable("Tb_VC_States");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkValveId).HasColumnName("LnkValveID");
            entity.Property(e => e.Source)
                .HasMaxLength(128)
                .IsUnicode(false)
                .HasDefaultValue("");
        });

        modelBuilder.Entity<TbVcValf>(entity =>
        {
            entity.ToTable("Tb_VC_Valves");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.LnkVatId).HasColumnName("LnkVatID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("");
        });

        modelBuilder.Entity<TbVcVat>(entity =>
        {
            entity.ToTable("Tb_VC_Vats");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.Enabled).HasDefaultValue(true);
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValue("New vat");
        });

        modelBuilder.Entity<TbViDatum>(entity =>
        {
            entity.ToTable("Tb_VI_Data");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ActCost1).HasColumnType("money");
            entity.Property(e => e.ActCost10).HasColumnType("money");
            entity.Property(e => e.ActCost11).HasColumnType("money");
            entity.Property(e => e.ActCost12).HasColumnType("money");
            entity.Property(e => e.ActCost2).HasColumnType("money");
            entity.Property(e => e.ActCost3).HasColumnType("money");
            entity.Property(e => e.ActCost4).HasColumnType("money");
            entity.Property(e => e.ActCost5).HasColumnType("money");
            entity.Property(e => e.ActCost6).HasColumnType("money");
            entity.Property(e => e.ActCost7).HasColumnType("money");
            entity.Property(e => e.ActCost8).HasColumnType("money");
            entity.Property(e => e.ActCost9).HasColumnType("money");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LnkHeaderId).HasColumnName("LnkHeaderID");
            entity.Property(e => e.LnkId).HasColumnName("LnkID");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ProdGrp).HasMaxLength(255);
            entity.Property(e => e.StdCost).HasColumnType("money");
        });

        modelBuilder.Entity<TbViHeader>(entity =>
        {
            entity.ToTable("Tb_VI_Header");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CreatedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Imported).HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Stagged).HasColumnType("datetime");
        });

        modelBuilder.Entity<VwHicsCoAMonograph>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_CoA_Monographs");

            entity.Property(e => e.ConformanceStatement)
                .HasMaxLength(1024)
                .IsUnicode(false);
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(1026)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.MasterParentId).HasColumnName("MasterParentID");
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(1026)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.ShortName)
                .HasMaxLength(15)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwHicsCoAPrintMap>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_CoA_PrintMap");

            entity.Property(e => e.CreatedByFullName)
                .HasMaxLength(1026)
                .IsUnicode(false)
                .HasColumnName("CreatedBy_FullName");
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.DeletedOn).HasColumnType("datetime");
            entity.Property(e => e.Filename)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.LnkMonographId).HasColumnName("LnkMonographID");
        });

        modelBuilder.Entity<VwHicsCoAQuestion>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_CoA_Questions");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(1026)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Encoded)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(1026)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Notes)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Specification)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwHicsCoATestAnswer>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_CoA_TestAnswers");

            entity.Property(e => e.CreatedBy)
                .HasMaxLength(1026)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.LnkQuestionId).HasColumnName("LnkQuestionID");
            entity.Property(e => e.LnkTestId).HasColumnName("LnkTestID");
            entity.Property(e => e.ModifiedBy)
                .HasMaxLength(1026)
                .IsUnicode(false);
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Result)
                .HasMaxLength(512)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwHicsEpr>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_EPRs");

            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.RecycledContent).HasColumnType("decimal(7, 3)");
            entity.Property(e => e.Weight).HasColumnType("decimal(7, 3)");
        });

        modelBuilder.Entity<VwHicsLog>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_Log");

            entity.Property(e => e.Category)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Computer)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Environment)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.Message)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Process)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Source)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwHicsRepAsclicenceCheck>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_Rep_ASCLicenceCheck");

            entity.Property(e => e.Dts)
                .HasColumnType("datetime")
                .HasColumnName("DTS");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
        });

        modelBuilder.Entity<VwHicsRepCaptureImport>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_Rep_Capture_Import");

            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.Item)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Pdffound)
                .HasColumnType("datetime")
                .HasColumnName("PDFFound");
            entity.Property(e => e.Pdfgone)
                .HasColumnType("datetime")
                .HasColumnName("PDFGone");
            entity.Property(e => e.Pdfsent)
                .HasColumnType("datetime")
                .HasColumnName("PDFSent");
            entity.Property(e => e.PirentryFound)
                .HasColumnType("datetime")
                .HasColumnName("PIREntryFound");
            entity.Property(e => e.Type)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Xmlfound)
                .HasColumnType("datetime")
                .HasColumnName("XMLFound");
            entity.Property(e => e.Xmlgone)
                .HasColumnType("datetime")
                .HasColumnName("XMLGone");
            entity.Property(e => e.Xmlsent)
                .HasColumnType("datetime")
                .HasColumnName("XMLSent");
        });

        modelBuilder.Entity<VwHicsRepCoAQuestionAnswer>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_Rep_CoA_QuestionAnswers");

            entity.Property(e => e.Question)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Result)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.ResultDateTime).HasColumnType("datetime");
            entity.Property(e => e.Specification)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwHicsRepLocation>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_Rep_Locations");

            entity.Property(e => e.Address)
                .HasMaxLength(614)
                .IsUnicode(false);
            entity.Property(e => e.AddressId).HasColumnName("AddressID");
            entity.Property(e => e.AddressShortCode)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Comment)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.FullName)
                .HasMaxLength(508)
                .IsUnicode(false);
            entity.Property(e => e.FullShortCode)
                .HasMaxLength(12)
                .IsUnicode(false);
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Latitude).HasColumnType("decimal(25, 21)");
            entity.Property(e => e.Longitude).HasColumnType("decimal(25, 21)");
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.ShortCode)
                .HasMaxLength(2)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwHicsRepLog>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_Rep_Log");

            entity.Property(e => e.Category)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Computer)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Environment)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.FullName)
                .HasMaxLength(1026)
                .IsUnicode(false);
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Message)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Process)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Source)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwHicsRepTransportDatum>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_Rep_TransportData");

            entity.Property(e => e.AccountCode)
                .HasMaxLength(14)
                .IsUnicode(false)
                .HasColumnName("Account Code");
            entity.Property(e => e.CollectionAddr1)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection Addr 1");
            entity.Property(e => e.CollectionAddr2)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection Addr 2");
            entity.Property(e => e.CollectionAddr3)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection Addr 3");
            entity.Property(e => e.CollectionContact)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection Contact");
            entity.Property(e => e.CollectionCountry)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection Country");
            entity.Property(e => e.CollectionCounty)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection County");
            entity.Property(e => e.CollectionDate)
                .HasMaxLength(17)
                .IsUnicode(false)
                .HasColumnName("Collection Date");
            entity.Property(e => e.CollectionName)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection Name");
            entity.Property(e => e.CollectionNotes)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection Notes");
            entity.Property(e => e.CollectionPostCode)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection PostCode");
            entity.Property(e => e.CollectionTelephone)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection Telephone");
            entity.Property(e => e.CollectionTime)
                .HasMaxLength(17)
                .IsUnicode(false)
                .HasColumnName("Collection Time");
            entity.Property(e => e.CollectionTown)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Collection Town");
            entity.Property(e => e.CustPaperwork)
                .HasMaxLength(16)
                .IsUnicode(false)
                .HasColumnName("Cust Paperwork");
            entity.Property(e => e.CustomerRef)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Customer Ref");
            entity.Property(e => e.DelEmail)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Del Email");
            entity.Property(e => e.DelMobile)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Del Mobile");
            entity.Property(e => e.DelNotes)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Del Notes");
            entity.Property(e => e.DelPhone)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Del Phone");
            entity.Property(e => e.DelTime)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Del Time");
            entity.Property(e => e.DeliveryAddress1)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Delivery Address 1");
            entity.Property(e => e.DeliveryAddress2)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Delivery Address 2");
            entity.Property(e => e.DeliveryAddress3)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Delivery Address 3");
            entity.Property(e => e.DeliveryContact)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Delivery Contact");
            entity.Property(e => e.DeliveryCountry)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Delivery Country");
            entity.Property(e => e.DeliveryCounty)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Delivery County");
            entity.Property(e => e.DeliveryDate)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("Delivery Date");
            entity.Property(e => e.DeliveryName)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Delivery Name");
            entity.Property(e => e.DeliveryPostCode)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Delivery PostCode");
            entity.Property(e => e.DeliveryTown)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Delivery Town");
            entity.Property(e => e.GoodsDesc)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Goods Desc");
            entity.Property(e => e.HazPackin)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Haz Packin");
            entity.Property(e => e.HazQuantity)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Haz Quantity");
            entity.Property(e => e.HazTunnelCode)
                .HasMaxLength(17)
                .IsUnicode(false)
                .HasColumnName("Haz Tunnel Code");
            entity.Property(e => e.HazWeigh)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Haz Weigh");
            entity.Property(e => e.JobType)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Job Type");
            entity.Property(e => e.PalletTypeA)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Pallet Type A");
            entity.Property(e => e.PalletTypeB)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Pallet Type B");
            entity.Property(e => e.PalletTypeBWeight)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Pallet Type B Weight");
            entity.Property(e => e.PalletTypeC)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Pallet Type C");
            entity.Property(e => e.PalletTypeCWeight)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Pallet Type C Weight");
            entity.Property(e => e.ServiceCode)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Service Code");
            entity.Property(e => e.Surcharges)
                .HasMaxLength(252)
                .IsUnicode(false);
            entity.Property(e => e.TypeAQuantity)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Type A Quantity");
            entity.Property(e => e.TypeAWeight)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Type A Weight");
            entity.Property(e => e.TypeBQuantity)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Type B Quantity");
            entity.Property(e => e.TypeCQuantity)
                .HasMaxLength(252)
                .IsUnicode(false)
                .HasColumnName("Type C Quantity");
            entity.Property(e => e.UnNo)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("UN No.");
            entity.Property(e => e.Volume)
                .HasMaxLength(252)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwHicsRepUser>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_Rep_Users");

            entity.Property(e => e.AdcreatedOn)
                .HasColumnType("datetime")
                .HasColumnName("ADCreatedOn");
            entity.Property(e => e.Addisabled).HasColumnName("ADDisabled");
            entity.Property(e => e.Adusername)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("ADUsername");
            entity.Property(e => e.CanRaisePos).HasColumnName("CanRaisePOs");
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Department)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Domain)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.Forenames)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.FullName)
                .HasMaxLength(1026)
                .IsUnicode(false);
            entity.Property(e => e.HicsLastButton)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("HICS_LastButton");
            entity.Property(e => e.HicsLastOnline)
                .HasColumnType("datetime")
                .HasColumnName("HICS_LastOnline");
            entity.Property(e => e.HicsLastOpened)
                .HasColumnType("datetime")
                .HasColumnName("HICS_LastOpened");
            entity.Property(e => e.HicsLastPage)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("HICS_LastPage");
            entity.Property(e => e.HicsOnline).HasColumnName("HICS_Online");
            entity.Property(e => e.HicsOpenedCount).HasColumnName("HICS_OpenedCount");
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.LockedOn).HasColumnType("datetime");
            entity.Property(e => e.ManagerFullName)
                .HasMaxLength(1026)
                .IsUnicode(false)
                .HasColumnName("Manager_FullName");
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Office)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Poapprover).HasColumnName("POApprover");
            entity.Property(e => e.PoapproverFullName)
                .HasMaxLength(1026)
                .IsUnicode(false)
                .HasColumnName("POApprover_FullName");
            entity.Property(e => e.Polimit).HasColumnName("POLimit");
            entity.Property(e => e.Surname)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Username)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwHicsRepVcValf>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_Rep_VC_Valves");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Type)
                .HasMaxLength(12)
                .IsUnicode(false);
            entity.Property(e => e.VatId).HasColumnName("VatID");
            entity.Property(e => e.VatName)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwHicsSupplyChainUserLink>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_SupplyChainUserLinks");

            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.LnkSysPeoplePpCode)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("LnkSYS_PEOPLE_PP_CODE");
            entity.Property(e => e.LnkUserId).HasColumnName("LnkUserID");
        });

        modelBuilder.Entity<VwHicsUser>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_HICS_Users");

            entity.Property(e => e.AdcreatedOn)
                .HasColumnType("datetime")
                .HasColumnName("ADCreatedOn");
            entity.Property(e => e.Addisabled).HasColumnName("ADDisabled");
            entity.Property(e => e.Adusername)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("ADUsername");
            entity.Property(e => e.CanRaisePos).HasColumnName("CanRaisePOs");
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");
            entity.Property(e => e.Department)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Domain)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.Forenames)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.FullName)
                .HasMaxLength(1026)
                .IsUnicode(false);
            entity.Property(e => e.HicsLastButton)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("HICS_LastButton");
            entity.Property(e => e.HicsLastOnline)
                .HasColumnType("datetime")
                .HasColumnName("HICS_LastOnline");
            entity.Property(e => e.HicsLastOpened)
                .HasColumnType("datetime")
                .HasColumnName("HICS_LastOpened");
            entity.Property(e => e.HicsLastPage)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("HICS_LastPage");
            entity.Property(e => e.HicsOnline).HasColumnName("HICS_Online");
            entity.Property(e => e.HicsOpenedCount).HasColumnName("HICS_OpenedCount");
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
            entity.Property(e => e.LockedOn).HasColumnType("datetime");
            entity.Property(e => e.ModifiedOn).HasColumnType("datetime");
            entity.Property(e => e.Office)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Poapprover).HasColumnName("POApprover");
            entity.Property(e => e.Polimit).HasColumnName("POLimit");
            entity.Property(e => e.Surname)
                .HasMaxLength(512)
                .IsUnicode(false);
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Username)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwMatrixStockRegisterType>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_Matrix_StockRegister_Types");

            entity.Property(e => e.Code)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("ID");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
