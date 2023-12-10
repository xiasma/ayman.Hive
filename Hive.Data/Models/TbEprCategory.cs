using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbEprCategory
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

    public int? LnkParentCategory { get; set; }

    public string Name { get; set; } = null!;
}
