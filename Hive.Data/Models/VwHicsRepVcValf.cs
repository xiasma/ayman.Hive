using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsRepVcValf
{
    public int Id { get; set; }

    public bool Enabled { get; set; }

    public string Type { get; set; } = null!;

    public string Name { get; set; } = null!;

    public int Position { get; set; }

    public int? VatId { get; set; }

    public string? VatName { get; set; }

    public int? VatEnabled { get; set; }
}
