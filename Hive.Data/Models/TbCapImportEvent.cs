using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCapImportEvent
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int LnkFileId { get; set; }

    public string Item { get; set; } = null!;

    public DateTime EventDate { get; set; }

    public bool Success { get; set; }

    public int? PirUnique { get; set; }

    public int? ErrorCode { get; set; }

    public string? Error { get; set; }

    public string? Supplier { get; set; }

    public string? SupplierRef { get; set; }

    public string? Currency { get; set; }

    public string? Part { get; set; }

    public string? Order { get; set; }

    public decimal? Quantity { get; set; }

    public decimal? QuantitySup { get; set; }

    public decimal? Price { get; set; }

    public decimal? Value { get; set; }

    public string? Vatcode { get; set; }

    public string? Event { get; set; }
}
