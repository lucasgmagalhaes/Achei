using AutoMapper;
using Entidades;
using Entidades.Dto;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System;

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
        public ActionResult GetTag(long id)
        {
            try
            {
                Tag tag = tagService.Buscar(id);
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