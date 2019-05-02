using System;
using System.Runtime.Serialization;

namespace Exceptions.Entity
{
    /// <summary>
    /// Representa um erro que ocorre quando é tentando criar uma entidade que já existe.
    /// </summary>
    [Serializable]
    public class EntityAlreadyExistsException : Exception
    {
        public EntityAlreadyExistsException() { }

        public EntityAlreadyExistsException(string message) : base(message) { }

        public EntityAlreadyExistsException(string message, System.Exception inner) : base(message, inner) { }

        protected EntityAlreadyExistsException(SerializationInfo info, StreamingContext context) : base(info, context) { }
    }
}
