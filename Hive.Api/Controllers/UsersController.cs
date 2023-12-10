using AutoMapper;
using Hive.Api.Dtos;
using Hive.Data.Models;
using Hive.Data.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.JsonPatch;
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

		[HttpPut("{userId}")]
		public async Task<ActionResult> ReplaceUser(int userId, UpdateUser user)
		{
			var userModel = await _usersRepository.GetUserAsync(userId);
			if (userModel == null)
			{
				return NotFound();
			}

			_mapper.Map(user, userModel);

			await _usersRepository.SaveChangesAsync();

			return NoContent();
		}

		/// <summary>
		/// Partially updates a User resource.
		/// </summary>
		/// <param name="userId">The ID of the user to modify.</param>
		/// <param name="patchDocument"></param>
		/// <example>PATCH https://localhost:7025/api/v1/users/16 
		/// -H 'Content-Type: application/json'
		/// -H 'Accept: application/json'
		/// -d '[{"op": "replace","path": "/Surname","value": "this is his new surname"},{"op": "replace","path": "/Adusername","value": "waynesusername"}]'
		/// </example>
		[HttpPatch("{userId}")]
		public async Task<ActionResult> ChangeUser(int userId, JsonPatchDocument<UpdateUser> patchDocument)
		{
			if (!await _usersRepository.UserExistsAsync(userId))
			{
				return NotFound();
			}

			var userModel = await _usersRepository.GetUserAsync(userId);

			var userToPatch = _mapper.Map<UpdateUser>(userModel);

			patchDocument.ApplyTo(userToPatch, ModelState);

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			if (!TryValidateModel(userToPatch))
			{
				return BadRequest(ModelState);
			}

			_mapper.Map(userToPatch, userModel);
			await _usersRepository.SaveChangesAsync();

			return NoContent();
		}

	}
}
