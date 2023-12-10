using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbLocation
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

    public int AddressId { get; set; }

    public string ShortCode { get; set; } = null!;

    public string Name { get; set; } = null!;

    public decimal? Latitude { get; set; }

    public decimal? Longitude { get; set; }

    public int ParentId { get; set; }

    public string? Comment { get; set; }
}
