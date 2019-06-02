using System.Collections.Generic;
using System.Linq;
using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;

namespace Persistencia.Services
{
    public class ItemMatchService : CrudService<ItemMatch>, IItemMatchService
    {
        public ItemMatchService(ApplicationDbContext dbContext) : base(dbContext) { }

        public List<ItemAchado> BuscarMatchsAchados(long usuarioId)
        {
            return Entity()
                .Include(item => item.ItemAchado)
                .Include(item => item.ItemAchado)
                .Where(item => item.ItemPerdido.UsuarioId == usuarioId)
                .Select(item => item.ItemAchado).ToList();
        }

        public List<ItemMatch> BuscarMatchsAchados(long usuarioId, long idAchado)
        {
            return Entity()
                .Include(item => item.ItemAchado)
                .Include(item => item.ItemPerdido)
                .Where(item => item.ItemPerdido.UsuarioId == usuarioId && item.ItemAchadoId == idAchado)
                .ToList();
        }

        public List<ItemMatch> BuscarMatchsPerdidos(long usuarioId, long idPerdido)
        {
            return Entity().Include(item => item.ItemPerdido)
                    .Where(item => item.ItemAchado.UsuarioId == usuarioId && item.ItemPerdidoId == idPerdido)
                    .ToList();
        }

        public List<ItemPerdido> BuscarMatchsPerdidos(long usuarioId)
        {
            return Entity().Include(item => item.ItemPerdido)
                    .Where(item => item.ItemAchado.UsuarioId == usuarioId)
                    .Select(item => item.ItemPerdido).ToList();
        }
    }
}
