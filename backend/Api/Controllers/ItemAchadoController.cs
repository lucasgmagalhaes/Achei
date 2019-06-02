using AutoMapper;
using Entidades;
using Entidades.Dto;
using Entidades.Entidades;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;

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
        public ActionResult BuscarAchado(long id)
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
        public ActionResult Atualizar([FromBody]ItemAchado itemAchado, [FromServices]IItemMatchService itemMatchService,
            [FromServices]IItemPerdidoService itemPerdidoService)
        {
            try
            {
                itemAchadoService.Atualizar(itemAchado);

                if (itemAchado.Devolvido)
                {
                    List<ItemMatch> matchs = itemMatchService.BuscarMatchsAchados(itemAchado.UsuarioId, itemAchado.Id);
                    matchs.ForEach(match =>
                    {
                        match.ItemPerdido.Recuperado = true;
                    });

                    itemPerdidoService.Atualizar(matchs.Select(match => match.ItemPerdido).ToList());
                }

                itemAchadoService.AtualizarItensCompativeis(itemAchado);
                return Ok(new RequestResponse() { message = "Item Atualizado com sucesso", status = "200" });
            }
            catch (Exception ex)
            {
                return BadRequest(new RequestResponse() { message = ex.Message, status = "400" });
            }
        }

        [HttpDelete("{id}")]
        public ActionResult Excluir(long id)
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
        public ActionResult Salvar([FromBody]ItemAchado itemAchado)
        {
            try
            {
                itemAchadoService.Inserir(itemAchado);
                itemAchadoService.AtualizarItensCompativeis(itemAchado);
                return Ok(new RequestResponse() { message = "Item atualizado com sucesso", status = "200" });
            }
            catch (Exception e)
            {
                return BadRequest(e);
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
                return BadRequest(e);
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
                return BadRequest(e);
            }
        }
    }
}
