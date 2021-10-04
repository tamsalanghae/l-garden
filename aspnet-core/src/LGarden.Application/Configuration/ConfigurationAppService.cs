using System.Threading.Tasks;
using Abp.Authorization;
using Abp.Runtime.Session;
using LGarden.Configuration.Dto;

namespace LGarden.Configuration
{
    [AbpAuthorize]
    public class ConfigurationAppService : LGardenAppServiceBase, IConfigurationAppService
    {
        public async Task ChangeUiTheme(ChangeUiThemeInput input)
        {
            await SettingManager.ChangeSettingForUserAsync(AbpSession.ToUserIdentifier(), AppSettingNames.UiTheme, input.Theme);
        }
    }
}
