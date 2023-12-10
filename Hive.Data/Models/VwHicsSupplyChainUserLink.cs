using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsSupplyChainUserLink
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int LnkUserId { get; set; }

    public string LnkSysPeoplePpCode { get; set; } = null!;
}
