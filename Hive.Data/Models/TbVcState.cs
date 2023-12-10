using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbVcState
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int LnkValveId { get; set; }

    public bool State { get; set; }

    public string Source { get; set; } = null!;
}
