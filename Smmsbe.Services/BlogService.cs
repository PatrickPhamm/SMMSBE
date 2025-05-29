using Azure.Core;
using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services.Exceptions;
using Smmsbe.Services.Helpers;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services
{
    public class BlogService : IBlogService
    {
        private readonly IBlogRepository _blogRepository;

        public BlogService(IBlogRepository blogRepository)
        {
            _blogRepository = blogRepository;
        }

        public async Task<Blog> GetById(int id)
        {
            var entity = await _blogRepository.GetById(id);
            if (entity == null) throw AppExceptions.NotFoundId();

            return entity;
        }

        public async Task<Blog> AddBlogAsync(AddBlogRequest request)
        {
            var newBlog = new Blog
            {
                ManagerId = request.ManagerId,
                Title = request.Title,
                Description = request.Description,
                DateAdded = request.DateAdded
            };

            return await _blogRepository.Insert(newBlog);
        }

        public async Task<Blog> UpdateBlogAsync(UpdateBlogRequest request)
        {
            var updateBlog = await _blogRepository.GetById(request.BlogId);
            if (updateBlog == null) throw AppExceptions.NotFoundId();

            //updateBlog.ManagerId = request.ManagerId;
            updateBlog.Title = request.Title;
            updateBlog.Description = request.Description;
            updateBlog.DateAdded = request.DateAdded;

            await _blogRepository.Update(updateBlog);
            return updateBlog;
        }

        public async Task<bool> DeleteBlogAsync(int id)
        {
            try
            {
                var blog = await _blogRepository.GetById(id);
                if (blog == null) throw AppExceptions.NotFoundId();

                await _blogRepository.Delete(id);
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        
    }
}
