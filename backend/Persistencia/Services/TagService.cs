using Entidades;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;
using System.Collections.Generic;
using System.Linq;

namespace Persistencia.Services
{
    public class TagService : CrudService<Tag>, ITagService
    {
        public TagService(ApplicationDbContext dbContext) : base(dbContext) { }

        public List<Tag> BuscarPorItemId(long id)
        {
            return base.Buscar(tag => tag.ItemId == id).ToList();
        }
    }
}
