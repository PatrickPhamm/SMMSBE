using Microsoft.EntityFrameworkCore;
using Smmsbe.Repositories;
using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services.Enum;
using Smmsbe.Services.Exceptions;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.Services
{
    public class ConsultationScheduleService : IConsultationScheduleService
    {
        private readonly IConsultationScheduleRepository _consultationScheduleRepository;
        public ConsultationScheduleService(IConsultationScheduleRepository consultationScheduleRepository)
        {
            _consultationScheduleRepository = consultationScheduleRepository;
        }

        public async Task<ConsultationSchedule> GetById(int id)
        {
            var entity = await _consultationScheduleRepository.GetById(id);
            if (entity == null) throw AppExceptions.NotFoundId();

            return entity;
        }

        public async Task<ConsultationScheduleResponse> GetByIdAsync(int id)
        {
            var entity = await _consultationScheduleRepository.GetAll()
                                                                    .Where(x => x.ConsultationScheduleId == id)
                                                                    .Select(x => new ConsultationScheduleResponse
                                                                    {
                                                                        ConsultationScheduleId = x.ConsultationScheduleId,
                                                                        ConsultationFormId = x.ConsultationFormId,
                                                                        NurseId = x.NurseId,
                                                                        ConsultDate = x.ConsultDate,
                                                                        Location = x.Location,
                                                                        Status = ((ConsultationScheduleStatus)x.Status).ToString()
                                                                    }).FirstOrDefaultAsync();

            if (entity == null) throw AppExceptions.NotFoundId();
            return entity;
        }

        public async Task<ConsultationSchedule> AddConsultationScheduleAsync(AddConsultationScheduleRequest request)
        {
            var newCon = new ConsultationSchedule
            {
                ConsultationFormId = request.ConsultationFormId,
                NurseId = request.NurseId,
                Status = (int)ConsultationScheduleStatus.Pending,
                Location = request.Location,
                ConsultDate = request.ConsultDate
            };

            return await _consultationScheduleRepository.Insert(newCon);
        }

        public async Task<List<ConsultationScheduleResponse>> SearchConsultationScheduleAsync(SearchConsultationScheduleRequest request)
        {
            var query = _consultationScheduleRepository.GetAll();

            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(
                            s => s.ConsultationFormId.ToString().Contains(request.Keyword) ||
                            (!string.IsNullOrEmpty(s.Location.ToString()) && s.Location.ToString().Contains(request.Keyword)));

            var searchCo = await query.Select(x => new ConsultationScheduleResponse
            {
                ConsultationScheduleId = x.ConsultationScheduleId,
                ConsultationFormId = x.ConsultationFormId,
                NurseId = x.NurseId,
                Status = ((ConsultationScheduleStatus)x.Status).ToString(),
                Location = x.Location,
                ConsultDate = x.ConsultDate
            }).ToListAsync();

            return searchCo;
        }

        public async Task<ConsultationSchedule> UpdateConsultationScheduleAsync(UpdateConsultationScheduleRequest request)
        {
            var updateConsentForm = await _consultationScheduleRepository.GetById(request.ConsultationScheduleId);
            if (updateConsentForm == null) throw AppExceptions.NotFoundId();

            updateConsentForm.ConsultationScheduleId = request.ConsultationScheduleId;
            updateConsentForm.NurseId = request.NurseId;
            updateConsentForm.Location = request.Location;
            updateConsentForm.ConsultDate = request.ConsultDate;

            await _consultationScheduleRepository.Update(updateConsentForm);
            return updateConsentForm;
        }

        public async Task<bool> AcceptConsultation(int consultationId)
        {
            var consultation = await _consultationScheduleRepository.GetById(consultationId);
            if (consultation == null) return false;

            consultation.Status = (int)ConsultationScheduleStatus.Accepted;

            await _consultationScheduleRepository.Update(consultation);

            return true;
        }

        public async Task<bool> RejectConsultation(int consultationId)
        {
            var consultation = await _consultationScheduleRepository.GetById(consultationId);
            if (consultation == null) return false;

            consultation.Status = (int)ConsultationScheduleStatus.Rejected;

            await _consultationScheduleRepository.Update(consultation);

            return true;
        }

        public async Task<bool> DeleteConsultationScheduleAsync(int id)
        {
            try
            {
                var deleted = await _consultationScheduleRepository.GetById(id);
                if (deleted == null) throw AppExceptions.NotFoundId();

                await _consultationScheduleRepository.Delete(id);
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
