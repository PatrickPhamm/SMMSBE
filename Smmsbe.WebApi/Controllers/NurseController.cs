using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class nurseController : ControllerBase
    {
        private readonly INurseService _nurseService;

        public nurseController(INurseService nurseService)
        {
            _nurseService = nurseService;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginNurseRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var acc = await _nurseService.AuthorizeAsync(request.Email, request.Password);

            return Ok(new
            {
                Success = true,
                User = new
                {
                    Id = acc.NurseId,
                    acc.Email,
                    acc.FullName
                }
            });
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _nurseService.GetById(id);
            return Ok(getById);
        }

        #region getAll
        /*[HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
            var result = await _nurseService.GetAllAsync();
            return Ok(result);
        }*/
        #endregion

        [HttpPost("add")]
        public async Task<IActionResult> AddAccount([FromBody] AddNurseRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var account = await _nurseService.AddNurseAsync(request);

            return Ok(new
            {
                account.NurseId,
                account.FullName,
                account.Username,
                account.Email
            });
        }

        [HttpPut("update")]
        public async Task<IActionResult> UpdateAccount(UpdateNurseRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var acc = await _nurseService.UpdateNurseAsync(request);

            return Ok(acc);
        }


        [HttpPost("search")]
        public async Task<IActionResult> Search(SearchNurseRequest request)
        {
            var result = await _nurseService.SearchNurseAsync(request);

            return Ok(result);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAccount(int id)
        {
            var result = await _nurseService.DeleteNurseAsync(id);

            return Ok();
        }

        [HttpGet("{id}/vaccineResults")]
        public async Task<IActionResult> GetVaccineResults(int id)
        {
            var result = await _nurseService.GetVaccinationResults(id);
            return Ok(result);
        }

        [HttpGet("{id}/healthCheckResults")]
        public async Task<IActionResult> GetHealthCheckResults(int id)
        {
            var result = await _nurseService.GetHealthCheckResults(id);
            return Ok(result);
        }
    }
}
