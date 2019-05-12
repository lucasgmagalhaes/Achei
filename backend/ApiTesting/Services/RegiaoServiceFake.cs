using Entidades.Entidades;
using Persistencia.Interfaces;
using System.Linq;

namespace ApiTesting.Services
{
    internal class RegiaoServiceFake : CrudServiceFake<Regiao>, IRegiaoService
    {
        public RegiaoServiceFake() : base(GeradorMocks.GetItensPerdidos().Select(item => item.Regiao).ToList()) { }

        public Regiao BuscarPorItemId(long id)
        {
            return base.Buscar().SingleOrDefault(regiao => regiao.Item.Any(item => item.Id == id));
        }
    }
}
