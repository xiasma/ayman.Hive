using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbSr
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public bool Cancelled { get; set; }

    public DateTime? CancelledOn { get; set; }

    public int? CancelledBy { get; set; }

    public string? CancelledComment { get; set; }

    public bool Closed { get; set; }

    public DateTime? ClosedOn { get; set; }

    public int? ClosedBy { get; set; }

    public int Prefix { get; set; }

    public int SerialNo { get; set; }

    public string? AdditionalRef { get; set; }

    public int Sample { get; set; }

    public int? Level1 { get; set; }

    public int? Level2 { get; set; }

    public int? Level3 { get; set; }

    public int? Level4 { get; set; }

    public int? Level5 { get; set; }

    public int TypeLink { get; set; }

    public int Type { get; set; }

    public int Product { get; set; }

    public string? BondedState { get; set; }

    public int Source { get; set; }

    public int Destination { get; set; }

    public string? Comment { get; set; }

    public int? PreviousSerialRef { get; set; }

    public int DerivativeOf { get; set; }

    public int SupersededBy { get; set; }
}
