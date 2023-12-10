using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbAr
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public bool Enabled { get; set; }

    public int LnkArid { get; set; }

    public int Number { get; set; }

    public int LnkLocationId { get; set; }

    public int LnkBsmid { get; set; }

    public string? SerialRef { get; set; }

    public DateOnly PurchasedOn { get; set; }

    public int LnkSupplierId { get; set; }

    public string? OrderRef { get; set; }

    public decimal Cost { get; set; }

    public DateOnly? WarrantyExpiry { get; set; }

    public int? LnkUserId { get; set; }

    public int LnkStatusId { get; set; }

    public string? StatusNote { get; set; }

    public string? Comment { get; set; }

    public string DellEsc { get; set; } = null!;

    public string DellPpid { get; set; } = null!;

    public string DellSt { get; set; } = null!;

    public string Eid { get; set; } = null!;

    public bool HasDongle { get; set; }

    public string Imei1 { get; set; } = null!;

    public string Imei2 { get; set; } = null!;

    public bool LabelPrinter { get; set; }

    public string Mac { get; set; } = null!;

    public string ModelRef { get; set; } = null!;

    public string Name { get; set; } = null!;

    public int LnkOsid { get; set; }

    public string PrinterName { get; set; } = null!;

    public int LnkSimid { get; set; }

    public bool? Addisabled { get; set; }

    public string? Adguid { get; set; }
}
