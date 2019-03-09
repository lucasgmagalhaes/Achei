using Entidades.Entidades;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;

namespace Persistencia.Services
{
    public class UsuarioService : CrudService<Usuario>, IUsuarioService
    {
        public UsuarioService(ApplicationDbContext dbContext) : base(dbContext) { }
    }
}
