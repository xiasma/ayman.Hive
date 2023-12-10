using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbLicencingDsv
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public string Developer { get; set; } = null!;

    public string Software { get; set; } = null!;

    public string Version { get; set; } = null!;

    public bool Enabled { get; set; }
}
