using System.Collections.Generic;

namespace Entidades.Entidades
{
    public class ItemPerdido : Item
    {

        public bool Recuperado { get; set; }
        public long? ItemAchadoMatchId { get; set; }
        public virtual ItemAchado ItemAchadoMatch { get; set; }
        public virtual List<ItemAchado> ItensAchadosMatch { get; set; }

        public ItemPerdido()
        {
            ItensAchadosMatch = new List<ItemAchado>();
        }
    }
}
