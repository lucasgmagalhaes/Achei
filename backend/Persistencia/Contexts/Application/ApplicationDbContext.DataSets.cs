using Entidades;
using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;

namespace Persistencia.Contexts.Application
{
    public partial class ApplicationDbContext
    {
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<ItemAchado> ItemAchado { get; set; }
        public virtual DbSet<ItemPerdido> ItemPerdido { get; set; }
        public virtual DbSet<Tag> Tag { get; set; }
        public virtual DbSet<Regiao> Regiao { get; set; }
    }
}
