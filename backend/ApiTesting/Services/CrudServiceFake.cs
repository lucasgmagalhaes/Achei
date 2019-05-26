using Entidades.Interfaces;
using Exceptions.Entity;
using Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ApiTesting.Services
{
    public class CrudServiceFake<T> : ICrudService<T> where T : class, IEntity, new()
    {
        private readonly List<T> entidades;

        public CrudServiceFake(List<T> entidades)
        {
            this.entidades = entidades;
        }

        public void Atualizar(T entidade)
        {
            IEntity itemPerdido = entidades.Find(_entidade => _entidade.Id == entidade.Id);
            if (itemPerdido != null)
            {
                entidade.CopiarPropriedadesPara(itemPerdido);
            }
            else
            {
                throw new EntityNotFoundException();
            }
        }

        public void Atualizar(List<T> entidades)
        {
            entidades.ForEach(_entidade =>
            {
                T itemPerdido = this.entidades.SingleOrDefault(item => item.Id == _entidade.Id);
                if (itemPerdido != null)
                {
                    _entidade.CopiarPropriedadesPara(itemPerdido);
                }
            });
        }

        public Task AtualizarAsync(T entidade)
        {
            throw new NotImplementedException();
        }

        public Task AtualizarAsync(List<T> entidades)
        {
            throw new NotImplementedException();
        }

        public List<T> Buscar()
        {
            List<T> itensRetorno = new List<T>();
            entidades.ForEach(item =>
            {
                T itemCopia = new T();
                item.CopiarPropriedadesPara(itemCopia);
                itensRetorno.Add(itemCopia);
            });
            return itensRetorno;
        }

        public T Buscar(long id)
        {
            T entidade = entidades.SingleOrDefault(item => item.Id == id);

            if (entidade == null)
            {
                return null;
            }

            T retorno = new T();
            entidade.CopiarPropriedadesPara(retorno);
            return retorno;
        }

        public IQueryable<T> Buscar(Expression<Func<T, bool>> predicate, Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null)
        {
            return entidades.Where(predicate.Compile()).AsQueryable();
        }

        public Task<List<T>> BuscarAsync()
        {
            throw new NotImplementedException();
        }

        public Task<T> BuscarAsync(long id)
        {
            throw new NotImplementedException();
        }

        public void Deletar(T entidade)
        {
            if (entidade != null)
            {
                Remover(entidade.Id);
            }
        }

        public void Deletar(long id)
        {
            Remover(id);
        }

        private void Remover(long id)
        {
            T itemPerdido = entidades.SingleOrDefault(item => item.Id == id);
            if (itemPerdido != null)
            {
                entidades.Remove(itemPerdido);
            }
        }

        public Task DeletarAsync(T entidade)
        {
            throw new NotImplementedException();
        }

        public Task DeletarAsync(long id)
        {
            throw new NotImplementedException();
        }

        public DbSet<T> Entity()
        {
            throw new NotImplementedException();
        }

        public IQueryable<T> FromSql(string sql)
        {
            throw new NotImplementedException();
        }

        public IQueryable<T> FromSql(string sql, params object[] obj)
        {
            throw new NotImplementedException();
        }

        public T Inserir(T entidade)
        {
            if (entidade != null)
            {
                Random random = new Random();
                entidade.Id = random.Next(9999);
                entidades.Add(entidade);
                return entidade;
            }
            return null;
        }

        public Task<T> InserirAsync(T entidade)
        {
            throw new NotImplementedException();
        }

        #region IDisposable Support
        private bool disposedValue = false; // Para detectar chamadas redundantes

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    entidades.Clear();
                }
                disposedValue = true;
            }
        }

        ~CrudServiceFake()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public void Deletar(List<T> entidades)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
