using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbAscLicences2
{
    public int Id { get; set; }

    public DateTime Dts { get; set; }

    public string UserId { get; set; } = null!;

    public string UserName { get; set; } = null!;
}
