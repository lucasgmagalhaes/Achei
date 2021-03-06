﻿using AutoMapper;
using Entidades;
using Entidades.Dto;
using Entidades.Entidades;
using Exceptions.Entity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;

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
        public ActionResult BuscarPerdido(long id)
        {
            try
            {
                if (id <= 0)
                {
                    return BadRequest("Id inválido");
                }

                ItemPerdido perdido = itemPerdidoService.Buscar(id);

                if (perdido == null)
                {
                    return NotFound("Item não existe");
                }

                ItemPerdidoDto itemDto = mapper.Map<ItemPerdidoDto>(perdido);
                return Ok(itemDto);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e);
            }
        }

        /// <summary>
        /// PUT api/usuario
        /// </summary>
        /// <param name="itemPerdido"></param>
        /// <returns></returns>
        [HttpPut]
        public ActionResult Atualizar([FromBody]ItemPerdido itemPerdido, [FromServices]IItemMatchService itemMatchService,
           [FromServices]IItemAchadoService itemAchadoService)
        {
            try
            {
                if (itemPerdido == null)
                {
                    return BadRequest("Item não informado");
                }

                itemPerdidoService.Atualizar(itemPerdido);
                List<ItemMatch> matchs = itemMatchService.BuscarMatchsPerdidos(itemPerdido.UsuarioId, itemPerdido.Id);

                if (itemPerdido.Recuperado)
                {     
                    matchs.ForEach(match =>
                    {
                        match.ItemAchado.Devolvido = true;
                    }); 
                }
                else
                {
                    matchs.ForEach(match =>
                    {
                        match.ItemAchado.Devolvido = false;
                    });
                }

                itemAchadoService.Atualizar(matchs.Select(match => match.ItemAchado).ToList());
                itemPerdidoService.AtualizarItensCompativeis(itemPerdido);
                return Ok(new RequestResponse() { message = "Item Atualizado com sucesso", status = "200" });
            }
            catch (EntityNotFoundException ex)
            {
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex);
            }
        }

        [HttpDelete("{id}")]
        public ActionResult Excluir(long id)
        {
            try
            {
                if (id <= 0)
                {
                    return BadRequest("Id inválido");
                }

                itemPerdidoService.Deletar(id);
                return Ok(new RequestResponse() { message = "Item deletado com sucesso", status = "200" });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex);
            }
        }

        [HttpGet("{id}/regiao")]
        public ActionResult BuscarRegiaoItemPerdido(long id, [FromServices] IRegiaoService regiaoService)
        {
            try
            {
                Regiao regiao = regiaoService.BuscarPorItemId(id);
                RegiaoDto dto = mapper.Map<RegiaoDto>(regiao);
                return Ok(dto);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e);
            }
        }

        [HttpGet("{id}/tags")]
        public ActionResult BuscarTagItemPerdido(long id, [FromServices] ITagService tagService)
        {
            try
            {
                List<Tag> tags = tagService.BuscarPorItemId(id);
                List<TagDto> dtos = mapper.Map<List<TagDto>>(tags);
                return Ok(dtos);
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e);
            }
        }

        [HttpPost]
        public ActionResult Salvar([FromBody]ItemPerdido itemPerdido)
        {
            try
            {
                itemPerdidoService.Inserir(itemPerdido);
                itemPerdidoService.AtualizarItensCompativeis(itemPerdido);
                return Ok(new RequestResponse() { message = "Item cadastrado com sucesso", status = "200" });
            }
            catch (Exception e)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, e);
            }
        }
    }
}
