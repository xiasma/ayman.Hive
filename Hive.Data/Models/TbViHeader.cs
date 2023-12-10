using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbViHeader
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public DateTime? Stagged { get; set; }

    public DateTime? Imported { get; set; }
}
