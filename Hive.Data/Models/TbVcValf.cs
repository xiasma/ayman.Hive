using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbVcValf
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

    public int Type { get; set; }

    public int LnkVatId { get; set; }

    public string Name { get; set; } = null!;

    public int Position { get; set; }

    public string? Description { get; set; }
}
