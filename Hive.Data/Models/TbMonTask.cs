using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbMonTask
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public Guid SqljobId { get; set; }

    public string Comment { get; set; } = null!;

    public string To { get; set; } = null!;

    public string Cc { get; set; } = null!;

    public string Bcc { get; set; } = null!;

    public DateTime? LastRun { get; set; }

    public int? LastStatus { get; set; }

    public int? Runs { get; set; }

    public int? Emails { get; set; }

    public decimal? LastRunDuration { get; set; }

    public decimal? AverageRunDuration { get; set; }
}
