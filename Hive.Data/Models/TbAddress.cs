using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbAddress
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

    public string ShortCode { get; set; } = null!;

    public string AddLine1 { get; set; } = null!;

    public string? AddLine2 { get; set; }

    public string? AddLine3 { get; set; }

    public string? Town { get; set; }

    public string? County { get; set; }

    public string? Postcode { get; set; }

    public int? Country { get; set; }

    public decimal? Latitude { get; set; }

    public decimal? Longitude { get; set; }

    public string? Comment { get; set; }
}
