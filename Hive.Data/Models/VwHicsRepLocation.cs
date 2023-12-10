using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsRepLocation
{
    public int Id { get; set; }

    public int ParentId { get; set; }

    public bool Enabled { get; set; }

    public int AddressId { get; set; }

    public string? AddressShortCode { get; set; }

    public string? Address { get; set; }

    public string ShortCode { get; set; } = null!;

    public string Name { get; set; } = null!;

    public decimal Latitude { get; set; }

    public decimal Longitude { get; set; }

    public string Comment { get; set; } = null!;

    public int? Depth { get; set; }

    public string? FullShortCode { get; set; }

    public string FullName { get; set; } = null!;
}
