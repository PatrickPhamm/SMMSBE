using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FormController : ControllerBase
    {
        private readonly IFormService _formService;

        public FormController(IFormService formService)
        {
            _formService = formService;
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var entity = await _formService.GetById(id);

            return Ok(entity);
        }

        [HttpPost("Add")]
        public async Task<IActionResult> AddForm([FromBody] AddFormRequest request)
        {
            var entity = await _formService.AddFormAsync(request);

            return Ok(entity);
        }

        [HttpPut("Update")]
        public async Task<IActionResult> UpdateForm(UpdateFormRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var entity = await _formService.UpdateFormAsync(request);

            return Ok(entity);
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchFormRequest request)
        {
            var result = await _formService.SearchFormAsync(request);

            return Ok(result);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteForm(int id)
        {
            var result = await _formService.DeleteFormAsync(id);

            return Ok();
        }
    }
}
