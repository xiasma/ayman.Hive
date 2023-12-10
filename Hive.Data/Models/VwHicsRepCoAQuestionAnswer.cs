using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsRepCoAQuestionAnswer
{
    public string Question { get; set; } = null!;

    public string Specification { get; set; } = null!;

    public DateTime? ResultDateTime { get; set; }

    public string? Result { get; set; }

    public bool? ResultPassed { get; set; }
}
