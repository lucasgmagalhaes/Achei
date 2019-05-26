using Entidades.Entidades;
using System.Collections.Generic;

namespace Entidades.Dto
{
    public class ItemPerdidoDto : ItemDto
    {
        public bool Recuperado { get; set; }
        public List<long> ItensAchadosMatchId { get; set; }
    }
}
