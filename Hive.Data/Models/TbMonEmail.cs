using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbMonEmail
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int? LnkRunId { get; set; }

    public string Profile { get; set; } = null!;

    public string To { get; set; } = null!;

    public string Cc { get; set; } = null!;

    public string Bcc { get; set; } = null!;

    public string Subject { get; set; } = null!;

    public string Body { get; set; } = null!;

    public bool ReadyToSend { get; set; }

    public DateTime? Processed { get; set; }
}
