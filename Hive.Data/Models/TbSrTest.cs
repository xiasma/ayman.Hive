using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbSrTest
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int Sr { get; set; }

    public bool? Accepted { get; set; }

    public int? AcceptedWho { get; set; }

    public bool? Locked { get; set; }

    public DateTime? LockedOn { get; set; }

    public int? LockedBy { get; set; }

    public int? LockedWho { get; set; }

    public bool AcceptedViaMatrix { get; set; }
}
