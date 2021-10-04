using Abp.AspNetCore.Mvc.Views;
using Abp.Runtime.Session;
using Microsoft.AspNetCore.Mvc.Razor.Internal;

namespace LGarden.Web.Views
{
    public abstract class LGardenRazorPage<TModel> : AbpRazorPage<TModel>
    {
        [RazorInject]
        public IAbpSession AbpSession { get; set; }

        protected LGardenRazorPage()
        {
            LocalizationSourceName = LGardenConsts.LocalizationSourceName;
        }
    }
}
