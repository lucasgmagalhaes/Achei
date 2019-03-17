using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Persistencia.Contexts.Application;

namespace Migrations
{
    [Migration("2019031003")]
    [DbContext(typeof(ApplicationDbContext))]
    public class Conversor_2019031003 : Migration
    {
        protected override void Up(MigrationBuilder migration)
        {
            migration.Sql("ALTER TABLE usuario ALTER COLUMN foto_perfil varchar(max)");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
        }
    }
}
