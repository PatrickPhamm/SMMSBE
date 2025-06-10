using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicationController : ControllerBase
    {
        private readonly IMedicationService _medicationService;

        public MedicationController(IMedicationService medicationService)
        {
            _medicationService = medicationService;
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _medicationService.GetByIdAync(id);
            return Ok(getById);
        }

        [HttpPost("AddMedication")]
        public async Task<IActionResult> AddMedication(AddMedicationRequest request)
        {
            var addMedication = await _medicationService.AddMedicationAsync(request);
            return Ok(addMedication);
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchMedicationRequest request)
        {
            var result = await _medicationService.SearchMedicationAsync(request);

            return Ok(result);
        }

        [HttpPut("UpdateMedication")]
        public async Task<IActionResult> UpdateMedication(UpdateMedicationRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateMedication = await _medicationService.UpdateMedicationAsync(request);
            return Ok(updateMedication);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMedication(int id)
        {
            var deleteMedication = await _medicationService.DeleteMedicationAsync(id);
            return Ok();
        }
    }
}
