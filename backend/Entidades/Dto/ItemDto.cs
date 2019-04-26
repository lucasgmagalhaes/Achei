using System;
using System.Collections.Generic;

namespace Entidades.Entidades
{
    public class ItemDto
    {
        public long Id { get; set; }
        public string Titulo { get; set; }
        public string Detalhe { get; set; }
        public long? RegiaoId { get; set; }
        public DateTime? DataInicio { get; set; }
        public DateTime? DataFim { get; set; }
        public string Hora { get; set; }
        public string Imagem { get; set; }
        public Regiao Regiao { get; set; }
        public long UsuarioId { get; set; }
        public List<Tag> Tags { get; set; }
    }
}
