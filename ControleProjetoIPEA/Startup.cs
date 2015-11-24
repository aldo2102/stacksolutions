using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ControleProjetoIPEA.Startup))]
namespace ControleProjetoIPEA
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
