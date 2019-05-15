using System;
using System.Runtime.Serialization;

namespace Exceptions.Entity
{
    /// <summary>
    /// Representa um erro que ocorre quando é tentando criar uma entidade que já existe.
    /// </summary>

    /// <summary>
    /// <para>
    ///     Representa um erro que ocorre quando é tentando criar uma entidade que já existe.
    ///     Retorna a mensagem "Entidade já cadastrada no banco" como default.
    /// </para>
    ///
    /// <para>
    ///     Recomenda-se usar essa exceção para entidades de persistência, exceto para testes unitários.
    /// </para>
    ///
    /// <example>
    /// <code>
    /// bool exists = dbService.Set<T>().Any(ent => ent.Id == entidade.Id);
    ///     if (!exists)
    ///     {
    ///        await dbService.AddAsync(entidade);
    ///        await dbService.SaveChangesAsync();
    ///        return entidade;
    ///     }
    ///     else
    ///     {
    ///         throw new EntityAlreadyExistsException("Entidade já foi cadastrada");
    ///     }
    ///       
    /// </code>
    /// </example>
    /// </summary>
    [Serializable]
    public class EntityAlreadyExistsException : Exception
    {
        /// <summary>
        /// Inicializa um erro que ocorre quando é tentando buscar uma entidade que não existe.
        /// Possui como mensagem padrão: "Entidade não encontrada no repositório de dados".
        /// </summary>
        public EntityAlreadyExistsException() : base("Entidade já cadastrada no banco") { }

        /// <summary>
        /// Inicializa um erro que ocorre quando é tentando buscar uma entidade que não existe com uma mensagem específica
        /// </summary>
        /// <param name="message">Mensagem a ser lançada na exceção</param>
        public EntityAlreadyExistsException(string message) : base(message) { }

        /// <summary>
        /// Inicializa um erro que ocorre quando é tentando buscar uma entidade que não existe com uma mensagem específica
        /// e a exceção que raiz que levou a esta
        /// </summary>
        /// <param name="message">Mensagem a ser lançada na exceção</param>
        /// <param name="inner">Inner Exception que gerou esta exceção</param>
        public EntityAlreadyExistsException(string message, Exception inner) : base(message, inner) { }

        protected EntityAlreadyExistsException(SerializationInfo info, StreamingContext context) : base(info, context) { }
    }
}
