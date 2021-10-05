﻿using Abp.AutoMapper;
using LGarden.Roles.Dto;
using LGarden.Web.Models.Common;

namespace LGarden.Web.Models.Roles
{
    [AutoMapFrom(typeof(GetRoleForEditOutput))]
    public class EditRoleModalViewModel : GetRoleForEditOutput, IPermissionsEditViewModel
    {
        public bool HasPermission(FlatPermissionDto permission)
        {
            return GrantedPermissionNames.Contains(permission.Name);
        }
    }
}
