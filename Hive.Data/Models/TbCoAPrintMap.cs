using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbCoAPrintMap
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int LnkCustomer { get; set; }

    public int LnkProduct { get; set; }

    public int LnkMonographId { get; set; }

    public string? Filename { get; set; }

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }
}
