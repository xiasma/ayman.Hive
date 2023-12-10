using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCoAPartMap
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int LnkProductId { get; set; }

    public int ShelfLife { get; set; }
}
