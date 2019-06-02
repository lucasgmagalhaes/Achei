using Entidades;
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
        private IItemMatchService itemMatchService;

        public ItemAchadoService(ApplicationDbContext dbContext, IItemMatchService itemMatchService) : base(dbContext)
        {
            this.itemMatchService = itemMatchService;
        }

        public List<ItemAchado> BuscarPorIdUsuario(long id)
        {
            return base.Buscar(perdido => perdido.UsuarioId == id).ToList();
        }

        public List<ItemMatch> BuscarMatchs(long idItem)
        {
            return Entity().Include(item => item.ItensPerdidosMatch)
                .Where(item => item.Id == idItem)
                .Select(item => item.ItensPerdidosMatch)
                .SingleOrDefault();
        }

        public void AtualizarItensCompativeis(ItemAchado item)
        {
            List<ItemPerdido> itensCompativeis = Entity<ItemPerdido>()
                .Include(_item => _item.Tags)
                .Include(_item => _item.Regiao)
                .Where(_item => !_item.Recuperado)
                .ToList();

            List<ItemMatch> matchsItem = BuscarMatchs(item.Id);
            itemMatchService.Deletar(matchsItem);

            itensCompativeis = itensCompativeis
                .Where(_item => _item.Tags.Any(tag => item.Tags.Any(itemTag => itemTag.Nome == tag.Nome))).ToList();

            List<ItemMatch> matchs = new List<ItemMatch>();
            itensCompativeis.ForEach(perdido =>
            {
                matchs.Add(new ItemMatch() { ItemAchado = item, ItemPerdido = perdido });
            });

            itemMatchService.Inserir(matchs);
            base.Atualizar(item);
        }
    }
}
