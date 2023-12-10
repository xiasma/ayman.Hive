using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsCoAQuestion
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public string? ModifiedBy { get; set; }

    public bool Enabled { get; set; }

    public string Name { get; set; } = null!;

    public string? Notes { get; set; }

    public string Specification { get; set; } = null!;

    public string Encoded { get; set; } = null!;

    public bool Redundant { get; set; }
}
