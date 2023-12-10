using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbMonEmailAttachment
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int LnkTaskId { get; set; }

    public int LnkRunId { get; set; }

    public int LnkEmailId { get; set; }

    public string File { get; set; } = null!;
}
