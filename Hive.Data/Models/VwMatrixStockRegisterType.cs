using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwMatrixStockRegisterType
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Description { get; set; } = null!;
}
