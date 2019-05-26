namespace Entidades.Interfaces
{
    /// <summary>
    /// Nível básico de uma entidade.
    /// </summary>
    public interface IEntity
    {
        /// <summary>
        /// Primary key default padronizada no sistema
        /// </summary>
        long Id { get; set; }
    }
}
