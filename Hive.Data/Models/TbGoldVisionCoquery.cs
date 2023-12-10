using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbGoldVisionCoquery
{
    public int Id { get; set; }

    public Guid CoId { get; set; }

    public int Count { get; set; }
}
