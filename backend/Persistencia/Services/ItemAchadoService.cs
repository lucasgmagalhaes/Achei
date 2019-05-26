using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Nest;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Utils;

namespace Persistencia.Services
{
    public class ItemAchadoService : CrudService<ItemAchado>, IItemAchadoService
    {
        public ItemAchadoService(ApplicationDbContext dbContext) : base(dbContext) { }

        public List<ItemAchado> BuscarPorIdUsuario(long id)
        {
            return base.Buscar(perdido => perdido.UsuarioId == id).ToList();
        }

        public async Task AtualizarItensCompativeis(ItemAchado item)
        {
            List<ItemPerdido> itensCompativeis = await base.Entity<ItemPerdido>()
                .Where(_item => !_item.Recuperado
                && _item.Tags.Any(tag => item.Tags.Contains(tag))
                && Coordenadas.RegioesEstaoPerto(_item.Regiao, item.Regiao))
                .ToListAsync();

            item.ItensPerdidosMatch = itensCompativeis;
            await base.AtualizarAsync(item);
        }
    }
}
