using Entidades.Entidades;
using Entidades.Interfaces;

namespace Entidades
{
    public class Tag : IEntity
    {
        public long Id { get; set; }
        public string Nome { get; set; }
        public long? ItemId { get; set; }
        public virtual Item Item { get; set; }
    }
}