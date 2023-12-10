using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCoAQuestionsToMonograph
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int LnkMonographId { get; set; }

    public int LnkQuestionId { get; set; }

    public int Position { get; set; }
}
