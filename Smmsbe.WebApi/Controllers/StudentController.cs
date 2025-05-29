using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        private readonly IStudentService _studentService;
        public StudentController(IStudentService studentService)
        {
            _studentService = studentService;
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Login([FromBody] LoginStudentRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var acc = await _studentService.AuthorizeAsync(request.StudentNumber, request.Password);

            return Ok(new
            {
                Success = true,
                User = new
                {
                    Id = acc.StudentId,
                    acc.FullName, 
                    acc.ClassName,
                    acc.StudentNumber
                }
            });
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            //var getById = await _studentService.GetById(id);
            var getById = await _studentService.GetByIdAsync(id);
            return Ok(getById);
        }

        /*[HttpGet("GetAll")]
        public async Task<IActionResult> GetAll()
        {
            var result = await _studentService.GetAllAsync();
            return Ok(result);
        }*/

        [HttpPost("Add")]
        public async Task<IActionResult> AddAccount([FromBody] AddStudentRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var account = await _studentService.AddStudentAsync(request);

            return Ok(new
            {
                account.StudentId,
                account.ParentId,
                account.FullName,
                account.DateOfBirth,
                account.Gender,
                account.StudentNumber
            });
        }

        [HttpPut("Update")]
        public async Task<IActionResult> UpdateAccount(UpdateStudentRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var acc = await _studentService.UpdateStudentAsync(request);

            return Ok(acc);
        }

        [HttpPost("Search")]
        public async Task<IActionResult> Search(SearchStudentRequest request)
        {
            var result = await _studentService.SearchStudentAsync(request);

            return Ok(result);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAccount(int id)
        {
            var result = await _studentService.DeleteStudentAsync(id);

            return Ok();
        }
    }
}
