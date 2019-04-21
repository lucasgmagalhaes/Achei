using Entidades.Entidades;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;

namespace Persistencia.Services
{
    public class ItemAchadoService : CrudService<ItemAchado>, IItemAchadoService
    {
        public ItemAchadoService(ApplicationDbContext dbContext) : base(dbContext) { }
    }
}
