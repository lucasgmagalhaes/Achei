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
        public EntityNotFoundException() : base("Entidade não encontrada no repositório de dados") { }

        public EntityNotFoundException(string message) : base(message) { }

        public EntityNotFoundException(string message, System.Exception inner) : base(message, inner) { }

        protected EntityNotFoundException(SerializationInfo info, StreamingContext context) : base(info, context) { }
    }
}
