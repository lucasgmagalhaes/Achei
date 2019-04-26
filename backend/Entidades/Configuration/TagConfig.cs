using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Entidades.Configuration
{
    public class TagConfig : IEntityTypeConfiguration<Tag>
    {
        public void Configure(EntityTypeBuilder<Tag> builder)
        {
            builder.ToTable("Tag");

            builder.Property(e => e.Id)
                .HasColumnName("Id")
                .ValueGeneratedOnAdd();

            builder.Property(e => e.Nome)
                .IsRequired()
                .HasMaxLength(30)
                .IsUnicode(false);

            builder.HasOne(d => d.Item)
                .WithMany(p => p.Tags)
                .HasForeignKey(d => d.ItemId)
                .HasConstraintName("FK__TAG__ItemId__68487DD7");
        }
    }
}