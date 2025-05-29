using Smmsbe.Repositories.Entities;
using Smmsbe.Services.Models;

namespace Smmsbe.Services.Interfaces
{
    public interface IParentService
    {
        Task<Parent> GetById(int id);

        Task<Parent> AuthorizeAsync(string username, string password);

        Task<Parent> UpdateParentAsync(UpdateParentRequest request);

        Task<Parent> AddParentAsync(AddParentRequest request);

        Task<bool> DeleteParentAsync(int id);

        Task<List<ParentResponse>> SearchParentAsync(SearchParentRequest request);

        //Task<Parent> GetAllAsync();
    }
}
