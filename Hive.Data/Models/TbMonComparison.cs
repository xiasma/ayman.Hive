using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbMonComparison
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int LnkTaskId { get; set; }

    public string? Ref01 { get; set; }

    public string? Ref02 { get; set; }

    public string? Ref03 { get; set; }

    public string? Ref04 { get; set; }

    public string? Ref05 { get; set; }

    public string? Ref06 { get; set; }

    public string? Ref07 { get; set; }

    public string? Ref08 { get; set; }

    public string? Ref09 { get; set; }

    public string? Ref10 { get; set; }
}
