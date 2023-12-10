using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbSrTestResult
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int Who { get; set; }

    public int Test { get; set; }

    public int Type { get; set; }

    public string? Result { get; set; }
}
