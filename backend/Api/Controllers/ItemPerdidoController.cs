using Entidades.Entidades;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [ApiController]
    [Authorize("Bearer")]
    [Route("api/[controller]")]
    public class ItemPerdidoController : ControllerBase
    {
        [HttpPost]
        public IActionResult Salvar([FromBody]ItemPerdido itemPerdido)
        {
            // TESTE
            return Ok("WTF");
        }
    }
}
