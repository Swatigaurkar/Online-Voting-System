using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Online_Voting_System.Startup))]
namespace Online_Voting_System
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
