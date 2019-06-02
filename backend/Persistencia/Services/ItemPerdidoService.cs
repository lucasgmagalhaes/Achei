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
        private readonly IItemMatchService itemMatchService;

        public ItemPerdidoService(ApplicationDbContext dbContext, IItemMatchService itemMatchService) : base(dbContext)
        {
            this.itemMatchService = itemMatchService;
        }

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

        public List<ItemMatch> BuscarMatchs(long idItem)
        {
            return Entity().Include(item => item.ItensAchadosMatch)
                .Where(item => item.Id == idItem)
                .Select(item => item.ItensAchadosMatch)
                .SingleOrDefault();
        }

        public void AtualizarItensCompativeis(ItemPerdido item)
        {
            List<ItemAchado> itensCompativeis = Entity<ItemAchado>()
                .Include(_item => _item.Tags)
                .Include(_item => _item.Regiao)
                .Where(_item => !_item.Devolvido)
                .ToList();

            List<ItemMatch> itensMatch = BuscarMatchs(item.Id);
            itemMatchService.Deletar(itensMatch);

            itensCompativeis = itensCompativeis
                .Where(_item => _item.Tags.Any(tag => item.Tags.Any(itemTag => itemTag.Nome == tag.Nome))).ToList();

            List<ItemMatch> matchs = new List<ItemMatch>();
            itensCompativeis.ForEach(achado =>
            {
                matchs.Add(new ItemMatch() { ItemPerdido = item, ItemAchado = achado });
            });

            itemMatchService.InserirAsync(matchs);
            base.Atualizar(item);
        }
    }
}
