using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsCoAMonograph
{
    public DateTime CreatedOn { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public string? ModifiedBy { get; set; }

    public int Id { get; set; }

    public bool Enabled { get; set; }

    public int Version { get; set; }

    public int ParentId { get; set; }

    public int MasterParentId { get; set; }

    public string Name { get; set; } = null!;

    public string ShortName { get; set; } = null!;

    public string? Description { get; set; }

    public string? ConformanceStatement { get; set; }

    public int TimesUsed { get; set; }
}
