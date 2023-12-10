using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbBuStatus
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Enabled { get; set; }

    public string ShortName { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string? Description { get; set; }
}
