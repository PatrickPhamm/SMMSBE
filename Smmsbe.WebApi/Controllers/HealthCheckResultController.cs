using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

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

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _healthCheckResultService.GetById(id);
            return Ok(getById);
        }

        [HttpPost("AddHealthCheckResult")]
        public async Task<IActionResult> AddHealthCheckResult(AddHealthCheckResultRequest request)
        {
            var addHealthCheckResult = await _healthCheckResultService.AddHealthCheckResultAsync(request);
            return Ok(addHealthCheckResult);
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchHealthCheckResultRequest request)
        {
            var result = await _healthCheckResultService.SearchHealthCheckResultAsync(request);

            return Ok(result);
        }

        [HttpPut("UpdateHealthCheckResult")]
        public async Task<IActionResult> UpdateHealthCheckResult(UpdateHealthCheckResultRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateHealthCheckResult = await _healthCheckResultService.UpdateHealthCheckResultAsync(request);
            return Ok(updateHealthCheckResult);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteHealthCheckResult(int id)
        {
            var deleteHealthCheckResult = await _healthCheckResultService.DeleteHealthCheckResultAsync(id);
            return Ok();
        }
    }
}
