using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Admissions.Startup))]
namespace Admissions
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
