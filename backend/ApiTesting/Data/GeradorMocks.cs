using Entidades;
using Entidades.Entidades;
using System;
using System.Collections.Generic;

namespace ApiTesting
{
    /// <summary>
    /// Classe auxiliar para criação da lista de itens
    /// </summary>
    internal static class GeradorMocks
    {
        public static List<ItemPerdido> GetItensPerdidos()
        {
            return new List<ItemPerdido>()
            {
                new ItemPerdido() {
                    Id = 1,
                    DataFim = new DateTime(),
                    DataInicio = new DateTime(),
                    Detalhe = "Item 1",
                    Titulo = "Perdi meu Sapato",
                    RegiaoId = 1,
                    Tags = new List<Tag>() {
                        new Tag() {
                            Id = 1,
                            ItemId = 1,
                            Nome = "Sapato"
                        },
                        new Tag() {
                            Id = 2,
                            ItemId = 1,
                            Nome = "Nike"
                        }
                    },
                    Hora = "01",
                    Imagem = "",
                    UsuarioId = 1,
                    Recuperado = true,
                    Regiao = new Regiao() {
                        Id = 1,
                        Item = new List<Item>(),
                        Latitude = "123",
                        Longitude = "321"
                    }
                },
                new ItemPerdido() {
                    Id = 2,
                    DataFim = new DateTime(),
                    DataInicio = new DateTime(),
                    Detalhe = "Item 2",
                    Titulo = "Mochila perdida",
                    RegiaoId = 2,
                    Tags = new List<Tag>() {
                        new Tag() {
                            Id = 3,
                            ItemId = 2,
                            Nome = "Mochila"
                        }
                    },
                    Hora = "10:15",
                    Imagem = "",
                    Recuperado = true,
                    Regiao = new Regiao() {
                        Id = 2,
                        Item = new List<Item>(),
                        Latitude = "31235",
                        Longitude = "32121"
                    }
                },
                new ItemPerdido() {
                    Id = 3,
                    DataFim = new DateTime(),
                    DataInicio = new DateTime(),
                    Detalhe = "Item 3",
                    Titulo = "Tênis perdido",
                    RegiaoId = 2,
                    Tags = new List<Tag>() {
                        new Tag() {
                            Id = 4,
                            ItemId = 3,
                            Nome = "tenis"
                        }
                    },
                    Hora = "05:10",
                    Imagem = "",
                    Recuperado = true,
                    Regiao = new Regiao() {
                        Id = 3,
                        Item = new List<Item>(),
                        Latitude = "-132516",
                        Longitude = "111111"
                    }
                },
                new ItemPerdido() {
                    Id = 4,
                    DataFim = new DateTime(),
                    DataInicio = new DateTime(),
                    Detalhe = "Item 4",
                    Titulo = "Bota perdida",
                    RegiaoId = 2,
                    Tags = new List<Tag>() {
                        new Tag() {
                            Id = 5,
                            ItemId = 3,
                            Nome = "bota"
                        }
                    },
                    Hora = "05:10",
                    Imagem = "",
                    Recuperado = true,
                    Regiao = new Regiao() {
                        Id = 3,
                        Item = new List<Item>(),
                        Latitude = "-132516",
                        Longitude = "111111"
                    }
                }
            };
        }
    }
}
