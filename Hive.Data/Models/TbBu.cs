using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbBu
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int LnkSessionId { get; set; }

    public int LnkStatusId { get; set; }

    public string Part { get; set; } = null!;

    public string SourceFile { get; set; } = null!;

    public int FileSize { get; set; }

    public int? LnkDocId { get; set; }

    public int SuccessfulReupload { get; set; }
}
