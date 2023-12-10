using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbArcLog
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int LnkSessionId { get; set; }

    public string Path { get; set; } = null!;

    public decimal? Size { get; set; }

    public DateTime? From { get; set; }

    public DateTime? To { get; set; }

    public int? Success { get; set; }

    public string? Note { get; set; }
}
