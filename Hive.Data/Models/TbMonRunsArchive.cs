using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbMonRunsArchive
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int SourceId { get; set; }

    public DateTime SourceCreatedOn { get; set; }

    public int SourceCreatedBy { get; set; }

    public int TaskId { get; set; }

    public DateTime? Start { get; set; }

    public DateTime? End { get; set; }

    public int Status { get; set; }

    public int AgentId { get; set; }
}
