using Hive.Data.Models;
using Hive.Utilities;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace Hive.Data.Repositories
{
    public class SqlUsersRepository : IUsersRepository
    {
        private readonly string _connectionString;

        public SqlUsersRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public Task AddUserAsync(TbUser user)
        {
            throw new NotImplementedException();
        }

        public void DeleteUser(TbUser user)
        {
            throw new NotImplementedException();
        }

        public Task<TbUser?> GetUserAsync(int userId)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<TbUser>> GetUsersAsync()
        {
            throw new NotImplementedException();
        }

        private TbUser MapRowToUser(DataRow row)
        {
            var user = new TbUser
            {
                CreatedOn = Convert.ToDateTime(row["CreatedOn"]),
                CreatedBy = Convert.ToInt32(row["CreatedBy"]),
                ModifiedOn = Convert.ToDateTime(row["ModifiedOn"]),
                ModifiedBy = Convert.ToInt32(row["ModifiedBy"]),
                Deleted = Convert.ToBoolean(row["Deleted"]),
                DeletedOn = Convert.ToDateTime(row["DeletedOn"]),
                DeletedBy = Convert.ToInt32(row["DeletedBy"]),
                Locked = Convert.ToBoolean(row["Locked"]),
                LockedOn = Convert.ToDateTime(row["LockedOn"]),
                LockedBy = Convert.ToInt32(row["LockedBy"]),
                OpenedLast = Convert.ToDateTime(row["OpenedLast"]),
                OpenedCount = Convert.ToInt32(row["OpenedCount"]),
                Adusername = Convert.ToString(row["Adusername"]),
                Forenames = Convert.ToString(row["Forenames"]),
                Surname = Convert.ToString(row["Surname"]),
                PLastPage = Convert.ToString(row["P_LastPage"]),
                PLastButton = Convert.ToString(row["P_LastButton"]),
                PLastEnvironment = Convert.ToInt32(row["P_LastEnvironment"]),
                Email = Convert.ToString(row["Email"]),
                HideFromList = Convert.ToBoolean(row["HideFromList"]),
                AdcreatedOn = Convert.ToDateTime(row["AdcreatedOn"]),
                Addisabled = Convert.ToBoolean(row["Addisabled"]),
                Online = Convert.ToBoolean(row["Online"]),
                LastOnline = Convert.ToDateTime(row["LastOnline"]),
                Department = Convert.ToString(row["Department"]),
                DistinguishedName = Convert.ToString(row["DistinguishedName"]),
                DistinguishedManager = Convert.ToString(row["DistinguishedManager"]),
                Manager = Convert.ToInt32(row["Manager"]),
                Office = Convert.ToString(row["Office"]),
                Title = Convert.ToString(row["Title"]),
                PCoAiFontSize = Convert.ToInt32(row["P_CoAI_FontSize"]),
                PCoAiSortOrder = Convert.ToInt32(row["P_CoAI_SortOrder"]),
                Adguid = Convert.ToString(row["Adguid"]),
                Gvguid = Convert.ToString(row["Gvguid"]),
                PWediSortOrder = Convert.ToInt32(row["P_WEDI_SortOrder"]),
                PWediSearchInData = Convert.ToBoolean(row["P_WEDI_SearchInData"]),
                PItarOrderBy = Convert.ToString(row["P_ITAR_OrderBy"]),
                PItarOrderDirection = Convert.ToInt32(row["P_ITAR_OrderDirection"]),
                PItarActiveOnly = Convert.ToInt32(row["P_ITAR_ActiveOnly"]),
                PSrOrderBy = Convert.ToString(row["P_SR_OrderBy"]),
                PSrOrderDirection = Convert.ToInt32(row["P_SR_OrderDirection"]),
                PSrThisYearOnly = Convert.ToInt32(row["P_SR_ThisYearOnly"]),
                PSrltIncludeCompleted = Convert.ToInt32(row["P_SRLT_IncludeCompleted"]),
                PSrHideSuperseded = Convert.ToInt32(row["P_SR_HideSuperseded"]),
                PBiPrinter = Convert.ToString(row["P_BI_Printer"]),
                PSrPrinter = Convert.ToString(row["P_SR_Printer"]),
                PSrHideClosed = Convert.ToInt32(row["P_SR_HideClosed"]),
                PPmHidePhantomised = Convert.ToInt32(row["P_PM_HidePhantomised"]),
                PSbuSkipProductChecks = Convert.ToInt32(row["P_SBU_SkipProductChecks"]),
                PoCanRaise = Convert.ToBoolean(row["PO_CanRaise"]),
                PoLimit = Convert.ToInt32(row["PO_Limit"]),
                PoApprover = Convert.ToInt32(row["PO_Approver"]),
                PDocsLastSearch = Convert.ToString(row["P_DOCS_LastSearch"]),
                PSrOnlyMe = Convert.ToInt32(row["P_SR_OnlyMe"]),
                PArFilterAdd = Convert.ToString(row["P_AR_FilterAdd"]),
                PArFilterType = Convert.ToString(row["P_AR_FilterType"]),
                PArFilterSupplier = Convert.ToInt32(row["P_AR_FilterSupplier"]),
                PArFilterStatus = Convert.ToInt32(row["P_AR_FilterStatus"]),
                PArOrderBy = Convert.ToString(row["P_AR_OrderBy"]),
                PArOrderDirection = Convert.ToInt32(row["P_AR_OrderDirection"]),
                PArIncludeDisabled = Convert.ToInt32(row["P_AR_IncludeDisabled"]),
                PAraMineOnly = Convert.ToInt32(row["P_ARA_MineOnly"])
            };

            return user;
        }

        public async Task<(IEnumerable<TbUser>, PaginationMetadata)> GetUsersAsync(string? name, int pageNumber, int pageSize)
        {
            List<DataRow> result = new List<DataRow>();
            var users = new List<TbUser>();

            if (!string.IsNullOrEmpty(name))
            {
                name = name.Trim().Truncate(100);
            }

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("GetUsers", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@FilterValue", SqlDbType.NVarChar) { Value = name ?? string.Empty });
                    command.Parameters.Add(new SqlParameter("@PageNumber", SqlDbType.Int) { Value = pageNumber });
                    command.Parameters.Add(new SqlParameter("@MaxPageSize", SqlDbType.Int) { Value = pageSize });

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        result.AddRange(dataTable.Rows.OfType<DataRow>());
                    }
                }
            }

            foreach (var row in result)
            {
                users.Add(MapRowToUser(row));
            }
            
            return (users, new PaginationMetadata(0, 1, 0));
        }

        public Task<bool> SaveChangesAsync()
        {
            throw new NotImplementedException();
        }

        public Task<bool> UserExistsAsync(int userId)
        {
            throw new NotImplementedException();
        }
    }
}
