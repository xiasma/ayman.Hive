using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbScOrderAudit
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int Type { get; set; }

    public int OrderId { get; set; }

    public decimal? QuantityOrdered { get; set; }

    public DateTime? DeliveryDate { get; set; }

    public DateTime? ReqdDespatchDate { get; set; }

    public DateTime? Delivered { get; set; }
}
