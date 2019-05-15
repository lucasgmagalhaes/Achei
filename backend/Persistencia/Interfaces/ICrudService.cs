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
    /// <typeparam name="T">Entidade a ser usada nas operações. A mesma deve estar registrada na lista de entidades do DbContext</typeparam>
    public interface ICrudService<T> : IDisposable where T : class, IEntity, new()
    {
        /// <summary>
        /// Executa um commando sql direto no banco, criando um LINQ para o mesmo.
        /// <para>
        /// Para maiores detalhes sobre o commando, use crudService.Entity().FromSql();
        /// O commando fromSql direto do dbContext possui mais informações.
        /// </para>
        /// 
        /// </summary>
        /// <param name="sql">Quey a ser criada</param>
        /// <returns>Linq da query executada</returns>
        IQueryable<T> FromSql(string sql);

        /// <summary>
        ///  Executa um commando sql direto no banco, criando um LINQ para o mesmo.
        /// <para>
        /// Para maiores detalhes sobre o commando, use crudService.Entity().FromSql();
        /// O commando fromSql direto do dbContext possui mais informações.
        /// </para>
        /// 
        /// </summary>
        /// <param name="sql">Quey a ser criada</param>
        /// <param name="obj">Parâmetros da Query</param>
        /// <returns></returns>
        IQueryable<T> FromSql(string sql, params object[] obj);

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

        /// <summary>
        /// Busca todas as entidades de um repositório
        /// </summary>
        /// <returns>Entidades do tipo T</returns>
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

        /// <summary>
        /// Executa uma busca assíncrona no banco por todos os registros de uma entidade específica
        /// </summary>
        /// <returns>Lista de todas as entidades</returns>
        Task<List<T>> BuscarAsync();

        /// <summary>
        /// Executa uma busca assíncrona no banco por uma entidade de id específico
        /// </summary>
        /// <param name="id">Id da entidade existente</param>
        /// <returns>Entidade procurada</returns>
        Task<T> BuscarAsync(long id);

        /// <summary>
        /// Deleta um objeto de uma entidade no banco de dados,
        /// com base na entidade
        /// </summary>
        /// <param name="entidade"></param>
        void Deletar(T entidade);

        /// <summary>
        /// Deleta uma lista objetos de uma entidade no banco de dados.
        /// com base na entidade
        /// </summary>
        /// <param name="entidade"></param>
        void Deletar(List<T> entidades);

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