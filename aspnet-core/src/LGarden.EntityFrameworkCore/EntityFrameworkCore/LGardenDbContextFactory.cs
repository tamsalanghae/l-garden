using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using LGarden.Configuration;
using LGarden.Web;

namespace LGarden.EntityFrameworkCore
{
    /* This class is needed to run "dotnet ef ..." commands from command line on development. Not used anywhere else */
    public class LGardenDbContextFactory : IDesignTimeDbContextFactory<LGardenDbContext>
    {
        public LGardenDbContext CreateDbContext(string[] args)
        {
            var builder = new DbContextOptionsBuilder<LGardenDbContext>();
            var configuration = AppConfigurations.Get(WebContentDirectoryFinder.CalculateContentRootFolder());

            LGardenDbContextConfigurer.Configure(builder, configuration.GetConnectionString(LGardenConsts.ConnectionStringName));

            return new LGardenDbContext(builder.Options);
        }
    }
}
