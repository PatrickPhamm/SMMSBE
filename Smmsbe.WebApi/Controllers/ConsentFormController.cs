using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class consentFormController : ControllerBase
    {
        private readonly IConsentFormService _consentFormService;
        public consentFormController(IConsentFormService consentFormService)
        {
            _consentFormService = consentFormService;
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _consentFormService.GetByIdAsync(id);
            return Ok(getById);
        }

        [HttpPost("addConsentForm")]
        public async Task<IActionResult> AddConsentForm(AddConsentFormRequest request)
        {
            var addConsentForm = await _consentFormService.AddConsentFormAsync(request);
            return Ok(addConsentForm);
        }

        [HttpPost("search")]
        public async Task<IActionResult> Search(SearchConsentFormRequest request)
        {
            var result = await _consentFormService.SearchConsentFormAsync(request);

            return Ok(result);
        }

        [HttpPut("updateConsentForm")]
        public async Task<IActionResult> UpdateConsentForm(UpdateConsentFormRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateConsentForm = await _consentFormService.UpdateConsentFormAsync(request);
            return Ok(updateConsentForm);
        }

        [HttpPost("accept/{consentFormId}")]
        public async Task<IActionResult> Approve(int consentFormId)
        {
            var result = await _consentFormService.AcceptConsentForm(consentFormId);

            return Ok(result);
        }

        [HttpPost("reject/{consentFormId}")]
        public async Task<IActionResult> Reject(int consentFormId)
        {
            var result = await _consentFormService.RejectConsentForm(consentFormId);

            return Ok(result);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteConsentForm(int id)
        {
            var deleteConsentForm = await _consentFormService.DeleteConsentFormAsync(id);
            return Ok();
        }
    }
}
