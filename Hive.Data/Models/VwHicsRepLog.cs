using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsRepLog
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public string? FullName { get; set; }

    public string Computer { get; set; } = null!;

    public string Source { get; set; } = null!;

    public string Environment { get; set; } = null!;

    public string Category { get; set; } = null!;

    public string Process { get; set; } = null!;

    public string Message { get; set; } = null!;
}
