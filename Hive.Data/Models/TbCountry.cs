using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCountry
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

    public string Name { get; set; } = null!;

    public string _2letter { get; set; } = null!;

    public string _3letter { get; set; } = null!;

    public int Numeric { get; set; }

    public string? Comment { get; set; }
}
