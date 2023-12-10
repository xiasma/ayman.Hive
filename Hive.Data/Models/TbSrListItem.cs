using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbSrListItem
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int List { get; set; }

    public string Value { get; set; } = null!;
}
