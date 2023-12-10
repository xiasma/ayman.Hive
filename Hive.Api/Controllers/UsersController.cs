using AutoMapper;
using Hive.Api.Dtos;
using Hive.Data.Models;
using Hive.Data.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration.UserSecrets;
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

		[HttpGet("{id}", Name="GetUser")]
		[ProducesResponseType(StatusCodes.Status200OK)]
		[ProducesResponseType(StatusCodes.Status404NotFound)]
		[ProducesResponseType(StatusCodes.Status400BadRequest)]
		public async Task<IActionResult> GetUser(int id)
		{
			var user= await _usersRepository.GetUserAsync(id);
			if (user == null)
			{
				return NotFound();
			}

			return Ok(_mapper.Map<User>(user));
		}

		[HttpPost]
		public async Task<ActionResult<User>> CreateUser(User user)
		{
			var userModel = _mapper.Map<TbUser>(user);
			await _usersRepository.AddUserAsync(userModel);

			await _usersRepository.SaveChangesAsync();

			var createdUserToReturn = _mapper.Map<TbUser>(user);

			return CreatedAtRoute(
				"GetUser",
				new { id = createdUserToReturn.Id },
				createdUserToReturn);
		}
	}
}
