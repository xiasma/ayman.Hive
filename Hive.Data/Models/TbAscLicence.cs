using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbAscLicence
{
    public int Id { get; set; }

    public DateTime Dts { get; set; }

    public int ActiveUsers { get; set; }
}
