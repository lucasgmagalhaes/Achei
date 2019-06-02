using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Entidades.Configuration
{
    public class ItemMatchConfig : IEntityTypeConfiguration<ItemMatch>
    {
        public void Configure(EntityTypeBuilder<ItemMatch> builder)
        {
            builder.HasOne(item => item.ItemPerdido)
                 .WithMany(item => item.ItensAchadosMatch)
                 .HasForeignKey(item => item.ItemPerdidoId);

            builder.HasOne(item => item.ItemAchado)
                .WithMany(item => item.ItensPerdidosMatch)
                .HasForeignKey(item => item.ItemAchadoId);
        }
    }
}
