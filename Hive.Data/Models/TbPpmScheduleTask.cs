using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbPpmScheduleTask
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public int LnkScheduleJobId { get; set; }

    public int LnkTaskId { get; set; }

    public int Type { get; set; }

    public string Name { get; set; } = null!;

    public int? LnkJobAssetId { get; set; }

    public int Position { get; set; }

    public bool ReqDoc { get; set; }

    public string? Notes { get; set; }

    public bool Closed { get; set; }

    public DateTime? ClosedOn { get; set; }

    public int? ClosedBy { get; set; }
}
