using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services.Interfaces;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HealthCheckResultController : ControllerBase
    {
        private readonly IHealthCheckResultService _healthCheckResultService;
        public HealthCheckResultController(IHealthCheckResultService healthCheckResultService)
        {
            _healthCheckResultService = healthCheckResultService;
        }
    }
}
