using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCapImport
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public string Item { get; set; } = null!;

    public DateTime Pdffound { get; set; }

    public DateTime? Xmlfound { get; set; }

    public DateTime? Xmlsent { get; set; }

    public DateTime? Xmlgone { get; set; }

    public DateTime? PirentryFound { get; set; }

    public DateTime? Pdfsent { get; set; }

    public DateTime? Pdfgone { get; set; }

    public string? Type { get; set; }
}
