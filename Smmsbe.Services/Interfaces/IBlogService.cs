using Smmsbe.Repositories.Entities;
using Smmsbe.Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Interfaces
{
    public interface IBlogService
    {
        Task<Blog> GetById(int id);

        Task<Blog> AddBlogAsync(AddBlogRequest request);

        Task<Blog> UpdateBlogAsync(UpdateBlogRequest request);

        Task<bool> DeleteBlogAsync(int id);

        string GetImageFolder();

    }
}
