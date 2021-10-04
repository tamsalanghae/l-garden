using System.Threading.Tasks;
using Abp.Application.Services;
using LGarden.Sessions.Dto;

namespace LGarden.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
    }
}
