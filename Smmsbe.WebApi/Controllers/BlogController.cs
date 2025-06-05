using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services.Common;
using Smmsbe.Services;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BlogController : ControllerBase
    {
        public readonly IBlogService _blogService;
        private readonly IImageService _imageService;
        private readonly AppSettings _appSettings;

        public BlogController(IBlogService blogService, IImageService imageService, AppSettings appSettings)
        {
            _blogService = blogService;
            _imageService = imageService;
            _appSettings = appSettings;
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


        /// <summary>
        /// Max 5MB, Filetypes: ".jpg", ".jpeg", ".png", ".gif"
        /// </summary>
        /// <param name="imageFile"></param>
        /// <returns></returns>
        [HttpPost("UploadImage")]
        public async Task<IActionResult> UploadBlogImage(IFormFile imageFile)
        {
            if (imageFile == null || imageFile.Length == 0)
                return BadRequest("No file uploaded");

            // Validate file is an image
            string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
            string fileExtension = Path.GetExtension(imageFile.FileName).ToLowerInvariant();

            if (!allowedExtensions.Contains(fileExtension))
                return BadRequest("Invalid file type. Only jpg, jpeg, png, and gif are allowed.");

            // Size validation (e.g., max 5MB)
            if (imageFile.Length > 5 * 1024 * 1024)
                return BadRequest("File size exceeds the limit of 5MB.");

            try
            {
                var fileName = Guid.NewGuid().ToString() + fileExtension;
                var folder = _blogService.GetImageFolder();
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", folder, fileName);
                var result = await _imageService.UploadImageAsync(filePath, imageFile.OpenReadStream());

                return Ok(result ? new
                {
                    PathFull = $"{_appSettings.ApplicationUrl}/{folder}/{fileName}",
                    FileName = fileName
                } : null);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
