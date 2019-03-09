using Microsoft.AspNetCore.Authorization;
using Persistencia;
using System.Threading.Tasks;

namespace Api
{
    public class AuthorizeHandle : IAuthorizationHandler
    {
        public Task HandleAsync(AuthorizationHandlerContext context)
        {
            var email = context.User.Identity.Name;
            if (context.User.Identity.IsAuthenticated)
            {
                string database = Session.BuscarBancoDoUsuario(email);
                if (database != "")
                {
                    ConnectionString.Database = database;
                }
            }
            return Task.CompletedTask;
        }
    }
}
