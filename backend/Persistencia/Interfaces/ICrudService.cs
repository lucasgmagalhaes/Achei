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
    /// <summary>
    /// Contrato básico de entidades para realização das operações do CRUD.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface ICrudService<T> where T : class, IEntity, new()
    {
        /// <summary>
        /// Persiste mudanças feitas em uma entidade
        /// </summary>
        /// <param name="entidade">Entidade mapeada no banco de dados</param>
        void Atualizar(T entidade);

        /// <summary>
        /// Persiste mudanças feitas em um conjunto de entidades
        /// <param name="entidades">Entidades mapeadas no banco de dados</param>
        /// </summary>
        void Atualizar(List<T> entidades);

        /// <summary>
        /// Persiste mudanças feitas em um conjunto de entidades de forma assíncrona
        /// </summary>
        /// <param name="entidade"></param>
        /// <returns></returns>
        Task AtualizarAsync(T entidade);

        /// <summary>
        /// Persiste mudanças feitas em um conjunto de entidades de forma assíncrona
        /// <param name="entidades">Entidades mapeadas no banco de dados</param>
        /// </summary>
        Task AtualizarAsync(List<T> entidades);

        List<T> Buscar();
        /// <summary>
        /// Busca uma entidade baseada no seu id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        T Buscar(long id);

        /// <summary>
        /// Realiza uma busca por entidades em função de um predicado.
        /// Retornando a query para ser executada
        /// </summary>
        /// 
        /// <example>
        /// 
        /// public List<Entidade2> BuscarEntidade2PorEntidade1(long idEntidade1)
        /// {
        ///     return crudService.Buscar(entidade1 => usuarioEmpresa.Id == idEntidade1,
        ///            result => result.Include(c => c.IdEntidade2))
        ///           .Select(entidade1 => entidade1.IdEntidade2).ToList();
        /// }
        /// 
        /// </example>
        /// 
        /// <param name="predicate"></param>
        /// <param name="include"></param>
        /// <returns></returns>
        IQueryable<T> Buscar(Expression<Func<T, bool>> predicate, Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null);

        Task<List<T>> BuscarAsync();

        Task<T> BuscarAsync(long id);

        /// <summary>
        /// Deleta um objeto de uma entidade no banco de dados,
        /// com base na entidade
        /// </summary>
        /// <param name="entidade"></param>
        void Deletar(T entidade);

        /// <summary>
        /// Deleta um objeto de uma entidade no banco de dados,
        /// com base no id da entidade
        /// </summary>
        /// <param name="id"></param>
        void Deletar(long id);

        /// <summary>
        /// Deleta um objeto de uma entidade no banco de dados de forma assíncrona,
        /// com na própria entidade
        /// </summary>
        /// <param name="entidade"></param>
        Task DeletarAsync(T entidade);

        /// <summary>
        /// Deleta um objeto de uma entidade no banco de dados de forma assíncrona,
        /// com base no id dessa entidade
        /// </summary>
        /// <param name="entidade"></param>
        /// <returns></returns>
        Task DeletarAsync(long id);

        /// <summary>
        /// Persiste um objeto de uma entidade no banco de dados
        /// </summary>
        /// <param name="entidade"></param>
        /// <returns></returns>
        T Inserir(T entidade);

        /// <summary>
        /// Persiste um objeto de uma entidade no banco de dados de forma assíncrona
        /// </summary>
        /// <param name="entidade"></param>
        /// <returns></returns>
        Task<T> InserirAsync(T entidade);

        /// <summary>
        /// Retorna o dataSet da entide definida neste serviço
        /// </summary>
        /// <returns></returns>
        DbSet<T> Entity();
    }
}