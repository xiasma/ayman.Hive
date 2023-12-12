using Microsoft.AspNetCore.StaticFiles;
using Serilog;
using System.Reflection;
using Hive.Data.Repositories;
using Hive.Data.Models;
using Microsoft.EntityFrameworkCore;


// TODO move this to config + environment variable
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
	var xmlCommentsFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
	var xmlCommentsFullPath = Path.Combine(AppContext.BaseDirectory, xmlCommentsFile);

	setupAction.IncludeXmlComments(xmlCommentsFullPath);

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

var hiveSqlConnectionString = builder.Configuration.GetConnectionString("HiveSqlConnectionString");
builder.Services.AddDbContext<HiveDbContext>(
	dbContextOptions => dbContextOptions.UseSqlServer(hiveSqlConnectionString, builder =>
		{ builder.EnableRetryOnFailure(5, TimeSpan.FromSeconds(10), null); }
		));

builder.Services.AddScoped<IUsersRepository, UsersRepository>();
//builder.Services.AddScoped<IUsersRepository>(repo => new SqlUsersRepository(hiveSqlConnectionString));

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
