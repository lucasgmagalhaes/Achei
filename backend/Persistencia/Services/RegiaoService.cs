using Entidades.Entidades;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;
using System.Linq;

namespace Persistencia.Services
{
    public class RegiaoService : CrudService<Regiao>, IRegiaoService
    {
        public RegiaoService(ApplicationDbContext dbContext) : base(dbContext) { }

        public Regiao BuscarPorItemId(long id)
        {
            return base.Entity().Where(regiao => regiao.Item.Any(item => item.Id == id)).Single();
        }
    }
}
