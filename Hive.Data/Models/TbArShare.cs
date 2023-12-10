using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbArShare
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public int LnkArid { get; set; }

    public int LnkAssetId { get; set; }
}
