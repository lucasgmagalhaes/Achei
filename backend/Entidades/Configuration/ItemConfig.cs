using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Entidades.Configuration
{
    public class ItemConfig : IEntityTypeConfiguration<Item>
    {
        public void Configure(EntityTypeBuilder<Item> builder)
        {
            builder.ToTable("Item");

            builder.Property(e => e.Id)
                .HasColumnName("Id")
                .ValueGeneratedOnAdd();

            builder.HasDiscriminator<string>("Tipo")
                .HasValue<ItemPerdido>("ItemPerdido")
                .HasValue<ItemAchado>("ItemAchado");

            builder.Property(e => e.DataFim).HasColumnType("date");

            builder.Property(e => e.DataInicio).HasColumnType("date");

            builder.Property(e => e.Detalhe)
                .HasMaxLength(100)
                .IsUnicode(false);

            builder.Property(e => e.Hora)
                .HasMaxLength(10)
                .IsUnicode(false);

            builder.Property(e => e.Titulo)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false);

            builder.HasOne(d => d.Regiao)
                .WithMany(p => p.Item)
                .HasForeignKey(d => d.RegiaoId)
                .HasConstraintName("FK__Item__RegiaoId__5FB337D6");

            builder.Property(e => e.UsuarioId)
                .HasColumnName("UsuarioId");

            builder.HasMany(e => e.Tags).WithOne(tag => tag.Item).HasForeignKey(e => e.ItemId);

        }
    }
}
