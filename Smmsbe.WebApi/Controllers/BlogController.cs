using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BlogController : ControllerBase
    {
        public readonly IBlogService _blogService;
        public BlogController(IBlogService blogService)
        {
            _blogService = blogService;
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            var getById = await _blogService.GetById(id);
            return Ok(getById);
        }

        [HttpPost("AddBlog")]
        public async Task<IActionResult> AddBlog(AddBlogRequest request)
        {
            var addBlog = await _blogService.AddBlogAsync(request);
            return Ok(addBlog);
        }

        [HttpPut("UpdateBlog")]
        public async Task<IActionResult> UpdateBlog(UpdateBlogRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var updateBlog = await _blogService.UpdateBlogAsync(request);
            return Ok(updateBlog);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBlog(int id)
        {
            var deleteBlog = await _blogService.DeleteBlogAsync(id);
            return Ok();
        }
    }
}
