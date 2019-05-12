using Entidades.Entidades;
using Persistencia.Interfaces;
using System.Collections.Generic;
using System.Linq;

namespace ApiTesting.Services
{
    internal class ItemPerdidoServiceFake : CrudServiceFake<ItemPerdido>, IItemPerdidoService
    {
        public ItemPerdidoServiceFake() : base(GeradorMocks.GetItensPerdidos()) { }

        public ItemPerdido BuscarComEagerLoading(long id)
        {
            return base.Buscar(id);
        }

        public ItemPerdido BuscarComTags(long id)
        {
            return base.Buscar(id);
        }

        public List<ItemPerdido> BuscarPorIdUsuario(long id)
        {
            return base.Buscar().Where(item => item.UsuarioId == id).ToList();
        }
    }
}
