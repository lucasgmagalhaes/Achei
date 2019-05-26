using System;
using System.Reflection;

namespace Extensions
{
    /// <summary>
    /// Métodos de extensão para objetos.
    /// </summary>
    public static class ObjectExtensionMethods
    {
        /// <summary>
        /// Realiza a cópia das propriedades do objeto no parâmetro, para o objeto de extensão
        /// </summary>
        /// 
        /// <example>
        ///     Usuario usuario = new Usuario();
        ///     Usuario usuario2 = new Usuario();
        ///     usuario.Nome = "José";
        ///     usuario2.CopiarPropriedadesDe(usuario);
        ///     Console.WriteLine(usuario2.Nome); // Output: 'José'
        /// </example>
        /// 
        /// <exception cref="ArgumentNullException">Parâmetro parent não pode ser nulo</exception>
        ///  
        /// <param name="self">Objeto que está chamando o método</param>
        /// <param name="parent">Objeto que terá as propriedades copiadas</param>
        public static void CopiarPropriedadesDe(this object to, object from)
        {
            if (from == null)
            {
                throw new ArgumentNullException("from", "Objeto a ser copiado não pode nulo");
            }

            PropertyInfo[] fromProperties = from.GetType().GetProperties();
            PropertyInfo[] toProperties = to.GetType().GetProperties();

            IniciarCopia(toProperties, fromProperties, to, from);
        }

        /// <summary>
        /// Realiza a cópia das propriedades do objeto de extensão, para o objeto do parâmetro
        /// </summary>
        /// 
        /// <example>
        ///     Usuario usuario = new Usuario();
        ///     Usuario usuario2 = new Usuario();
        ///     usuario.Nome = "José";
        ///     usuario.CopiarPropriedadesPara(usuario2);
        ///     Console.WriteLine(usuario2.Nome); // Output: 'José'
        /// </example>
        /// 
        /// <exception cref="ArgumentNullException">Parâmetro parent não pode ser nulo</exception>
        /// 
        /// <param name="self">Objeto que está chamando o método</param>
        /// <param name="parent">Objeto que receberá as propriedades</param>
        public static void CopiarPropriedadesPara(this object from, object to)
        {
            if (to == null)
            {
                throw new ArgumentNullException("to", "Objeto a ser copiado não pode nulo");
            }

            PropertyInfo[] toProperties = to.GetType().GetProperties();
            PropertyInfo[] fromProperties = from.GetType().GetProperties();

            IniciarCopia(toProperties, fromProperties, to, from);
        }

        /// <summary>
        /// Realiza a cópia das propriedades de um objeto apra outro
        /// </summary>
        /// 
        /// <exception cref="ArgumentNullException">Objetos não podem ser nulos</exception>
        /// 
        /// <param name="toProperties">Propriedades do objeto que receberá os novos valores</param>
        /// <param name="fromProperties">Propriedades do objeto que terá os valores copiados</param>
        /// <param name="to">Objeto que terá os valores copiados</param>
        /// <param name="from">Objeto que receberá os valores</param>
        private static void IniciarCopia(PropertyInfo[] toProperties, PropertyInfo[] fromProperties, object to, object from)
        {
            ValidarParametros(toProperties, fromProperties, to, from);

            foreach (PropertyInfo fromProperty in fromProperties)
            {
                foreach (PropertyInfo toProperty in toProperties)
                {
                    if (fromProperty.Name == toProperty.Name && fromProperty.PropertyType == toProperty.PropertyType)
                    {
                        toProperty.SetValue(to, fromProperty.GetValue(from));
                        break;
                    }
                }
            }
        }

        private static void ValidarParametros(PropertyInfo[] toProperties, PropertyInfo[] fromProperties, object to, object from)
        {
            if (toProperties == null)
            {
                throw new ArgumentNullException("toProperties", "Propriedades do objeto não pode ser nula");
            }
            else if (fromProperties == null)
            {
                throw new ArgumentNullException("fromProperties", "Propriedades do objeto não pode ser nula");
            }
            else if (to == null)
            {
                throw new ArgumentNullException("to", "Objeto que receberá os valores não pode ser nulo");
            }
            else if (from == null)
            {
                throw new ArgumentNullException("from", "Objeto que receberá os valores não pode ser nulo");
            }
        }
    }
}
