using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsEpr
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Enabled { get; set; }

    public int Part { get; set; }

    public int Category { get; set; }

    public int? SubCategory { get; set; }

    public int PackagingType { get; set; }

    public decimal Weight { get; set; }

    public decimal RecycledContent { get; set; }

    public bool PackagingForImportedGoods { get; set; }

    public bool SiteWaste { get; set; }

    public bool PreviouslyUsedMaterial { get; set; }

    public bool MadeFromRecycled { get; set; }

    public bool Recyclable { get; set; }

    public bool Biodegradable { get; set; }

    public bool Reusable { get; set; }
}
