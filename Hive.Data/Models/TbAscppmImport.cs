using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbAscppmImport
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public int LnkSessionId { get; set; }

    public int ExcelRowNo { get; set; }

    public string? VenUnique { get; set; }

    public string? VenPartOnly { get; set; }

    public string? VenCode { get; set; }

    public string? VenManuf { get; set; }

    public string? VenFromQty { get; set; }

    public string? VenToQty { get; set; }

    public string? VenFromDate { get; set; }

    public string? VenToDate { get; set; }

    public string? VenPartCode { get; set; }

    public string? VenPartRefOnly { get; set; }

    public string? VenManufPartOnly { get; set; }

    public string? VenNote { get; set; }

    public string? VenStatus { get; set; }

    public string? VenPrice { get; set; }

    public string? VenPricePer { get; set; }

    public string? VenDiscount { get; set; }

    public string? VenCurrency { get; set; }

    public string? VenOk { get; set; }

    public string? VenDateCreated { get; set; }

    public string? VenDateAmended { get; set; }

    public string? VenUom { get; set; }

    public string? VenRating1 { get; set; }

    public string? VenRating2 { get; set; }

    public string? VenRating3 { get; set; }

    public string? VenRating4 { get; set; }

    public string? VenRating5 { get; set; }

    public string? VenJob { get; set; }

    public string? VenUop { get; set; }

    public string? VenAnyCurrFlag { get; set; }

    public string? VenLead { get; set; }

    public string? VenApproved { get; set; }

    public int Status { get; set; }

    public string? StatusInfo { get; set; }
}
