using System.Collections.Generic;
using LGarden.Roles.Dto;

namespace LGarden.Web.Models.Users
{
    public class UserListViewModel
    {
        public IReadOnlyList<RoleDto> Roles { get; set; }
    }
}
