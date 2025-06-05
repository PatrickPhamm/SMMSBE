using Microsoft.EntityFrameworkCore;
using Smmsbe.Repositories;
using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services;
using Smmsbe.Services.Common;
using Smmsbe.Services.Interfaces;
using Smmsbe.WebApi.Middlewares;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Start DI
builder.Services.AddSingleton<IHashHelper, HashHelper>();

// AppSettings
var appSettings = new AppSettings
{
    ApplicationUrl = builder.Configuration["AppSettings:ApplicationUrl"]
};


builder.Services.AddSingleton(appSettings);

var cnnString = builder.Configuration.GetConnectionString("DefaultConnection");

builder.Services.AddDbContext<SMMSContext>((optionBuilder) =>
{
    optionBuilder.UseSqlServer(cnnString);
});

builder.Services.AddScoped<IManagerRepository, ManagerRepository>();
builder.Services.AddScoped<IManagerService, ManagerService>();
builder.Services.AddScoped<INurseRepository, NurseRepository>();
builder.Services.AddScoped<INurseService, NurseService>();
builder.Services.AddScoped<IParentRepository, ParentRepository>();
builder.Services.AddScoped<IParentService, ParentService>();
builder.Services.AddScoped<IStudentRepository, StudentRepository>();
builder.Services.AddScoped<IStudentService, StudentService>();
builder.Services.AddScoped<IBlogRepository, BlogRepository>();
builder.Services.AddScoped<IBlogService, BlogService>();
builder.Services.AddScoped<IMedicalInventoryRepository, MedicalInventoryRepository>();
builder.Services.AddScoped<IMedicalInventoryService, MedicalInventoryService>();
builder.Services.AddScoped<IVaccinationScheduleRepository, VaccinationScheduleRepository>();
builder.Services.AddScoped<IVaccinationScheduleService, VaccinationScheduleService>();
builder.Services.AddScoped<IFormRepository, FormRepository>();
builder.Services.AddScoped<IFormService, FormService>();

builder.Services.AddScoped<IImageService, ImageService>();

var app = builder.Build();

app.UseStaticFiles();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())
//{
//    app.UseSwagger();
//    app.UseSwaggerUI();
//}

//app.UseHttpsRedirection();

app.UseSwagger();
app.UseSwaggerUI();

app.UseAuthorization();

app.UseMiddleware<ErrorHandlerMiddleware>();

app.MapControllers();

//app.Run();
await app.RunAsync();

