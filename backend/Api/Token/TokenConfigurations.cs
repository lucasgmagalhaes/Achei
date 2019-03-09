namespace Api.Token
{
    /// <summary>
    /// Contém as configurações (Audience, Issuer - emissor, Seconds - tempo de validade em segundos) 
    /// empregadas na geração de tokens, Obtidas a partir do arquivo appsettings.json.
    /// </summary>
    public class TokenConfigurations
    {
        public string Audience { get; set; }
        public string Issuer { get; set; }
        public int Seconds { get; set; }
    }
}
