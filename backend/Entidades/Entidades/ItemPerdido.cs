using System.Collections.Generic;

namespace Entidades.Entidades
{
    public class ItemPerdido : Item
    {

        public bool Recuperado { get; set; }
        public virtual List<ItemMatch> ItensAchadosMatch { get; set; }

        public ItemPerdido()
        {
            ItensAchadosMatch = new List<ItemMatch>();
        }
    }
}
