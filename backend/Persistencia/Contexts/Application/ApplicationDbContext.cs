using Entidades.Configuration;
using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;

namespace Persistencia.Contexts.Application
{
    public partial class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.EnableSensitiveDataLogging();
            optionsBuilder
                .UseSqlServer(ConnectionString.GetConnection(), b => b.MigrationsAssembly("Migrations"))
                .EnableDetailedErrors();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "1.0.0");

            modelBuilder.ApplyConfiguration(new UsuarioConfig());
            modelBuilder.ApplyConfiguration(new ItemConfig());
            modelBuilder.ApplyConfiguration(new TagConfig());
            modelBuilder.ApplyConfiguration(new RegiaoConfig());

            modelBuilder.Entity<ItemPerdido>()
                .Property(e => e.UsuarioId)
                .HasColumnName("UsuarioId");

            modelBuilder.Entity<ItemAchado>()
                .Property(e => e.UsuarioId)
                .HasColumnName("UsuarioId");
        }
    }
}