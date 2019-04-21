using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Entidades.Configuration
{
    public class UsuarioConfig : IEntityTypeConfiguration<Usuario>
    {
        public void Configure(EntityTypeBuilder<Usuario> builder)
        {
            builder.ToTable("usuario");

            builder.Property(e => e.Id)
                .HasColumnName("id")
                .ValueGeneratedOnAdd();

            builder.Property(e => e.Cidade)
                .HasColumnName("cidade")
                .HasMaxLength(100)
                .IsUnicode(false);

            builder.Property(e => e.DataNascimento)
                .HasColumnName("data_nascimento")
                .HasColumnType("date");

            builder.Property(e => e.Email)
                .IsRequired()
                .HasColumnName("email")
                .HasMaxLength(50)
                .IsUnicode(false);

            builder.Property(e => e.Estado)
                .HasColumnName("estado")
                .HasMaxLength(100)
                .IsUnicode(false);

            builder.Property(e => e.FotoPerfil)
                .HasColumnName("foto_perfil");

            builder.Property(e => e.Nome)
                .IsRequired()
                .HasColumnName("nome")
                .HasMaxLength(255)
                .IsUnicode(false);

            builder.Property(e => e.Senha)
                .IsRequired()
                .HasColumnName("senha")
                .HasMaxLength(20)
                .IsUnicode(false);

            builder.Property(e => e.Sexo)
                .HasColumnName("sexo")
                .HasMaxLength(10)
                .IsUnicode(false);

            builder.Property(e => e.Telefone)
                .HasColumnName("telefone")
                .HasMaxLength(15)
                .IsUnicode(false);

            builder.HasMany(e => e.ItensAchados)
                .WithOne(item => item.Usuario)
                .HasForeignKey(s => s.UsuarioId);

            builder.HasMany(e => e.ItensPerdidos)
                .WithOne(item => item.Usuario)
                .HasForeignKey(s => s.UsuarioId);

        }
    }
}
