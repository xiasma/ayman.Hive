using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsCoATestAnswer
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public string? ModifiedBy { get; set; }

    public int LnkTestId { get; set; }

    public int LnkQuestionId { get; set; }

    public string? Result { get; set; }

    public bool Passed { get; set; }
}
