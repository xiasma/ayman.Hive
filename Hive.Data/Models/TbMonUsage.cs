using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbMonUsage
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public string Name { get; set; } = null!;

    public string Query { get; set; } = null!;

    public string? Type { get; set; }

    public decimal? Duration { get; set; }
}
