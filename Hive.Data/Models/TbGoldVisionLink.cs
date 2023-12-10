using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbGoldVisionLink
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int LnkUserId { get; set; }

    public Guid LnkUsersUsId { get; set; }
}
