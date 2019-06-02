using Entidades.Entidades;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioService usuarioService;

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
        public ActionResult Get(long id)
        {
            try
            {
                Usuario usuario = usuarioService.Buscar(id);
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
        /// POST api/controller
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Post([FromBody]Usuario usuario)
        {
            try
            {
                Usuario user = usuarioService
                    .Buscar(_usuario => _usuario.Email == usuario.Email)
                    .SingleOrDefault();

                if (user != null)
                {
                    return BadRequest(new { message = "Já existe um usuário cadastrado com o email informado " });
                }

                usuarioService.Inserir(usuario);
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
        public ActionResult Atualizar([FromBody]Usuario usuario)
        {
            try
            {
                usuarioService.Atualizar(usuario);
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
        public ActionResult Delete(long id)
        {
            usuarioService.Deletar(id);
            return Ok();
        }

        [HttpGet("{usuarioId}/itensAchados")]
        public ActionResult BuscarItensAchados(long usuarioId, [FromServices] IItemAchadoService itemAchadoService)
        {
            try
            {
                List<ItemAchado> perdidos = itemAchadoService.BuscarPorIdUsuario(usuarioId);
                return Ok(perdidos);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet("{usuarioId}/itensPerdidos")]
        public ActionResult BuscarItensPerdidos(long usuarioId, [FromServices] IItemPerdidoService itemPerdidoService)
        {
            try
            {
                List<ItemPerdido> perdidos = itemPerdidoService.BuscarPorIdUsuario(usuarioId);
                return Ok(perdidos);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet("{usuarioId}/itensPerdidosMatch")]
        public IActionResult BuscarItensPerdidosMatch(long usuarioId, [FromServices] IItemMatchService itemMatchService)
        {
            try
            {
                List<ItemPerdido> perdidos = itemMatchService.BuscarMatchsPerdidos(usuarioId);
                return Ok(perdidos);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet("{usuarioId}/itensAchadosMatch")]
        public IActionResult BuscarItensAchadosMatch(long usuarioId, [FromServices] IItemMatchService itemMatchService)
        {
            try
            {
                List<ItemAchado> perdidos = itemMatchService.BuscarMatchsAchados(usuarioId);
                return Ok(perdidos);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

    }
}
