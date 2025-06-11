using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsentFormController : ControllerBase
    {
        private readonly IConsentFormService _consentFormService;
        public ConsentFormController(IConsentFormService consentFormService)
        {
            _consentFormService = consentFormService;
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _consentFormService.GetByIdAsync(id);
            return Ok(getById);
        }

        [HttpPost("AddConsentForm")]
        public async Task<IActionResult> AddConsentForm(AddConsentFormRequest request)
        {
            var addConsentForm = await _consentFormService.AddConsentFormAsync(request);
            return Ok(addConsentForm);
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchConsentFormRequest request)
        {
            var result = await _consentFormService.SearchConsentFormAsync(request);

            return Ok(result);
        }

        [HttpPut("UpdateConsentForm")]
        public async Task<IActionResult> UpdateConsentForm(UpdateConsentFormRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateConsentForm = await _consentFormService.UpdateConsentFormAsync(request);
            return Ok(updateConsentForm);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteConsentForm(int id)
        {
            var deleteConsentForm = await _consentFormService.DeleteConsentFormAsync(id);
            return Ok();
        }
    }
}
