using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbBuType
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Enabled { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public int MaxSize { get; set; }

    public int MinHeight { get; set; }

    public int MinWidth { get; set; }

    public int MaxHeight { get; set; }

    public int MaxWidth { get; set; }

    public bool EnforceSquare { get; set; }

    public string FileName { get; set; } = null!;

    public bool Overwrite { get; set; }

    public bool AllowBmps { get; set; }

    public bool AllowDocxs { get; set; }

    public bool AllowPdfs { get; set; }

    public bool AllowPngs { get; set; }

    public bool AllowPptxs { get; set; }

    public bool AllowJpgs { get; set; }

    public bool AllowTifs { get; set; }

    public bool AllowXlsxs { get; set; }

    public string CategoryType { get; set; } = null!;
}
