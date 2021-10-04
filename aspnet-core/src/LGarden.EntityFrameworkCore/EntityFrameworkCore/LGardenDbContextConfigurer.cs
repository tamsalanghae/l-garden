using System.Data.Common;
using Microsoft.EntityFrameworkCore;

namespace LGarden.EntityFrameworkCore
{
    public static class LGardenDbContextConfigurer
    {
        public static void Configure(DbContextOptionsBuilder<LGardenDbContext> builder, string connectionString)
        {
            builder.UseMySql(connectionString);
        }

        public static void Configure(DbContextOptionsBuilder<LGardenDbContext> builder, DbConnection connection)
        {
            builder.UseMySql(connection);
        }
    }
}
