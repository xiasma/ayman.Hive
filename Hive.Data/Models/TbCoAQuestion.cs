using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCoAQuestion
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Enabled { get; set; }

    public int? ParentId { get; set; }

    public int? MasterParentId { get; set; }

    public string Name { get; set; } = null!;

    public string? Notes { get; set; }

    public string Specification { get; set; } = null!;

    public string Encoded { get; set; } = null!;

    public bool Redundant { get; set; }
}
