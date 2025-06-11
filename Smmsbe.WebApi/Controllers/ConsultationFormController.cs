using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsultationFormController : ControllerBase
    {
        private readonly IConsultationFormService _consultationFormService;
        public ConsultationFormController(IConsultationFormService consultationFormService)
        {
            _consultationFormService = consultationFormService;
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _consultationFormService.GetById(id);
            return Ok(getById);
        }

        [HttpPost("AddConsultationForm")]
        public async Task<IActionResult> AddConsultationForm(AddConsultationFormRequest request)
        {
            var addConsultationForm = await _consultationFormService.AddConsultationFormAsync(request);
            return Ok(addConsultationForm);
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchConsultationFormRequest request)
        {
            var result = await _consultationFormService.SearchConsultationFormAsync(request);

            return Ok(result);
        }

        [HttpPut("UpdateConsultationForm")]
        public async Task<IActionResult> UpdateConsultationForm(UpdateConsultationFormRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateConsultationForm = await _consultationFormService.UpdateConsultationFormAsync(request);
            return Ok(updateConsultationForm);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteConsultationForm(int id)
        {
            var deleteConsultationForm = await _consultationFormService.DeleteConsultationFormAsync(id);
            return Ok();
        }
    }
}
