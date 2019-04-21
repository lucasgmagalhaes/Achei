using Entidades.Entidades;

namespace Entidades
{
    public class Tag
    {
        public long Id { get; set; }
        public string Nome { get; set; }
        public long? ItemId { get; set; }
        public virtual Item Item { get; set; }
    }
}