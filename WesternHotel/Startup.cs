using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WesternHotel.Startup))]
namespace WesternHotel
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
