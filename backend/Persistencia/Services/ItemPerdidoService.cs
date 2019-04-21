using Entidades.Entidades;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;

namespace Persistencia.Services
{
    public class ItemPerdidoService : CrudService<ItemPerdido>, IItemPerdidoService
    {
        public ItemPerdidoService(ApplicationDbContext dbContext) : base(dbContext) { }
    }
}
