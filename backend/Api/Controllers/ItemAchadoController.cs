using Entidades.Entidades;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ItemAchadoController : ControllerBase
    {
        private readonly IItemAchadoService itemAchadoService;

        public ItemAchadoController(IItemAchadoService itemAchadoService)
        {
            this.itemAchadoService = itemAchadoService;
        }

        [HttpGet("{id}")]
        public IActionResult BuscarAchado(long id)
        {
            try
            {
                ItemAchado achado = this.itemAchadoService.Buscar(id);
                return Ok(achado);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        public IActionResult Salvar([FromBody]ItemAchado itemAchado)
        {
            try
            {
                itemAchadoService.Inserir(itemAchado);
                return Ok("Sucesso");
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
