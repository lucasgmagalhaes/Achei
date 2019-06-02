using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Entidades.Configuration
{
    public class ItemPerdidoConfig : IEntityTypeConfiguration<ItemPerdido>
    {
        public void Configure(EntityTypeBuilder<ItemPerdido> builder)
        {
            builder.Property(e => e.UsuarioId)
              .HasColumnName("UsuarioId");
        }
    }
}
