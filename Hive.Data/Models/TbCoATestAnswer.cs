using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCoATestAnswer
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int LnkTestId { get; set; }

    public int LnkQuestionId { get; set; }

    public string? Result { get; set; }

    public bool Passed { get; set; }
}
