using System;
using System.Runtime.Serialization;

namespace Exceptions.Entity
{
    /// <summary>
    /// <para>
    ///     Representa um erro que ocorre quando é tentando buscar uma entidade que não existe
    ///     Retorna a mensagem "Entidade não encontrada no repositório de dados" como default.
    /// </para>
    ///
    /// <para>
    ///     Recomenda-se usar essa exceção para entidades de persistência, exceto para testes unitários.
    /// </para>
    ///
    /// <example>
    /// <code>
    ///    if (sql("SELECT * ENTIDADE_EXEMPLO WHERE ID = -1") != null)
    ///       {
    ///         // Faça alguma coisa
    ///       }
    ///       else
    ///       {
    ///         // Lança essa exceção pois a entidade não foi encontrada
    ///         throw new EntityNotFoundException("Entidade não existe no banco de dados para ser atualizada");
    ///       }
    ///       
    /// </code>
    /// </example>
    /// </summary>
    [Serializable]
    public class EntityNotFoundException : Exception
    {
        /// <summary>
        /// Inicializa um erro que ocorre quando é tentando buscar uma entidade que não existe.
        /// Possui como mensagem padrão: "Entidade não encontrada no repositório de dados".
        /// </summary>
        public EntityNotFoundException() : base("Entidade não encontrada no repositório de dados") { }

        /// <summary>
        /// Inicializa um erro que ocorre quando é tentando buscar uma entidade que não existe com uma mensagem específica
        /// </summary>
        /// <param name="message">Mensagem a ser lançada na exceção</param>
        public EntityNotFoundException(string message) : base(message) { }

        /// <summary>
        /// Inicializa um erro que ocorre quando é tentando buscar uma entidade que não existe com uma mensagem específica
        /// e a exceção que raiz que levou a esta
        /// </summary>
        /// <param name="message">Mensagem a ser lançada na exceção</param>
        /// <param name="inner">Inner Exception que gerou esta exceção</param>
        public EntityNotFoundException(string message, Exception inner) : base(message, inner) { }

        protected EntityNotFoundException(SerializationInfo info, StreamingContext context) : base(info, context) { }
    }
}
