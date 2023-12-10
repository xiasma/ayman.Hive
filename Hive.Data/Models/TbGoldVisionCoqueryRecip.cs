using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbGoldVisionCoqueryRecip
{
    public int Id { get; set; }

    public Guid CorId { get; set; }

    public Guid CoId { get; set; }
}
