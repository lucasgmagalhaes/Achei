﻿using Api.Token;
using Entidades.Entidades;
using Microsoft.AspNet.OData.Extensions;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.PlatformAbstractions;
using Persistencia;
using Persistencia.Contexts.Application;
using Persistencia.Interfaces;
using Persistencia.Services;
using Swashbuckle.AspNetCore.Swagger;
using System;
using System.IO;

namespace Api
{
    public class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

            ConnectionString.Server = configuration.GetValue<string>("ConnectionString:Server");
            ConnectionString.Database = configuration.GetValue<string>("ConnectionString:Database");
            ConnectionString.UserId = configuration.GetValue<string>("ConnectionString:UserId");
            ConnectionString.Password = configuration.GetValue<string>("ConnectionString:Password");
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors();
            services.AddOData();
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);

            services.AddScoped(typeof(ICrudService<>), typeof(CrudService<>));
            services.AddScoped(typeof(IAutenticacaoService), typeof(AutenticacaoService));
            services.AddScoped(typeof(IUsuarioService), typeof(UsuarioService));
            services.AddScoped(typeof(IItemAchadoService), typeof(ItemAchadoService));
            services.AddScoped(typeof(IItemPerdidoService), typeof(ItemPerdidoService));
            services.AddScoped(typeof(IRegiaoService), typeof(RegiaoService));
            services.AddScoped(typeof(ITagService), typeof(TagService));
            services.AddScoped(typeof(IItemMatchService), typeof(ItemMatchService));

            services.Scan(scan => scan.FromCallingAssembly().AddClasses().AsMatchingInterface());

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddSingleton<IAuthorizationHandler, AuthorizeHandle>();

            services.AddDbContext<ApplicationDbContext>();

            services.AddSingleton(Mapeamento.Criar());

            ConfigureAuthentication(services);

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1",
                    new Info
                    {
                        Title = "Achei API",
                        Version = "v1",
                        Description = "Sistema de procura e cadastro de achados e perdidos",
                        Contact = new Contact
                        {
                            Name = "Lucas Gomes",
                            Url = "https://github.com/lucasgmagalhaes/Achei"
                        }
                    });

                string caminhoAplicacao = PlatformServices.Default.Application.ApplicationBasePath;
                string nomeAplicacao = PlatformServices.Default.Application.ApplicationName;
                string caminhoXmlDoc =
                    Path.Combine(caminhoAplicacao, $"{nomeAplicacao}.xml");

                c.IncludeXmlComments(caminhoXmlDoc);
            });

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            app.Use(async (ctx, next) =>
            {
                await next();
                if (ctx.Response.StatusCode == 204)
                {
                    ctx.Response.ContentLength = 0;
                }
            });

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseCors(builder => builder.WithOrigins("http://localhost:4200")
                .AllowAnyHeader()
                .AllowAnyMethod());
            }
            else
            {
                app.UseHsts();
            }

            ConfigureSwagger(app);
            UpdateDatabase(app);

            app.UseHttpsRedirection();
            app.UseMvc(routerBuilder =>
            {
                routerBuilder.EnableDependencyInjection();
                routerBuilder.Expand().Filter().Count().OrderBy();
            });
        }

        private void ConfigureSwagger(IApplicationBuilder app)
        {
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Achei API");
            });
        }

        private void UpdateDatabase(IApplicationBuilder app)
        {
            using (IServiceScope serviceScope = app.ApplicationServices.GetRequiredService<IServiceScopeFactory>().CreateScope())
            {
                using (ApplicationDbContext context = serviceScope.ServiceProvider.GetService<ApplicationDbContext>())
                {
                    context.Database.Migrate();
                }
            }
        }

        private void ConfigureAuthentication(IServiceCollection services)
        {
            SigningConfigurations signingConfigurations = new SigningConfigurations();
            services.AddSingleton(signingConfigurations);

            TokenConfigurations tokenConfigurations = new TokenConfigurations();
            new ConfigureFromConfigurationOptions<TokenConfigurations>(
                Configuration.GetSection("TokenConfigurations"))
                    .Configure(tokenConfigurations);
            services.AddSingleton(tokenConfigurations);


            services.AddAuthentication(authOptions =>
            {
                authOptions.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                authOptions.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(bearerOptions =>
            {
                Microsoft.IdentityModel.Tokens.TokenValidationParameters paramsValidation = bearerOptions.TokenValidationParameters;
                paramsValidation.IssuerSigningKey = signingConfigurations.Key;
                paramsValidation.ValidAudience = tokenConfigurations.Audience;
                paramsValidation.ValidIssuer = tokenConfigurations.Issuer;
                paramsValidation.ValidateIssuerSigningKey = true;
                paramsValidation.ValidateLifetime = true;
                paramsValidation.ClockSkew = TimeSpan.Zero;
            });

            services.AddAuthorization(auth =>
            {
                auth.AddPolicy("Bearer", new AuthorizationPolicyBuilder()
                    .AddAuthenticationSchemes(JwtBearerDefaults.AuthenticationScheme)
                    .RequireAuthenticatedUser().Build());
            });
        }
    }
}
