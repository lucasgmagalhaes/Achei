using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Utils;

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

        public ItemPerdido BuscarComEagerLoading(long id)
        {
            return base.Entity()
                .Include(item => item.Regiao)
                .Include(item => item.Tags)
                .Single(item => item.Id == id);
        }

        public async Task AtualizarItensCompativeis(ItemPerdido item)
        {
            List<ItemAchado> itensCompativeis = await base.Entity<ItemAchado>()
                .Where(_item => !_item.Devolvido
                && _item.Tags.Any(tag => item.Tags.Contains(tag))
                && Coordenadas.RegioesEstaoPerto(_item.Regiao, item.Regiao))
                .ToListAsync();

            item.ItensAchadosMatch = itensCompativeis;
            await base.AtualizarAsync(item);
        }
    }
}
