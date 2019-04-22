using Entidades.Entidades;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ItemPerdidoController : ControllerBase
    {
        private readonly IItemPerdidoService itemPerdidoService;

        public ItemPerdidoController(IItemPerdidoService itemPerdidoService)
        {
            this.itemPerdidoService = itemPerdidoService;
        }

        [HttpGet("{id}")]
        public IActionResult BuscarPerdidos(long id)
        {
            try
            {
                List<ItemPerdido> perdidos = this.itemPerdidoService.BuscarPorIdUsuario(id);
                return Ok(perdidos);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        public IActionResult Salvar([FromBody]ItemPerdido itemPerdido)
        {
            try
            {
                itemPerdidoService.Inserir(itemPerdido);
                return Ok(new RequestResponse() { message = "Item cadastrado com sucesso", status = "200" });
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
