using Entidades.Entidades;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;
using System.Linq;

namespace Persistencia.Services
{
    public class AutenticacaoService : CrudService<Usuario>, IAutenticacaoService
    {
        public AutenticacaoService(ApplicationDbContext context) : base(context) { }

        public Usuario AutenticarUsuario(string email, string senha)
        {
            return base.Buscar(usuario => usuario.Email == email).SingleOrDefault();
        }
    }
}
