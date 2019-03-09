using System;
using System.Collections.Generic;
using System.Linq;

namespace Api
{
    public static class Session
    {
        private static Dictionary<string, string> usuarios;

        static Session()
        {
            usuarios = new Dictionary<string, string>();
        }

        public static bool IsUsuarioLogado(string email)
        {
            try
            {
                string banco = usuarios[email];
                return !string.IsNullOrEmpty(banco);
            }
            catch
            {
                return false;
            }
        }

        public static int GetQuantidadeUsuariosLogados(string banco)
        {
            if (!string.IsNullOrEmpty(banco))
            {
                return usuarios.Where(usuario => usuario.Value == banco).Count();
            }
            throw new Exception("Não existe banco de dados vazio ou nullo");
        }

        public static void AdicionarSessaoUsuario(string email, string banco)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(banco))
            {
                if (string.IsNullOrEmpty(email))
                {
                    throw new Exception("Não é possível cadastrar um token vazio");
                }

                if (string.IsNullOrEmpty(banco))
                {
                    throw new Exception("Não é possível cadastrar um banco vazio");
                }
            }
            usuarios.Add(email, banco);
        }

        public static string BuscarBancoDoUsuario(string email)
        {
            try
            {
                string banco = usuarios[email];
                if (!string.IsNullOrEmpty(banco))
                {
                    return banco;
                }
                return "";
            }
            catch
            {
                return "";
            }
        }

        public static void FinalizarSessao(string token)
        {
            if (!usuarios.Remove(token))
            {
                throw new Exception("Não existe usuário logado com o token" + token +
                    "para que sua sessão seja finalizada");
            }
        }
    }
}
