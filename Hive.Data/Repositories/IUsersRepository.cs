using Hive.Data.Models;

namespace Hive.Data.Repositories
{
	public interface IUsersRepository
	{
		Task<IEnumerable<TbUser>> GetUsersAsync();
		Task<(IEnumerable<TbUser>, PaginationMetadata)> GetUsersAsync(
			string? name, int pageNumber, int pageSize);
		Task<TbUser?> GetUserAsync(int userId);
		Task<bool> UserExistsAsync(int userId);
		Task AddUserAsync(TbUser user);
		void DeleteUser(TbUser user);
		Task<bool> SaveChangesAsync();
	}
}
