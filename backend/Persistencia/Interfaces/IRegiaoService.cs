using Entidades.Entidades;

namespace Persistencia.Interfaces
{
    public interface IRegiaoService : ICrudService<Regiao>
    {
        Regiao BuscarPorItemId(long id);
    }
}
