using System;
using System.Runtime.Serialization;

namespace Exceptions.Entity
{
    /// <summary>
    /// Representa um erro que ocorre quando é tentando buscar uma entidade que não existe
    /// </summary>
    [Serializable]
    public class EntityNotFoundException : Exception
    {
        public EntityNotFoundException() { }

        public EntityNotFoundException(string message) : base(message) { }

        public EntityNotFoundException(string message, System.Exception inner) : base(message, inner) { }

        protected EntityNotFoundException(SerializationInfo info, StreamingContext context) : base(info, context) { }
    }
}
