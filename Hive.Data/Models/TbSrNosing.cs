﻿using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbSrNosing
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int Sr { get; set; }

    public int Who { get; set; }

    public int Score { get; set; }
}
