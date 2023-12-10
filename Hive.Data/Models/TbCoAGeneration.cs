using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCoAGeneration
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public string Sono { get; set; } = null!;

    public int Part { get; set; }

    public int Test { get; set; }

    public int Monograph { get; set; }

    public int Template { get; set; }

    public string FileName { get; set; } = null!;

    public string Path { get; set; } = null!;

    public DateTime? Sent { get; set; }

    public int? SentBy { get; set; }

    public DateTime? Deleted { get; set; }

    public int? DeletedBy { get; set; }

    public string? ScbatchNo { get; set; }
}
