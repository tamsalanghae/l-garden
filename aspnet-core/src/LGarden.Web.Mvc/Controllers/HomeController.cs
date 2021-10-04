using Microsoft.AspNetCore.Mvc;
using Abp.AspNetCore.Mvc.Authorization;
using LGarden.Controllers;

namespace LGarden.Web.Controllers
{
    [AbpMvcAuthorize]
    public class HomeController : LGardenControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
