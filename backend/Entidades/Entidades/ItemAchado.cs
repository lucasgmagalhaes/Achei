using System.Collections.Generic;

namespace Entidades.Entidades
{
    public class ItemAchado : Item
    {
        public bool Devolvido { get; set; }
        public virtual List<ItemMatch> ItensPerdidosMatch { get; set; }

        public ItemAchado()
        {
            ItensPerdidosMatch = new List<ItemMatch>();
        }
    }
}
