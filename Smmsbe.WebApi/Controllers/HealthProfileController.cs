using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HealthProfileController : ControllerBase
    {
        private readonly IHealthProfileService _healthProfileService;

        public HealthProfileController(IHealthProfileService healthProfileService)
        {
            _healthProfileService = healthProfileService;
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _healthProfileService.GetById(id);
            return Ok(getById);
        }

        [HttpPost("AddHealthProfile")]
        public async Task<IActionResult> AddhealthProfile(AddHealthProfileRequest request)
        {
            var addHealthProfile = await _healthProfileService.AddHealthProfileAsync(request);
            return Ok(addHealthProfile);
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchHealthProfileRequest request)
        {
            var result = await _healthProfileService.SearchHealthProfileAsync(request);

            return Ok(result);
        }

        [HttpPut("UpdateHealthProfile")]
        public async Task<IActionResult> UpdateHealthProfile(UpdateHealthProfileRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateHealthProfile = await _healthProfileService.UpdateHealthProfileAsync(request);
            return Ok(updateHealthProfile);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteHealthProfile(int id)
        {
            var deletehealthProfile = await _healthProfileService.DeleteHealthProfileAsync(id);
            return Ok();
        }
    }
}
