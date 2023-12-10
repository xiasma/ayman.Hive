using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbLicencing
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int LnkAssetId { get; set; }

    public int LnkDsvid { get; set; }

    public string Key { get; set; } = null!;

    public string? Note { get; set; }
}
