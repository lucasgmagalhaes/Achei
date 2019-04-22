using Entidades.Entidades;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;
using System.Collections.Generic;
using System.Linq;

namespace Persistencia.Services
{
    public class ItemAchadoService : CrudService<ItemAchado>, IItemAchadoService
    {
        public ItemAchadoService(ApplicationDbContext dbContext) : base(dbContext) { }

        public List<ItemAchado> BuscarPorIdUsuario(long id)
        {
            return base.Buscar(perdido => perdido.UsuarioId == id).ToList();
        }
    }
}
