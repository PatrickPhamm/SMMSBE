using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicalInventoryController : ControllerBase
    {
        private readonly IMedicalInventoryService _medicalInventoryService;

        public MedicalInventoryController(IMedicalInventoryService medicalInventoryService)
        {
            _medicalInventoryService = medicalInventoryService;
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var entity = await _medicalInventoryService.GetById(id);

            return Ok(entity);
        }

        [HttpPost("Add")]
        public async Task<IActionResult> AddMedicalInventory([FromBody] AddMedicalInventoryRequest request)
        {
            var entity = await _medicalInventoryService.AddMedicalInventoryAsync(request);

            return Ok(entity);
        }

        [HttpPut("Update")]
        public async Task<IActionResult> UpdateMedicalInventory(UpdateMedicalInventoryRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var entity = await _medicalInventoryService.UpdateMedicalInventoryAsync(request);
            return Ok(entity);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMedicalInventory(int id)
        {
            var result = await _medicalInventoryService.DeleteMedicalInventoryAsync(id);

            return Ok();
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchMedicalInventoryRequest request)
        {
            var result = await _medicalInventoryService.SearchMedicalInventorysAsync(request);

            return Ok(result);
        }
    }
}
