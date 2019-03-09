using Entidades.Entidades;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;

namespace Persistencia.Services
{
    public class AutenticacaoService : CrudService<Usuario>, IAutenticacaoService
    {
        public AutenticacaoService(ApplicationDbContext context) : base(context) { }
    }
}
