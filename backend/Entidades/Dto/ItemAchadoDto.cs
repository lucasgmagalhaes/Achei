using Entidades.Entidades;
using System.Collections.Generic;

namespace Entidades.Dto
{
    public class ItemAchadoDto : ItemDto
    {
        public bool Devolvido { get; set; }
        public List<long> ItensPerdidoMatchId { get; set; }
    }
}
