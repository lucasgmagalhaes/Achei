using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Entidades.Configuration
{
    public class ItemAchadoConfig : IEntityTypeConfiguration<ItemAchado>
    {
        public void Configure(EntityTypeBuilder<ItemAchado> builder)
        {
            builder.Property(e => e.UsuarioId)
              .HasColumnName("UsuarioId");

            builder.HasOne(e => e.ItemPerdidoMatch)
                .WithMany(item => item.ItensAchadosMatch)
                .HasForeignKey(item => item.ItemPerdidoMatchId);
        }
    }
}
