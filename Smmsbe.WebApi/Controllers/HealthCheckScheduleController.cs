using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

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

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _healthCheckScheduleService.GetById(id);
            return Ok(getById);
        }

        [HttpPost("AddHealthCheckSchedule")]
        public async Task<IActionResult> AddHealthCheckSchedule(AddHealthCheckScheduleRequest request)
        {
            var addHealthCheckSchedule = await _healthCheckScheduleService.AddHealthCheckScheduleAsync(request);
            return Ok(addHealthCheckSchedule);
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchHealthCheckScheduleRequest request)
        {
            var result = await _healthCheckScheduleService.SearchHealthCheckScheduleAsync(request);

            return Ok(result);
        }

        [HttpPut("UpdateHealthCheckSchedule")]
        public async Task<IActionResult> UpdateHealthCheckSchedule(UpdateHealthCheckScheduleRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateHealthCheckSchedule = await _healthCheckScheduleService.UpdateHealthCheckScheduleAsync(request);
            return Ok(updateHealthCheckSchedule);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteHealthCheckSchedule(int id)
        {
            var deleteHealthCheckSchedule = await _healthCheckScheduleService.DeleteHealthCheckScheduleAsync(id);
            return Ok();
        }
    }
}
