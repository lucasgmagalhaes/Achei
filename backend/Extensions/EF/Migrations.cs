using Microsoft.EntityFrameworkCore.Migrations;

namespace Extensions.EF
{
    public static class Migrations
    {
        /// <summary>
        /// Verifica se uma tabela existe no banco
        /// </summary>
        /// <param name="migrationBuilder">Migration Builder</param>
        /// <param name="table">Nome da tabela que deseja verificar a existência</param>
        public static bool TableExists(this MigrationBuilder migrationBuilder, string table)
        {
            try
            {
                migrationBuilder.Sql($"SELECT TOP 1 1 FROM {table}");
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Verifica se uma columna existe em uma tabela
        /// </summary>
        /// <param name="migrationBuilder">Migration Builder</param>
        /// <param name="table">Nome da tabela que deseja verificar a existência</param>
        /// <param name="column">Nome da columna que deseja verificar a existência</param>
        public static bool ColumnExists(this MigrationBuilder migrationBuilder, string table, string column)
        {
            try
            {
                migrationBuilder.Sql($"SELECT TOP 1 {column} FROM {table}");
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Cria uma foreign key à uma tabela existente, junto com um index para a mesma.
        /// </summary>
        /// <param name="migrationBuilder">Miragration Builder</param>
        /// <param name="baseTable">Tabela que terá a noma coluna(foreign key)</param>
        /// <param name="foreignTable">Tabela referência para a tabela base</param>
        /// <param name="newColumn">Nome da nova coluna</param>
        /// <param name="foreignTableReference">Primary key da tabela referência</param>
        /// <param name="indexName">
        /// Nome do index. Se definido como null, terá seu valor default 
        /// como IX_{baseTable}_{newColumn}
        /// </param>
        /// <param name="fkName">
        /// Nome da foreign Key. Se definido como null, terá seu valor default 
        /// como IFK_{baseTable}_{foreignTable}_{newColumn}
        /// </param>
        public static void CreateForeignKeyWithIndex(this MigrationBuilder migrationBuilder, string baseTable,
            string foreignTable, string newColumn, string foreignTableReference, string indexName = null, string fkName = null)
        {
            migrationBuilder.AddColumn<long>(
                name: newColumn,
                table: baseTable,
                nullable: true);

            if (indexName == null)
            {
                indexName = $"IX_{baseTable}_{newColumn}";
            }

            migrationBuilder.CreateIndex(
                name: indexName,
                table: baseTable,
                column: newColumn);

            if (fkName == null)
            {
                fkName = $"FK_{baseTable}_{foreignTable}_{newColumn}";
            }

            migrationBuilder.AddForeignKey(
                name: fkName,
                table: baseTable,
                column: newColumn,
                principalTable: foreignTable,
                principalColumn: foreignTableReference,
                onDelete: ReferentialAction.NoAction,
                onUpdate: ReferentialAction.NoAction);
        }
    }
}
