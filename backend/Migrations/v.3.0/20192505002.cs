using Extensions.EF;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Persistencia.Contexts.Application;

namespace Migrations
{
    [Migration("20192505002")]
    [DbContext(typeof(ApplicationDbContext))]
    public class Conversor20192505002 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("CREATE TABLE ItemMatch("+
                "Id INT AUTO_INCREMENT," +
                "ItemAchadoId INT references Item(Id)," +
                "ItemPerdidoId INT references Item(Id)," +
                "PRIMARY KEY(Id))");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            // Method intentionally left empty.
        }
    }
}
