using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
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

        public ItemPerdido BuscarComTags(long id)
        {
            return base.Buscar(perdido => perdido.Id == id, result => result.Include(perdido => perdido.Tags))
                .SingleOrDefault();
        }
    }
}
