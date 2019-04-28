using Entidades.Entidades;
using System.Collections.Generic;

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
    }
}
