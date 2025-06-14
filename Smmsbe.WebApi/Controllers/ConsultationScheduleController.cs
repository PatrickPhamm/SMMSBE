using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class consultationScheduleController : ControllerBase
    {
        private readonly IConsultationScheduleService _consultationScheduleService;
        public consultationScheduleController(IConsultationScheduleService consultationScheduleService)
        {
            _consultationScheduleService = consultationScheduleService;
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _consultationScheduleService.GetByIdAsync(id);
            return Ok(getById);
        }

        [HttpPost("createConsultationSchedule")]
        public async Task<IActionResult> AddConsultationSchedule(AddConsultationScheduleRequest request)
        {
            var addConsultationSchedule = await _consultationScheduleService.AddConsultationScheduleAsync(request);
            return Ok(addConsultationSchedule);
        }

        [HttpPost("search")]
        public async Task<IActionResult> Search(SearchConsultationScheduleRequest request)
        {
            var result = await _consultationScheduleService.SearchConsultationScheduleAsync(request);

            return Ok(result);
        }

        [HttpPut("updateConsultationSchedule")]
        public async Task<IActionResult> UpdateConsultationSchedule(UpdateConsultationScheduleRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateConsultationSchedule = await _consultationScheduleService.UpdateConsultationScheduleAsync(request);
            return Ok(updateConsultationSchedule);
        }

        [HttpPost("accept/{consultationId}")]
        public async Task<IActionResult> Approve(int consultationId)
        {
            var result = await _consultationScheduleService.AcceptConsultation(consultationId);

            return Ok(result);
        }

        [HttpPost("reject/{consultationId}")]
        public async Task<IActionResult> Reject(int consultationId)
        {
            var result = await _consultationScheduleService.RejectConsultation(consultationId);

            return Ok(result);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteConsultationSchedule(int id)
        {
            var deleteConsultationSchedule = await _consultationScheduleService.DeleteConsultationScheduleAsync(id);
            return Ok();
        }
    }
}
