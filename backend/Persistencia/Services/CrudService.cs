﻿using Entidades.Interfaces;
using Exceptions.Entity;
using Microsoft.EntityFrameworkCore;
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

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            dbService.Dispose();
        }

        public IQueryable<T> FromSql(string sql)
        {
            return dbService.Set<T>().FromSql(sql);
        }

        public IQueryable<T> FromSql(string sql, params object[] obj)
        {
            return dbService.Set<T>().FromSql(sql, obj);
        }

        public void Atualizar(T entidade)
        {
            if (dbService.Set<T>().Any(ent => ent.Id == entidade.Id))
            {
                dbService.Update(entidade);
                dbService.SaveChanges();
            }
            else
            {
                throw new EntityNotFoundException("Entidade não existe no banco de dados para ser atualizada");
            }
        }

        public void Atualizar(List<T> entidades)
        {
            if (entidades == null)
            {
                throw new ArgumentNullException("entidades", "Lista de entidades não pode ser nula");
            }

            for (int i = 0; i < entidades.Count; i++)
            {
                if (dbService.Set<T>().Any(ent => ent.Id == entidades[i].Id))
                {
                    dbService.Update(entidades[i]);
                }
                else
                {
                    throw new EntityNotFoundException($"Entidade no index: '{i}' não encontrada");
                }
            }
            dbService.SaveChanges();
        }

        public List<T> Buscar()
        {
            return dbService.Set<T>().ToList();
        }

        public IQueryable<T> Buscar(Expression<Func<T, bool>> predicate, Func<IQueryable<T>,
            IIncludableQueryable<T, object>> include = null)
        {
            IQueryable<T> result = dbService.Set<T>().Where(predicate);

            if (include != null)
            {
                result = include(result);
            }

            return result.AsQueryable();
        }

        public T Buscar(long id)
        {
            return dbService.Set<T>().Find(id);
        }

        public List<T> Buscar(long[] ids)
        {
            if (ids == null)
            {
                throw new ArgumentNullException("ids", "Não é buscar entidades por uma lista de ids nula");
            }

            return Buscar(ids.ToList());
        }

        public List<T> Buscar(List<long> ids)
        {
            if (ids == null)
            {
                throw new ArgumentNullException("ids", "Não é buscar entidades por uma lista de ids nula");
            }

            List<T> entidades = new List<T>();
            ids.ForEach(id => entidades.Add(dbService.Set<T>().Find(id)));
            return entidades;
        }

        public void Deletar(T entidade)
        {
            if (entidade == null)
            {
                throw new ArgumentNullException("entidade", "Não é possível remover uma entidade nulla");
            }

            dbService.Set<T>().Remove(entidade);
            dbService.SaveChanges();
        }

        public void Deletar(List<T> entidades)
        {
            if (entidades == null)
            {
                throw new ArgumentNullException("entidades", "Não é possível remover uma entidade nulla");
            }

            for (int i = 0; i < entidades.Count; i++)
            {
                if (entidades[i] != null)
                {
                    dbService.Set<T>().Remove(entidades[i]);
                }
                else
                {
                    throw new NullReferenceException("Não é possível remover uma entidade nulla no índice: " + i);
                }
            }

            dbService.SaveChanges();
        }

        public void Deletar(List<long> ids)
        {
            if (ids == null)
            {
                throw new ArgumentNullException("ids", "Não é buscar entidades por uma lista de ids nula");
            }

            foreach (long id in ids)
            {
                IEntity obj = new T() { Id = id };

                dbService.Attach(obj);
                dbService.Remove(obj);
            }

            dbService.SaveChanges();
        }

        public async Task DeletarAsync(List<long> ids)
        {
            if (ids == null)
            {
                throw new ArgumentNullException("ids", "Não é buscar entidades por uma lista de ids nula");
            }

            foreach (long id in ids)
            {
                IEntity obj = new T() { Id = id };

                dbService.Attach(obj);
                dbService.Remove(obj);
            }

            await dbService.SaveChangesAsync();
        }

        public void Deletar(long id)
        {
            IEntity obj = new T() { Id = id };

            dbService.Attach(obj);
            dbService.Remove(obj);
            dbService.SaveChanges();
        }

        public T Inserir(T entidade)
        {
            ValidarInserirEntidade(entidade);

            bool exists = dbService.Set<T>().Any(ent => ent.Id == entidade.Id);

            if (!exists)
            {
                dbService.Add(entidade);
                dbService.SaveChanges();
                return entidade;
            }
            else
            {
                throw new EntityAlreadyExistsException("Não é possível criar uma entidade já existente. ");
            }
        }

        public List<T> Inserir(List<T> entidades)
        {
            ValidarInserirEntidades(entidades);

            entidades.ForEach(entidade =>
            {
                dbService.Add(entidade);
            });

            dbService.SaveChanges();
            return entidades;
        }

        private void ValidarEntidadeNulla(T entidade)
        {
            if (entidade == null)
            {
                throw new ArgumentNullException("entidade", "Não é possível atualizar uma entidade nula");
            }
        }

        public async Task AtualizarAsync(T entidade)
        {
            ValidarEntidadeNulla(entidade);

            if (dbService.Set<T>().Any(ent => ent.Id == entidade.Id))
            {
                dbService.Update(entidade);
                await dbService.SaveChangesAsync();
            }
            else
            {
                throw new EntityNotFoundException("Entidade não existe no banco de dados para ser atualizada");
            }
        }

        public async Task AtualizarAsync(List<T> entidades)
        {
            dbService.Update(entidades);
            await dbService.SaveChangesAsync();
        }

        public async Task<List<T>> BuscarAsync()
        {
            return await dbService.Set<T>().ToListAsync();
        }

        public async Task<T> BuscarAsync(long id)
        {
            return await dbService.FindAsync<T>(id);
        }

        public async Task DeletarAsync(T entidade)
        {
            dbService.Remove(entidade);
            await dbService.SaveChangesAsync();
        }

        public async Task DeletarAsync(long id)
        {
            IEntity obj = new T() { Id = id };

            dbService.Attach(obj);
            dbService.Remove(obj);
            await dbService.SaveChangesAsync();
        }

        private void ValidarInserirEntidades(List<T> entidades)
        {
            if (entidades == null)
            {
                throw new ArgumentNullException("entidades", "Não é possível inserir uma lista nula de entidades");
            }
        }

        private void ValidarInserirEntidade(T entidade)
        {
            if (entidade == null)
            {
                throw new ArgumentNullException("entidade", "Não é possível inserir uma entidade nula");
            }
        }

        public async Task<List<T>> InserirAsync(List<T> entidades)
        {
            ValidarInserirEntidades(entidades);

            foreach (T entidade in entidades)
            {
                try
                {
                    bool exists = dbService.Set<T>().Any(ent => ent.Id == entidade.Id);

                    if (!exists)
                    {
                        await dbService.AddAsync(entidade);
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine(entidade.GetType() + "de Id:" + entidade.Id + "já foi cadastrada");
                        throw new EntityAlreadyExistsException("Entidade já foi cadastrada");
                    }
                }
                catch (Exception e)
                {
                    System.Diagnostics.Debug.WriteLine(e.Message);
                    throw new EntityAlreadyExistsException("Não é possível criar uma entidade já existente");
                }
            }
            await dbService.SaveChangesAsync();
            return entidades;
        }

        public async Task<T> InserirAsync(T entidade)
        {
            try
            {
                bool exists = dbService.Set<T>().Any(ent => ent.Id == entidade.Id);

                if (!exists)
                {
                    await dbService.AddAsync(entidade);
                    await dbService.SaveChangesAsync();
                    return entidade;
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine(entidade.GetType() + "de Id:" + entidade.Id + "já foi cadastrada");
                    throw new EntityAlreadyExistsException("Entidade já foi cadastrada");
                }
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.Message);
                throw new EntityAlreadyExistsException("Não é possível criar uma entidade já existente");
            }
        }

        public DbSet<T> Entity()
        {
            return dbService.Set<T>();
        }

        public DbSet<U> Entity<U>() where U : class, IEntity, new()
        {
            return dbService.Set<U>();
        }
    }
}
