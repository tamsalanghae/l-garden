using Microsoft.EntityFrameworkCore;
using Abp.Zero.EntityFrameworkCore;
using LGarden.Authorization.Roles;
using LGarden.Authorization.Users;
using LGarden.MultiTenancy;

namespace LGarden.EntityFrameworkCore
{
    public class LGardenDbContext : AbpZeroDbContext<Tenant, Role, User, LGardenDbContext>
    {
        /* Define a DbSet for each entity of the application */
        
        public LGardenDbContext(DbContextOptions<LGardenDbContext> options)
            : base(options)
        {
        }
    }
}
