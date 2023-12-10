using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCoAMonograph
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Enabled { get; set; }

    public int Version { get; set; }

    public int? ParentId { get; set; }

    public int? MasterParentId { get; set; }

    public string Name { get; set; } = null!;

    public string ShortName { get; set; } = null!;

    public string? Description { get; set; }

    public string? ConformanceStatement { get; set; }

    public int TimesUsed { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public bool DontShowPl { get; set; }
}
