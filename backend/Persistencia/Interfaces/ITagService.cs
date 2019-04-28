using Entidades;
using System.Collections.Generic;

namespace Persistencia.Interfaces
{
    public interface ITagService : ICrudService<Tag>
    {
        List<Tag> BuscarPorItemId(long id);
    }
}
