using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbGoldVisionHostedDomain
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public string Domain { get; set; } = null!;
}
