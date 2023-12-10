using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbMessage
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int From { get; set; }

    public int To { get; set; }

    public string Message { get; set; } = null!;

    public DateTime? Read { get; set; }
}
