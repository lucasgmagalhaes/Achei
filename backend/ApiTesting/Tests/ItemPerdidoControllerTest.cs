using Api;
using Api.Controllers;
using ApiTesting.Services;
using Entidades.Dto;
using Entidades.Entidades;
using Microsoft.AspNetCore.Mvc;
using Persistencia.Interfaces;
using System.Linq;
using Xunit;

namespace ApiTesting
{
    public class ItemPerdidoControllerTest
    {
        private readonly ItemPerdidoController controller;
        private readonly IItemPerdidoService service;

        public ItemPerdidoControllerTest()
        {
            service = new ItemPerdidoServiceFake();
            controller = new ItemPerdidoController(service, Mapeamento.Criar());
        }

        [Fact]
        public void Buscar_Por_Id_Retorna_Ok()
        {
            ItemPerdido item = service.Buscar().FirstOrDefault();
            ActionResult response = controller.BuscarPerdido(item.Id);
            Assert.IsType<OkObjectResult>(response);
            OkObjectResult okResult = response as OkObjectResult;
            ItemPerdidoDto itemRetorno = okResult.Value as ItemPerdidoDto;
            Assert.Equal(itemRetorno.Id, item.Id);
        }

        [Fact]
        public void Buscar_Por_Id_Inexistente()
        {
            ActionResult response = controller.BuscarPerdido(999);
            Assert.IsType<NotFoundObjectResult>(response);
        }

        [Fact]
        public void Atualizar_Item_Existente()
        {
            ItemPerdido item = service.Buscar().FirstOrDefault();
            item.Recuperado = true;
            ActionResult response = controller.Atualizar(item);
            Assert.IsType<OkObjectResult>(response);
            ItemPerdido atualizado = service.Buscar(item.Id);
            Assert.True(atualizado.Recuperado);
        }

        [Fact]
        public void Atualizar_Item_Inexistente()
        {
            ItemPerdido item = service.Buscar().FirstOrDefault();
            item.Id = -9;
            ActionResult response = controller.Atualizar(item);
            Assert.IsType<NotFoundObjectResult>(response);
        }

        [Fact]
        public void Excluir_Item_Existente()
        {
            ItemPerdido item = service.Buscar().FirstOrDefault();
            ActionResult response = controller.Excluir(item.Id);
            Assert.IsType<OkObjectResult>(response);
            ItemPerdido itemExcluido = service.Buscar(item.Id);
            Assert.Null(itemExcluido);
            service.Inserir(item);
        }

        [Fact]
        public void Excluir_Item_Inexistente()
        {
            ItemPerdido item = service.Buscar().FirstOrDefault();
            item.Id = -9;
            ActionResult response = controller.Excluir(item.Id);
            Assert.IsType<NotFoundObjectResult>(response);
        }

        //[Fact]
        //public void Buscar_Regiao_Item()
        //{
        //    ItemPerdido item = this.service.Buscar().FirstOrDefault();
        //    item.Id = -9;
        //    var response = controller.Excluir(item.Id);
        //    Assert.IsType<NotFoundObjectResult>(response);
        //}
    }
}
