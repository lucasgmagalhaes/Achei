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
            ItemPerdido item = this.service.Buscar().FirstOrDefault();
            var response = controller.BuscarPerdido(item.Id);
            Assert.IsType<OkObjectResult>(response);
            var okResult = response as OkObjectResult;
            var itemRetorno = okResult.Value as ItemPerdidoDto;
            Assert.Equal(itemRetorno.Id, item.Id);
        }

        [Fact]
        public void Buscar_Por_Id_Inexistente()
        {
            var response = controller.BuscarPerdido(999);
            Assert.IsType<NotFoundObjectResult>(response);
        }

        [Fact]
        public void Atualizar_Item_Existente()
        {
            ItemPerdido item = this.service.Buscar().FirstOrDefault();
            item.Recuperado = true;
            var response = controller.Atualizar(item);
            Assert.IsType<OkObjectResult>(response);
            ItemPerdido atualizado = this.service.Buscar(item.Id);
            Assert.True(atualizado.Recuperado);
        }

        [Fact]
        public void Atualizar_Item_Inexistente()
        {
            ItemPerdido item = this.service.Buscar().FirstOrDefault();
            item.Id = -9;
            var response = controller.Atualizar(item);
            Assert.IsType<NotFoundObjectResult>(response);
        }

        [Fact]
        public void Excluir_Item_Existente()
        {
            ItemPerdido item = this.service.Buscar().FirstOrDefault();
            var response = controller.Excluir(item.Id);
            Assert.IsType<OkObjectResult>(response);
            ItemPerdido itemExcluido = this.service.Buscar(item.Id);
            Assert.Null(itemExcluido);
            this.service.Inserir(item);
        }

        [Fact]
        public void Excluir_Item_Inexistente()
        {
            ItemPerdido item = this.service.Buscar().FirstOrDefault();
            item.Id = -9;
            var response = controller.Excluir(item.Id);
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
