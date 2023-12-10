using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbSim
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public string Sim { get; set; } = null!;

    public string Mobile { get; set; } = null!;

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public bool Enabled { get; set; }

    public string Note { get; set; } = null!;
}
