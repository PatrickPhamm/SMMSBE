using Smmsbe.Repositories.Entities;
using Smmsbe.Services.Models;

namespace Smmsbe.Services.Interfaces
{
    public interface IConsultationScheduleService
    {
        Task<ConsultationSchedule> GetById(int id);
        Task<ConsultationScheduleResponse> GetByIdAsync(int id);
        Task<ConsultationSchedule> AddConsultationScheduleAsync(AddConsultationScheduleRequest request);
        Task<List<ConsultationScheduleResponse>> SearchConsultationScheduleAsync(SearchConsultationScheduleRequest request);
        Task<ConsultationSchedule> UpdateConsultationScheduleAsync(UpdateConsultationScheduleRequest request);
        Task<bool> AcceptConsultation(int consultationId);
        Task<bool> RejectConsultation(int consultationId);
        Task<bool> DeleteConsultationScheduleAsync(int id);
    }
}
