using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCoATest
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int? TestedBy { get; set; }

    public int? VerifiedBy { get; set; }

    public int? LockedBy { get; set; }

    public DateTime? LockedOn { get; set; }

    public string BatchRef { get; set; } = null!;

    public DateTime SampleDate { get; set; }

    public int ProductId { get; set; }

    public string? LockComment { get; set; }

    public int? DisabledBy { get; set; }

    public DateTime? DisabledOn { get; set; }

    public string? DisableComment { get; set; }
}
