﻿using AutoMapper;
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
    public class ItemAchadoController : ControllerBase
    {
        private readonly IItemAchadoService itemAchadoService;
        private readonly IMapper mapper;

        public ItemAchadoController(IItemAchadoService itemAchadoService, IMapper mapper)
        {
            this.itemAchadoService = itemAchadoService;
            this.mapper = mapper;
        }

        [HttpGet("{id}")]
        public IActionResult BuscarAchado(long id)
        {
            try
            {
                ItemAchado achado = itemAchadoService.Buscar(id);
                return Ok(achado);
            }
            catch (Exception e)
            {
                return BadRequest(e);
            }
        }

        /// <summary>
        /// PUT api/usuario
        /// </summary>
        /// <param name="itemAchado"></param>
        /// <returns></returns>
        [HttpPut]
        public IActionResult Atualizar([FromBody]ItemAchado itemAchado)
        {
            try
            {
                itemAchadoService.Atualizar(itemAchado);
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
                itemAchadoService.Deletar(id);
                return Ok(new RequestResponse() { message = "Item deletado com sucesso", status = "200" });
            }
            catch (Exception ex)
            {
                return BadRequest(new RequestResponse() { message = ex.Message, status = "400" });
            }
        }

        [HttpPost]
        public IActionResult Salvar([FromBody]ItemAchado itemAchado)
        {
            try
            {
                itemAchadoService.Inserir(itemAchado);
                return Ok(new RequestResponse() { message = "Item atualizado com sucesso", status = "200" });
            }
            catch (Exception e)
            {
                return BadRequest(e);
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
    }
}
