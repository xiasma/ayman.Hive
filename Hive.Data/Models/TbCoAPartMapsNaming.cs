using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCoAPartMapsNaming
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int LnkProductId { get; set; }

    public int LnkCustomer { get; set; }

    public string Name { get; set; } = null!;

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }
}
