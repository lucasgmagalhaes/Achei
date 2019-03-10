using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StatusController : ControllerBase
    {
        [HttpGet()]
        public IActionResult Get()
        {
            return Ok("Api funcionando!");
        }
    }
}