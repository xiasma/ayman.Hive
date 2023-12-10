using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbArBsm
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public bool Enabled { get; set; }

    public int BsmtypeId { get; set; }

    public string Brand { get; set; } = null!;

    public string? Series { get; set; }

    public string? Model { get; set; }

    public string? Comment { get; set; }

    public bool ShowDellEsc { get; set; }

    public bool ShowDellPpid { get; set; }

    public bool ShowDellSt { get; set; }

    public bool ShowEid { get; set; }

    public bool ShowHasDongle { get; set; }

    public bool ShowImei1 { get; set; }

    public bool ShowImei2 { get; set; }

    public bool ShowLabelPrinter { get; set; }

    public bool ShowMac { get; set; }

    public bool ShowModelRef { get; set; }

    public bool ShowName { get; set; }

    public bool ShowOs { get; set; }

    public bool ShowPrinterName { get; set; }

    public bool ShowSim { get; set; }

    public bool ToolAddisabled { get; set; }

    public bool ToolCShare { get; set; }

    public bool ToolOnlineStatus { get; set; }

    public bool ToolDellSupport { get; set; }

    public bool ToolWebsite { get; set; }
}
