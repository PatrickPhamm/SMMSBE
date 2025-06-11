using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VaccinationScheduleController : ControllerBase
    {
        private readonly IVaccinationScheduleService _vaccinationScheduleService;
        public VaccinationScheduleController(IVaccinationScheduleService vaccinationScheduleService)
        {
            _vaccinationScheduleService = vaccinationScheduleService;
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _vaccinationScheduleService.GetById(id);
            return Ok(getById);
        }

        [HttpPost("AddVaccinationSchedule")]
        public async Task<IActionResult> AddVaccinationSchedule(AddVaccinationScheduleRequest request)
        {
            var addVaccinationSchedule = await _vaccinationScheduleService.AddVaccinationScheduleAsync(request);
            return Ok(addVaccinationSchedule);
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchVaccinationScheduleRequest request)
        {
            var result = await _vaccinationScheduleService.SearchVaccinationScheduleAsync(request);

            return Ok(result);
        }

        [HttpPut("UpdateVaccinationSchedule")]
        public async Task<IActionResult> UpdateVaccinationSchedule(UpdateVaccinationScheduleRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateVaccinationSchedule = await _vaccinationScheduleService.UpdateVaccinationScheduleAsync(request);
            return Ok(updateVaccinationSchedule);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteVaccinationSchedule(int id)
        {
            var deleteVaccinationSchedule = await _vaccinationScheduleService.DeleteVaccinationScheduleAsync(id);
            return Ok();
        }
    }
}
