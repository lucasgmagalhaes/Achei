using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Entidades;
using Entidades.Dto;
using Entidades.Entidades;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RegiaoController : ControllerBase
    {
        private readonly IRegiaoService regiaoService;
        private readonly IMapper mapper;

        public RegiaoController(IRegiaoService regiaoService, IMapper mapper)
        {
            this.regiaoService = regiaoService;
            this.mapper = mapper;
        }

        [HttpGet("{id}")]
        public IActionResult GetById(long id)
        {
            try
            {
                Regiao tag = this.regiaoService.Buscar(id);
                TagDto dto = mapper.Map<TagDto>(tag);
                return Ok(dto);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}