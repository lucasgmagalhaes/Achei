using Entidades.Interfaces;
using System;
using System.Collections.Generic;

namespace Entidades.Entidades
{
    public abstract class Item : IEntity
    {
        public long Id { get; set; }
        public string Titulo { get; set; }
        public string Detalhe { get; set; }
        public string Tipo { get; set; }
        public long? RegiaoId { get; set; }
        public DateTime? DataInicio { get; set; }
        public DateTime? DataFim { get; set; }
        public string Hora { get; set; }
        public virtual Regiao Regiao { get; set; }
        public long UsuarioId { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual List<Tag> Tags { get; set; }

        public Item()
        {
            Tags = new List<Tag>();
        }
    }
}
