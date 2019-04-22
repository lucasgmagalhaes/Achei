using Entidades.Entidades;
using System.Collections.Generic;

namespace Persistencia.Interfaces
{
    public interface IItemAchadoService : ICrudService<ItemAchado>
    {
        /// <summary>
        /// Busca os itens achados por um usuário
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        List<ItemAchado> BuscarPorIdUsuario(long id);
    }
}
