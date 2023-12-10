using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbEnvironment
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Enabled { get; set; }

    public string ShortName { get; set; } = null!;

    public string FullName { get; set; } = null!;

    public string? Notes { get; set; }

    public string? AscDbServer { get; set; }

    public string? AscDbInstance { get; set; }

    public string? AscDbName { get; set; }

    public string AscDbUser { get; set; } = null!;

    public string AscDbPassword { get; set; } = null!;
}
