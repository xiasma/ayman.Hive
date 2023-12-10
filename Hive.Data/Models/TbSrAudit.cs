using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbSrAudit
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int Sr { get; set; }

    public int Who { get; set; }

    public string Area { get; set; } = null!;

    public int? ItemValue { get; set; }

    public string ItemDescription { get; set; } = null!;

    public int? FromValue { get; set; }

    public string? FromDescription { get; set; }

    public int? ToValue { get; set; }

    public string? ToDescription { get; set; }
}
