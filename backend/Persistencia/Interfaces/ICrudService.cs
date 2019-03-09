using Entidades.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Persistencia.Interfaces
{
    public interface ICrudService<T> where T : class, IEntity, new()
    {
        void Atualizar(T entidade);
        void Atualizar(List<T> entidades);
        Task AtualizarAsync(T entidade);
        Task AtualizarAsync(List<T> entidades);
        List<T> Buscar();
        T Buscar(long id);
        IQueryable<T> Buscar(Expression<Func<T, bool>> predicate, Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null);
        Task<List<T>> BuscarAsync();
        Task<T> BuscarAsync(long id);
        void Deletar(T entidade);
        void Deletar(long id);
        Task DeletarAsync(T entidade);
        Task DeletarAsync(long id);
        T Inserir(T entidade);
        Task<T> InserirAsync(T entidade);
        DbSet<T> Entity();
    }
}