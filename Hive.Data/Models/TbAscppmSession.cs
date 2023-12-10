using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbAscppmSession
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }
}
