using Entidades.Entidades;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Xunit;

namespace ApiTesting
{
    public class ItemPerdidoServiceFake : IItemPerdidoService
    {
        private readonly List<ItemPerdido> items;

        public ItemPerdidoServiceFake()
        {
            items = new List<ItemPerdido>()
            {
                new ItemPerdido() {Id = 1, DataFim = new DateTime(), DataInicio = new DateTime(), Detalhe = "Item 1", Hora = "01", Imagem = "", Recuperado = true, Regiao = new Regiao() { Id = 1, Item = null, Latitude = "123", Longitude = "321"}},
                new ItemPerdido() {Id = 2, DataFim = new DateTime(), DataInicio = new DateTime(), Detalhe = "Item 2", Hora = "01", Imagem = "", Recuperado = false, Regiao = new Regiao() { Id = 2, Item = null, Latitude = "123", Longitude = "321"}},
                new ItemPerdido() {Id = 3, DataFim = new DateTime(), DataInicio = new DateTime(), Detalhe = "Item 3", Hora = "01", Imagem = "", Recuperado = true, Regiao = new Regiao() { Id = 3, Item = null, Latitude = "123", Longitude = "321"}},
                new ItemPerdido() {Id = 4, DataFim = new DateTime(), DataInicio = new DateTime(), Detalhe = "Item 4", Hora = "01", Imagem = "", Recuperado = false, Regiao = new Regiao() { Id = 4, Item = null, Latitude = "123", Longitude = "321"}},
                new ItemPerdido() {Id = 5, DataFim = new DateTime(), DataInicio = new DateTime(), Detalhe = "Item 5", Hora = "01", Imagem = "", Recuperado = true, Regiao = new Regiao() { Id = 5, Item = null, Latitude = "123", Longitude = "321"}},
                new ItemPerdido() {Id = 6, DataFim = new DateTime(), DataInicio = new DateTime(), Detalhe = "Item 6", Hora = "01", Imagem = "", Recuperado = false, Regiao = new Regiao() { Id = 6, Item = null, Latitude = "123", Longitude = "321"}},
                new ItemPerdido() {Id = 7, DataFim = new DateTime(), DataInicio = new DateTime(), Detalhe = "Item 7", Hora = "01", Imagem = "", Recuperado = true, Regiao = new Regiao() { Id = 7, Item = null, Latitude = "123", Longitude = "321"}},
                new ItemPerdido() {Id = 8, DataFim = new DateTime(), DataInicio = new DateTime(), Detalhe = "Item 8", Hora = "01", Imagem = "", Recuperado = true, Regiao = new Regiao() { Id = 8, Item = null, Latitude = "123", Longitude = "321"}},
                new ItemPerdido() {Id = 9, DataFim = new DateTime(), DataInicio = new DateTime(), Detalhe = "Item 9", Hora = "01", Imagem = "", Recuperado = true, Regiao = new Regiao() { Id = 9, Item = null, Latitude = "123", Longitude = "321"}},
                new ItemPerdido() {Id = 10, DataFim = new DateTime(), DataInicio = new DateTime(), Detalhe = "Item 10", Hora = "01", Imagem = "", Recuperado = true, Regiao = new Regiao() { Id = 10, Item = null, Latitude = "123", Longitude = "321"}}
            };
        }

        public void Atualizar(ItemPerdido entidade)
        {
            ItemPerdido itemPerdido = this.items.SingleOrDefault(_entidade => _entidade.Id = entidade.Id);
            itemPerdido = entidade;
        }

        public void Atualizar(List<ItemPerdido> entidades)
        {
            entidades.ForEach(_entidade =>
            {
                ItemPerdido itemPerdido = this.items.SingleOrDefault(item => item.Id == _entidade.Id);
                itemPerdido = _entidade;
            });
        }

        public Task AtualizarAsync(ItemPerdido entidade)
        {
            throw new NotImplementedException();
        }

        public Task AtualizarAsync(List<ItemPerdido> entidades)
        {
            throw new NotImplementedException();
        }

        public List<ItemPerdido> Buscar()
        {
            throw new NotImplementedException();
        }

        public ItemPerdido Buscar(long id)
        {
            throw new NotImplementedException();
        }

        public IQueryable<ItemPerdido> Buscar(Expression<Func<ItemPerdido, bool>> predicate, Func<IQueryable<ItemPerdido>, IIncludableQueryable<ItemPerdido, object>> include = null)
        {
            throw new NotImplementedException();
        }

        public Task<List<ItemPerdido>> BuscarAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ItemPerdido> BuscarAsync(long id)
        {
            throw new NotImplementedException();
        }

        public ItemPerdido BuscarComEagerLoading(long id)
        {
            throw new NotImplementedException();
        }

        public ItemPerdido BuscarComTags(long id)
        {
            throw new NotImplementedException();
        }

        public List<ItemPerdido> BuscarPorIdUsuario(long id)
        {
            throw new NotImplementedException();
        }

        public void Deletar(ItemPerdido entidade)
        {
            throw new NotImplementedException();
        }

        public void Deletar(long id)
        {
            throw new NotImplementedException();
        }

        public Task DeletarAsync(ItemPerdido entidade)
        {
            throw new NotImplementedException();
        }

        public Task DeletarAsync(long id)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public DbSet<ItemPerdido> Entity()
        {
            throw new NotImplementedException();
        }

        public IQueryable<ItemPerdido> FromSql(string sql)
        {
            throw new NotImplementedException();
        }

        public IQueryable<ItemPerdido> FromSql(string sql, params object[] obj)
        {
            throw new NotImplementedException();
        }

        public ItemPerdido Inserir(ItemPerdido entidade)
        {
            throw new NotImplementedException();
        }

        public Task<ItemPerdido> InserirAsync(ItemPerdido entidade)
        {
            throw new NotImplementedException();
        }
    }
}
