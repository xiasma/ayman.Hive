using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbArcSession
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int FileCount { get; set; }

    public decimal TotalFileSize { get; set; }
}
