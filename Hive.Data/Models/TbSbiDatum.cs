using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbSbiDatum
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int LnkHeaderId { get; set; }

    public int Status { get; set; }

    public string Year { get; set; } = null!;

    public string Customer { get; set; } = null!;

    public string Part { get; set; } = null!;

    public decimal P1quantity { get; set; }

    public decimal P1value { get; set; }

    public decimal P2quantity { get; set; }

    public decimal P2value { get; set; }

    public decimal P3quantity { get; set; }

    public decimal P3value { get; set; }

    public decimal P4quantity { get; set; }

    public decimal P4value { get; set; }

    public decimal P5quantity { get; set; }

    public decimal P5value { get; set; }

    public decimal P6quantity { get; set; }

    public decimal P6value { get; set; }

    public decimal P7quantity { get; set; }

    public decimal P7value { get; set; }

    public decimal P8quantity { get; set; }

    public decimal P8value { get; set; }

    public decimal P9quantity { get; set; }

    public decimal P9value { get; set; }

    public decimal P10quantity { get; set; }

    public decimal P10value { get; set; }

    public decimal P11quantity { get; set; }

    public decimal P11value { get; set; }

    public decimal P12quantity { get; set; }

    public decimal P12value { get; set; }

    public decimal P13quantity { get; set; }

    public decimal P13value { get; set; }

    public string Analysis1 { get; set; } = null!;

    public string Analysis2 { get; set; } = null!;

    public string Analysis3 { get; set; } = null!;

    public string Analysis4 { get; set; } = null!;

    public string Analysis5 { get; set; } = null!;

    public string Analysis6 { get; set; } = null!;

    public string Analysis7 { get; set; } = null!;

    public string Analysis8 { get; set; } = null!;

    public string Analysis9 { get; set; } = null!;

    public string Analysis10 { get; set; } = null!;

    public string Scuser { get; set; } = null!;
}
