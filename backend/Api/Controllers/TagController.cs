using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Entidades;
using Entidades.Dto;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TagController : ControllerBase
    {
        private readonly ITagService tagService;
        private readonly IMapper mapper;
        public TagController(ITagService tagService, IMapper mapper)
        {
            this.tagService = tagService;
            this.mapper = mapper;
        }

        [HttpGet("{id}")]
        public IActionResult GetTag(long id)
        {
            try
            {
                Tag tag = this.tagService.Buscar(id);
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