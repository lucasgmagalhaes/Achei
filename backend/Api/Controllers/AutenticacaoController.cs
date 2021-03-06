﻿using Api.Token;
using Entidades.Entidades;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Persistencia.Interfaces;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Principal;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AutenticacaoController : ControllerBase
    {
        [HttpPost]
        [AllowAnonymous]
        public object Post(
            [FromBody]Usuario usuario,
            [FromServices] IAutenticacaoService autenticacaoService,
            [FromServices]SigningConfigurations signingConfigurations,
            [FromServices]TokenConfigurations tokenConfigurations)
        {
            Usuario usuarioBase = null;

            if (usuario != null && !string.IsNullOrWhiteSpace(usuario.Email))
            {
                try
                {
                    usuarioBase = autenticacaoService.AutenticarUsuario(usuario.Email, usuario.Senha);

                    if (usuarioBase != null)
                    {
                        if (Session.IsUsuarioLogado(usuario.Email))
                        {
                            return new
                            {
                                authenticated = false,
                                message = "Usuário logado"
                            };
                        }

                        ClaimsIdentity identity = new ClaimsIdentity(
                            new GenericIdentity(usuario.Email, "Email"),
                            new[] {
                        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString("N")),
                        new Claim(JwtRegisteredClaimNames.UniqueName, usuario.Email)
                            }
                        );

                        DateTime dataCriacao = DateTime.Now;
                        DateTime dataExpiracao = dataCriacao +
                            TimeSpan.FromSeconds(tokenConfigurations.Seconds);

                        JwtSecurityTokenHandler handler = new JwtSecurityTokenHandler();
                        SecurityToken securityToken = handler.CreateToken(new SecurityTokenDescriptor
                        {
                            Issuer = tokenConfigurations.Issuer,
                            Audience = tokenConfigurations.Audience,
                            SigningCredentials = signingConfigurations.SigningCredentials,
                            Subject = identity,
                            NotBefore = dataCriacao,
                            Expires = dataExpiracao
                        });
                        string token = handler.WriteToken(securityToken);

                        return new
                        {
                            authenticated = true,
                            created = dataCriacao.ToString("yyyy-MM-dd HH:mm:ss"),
                            expiration = dataExpiracao.ToString("yyyy-MM-dd HH:mm:ss"),
                            token = token,
                            message = "OK",
                            usuario = usuarioBase
                        };
                    }
                    else
                    {
                        return new
                        {
                            authenticated = false,
                            message = "Email ou senha inválidos"
                        };
                    }
                }
                catch (Exception)
                {
                    return new { message = "Não foi possível validar o login" };
                }
            }
            return new { message = "Email inválido" };
        }
    }
}
