using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbViDatum
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int LnkHeaderId { get; set; }

    public int Status { get; set; }

    public int? LnkId { get; set; }

    public string ProdGrp { get; set; } = null!;

    public decimal StdCost { get; set; }

    public decimal ActCost1 { get; set; }

    public decimal ActCost2 { get; set; }

    public decimal ActCost3 { get; set; }

    public decimal ActCost4 { get; set; }

    public decimal ActCost5 { get; set; }

    public decimal ActCost6 { get; set; }

    public decimal ActCost7 { get; set; }

    public decimal ActCost8 { get; set; }

    public decimal ActCost9 { get; set; }

    public decimal ActCost10 { get; set; }

    public decimal ActCost11 { get; set; }

    public decimal ActCost12 { get; set; }
}
