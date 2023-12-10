using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbBuSession
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int LnkTypeId { get; set; }

    public bool Finished { get; set; }

    public DateTime? FinishedOn { get; set; }
}
