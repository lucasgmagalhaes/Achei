using Extensions.EF;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Persistencia.Contexts.Application;
using System;

namespace Migrations
{
    [Migration("20192505001")]
    [DbContext(typeof(ApplicationDbContext))]
    public class Conversor20192505001 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateForeignKeyWithIndex("Item", "Item", "ItemPerdidoMatchId", "Id");
            migrationBuilder.CreateForeignKeyWithIndex("Item", "Item", "ItemAchadoMatchId", "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            // Method intentionally left empty.
        }
    }
}
