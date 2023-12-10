using AutoMapper;
using Hive.Api.Dtos;
using Hive.Data.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

namespace Hive.Api.Controllers
{
	[ApiController]
	//[Authorize]
	[ApiVersion("1.0")]
	[Route("api/v{version:apiVersion}/users")]
	public class UsersController : ControllerBase
	{
		private readonly IUsersRepository _usersRepository;
		private readonly IMapper _mapper;
		const int maxUsersPageSize = 200;

		public UsersController(IUsersRepository usersRepository, IMapper mapper) 
		{
			this._usersRepository = usersRepository ?? throw new ArgumentNullException(nameof(usersRepository));
			this._mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
		}

		[HttpGet]
		public async Task<ActionResult<IEnumerable<User>>> GetUsers(
			 string? name, int pageNumber = 1, int pageSize = 10)
		{
			if (pageSize > maxUsersPageSize)
			{
				pageSize = maxUsersPageSize;
			}

			var (tbUsers, paginationMetadata) = await _usersRepository.GetUsersAsync(name, pageNumber, pageSize);

			Response.Headers.Add("X-Pagination", JsonSerializer.Serialize(paginationMetadata));

			return Ok(_mapper.Map<IEnumerable<User>>(tbUsers));
		}

	}
}
