using Entidades.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entidades.Entidades
{
    public class ItemMatch : IEntity
    {
        public long Id { get; set; }
        public long? ItemAchadoId { get; set; }
        public long? ItemPerdidoId { get; set; }
        public ItemAchado ItemAchado { get; set; }
        public ItemPerdido ItemPerdido { get; set; }
    }
}
