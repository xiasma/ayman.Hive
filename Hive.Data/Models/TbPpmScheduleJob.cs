using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbPpmScheduleJob
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public int LnkGroupId { get; set; }

    public string Name { get; set; } = null!;

    public string Location { get; set; } = null!;

    public int LnkJobId { get; set; }

    public bool ReqDoc { get; set; }

    public string? Notes { get; set; }

    public DateTime OriginalSchedule { get; set; }

    public DateTime Schedule { get; set; }

    public bool Closed { get; set; }

    public DateTime? ClosedOn { get; set; }

    public int? ClosedBy { get; set; }
}
