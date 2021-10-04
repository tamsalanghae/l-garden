using Abp.Application.Services;
using LGarden.MultiTenancy.Dto;

namespace LGarden.MultiTenancy
{
    public interface ITenantAppService : IAsyncCrudAppService<TenantDto, int, PagedTenantResultRequestDto, CreateTenantDto, TenantDto>
    {
    }
}

