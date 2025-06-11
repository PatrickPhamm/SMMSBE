using Smmsbe.Repositories.Entities;
using Smmsbe.Services.Models;

namespace Smmsbe.Services.Interfaces
{
    public interface IConsultationScheduleService
    {
        Task<ConsultationSchedule> GetById(int id);
        Task<ConsultationSchedule> AddConsultationScheduleAsync(AddConsultationScheduleRequest request);
        Task<List<ConsultationScheduleResponse>> SearchConsultationScheduleAsync(SearchConsultationScheduleRequest request);
        Task<ConsultationSchedule> UpdateConsultationScheduleAsync(UpdateConsultationScheduleRequest request);
        Task<bool> DeleteConsultationScheduleAsync(int id);
    }
}
