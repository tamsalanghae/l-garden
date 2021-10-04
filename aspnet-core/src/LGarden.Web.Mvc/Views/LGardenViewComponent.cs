using Abp.AspNetCore.Mvc.ViewComponents;

namespace LGarden.Web.Views
{
    public abstract class LGardenViewComponent : AbpViewComponent
    {
        protected LGardenViewComponent()
        {
            LocalizationSourceName = LGardenConsts.LocalizationSourceName;
        }
    }
}
