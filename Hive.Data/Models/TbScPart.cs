using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbScPart
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int LnkPartId { get; set; }

    public string? PrintedLotNumberPosition { get; set; }

    public string? UnitBarcode { get; set; }

    public string? GroupedBarcode { get; set; }
}
