using Abp.Authorization;
using LGarden.Authorization.Roles;
using LGarden.Authorization.Users;

namespace LGarden.Authorization
{
    public class PermissionChecker : PermissionChecker<Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {
        }
    }
}
