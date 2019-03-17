using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Entidades.Configuration.Gerencia
{
    public class UsuarioConfig : IEntityTypeConfiguration<Usuario>
    {
        public void Configure(EntityTypeBuilder<Usuario> entity)
        {
            entity.ToTable("usuario");

            entity.Property(e => e.Id)
                .HasColumnName("id")
                .ValueGeneratedOnAdd();

            entity.Property(e => e.Cidade)
                .HasColumnName("cidade")
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.Property(e => e.DataNascimento)
                .HasColumnName("data_nascimento")
                .HasColumnType("date");

            entity.Property(e => e.Email)
                .IsRequired()
                .HasColumnName("email")
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.Property(e => e.Estado)
                .HasColumnName("estado")
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.Property(e => e.FotoPerfil)
                .HasColumnName("foto_perfil");

            entity.Property(e => e.Nome)
                .IsRequired()
                .HasColumnName("nome")
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.Property(e => e.Senha)
                .IsRequired()
                .HasColumnName("senha")
                .HasMaxLength(20)
                .IsUnicode(false);

            entity.Property(e => e.Sexo)
                .HasColumnName("sexo")
                .HasMaxLength(10)
                .IsUnicode(false);

            entity.Property(e => e.Telefone)
                .IsRequired()
                .HasColumnName("telefone")
                .HasMaxLength(15)
                .IsUnicode(false);
        }
    }
}
