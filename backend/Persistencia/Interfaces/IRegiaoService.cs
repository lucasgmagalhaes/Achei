using Entidades.Entidades;
using System;
using System.Collections.Generic;
using System.Text;

namespace Persistencia.Interfaces
{
    public interface IRegiaoService : ICrudService<Regiao>
    {
        Regiao BuscarPorItemId(long id);
    }
}
