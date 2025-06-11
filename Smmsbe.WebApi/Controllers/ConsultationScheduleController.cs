using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsultationScheduleController : ControllerBase
    {
        private readonly IConsultationScheduleService _consultationScheduleService;
        public ConsultationScheduleController(IConsultationScheduleService consultationScheduleService)
        {
            _consultationScheduleService = consultationScheduleService;
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _consultationScheduleService.GetById(id);
            return Ok(getById);
        }

        [HttpPost("AddConsultationSchedule")]
        public async Task<IActionResult> AddConsultationSchedule(AddConsultationScheduleRequest request)
        {
            var addConsultationSchedule = await _consultationScheduleService.AddConsultationScheduleAsync(request);
            return Ok(addConsultationSchedule);
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchConsultationScheduleRequest request)
        {
            var result = await _consultationScheduleService.SearchConsultationScheduleAsync(request);

            return Ok(result);
        }

        [HttpPut("UpdateConsultationSchedule")]
        public async Task<IActionResult> UpdateConsultationSchedule(UpdateConsultationScheduleRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateConsultationSchedule = await _consultationScheduleService.UpdateConsultationScheduleAsync(request);
            return Ok(updateConsultationSchedule);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteConsultationSchedule(int id)
        {
            var deleteConsultationSchedule = await _consultationScheduleService.DeleteConsultationScheduleAsync(id);
            return Ok();
        }
    }
}
