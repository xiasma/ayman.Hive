using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class TbPermission
{
    public int Id { get; set; }

    public int LnkUserId { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    /// <summary>
    /// Archive adjustments
    /// </summary>
    public int Arc { get; set; }

    /// <summary>
    /// Archive adjustments, Reports
    /// </summary>
    public int ArcR { get; set; }

    /// <summary>
    /// Access Supply Chain, Adjust vat table (Edit)
    /// </summary>
    public int Ascavte { get; set; }

    /// <summary>
    /// Access Supply Chain, Adjust vat table (View only)
    /// </summary>
    public int Ascavtv { get; set; }

    /// <summary>
    /// Access Supply Chain, Booking in
    /// </summary>
    public int Ascbi { get; set; }

    /// <summary>
    /// Access Supply Chain, Inactivate me
    /// </summary>
    public int Ascim { get; set; }

    /// <summary>
    /// Access Supply Chain, Inactivate users
    /// </summary>
    public int Asciu { get; set; }

    /// <summary>
    /// Certificate of Analysis, Administration
    /// </summary>
    public int Coaa { get; set; }

    /// <summary>
    /// Certificate of Analysis, Input
    /// </summary>
    public int Coai { get; set; }

    /// <summary>
    /// Certificate of Analysis, Input (Locked by)
    /// </summary>
    public int CoaiL { get; set; }

    /// <summary>
    /// Certificate of Analysis, Input (Tested by)
    /// </summary>
    public int CoaiT { get; set; }

    /// <summary>
    /// Certificate of Analysis, Input (Verified by)
    /// </summary>
    public int CoaiV { get; set; }

    /// <summary>
    /// Certificate of Analysis, Print
    /// </summary>
    public int Coap { get; set; }

    /// <summary>
    /// Certificate of Analysis, Sent register
    /// </summary>
    public int Coasr { get; set; }

    /// <summary>
    /// IT, Asset register
    /// </summary>
    public int Itar { get; set; }

    /// <summary>
    /// Planned Preventative Maintenance, Administration (Entities and Groups)
    /// </summary>
    public int Ppma { get; set; }

    /// <summary>
    /// Planned Preventative Maintenance, Administration (Jobs and Tasks)
    /// </summary>
    public int Ppmr { get; set; }

    /// <summary>
    /// Planned Preventative Maintenance, Input
    /// </summary>
    public int Ppmi { get; set; }

    /// <summary>
    /// To be deleted
    /// </summary>
    public int HicsUm { get; set; }

    public int Itmon { get; set; }

    public int Msg { get; set; }

    public int Itup { get; set; }

    public int Its { get; set; }

    public int Ascdar { get; set; }

    public int CoaiD { get; set; }

    public int Itsr { get; set; }

    public int Cie { get; set; }

    public int Ascwedi { get; set; }

    public int AscwediSend { get; set; }

    public int Itara { get; set; }

    public int Srv { get; set; }

    public int Sre { get; set; }

    public int Sra { get; set; }

    public int Srltv { get; set; }

    public int Srltn { get; set; }

    public int Srlte { get; set; }

    public int Ascppm { get; set; }

    public int Ascdocs { get; set; }

    public int Ascpmv { get; set; }

    public int Ascpme { get; set; }

    public int Ascsbu { get; set; }

    public int AscdocsBu { get; set; }

    public int Poa { get; set; }

    public int Pop { get; set; }

    public int Ascvu { get; set; }

    public int Epra { get; set; }

    public int Epri { get; set; }

    public int Ara { get; set; }

    public int AscdocsBot { get; set; }

    public int Vca { get; set; }
}
