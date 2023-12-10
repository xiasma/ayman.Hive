using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbGoldVisionCoqueryFile
{
    public int Id { get; set; }

    public Guid CoaId { get; set; }

    public Guid CoId { get; set; }

    public bool FileExists { get; set; }

    public decimal FileSizeKb { get; set; }
}
