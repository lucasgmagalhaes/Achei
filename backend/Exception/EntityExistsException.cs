using System;

namespace Exception
{
    /// <summary>
    /// Representa um erro que ocorre quando é tentando criar uma entidade que já existe.
    /// </summary>
    [Serializable]
    public class EntityExistsException : Exception
    {
        public EntityExistsException() { }

        public EntityExistsException(string message) : base(message) { }

        public EntityExistsException(string message, System.Exception inner) : base(message, inner) { }

        protected EntityExistsException(
          System.Runtime.Serialization.SerializationInfo info,
          System.Runtime.Serialization.StreamingContext context) : base(info, context) { }
    }
}
