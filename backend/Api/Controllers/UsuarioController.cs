using System;
using System.Linq;
using Entidades.Entidades;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsuarioController : ControllerBase
    {
        private IUsuarioService usuarioService;

        public UsuarioController(IUsuarioService usuarioService)
        {
            this.usuarioService = usuarioService;
        }

        /// <summary>
        /// GET api/usuario/5
        /// </summary>
        /// <param name="id">Id usuário</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        [Authorize("Bearer")]
        public IActionResult Get(long id)
        {
            try
            {
                Usuario usuario = this.usuarioService.Buscar(id);
                if (usuario != null)
                {
                    return Ok(usuario);
                }
                else
                {
                    return NotFound("Não existe usuário com o id informado");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        /// <summary>
        /// POST api/<controller>
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Post([FromBody]Usuario usuario)
        {
            try
            {
                var user = this.usuarioService
                    .Buscar(_usuario => _usuario.Email == usuario.Email)
                    .SingleOrDefault();

                if (user != null)
                {
                    return BadRequest(new { message = "Já existe um usuário cadastrado com o email informado " });
                }

                this.usuarioService.Inserir(usuario);
                return Ok(new RequestResponse() { message = "Usuário criado com sucesso", status = "200", data = usuario });
            }
            catch (Exception ex)
            {
                return BadRequest(new RequestResponse() { message = ex.Message, status = "400" });
            }
        }

        /// <summary>
        /// PUT api/usuario
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns></returns>
        [HttpPut]
        [Authorize("Bearer")]
        public IActionResult Atualizar([FromBody]Usuario usuario)
        {
            try
            {
                this.usuarioService.Atualizar(usuario);
                return Ok(new RequestResponse() { message = "Usuário Atualizado com sucesso", status = "200" });
            }
            catch (Exception ex)
            {
                return BadRequest(new RequestResponse() { message = ex.Message, status = "400" });
            }
        }

        /// <summary>
        /// Deleta um usuário baseado no seu Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        [Authorize("Bearer")]
        public IActionResult Delete(long id)
        {
            this.usuarioService.Deletar(id);
            return Ok();
        }
    }
}
