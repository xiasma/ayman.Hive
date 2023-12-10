using AutoMapper;

namespace Hive.Api.Profiles
{
	public class UserProfile : Profile
	{
		public UserProfile()
		{
			CreateMap<Data.Models.TbUser, Dtos.User>();
		}
	}
}
