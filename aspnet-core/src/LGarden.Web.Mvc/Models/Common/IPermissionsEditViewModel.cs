using System.Collections.Generic;
using LGarden.Roles.Dto;

namespace LGarden.Web.Models.Common
{
    public interface IPermissionsEditViewModel
    {
        List<FlatPermissionDto> Permissions { get; set; }
    }
}