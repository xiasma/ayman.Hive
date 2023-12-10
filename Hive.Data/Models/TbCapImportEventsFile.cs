using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCapImportEventsFile
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public string FilePath { get; set; } = null!;

    public string FileName { get; set; } = null!;

    public DateOnly FileDate { get; set; }

    public int? LineCount { get; set; }

    public DateTime? Processed { get; set; }
}
