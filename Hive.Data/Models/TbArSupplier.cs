using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbArSupplier
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

    public string ScsupRef { get; set; } = null!;

    public string? Name { get; set; }

    public string? Website { get; set; }

    public string? AccMgr { get; set; }

    public string? AccMgrEmail { get; set; }

    public string? AccMgrTel { get; set; }

    public string? AccRef { get; set; }

    public string? Comment { get; set; }
}
