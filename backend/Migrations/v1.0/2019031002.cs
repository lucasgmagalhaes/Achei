using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Persistencia.Contexts.Application;

namespace Migrations
{
    [Migration("2019031002")]
    [DbContext(typeof(ApplicationDbContext))]
    public class Conversor_2019031002 : Migration
    {
        protected override void Up(MigrationBuilder migration)
        {
            migration.Sql("ALTER TABLE usuario ALTER COLUMN telefone varchar(15)");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
        }
    }
}
