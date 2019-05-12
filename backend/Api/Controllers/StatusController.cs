﻿using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StatusController : ControllerBase
    {
        [HttpGet()]
        public ActionResult Get()
        {
            return Ok("Api funcionando!");
        }
    }
}