using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Persistencia.Contexts.Application;

namespace Migrations
{
    [Migration("2019042005")]
    [DbContext(typeof(ApplicationDbContext))]
    public class Conversor_2019042005 : Migration
    {
        protected override void Up(MigrationBuilder migration)
        {
            migration.Sql("ALTER TABLE Item ADD Imagem VARCHAR(MAX) NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
        }
    }
}
