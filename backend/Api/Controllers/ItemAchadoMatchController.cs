using Entidades.Entidades;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System.Collections.Generic;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ItemAchadoMatchController : ControllerBase
    {
        private readonly IItemMatchService itemMatchService;

        public ItemAchadoMatchController(IItemMatchService itemMatchService)
        {
            this.itemMatchService = itemMatchService;
        }

        [HttpGet("idUsuario")]
        public IActionResult BuscarTodos(long idUsuario)
        {
            List<ItemAchado> itens = itemMatchService.BuscarMatchsAchados(idUsuario);
            return Ok(itens);
        }
    }
}
