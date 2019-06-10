using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Persistencia.Contexts.Application;

namespace Migrations
{
    [Migration("2019042004")]
    [DbContext(typeof(ApplicationDbContext))]
    public class Conversor_2019042004 : Migration
    {
        protected override void Up(MigrationBuilder migration)
        {
            migration.Sql("CREATE TABLE Item (" +
                "Id INT NOT NULL AUTO_INCREMENT," +
                "Titulo VARCHAR(50) NOT NULL," +
                "Detalhe VARCHAR(100) NULL," +
                "Tipo TEXT NOT NULL," +
                "UsuarioId INT NOT NULL," +
                "RegiaoId INT NULL," +
                "DataInicio DATE NULL," +
                "DataFim DATE NULL," +
                "Recuperado bit NULL," +
                "Devolvido bit NULL," +
                "Hora VARCHAR(10) NULL," +
                "FOREIGN KEY(UsuarioId) REFERENCES Usuario(Id) ON DELETE CASCADE," +
                "FOREIGN KEY(RegiaoId) REFERENCES Regiao(Id) ON DELETE CASCADE," +
                "PRIMARY KEY(Id)" +
                ");"
             );

            migration.Sql("CREATE TABLE Tag (" +
                "Id INT NOT NULL AUTO_INCREMENT," +
                "Nome VARCHAR(30) NOT NULL," +
                "ItemId INT NULL," +
                "FOREIGN KEY(ItemId) REFERENCES Item(Id) ON DELETE CASCADE," +
                "PRIMARY KEY(Id)" +
                ");"
            );
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
        }
    }
}
