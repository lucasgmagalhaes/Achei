using Entidades.Entidades;

namespace Persistencia.Interfaces
{
    public interface IAutenticacaoService : ICrudService<Usuario>
    {
        Usuario AutenticarUsuario(string email, string senha);
    }
}
