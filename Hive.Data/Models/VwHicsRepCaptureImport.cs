using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsRepCaptureImport
{
    public int Id { get; set; }

    public string Item { get; set; } = null!;

    public string? Type { get; set; }

    public DateTime Pdffound { get; set; }

    public DateTime? Xmlfound { get; set; }

    public DateTime? Xmlsent { get; set; }

    public DateTime? Xmlgone { get; set; }

    public DateTime? PirentryFound { get; set; }

    public DateTime? Pdfsent { get; set; }

    public DateTime? Pdfgone { get; set; }
}
