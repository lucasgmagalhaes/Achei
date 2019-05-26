using System.Collections.Generic;

namespace Entidades.Entidades
{
    public class ItemAchado : Item
    {
        public bool Devolvido { get; set; }
        public long ItemPerdidoMatchId { get; set; }
        public virtual ItemPerdido ItemPerdidoMatch { get; set; }
        public virtual List<ItemPerdido> ItensPerdidosMatch { get; set; }

        public ItemAchado()
        {
            ItensPerdidosMatch = new List<ItemPerdido>();
        }
    }
}
