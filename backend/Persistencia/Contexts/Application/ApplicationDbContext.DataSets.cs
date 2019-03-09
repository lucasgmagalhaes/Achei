using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;

namespace Persistencia.Contexts.Application
{
    public partial class ApplicationDbContext
    {
        public virtual DbSet<Usuario> Usuario { get; set; }
    }
}
