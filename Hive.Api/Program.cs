using Microsoft.AspNetCore.StaticFiles;
using Microsoft.EntityFrameworkCore;
using Hive.Data.Models;
using Microsoft.OpenApi.Models;
using Serilog;
using System.Reflection;
using System.Text;
using Hive.Data.Repositories;


// TODO move this to config + environment variable
const string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=HICS;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False";

Log.Logger = new LoggerConfiguration()
	.MinimumLevel.Debug()
	.WriteTo.Console()
	.WriteTo.File("logs/hive.txt", rollingInterval: RollingInterval.Day)
	.CreateLogger();



var builder = WebApplication.CreateBuilder(args);

builder.Host.UseSerilog();

builder.Services.AddControllers(options =>
{
	options.ReturnHttpNotAcceptable = true;
}).AddNewtonsoftJson()
.AddXmlDataContractSerializerFormatters();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(setupAction =>
{
	//var xmlCommentsFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
	//var xmlCommentsFullPath = Path.Combine(AppContext.BaseDirectory, xmlCommentsFile);

	//setupAction.IncludeXmlComments(xmlCommentsFullPath);

	//setupAction.AddSecurityDefinition("HiveApiBearerAuth", new OpenApiSecurityScheme()
	//{
	//	Type = SecuritySchemeType.Http,
	//	Scheme = "Bearer",
	//	Description = "Input a valid token to access this API"
	//});

	//setupAction.AddSecurityRequirement(new OpenApiSecurityRequirement
	//{
	//	{
	//		new OpenApiSecurityScheme
	//		{
	//			Reference = new OpenApiReference {
	//				Type = ReferenceType.SecurityScheme,
	//				Id = "HiveBearerAuth" }
	//		}, new List<string>() }
	//});
});

builder.Services.AddSingleton<FileExtensionContentTypeProvider>();

builder.Services.AddDbContext<HiveDbContext>(
	dbContextOptions => dbContextOptions.UseSqlServer(connectionString));

builder.Services.AddScoped<IUsersRepository, UsersRepository>();

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

builder.Services.AddApiVersioning(setupAction =>
{
	setupAction.AssumeDefaultVersionWhenUnspecified = true;
	setupAction.DefaultApiVersion = new Microsoft.AspNetCore.Mvc.ApiVersion(1, 0);
	setupAction.ReportApiVersions = true;
});

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
app.UseHttpsRedirection();

app.UseRouting();

// app.UseAuthentication();
// app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
	endpoints.MapControllers();
});

app.Run();
