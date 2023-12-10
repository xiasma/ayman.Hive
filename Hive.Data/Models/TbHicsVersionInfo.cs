using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbHicsVersionInfo
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public string Version { get; set; } = null!;

    public int? TicketRef { get; set; }

    public string Heading { get; set; } = null!;

    public string? ReleaseNote { get; set; }
}
