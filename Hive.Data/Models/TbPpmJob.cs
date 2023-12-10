using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbPpmJob
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

    public int LnkGroupId { get; set; }

    public string Name { get; set; } = null!;

    public string? Location { get; set; }

    public int? Freq { get; set; }

    public int? FreqValue { get; set; }

    public DateOnly? StartDate { get; set; }

    public bool ReqDocOnComp { get; set; }
}
