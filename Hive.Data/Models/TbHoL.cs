using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbHoL
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int Who { get; set; }

    public int Guesses { get; set; }
}
