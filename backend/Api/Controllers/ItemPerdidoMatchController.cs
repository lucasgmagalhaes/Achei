using Entidades.Entidades;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System.Collections.Generic;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ItemMatchController : ControllerBase
    {
        private readonly IItemMatchService itemMatchService;

        public ItemMatchController(IItemMatchService itemMatchService)
        {
            this.itemMatchService = itemMatchService;
        }

        [HttpGet("{idUsuario}")]
        public IActionResult BuscarTodos(long idUsuario)
        {
            List<ItemPerdido> itens = itemMatchService.BuscarMatchsPerdidos(idUsuario);
            return Ok(itens);
        }
    }
}
