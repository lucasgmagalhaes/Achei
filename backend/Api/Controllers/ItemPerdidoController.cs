using AutoMapper;
using Entidades;
using Entidades.Dto;
using Entidades.Entidades;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ItemPerdidoController : ControllerBase
    {
        private readonly IItemPerdidoService itemPerdidoService;
        private readonly IMapper mapper;

        public ItemPerdidoController(IItemPerdidoService itemPerdidoService, IMapper mapper)
        {
            this.itemPerdidoService = itemPerdidoService;
            this.mapper = mapper;
        }

        [HttpGet("{id}")]
        public IActionResult BuscarPerdido(long id)
        {
            try
            {
                ItemPerdido perdido = itemPerdidoService.Buscar(id);
                ItemPerdidoDto itemDto = mapper.Map<ItemPerdidoDto>(perdido);
                return Ok(itemDto);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        /// <summary>
        /// PUT api/usuario
        /// </summary>
        /// <param name="itemPerdido"></param>
        /// <returns></returns>
        [HttpPut]
        public IActionResult Atualizar([FromBody]ItemPerdido itemPerdido)
        {
            try
            {
                itemPerdidoService.Atualizar(itemPerdido);
                return Ok(new RequestResponse() { message = "Item Atualizado com sucesso", status = "200" });
            }
            catch (Exception ex)
            {
                return BadRequest(new RequestResponse() { message = ex.Message, status = "400" });
            }
        }

        [HttpDelete("{id}")]
        public IActionResult Excluir(long id)
        {
            try
            {
                itemPerdidoService.Deletar(id);
                return Ok(new RequestResponse() { message = "Item deletado com sucesso", status = "200" });
            }
            catch (Exception ex)
            {
                return BadRequest(new RequestResponse() { message = ex.Message, status = "400" });
            }
        }

        [HttpGet("{id}/regiao")]
        public IActionResult BuscarRegiaoItemPerdido(long id, [FromServices] IRegiaoService regiaoService)
        {
            try
            {
                Regiao regiao = regiaoService.BuscarPorItemId(id);
                RegiaoDto dto = mapper.Map<RegiaoDto>(regiao);
                return Ok(dto);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpGet("{id}/tags")]
        public IActionResult BuscarTagItemPerdido(long id, [FromServices] ITagService tagService)
        {
            try
            {
                List<Tag> tags = tagService.BuscarPorItemId(id);
                List<TagDto> dtos = mapper.Map<List<TagDto>>(tags);
                return Ok(dtos);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        [HttpPost]
        public IActionResult Salvar([FromBody]ItemPerdido itemPerdido)
        {
            try
            {
                itemPerdidoService.Inserir(itemPerdido);
                return Ok(new RequestResponse() { message = "Item cadastrado com sucesso", status = "200" });
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }
    }
}
