using Entidades.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore.Query;
using Persistencia.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Persistencia.Services
{
    public class CrudService<T> : ICrudService<T> where T : class, IEntity, new()
    {
        private readonly DbContext dbService;

        public CrudService(DbContext dbService)
        {
            this.dbService = dbService;
        }

        public void Atualizar(T entidade)
        {
            this.dbService.Update(entidade);
            this.dbService.SaveChanges();
        }

        public void Atualizar(List<T> entidades)
        {
            this.dbService.Update(entidades);
            this.dbService.SaveChanges();
        }

        public List<T> Buscar()
        {
            return this.dbService.Set<T>().ToList();
        }

        public IQueryable<T> Buscar(Expression<Func<T, bool>> predicate, Func<IQueryable<T>,
            IIncludableQueryable<T, object>> include = null)
        {
            IQueryable<T> result = this.dbService.Set<T>().Where(predicate);

            if (include != null)
                result = include(result);

            return result.AsQueryable();
        }

        public T Buscar(long id)
        {
            return this.dbService.Set<T>().Find(id);
        }

        public void Deletar(T entidade)
        {
            EntityEntry<T> retorno = this.dbService.Set<T>().Remove(entidade);
            dbService.SaveChanges();
        }

        public void Deletar(long id)
        {
            IEntity obj = new T() { Id = id };

            this.dbService.Attach(obj);
            this.dbService.Remove(obj);
            this.dbService.SaveChanges();
        }

        public T Inserir(T entidade)
        {
            try
            {
                bool exists = this.dbService.Set<T>().Any(ent => ent.Id == entidade.Id);

                if (!exists)
                {
                    this.dbService.Add(entidade);
                    this.dbService.SaveChanges();
                    return entidade;
                }
                else
                {
                    throw new Exception();
                }
            }
            catch (Exception e)
            {
                throw new Exception("Não é possível criar uma entidade já existente");
            }
        }

        public async Task AtualizarAsync(T entidade)
        {
            if (this.dbService.Set<T>().Any(ent => ent.Id == entidade.Id))
            {
                this.dbService.Update(entidade);
                await this.dbService.SaveChangesAsync();
            }
            else
            {
                throw new Exception("Entidade não existe no banco de dados para ser atualizada");
            }

        }

        public async Task AtualizarAsync(List<T> entidades)
        {
            this.dbService.Update(entidades);
            await this.dbService.SaveChangesAsync();
        }

        public async Task<List<T>> BuscarAsync()
        {
            return await this.dbService.Set<T>().ToListAsync();
        }

        public async Task<T> BuscarAsync(long id)
        {
            return await this.dbService.FindAsync<T>(id);
        }

        public async Task DeletarAsync(T entidade)
        {
            EntityEntry<T> retorno = this.dbService.Remove(entidade);
            await dbService.SaveChangesAsync();
        }

        public async Task DeletarAsync(long id)
        {
            IEntity obj = new T() { Id = id };

            this.dbService.Attach(obj);
            this.dbService.Remove(obj);
            await this.dbService.SaveChangesAsync();
        }

        public async Task<T> InserirAsync(T entidade)
        {
            try
            {
                bool exists = this.dbService.Set<T>().Any(ent => ent.Id == entidade.Id);

                if (!exists)
                {
                    await this.dbService.AddAsync(entidade);
                    await this.dbService.SaveChangesAsync();
                    return entidade;
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine(entidade.GetType() + "de Id:" + entidade.Id + "já foi cadastrada");
                    throw new Exception("Entidade já foi cadastrada");
                }
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.Message);
                throw new Exception("Não é possível criar uma entidade já existente");
            }
        }

        public DbSet<T> Entity()
        {
            return this.dbService.Set<T>();
        }
    }
}
