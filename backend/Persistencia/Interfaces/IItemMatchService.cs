using Entidades.Entidades;
using System.Collections.Generic;

namespace Persistencia.Interfaces
{
    public interface IItemMatchService : ICrudService<ItemMatch>
    {
        List<ItemPerdido> BuscarMatchsPerdidos(long usuarioId);
        List<ItemAchado> BuscarMatchsAchados(long usuarioId);
        List<ItemMatch> BuscarMatchsPerdidos(long usuarioId, long idPerdido);
        List<ItemMatch> BuscarMatchsAchados(long usuarioId, long idAchado);
    }
}
