using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbSrType
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Deleted { get; set; }

    public DateTime? DeletedOn { get; set; }

    public int? DeletedBy { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public bool Enabled { get; set; }

    public bool AppendNumber { get; set; }

    public string? Label { get; set; }

    public int SourceVat { get; set; }

    public int SourceCus { get; set; }

    public int SourceSup { get; set; }

    public bool SourceWo { get; set; }

    public int DestinationVat { get; set; }

    public int DestinationCus { get; set; }

    public int DestinationSup { get; set; }

    public bool DestinationWo { get; set; }

    public bool ReqTesting { get; set; }

    public bool CanSupersede { get; set; }

    public bool IncrementSerialNumber { get; set; }

    public bool Gmp { get; set; }

    public bool AdditionalRef { get; set; }

    public bool SourcePo { get; set; }

    public bool DestinationPo { get; set; }

    public int Version { get; set; }

    public int? VersionParent { get; set; }
}
