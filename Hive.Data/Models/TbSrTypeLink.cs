using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbSrTypeLink
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public int Type { get; set; }

    public int ParentId { get; set; }
}
