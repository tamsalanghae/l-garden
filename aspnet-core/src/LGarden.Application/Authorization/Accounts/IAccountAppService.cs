using System.Threading.Tasks;
using Abp.Application.Services;
using LGarden.Authorization.Accounts.Dto;

namespace LGarden.Authorization.Accounts
{
    public interface IAccountAppService : IApplicationService
    {
        Task<IsTenantAvailableOutput> IsTenantAvailable(IsTenantAvailableInput input);

        Task<RegisterOutput> Register(RegisterInput input);
    }
}
