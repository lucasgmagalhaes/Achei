using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Entidades.Configuration
{
    public class RegiaoConfig : IEntityTypeConfiguration<Regiao>
    {
        public void Configure(EntityTypeBuilder<Regiao> builder)
        {
            builder.ToTable("Regiao");

            builder.Property(e => e.Id)
                .HasColumnName("Id")
                .ValueGeneratedOnAdd();

            builder.Property(e => e.Latitude)
                .HasMaxLength(30)
                .IsUnicode(false);

            builder.Property(e => e.Longitude)
                .HasMaxLength(30)
                .IsUnicode(false);
        }
    }
}