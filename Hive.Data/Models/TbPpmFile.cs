using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbPpmFile
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public int Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int DeletedBy { get; set; }

    public int Type { get; set; }

    public int TypeId { get; set; }

    public int TypeId2 { get; set; }

    public string UploadedFrom { get; set; } = null!;

    public string FileName { get; set; } = null!;

    public string StoredAs { get; set; } = null!;
}
