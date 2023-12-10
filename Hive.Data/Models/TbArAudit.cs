using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbArAudit
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public int LnkArid { get; set; }

    public string ColumnName { get; set; } = null!;

    public int? FromValue { get; set; }

    public string? FromDescription { get; set; }

    public int? ToValue { get; set; }

    public string? ToDescription { get; set; }
}
