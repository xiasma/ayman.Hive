using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbPrinterLog
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int EventRecId { get; set; }

    public int LnkUserIdBy { get; set; }

    public int LnkAssetIdFrom { get; set; }

    public int LnkAssetIdTo { get; set; }

    public DateTime PrintTime { get; set; }

    public int Pages { get; set; }

    public string Note { get; set; } = null!;
}
