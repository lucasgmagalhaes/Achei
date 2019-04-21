using Entidades.Entidades;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System;

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

        [HttpPost]
        public IActionResult Salvar([FromBody]ItemPerdido itemPerdido)
        {
            try
            {
                itemPerdidoService.Inserir(itemPerdido);
                return Ok("Sucesso");
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
