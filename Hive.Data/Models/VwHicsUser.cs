using System;
using System.Collections.Generic;

namespace Hive.Data.Models;

public partial class VwHicsUser
{
    public int Id { get; set; }

    public DateTime CreatedOn { get; set; }

    public int CreatedBy { get; set; }

    public DateTime ModifiedOn { get; set; }

    public int ModifiedBy { get; set; }

    public bool Locked { get; set; }

    public DateTime? LockedOn { get; set; }

    public int? LockedBy { get; set; }

    public string Adusername { get; set; } = null!;

    public string? Domain { get; set; }

    public DateTime? AdcreatedOn { get; set; }

    public bool Addisabled { get; set; }

    public string? Username { get; set; }

    public string Forenames { get; set; } = null!;

    public string Surname { get; set; } = null!;

    public string? FullName { get; set; }

    public string? Email { get; set; }

    public string Title { get; set; } = null!;

    public string Department { get; set; } = null!;

    public int Manager { get; set; }

    public string Office { get; set; } = null!;

    public bool HideFromLists { get; set; }

    public DateTime? HicsLastOpened { get; set; }

    public int? HicsOpenedCount { get; set; }

    public string? HicsLastPage { get; set; }

    public string? HicsLastButton { get; set; }

    public bool HicsOnline { get; set; }

    public DateTime? HicsLastOnline { get; set; }

    public bool CanRaisePos { get; set; }

    public int Polimit { get; set; }

    public int? Poapprover { get; set; }
}
