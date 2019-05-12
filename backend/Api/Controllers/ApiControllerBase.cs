using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [ApiController]
    [Authorize("Bearer")]
    public abstract class ApiControllerBase<T> : ControllerBase
    {
        /// <summary>
        /// POST api/[controller]/
        /// </summary>
        /// <returns></returns>
        [HttpGet("{id}")]
        public abstract ActionResult Get();

        /// <summary>
        /// GET api/[controller]/{id}
        /// </summary>
        /// <param name="id">Id da entidade a ser buscada</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public abstract ActionResult Get(long id);

        /// <summary>
        /// PUT api/[controller]/
        /// </summary>
        /// <param name="entity">entidade a ser atualizada</param>
        /// <returns></returns>
        [HttpPut]
        public abstract ActionResult Put([FromBody]T entity);

        /// <summary>
        /// POST api/[controller]/
        /// </summary>
        /// <param name="entidade">entidade a ser criada</param>
        /// <returns></returns>
        [HttpPost]
        public abstract ActionResult Post([FromBody]T entidade);

        /// <summary>
        /// DELETE api/[controller]/{id}
        /// </summary>
        /// <param name="id">Id da entidade a ser deletada</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public abstract ActionResult Delete(long id);
    }
}
