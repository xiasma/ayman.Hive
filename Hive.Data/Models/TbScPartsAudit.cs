using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbScPartsAudit
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public string Part { get; set; } = null!;

    public string Field { get; set; } = null!;

    public string From { get; set; } = null!;

    public string To { get; set; } = null!;
}
