using System.Threading.Tasks;
using LGarden.Configuration.Dto;

namespace LGarden.Configuration
{
    public interface IConfigurationAppService
    {
        Task ChangeUiTheme(ChangeUiThemeInput input);
    }
}
