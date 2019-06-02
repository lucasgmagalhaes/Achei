using Entidades.Entidades;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Persistencia.Interfaces
{
    public interface IItemPerdidoService : ICrudService<ItemPerdido>
    {
        /// <summary>
        /// Busca os itens perdidos de um usuário
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        List<ItemPerdido> BuscarPorIdUsuario(long id);

        /// <summary>
        /// Busca um Item perdido carregando as tags referentes a ele
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        ItemPerdido BuscarComTags(long id);

        ItemPerdido BuscarComEagerLoading(long id);

        void AtualizarItensCompativeis(ItemPerdido item);

        List<ItemMatch> BuscarMatchs(long idItem);
    }
}
