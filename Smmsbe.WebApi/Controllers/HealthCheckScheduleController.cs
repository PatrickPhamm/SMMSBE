using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services.Interfaces;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HealthCheckScheduleController : ControllerBase
    {
        private readonly IHealthCheckScheduleService _healthCheckScheduleService;
        public HealthCheckScheduleController(IHealthCheckScheduleService healthCheckScheduleService)
        {
            _healthCheckScheduleService = healthCheckScheduleService;
        }
    }
}
