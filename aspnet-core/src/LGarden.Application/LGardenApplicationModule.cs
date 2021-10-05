﻿using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;
using LGarden.Authorization;

namespace LGarden
{
    [DependsOn(
        typeof(LGardenCoreModule), 
        typeof(AbpAutoMapperModule))]
    public class LGardenApplicationModule : AbpModule
    {
        public override void PreInitialize()
        {
            Configuration.Authorization.Providers.Add<LGardenAuthorizationProvider>();
        }

        public override void Initialize()
        {
            var thisAssembly = typeof(LGardenApplicationModule).GetAssembly();

            IocManager.RegisterAssemblyByConvention(thisAssembly);

            Configuration.Modules.AbpAutoMapper().Configurators.Add(
                // Scan the assembly for classes which inherit from AutoMapper.Profile
                cfg => cfg.AddMaps(thisAssembly)
            );
        }
    }
}
