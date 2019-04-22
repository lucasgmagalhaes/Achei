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
    }
}
