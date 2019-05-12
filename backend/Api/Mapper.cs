using AutoMapper;
using Entidades;
using Entidades.Dto;
using Entidades.Entidades;

namespace Api
{
    public static class Mapeamento
    {
        public static IMapper Criar()
        {
            MapperConfiguration mappingConfig = new MapperConfiguration(mc =>
            {
                mc.CreateMap<Tag, TagDto>();
                mc.CreateMap<Item, TagDto>();
                mc.CreateMap<ItemPerdido, ItemPerdidoDto>();
                mc.CreateMap<ItemAchado, ItemAchadoDto>();
                mc.CreateMap<Regiao, RegiaoDto>();
            });

            return mappingConfig.CreateMapper();
        }
    }
}
