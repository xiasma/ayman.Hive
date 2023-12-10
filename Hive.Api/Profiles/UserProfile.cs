using AutoMapper;

namespace Hive.Api.Profiles
{
	public class UserProfile : Profile
	{
		public UserProfile()
		{
			CreateMap<Data.Models.TbUser, Dtos.User>();
			CreateMap<Dtos.User, Data.Models.TbUser>();
			CreateMap<Data.Models.TbUser, Dtos.UpdateUser>();
			CreateMap<Dtos.UpdateUser, Data.Models.TbUser>();		}
	}
}
