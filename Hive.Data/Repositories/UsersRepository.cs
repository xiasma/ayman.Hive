using Microsoft.EntityFrameworkCore;
using Hive.Data.Models;

namespace Hive.Data.Repositories
{
	public class UsersRepository : IUsersRepository
	{
		private readonly HiveDbContext _context;

		public UsersRepository(HiveDbContext context)
		{
			_context = context ?? throw new ArgumentNullException(nameof(context));
		}

		public async Task AddUserAsync(TbUser user)
		{
			await _context.TbUsers.AddAsync(user);
		}

		public void DeleteUser(TbUser user)
		{
			_context.TbUsers.Remove(user);
		}

		public async Task<TbUser?> GetUserAsync(int userId)
		{
			return await _context.TbUsers.Where(c => c.Id == userId).FirstOrDefaultAsync();
		}

		public async Task<IEnumerable<TbUser>> GetUsersAsync()
		{
			return await _context.TbUsers.OrderBy(u => u.Adusername).ToListAsync();
		}

		public async Task<(IEnumerable<TbUser>, PaginationMetadata)> GetUsersAsync(string? name, int pageNumber, int pageSize)
		{
			var collection = _context.TbUsers as IQueryable<TbUser>;

			if (!string.IsNullOrWhiteSpace(name))
			{
				name = name.Trim();
				collection = collection.Where(c =>
					c.Adusername.Contains(name) ||
					c.Forenames.Contains(name) ||
					c.Surname.Contains(name));
			}

			var totalItemCount = await collection.CountAsync();

			var paginationMetadata = new PaginationMetadata(
				totalItemCount, pageSize, pageNumber);

			var collectionToReturn = await collection.OrderBy(c => c.Adusername)
				.Skip(pageSize * (pageNumber - 1))
				.Take(pageSize)
				.ToListAsync();

			return (collectionToReturn, paginationMetadata);
		}

		public async Task<bool> SaveChangesAsync()
		{
			return (await _context.SaveChangesAsync() >= 0);
		}

		public async Task<bool> UserExistsAsync(int userId)
		{
			return await _context.TbUsers.AnyAsync(u => u.Id == userId);
		}
	}
}
