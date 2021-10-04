using Abp.AspNetCore.Mvc.Controllers;
using Abp.IdentityFramework;
using Microsoft.AspNetCore.Identity;

namespace LGarden.Controllers
{
    public abstract class LGardenControllerBase: AbpController
    {
        protected LGardenControllerBase()
        {
            LocalizationSourceName = LGardenConsts.LocalizationSourceName;
        }

        protected void CheckErrors(IdentityResult identityResult)
        {
            identityResult.CheckErrors(LocalizationManager);
        }
    }
}
