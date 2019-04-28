using Entidades.Interfaces;
using System.Collections.Generic;

namespace Entidades.Entidades
{
    public class Regiao : IEntity
    {
        public long Id { get; set; }
        public string Longitude { get; set; }
        public string Latitude { get; set; }
        public virtual List<Item> Item { get; set; }

        public Regiao()
        {
            Item = new List<Item>();
        }
    }
}
