using Entidades.Entidades;
using System.Collections.Generic;
using System.Threading.Tasks;

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

        void AtualizarItensCompativeis(ItemAchado item);

        List<ItemMatch> BuscarMatchs(long idItem);
    }
}
