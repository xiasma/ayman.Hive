namespace Hive.Api.Dtos
{
	public class UpdateUser
	{
		public bool Deleted { get; set; }

		public DateTime? DeletedOn { get; set; }

		public int? DeletedBy { get; set; }

		public bool Locked { get; set; }

		public DateTime? LockedOn { get; set; }

		public int? LockedBy { get; set; }

		public DateTime? OpenedLast { get; set; }

		public int? OpenedCount { get; set; }

		public string Adusername { get; set; } = null!;

		public string Forenames { get; set; } = null!;

		public string Surname { get; set; } = null!;

		public string? PLastPage { get; set; }

		public string? PLastButton { get; set; }

		public int? PLastEnvironment { get; set; }

		public string? Email { get; set; }

		public bool HideFromList { get; set; }

		public DateTime? AdcreatedOn { get; set; }

		public bool Addisabled { get; set; }

		public bool Online { get; set; }

		public DateTime? LastOnline { get; set; }

		public string Department { get; set; } = null!;

		public string DistinguishedName { get; set; } = null!;

		public string DistinguishedManager { get; set; } = null!;

		public int Manager { get; set; }

		public string Office { get; set; } = null!;

		public string Title { get; set; } = null!;

		public int PCoAiFontSize { get; set; }

		public int PCoAiSortOrder { get; set; }

		public string? Adguid { get; set; }

		public string? Gvguid { get; set; }

		public int PWediSortOrder { get; set; }

		public bool PWediSearchInData { get; set; }

		public string? PItarOrderBy { get; set; }

		public int? PItarOrderDirection { get; set; }

		public int? PItarActiveOnly { get; set; }

		public string? PSrOrderBy { get; set; }

		public int? PSrOrderDirection { get; set; }

		public int? PSrThisYearOnly { get; set; }

		public int? PSrltIncludeCompleted { get; set; }

		public int? PSrHideSuperseded { get; set; }

		public string? PBiPrinter { get; set; }

		public string? PSrPrinter { get; set; }

		public int? PSrHideClosed { get; set; }

		public int? PPmHidePhantomised { get; set; }

		public int? PSbuSkipProductChecks { get; set; }

		public bool PoCanRaise { get; set; }

		public int PoLimit { get; set; }

		public int? PoApprover { get; set; }

		public string? PDocsLastSearch { get; set; }

		public int? PSrOnlyMe { get; set; }

		public string? PArFilterAdd { get; set; }

		public string? PArFilterType { get; set; }

		public int? PArFilterSupplier { get; set; }

		public int? PArFilterStatus { get; set; }

		public string? PArOrderBy { get; set; }

		public int? PArOrderDirection { get; set; }

		public int? PArIncludeDisabled { get; set; }

		public int? PAraMineOnly { get; set; }
	}
}
