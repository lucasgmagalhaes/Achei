using AutoMapper;
using Entidades.Dto;
using Entidades.Entidades;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System;

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
        public ActionResult GetById(long id)
        {
            try
            {
                Regiao tag = regiaoService.Buscar(id);
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