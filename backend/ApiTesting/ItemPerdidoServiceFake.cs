using Entidades;
using Entidades.Entidades;
using Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ApiTesting
{
    public class ItemPerdidoServiceFake : IItemPerdidoService
    {
        private readonly List<ItemPerdido> itens;

        public ItemPerdidoServiceFake()
        {
            itens = GeradorMocks.GetItensPerdidos();
        }

        private void DefinirAssociacoesComoNull(ItemPerdido item)
        {
            item.Regiao = null;
            item.Tags = new List<Tag>();
            item.Usuario = null;
        }

        public void Atualizar(ItemPerdido entidade)
        {
            ItemPerdido itemPerdido = this.itens.SingleOrDefault(_entidade => _entidade.Id == entidade.Id);
            if (itemPerdido != null)
            {
                entidade.CopiarPropriedadesPara(itemPerdido);
            }
        }

        public void Atualizar(List<ItemPerdido> entidades)
        {
            entidades.ForEach(_entidade =>
            {
                ItemPerdido itemPerdido = this.itens.SingleOrDefault(item => item.Id == _entidade.Id);
                if (itemPerdido != null)
                {
                    _entidade.CopiarPropriedadesPara(itemPerdido);
                }
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
            List<ItemPerdido> itensRetorno = new List<ItemPerdido>();
            this.itens.ForEach(item =>
            {
                ItemPerdido itemCopia = new ItemPerdido();
                item.CopiarPropriedadesPara(itemCopia);
                this.DefinirAssociacoesComoNull(itemCopia);
                itensRetorno.Add(itemCopia);
            });
            return itensRetorno;
        }

        public ItemPerdido Buscar(long id)
        {
            ItemPerdido itemPerdido = this.itens.SingleOrDefault(item => item.Id == id);
            ItemPerdido retorno = new ItemPerdido();
            itemPerdido.CopiarPropriedadesPara(retorno);

            DefinirAssociacoesComoNull(retorno); 
            return retorno;
        }

        public IQueryable<ItemPerdido> Buscar(Expression<Func<ItemPerdido, bool>> predicate, Func<IQueryable<ItemPerdido>, IIncludableQueryable<ItemPerdido, object>> include = null)
        {
            return this.itens.Where(predicate.Compile()).AsQueryable();
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
            return this.itens.SingleOrDefault(item => item.Id == id);
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
