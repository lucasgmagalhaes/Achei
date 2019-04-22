using Entidades.Entidades;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;
using System.Collections.Generic;
using System.Linq;

namespace Persistencia.Services
{
    public class ItemPerdidoService : CrudService<ItemPerdido>, IItemPerdidoService
    {
        public ItemPerdidoService(ApplicationDbContext dbContext) : base(dbContext) { }

        public List<ItemPerdido> BuscarPorIdUsuario(long id)
        {
            return base.Buscar(perdido => perdido.UsuarioId == id).ToList();
        }
    }
}
