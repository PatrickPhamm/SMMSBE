using Smmsbe.Repositories.Entities;
using Smmsbe.Services.Models;

namespace Smmsbe.Services.Interfaces
{
    public interface INurseService
    {
        Task<Nurse> GetById(int id);

        Task<Nurse> AuthorizeAsync(string username, string password);

        Task<Nurse> UpdateNurseAsync(UpdateNurseRequest request);

        Task<Nurse> AddNurseAsync(AddNurseRequest request);

        Task<bool> DeleteNurseAsync(int id);

        Task<List<NurseResponse>> SearchNurseAsync(SearchNurseRequest request);

        //Task<Nurse> GetAllAsync();
    }
}
