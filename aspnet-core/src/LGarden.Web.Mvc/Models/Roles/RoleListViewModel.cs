using System.Collections.Generic;
using LGarden.Roles.Dto;

namespace LGarden.Web.Models.Roles
{
    public class RoleListViewModel
    {
        public IReadOnlyList<PermissionDto> Permissions { get; set; }
    }
}
