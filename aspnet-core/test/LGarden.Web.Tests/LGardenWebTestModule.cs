using Abp.AspNetCore;
using Abp.AspNetCore.TestBase;
using Abp.Modules;
using Abp.Reflection.Extensions;
using LGarden.EntityFrameworkCore;
using LGarden.Web.Startup;
using Microsoft.AspNetCore.Mvc.ApplicationParts;

namespace LGarden.Web.Tests
{
    [DependsOn(
        typeof(LGardenWebMvcModule),
        typeof(AbpAspNetCoreTestBaseModule)
    )]
    public class LGardenWebTestModule : AbpModule
    {
        public LGardenWebTestModule(LGardenEntityFrameworkModule abpProjectNameEntityFrameworkModule)
        {
            abpProjectNameEntityFrameworkModule.SkipDbContextRegistration = true;
        } 
        
        public override void PreInitialize()
        {
            Configuration.UnitOfWork.IsTransactional = false; //EF Core InMemory DB does not support transactions.
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(LGardenWebTestModule).GetAssembly());
        }
        
        public override void PostInitialize()
        {
            IocManager.Resolve<ApplicationPartManager>()
                .AddApplicationPartsIfNotAddedBefore(typeof(LGardenWebMvcModule).Assembly);
        }
    }
}