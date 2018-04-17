using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SaleOnline.Startup))]
namespace SaleOnline
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
