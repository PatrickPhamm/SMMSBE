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
    public class ConsultationFormService : IConsultationFormService
    {
        private readonly IConsultationFormRepository _consultationFormRepository;

        public ConsultationFormService(IConsultationFormRepository consultationFormRepository)
        {
            _consultationFormRepository = consultationFormRepository;
        }

        public async Task<ConsultationForm> GetById(int id)
        {
            var entity = await _consultationFormRepository.GetById(id);
            if (entity == null) throw AppExceptions.NotFoundId();

            return entity;
        }

        public async Task<ConsultationFormResponse> GetByIdAsync(int id)
        {
            var entity = await _consultationFormRepository.GetById(id);
            if (entity == null) throw AppExceptions.NotFoundId();

            return new ConsultationFormResponse
            {
                ConsultationFormId = entity.ConsultationFormId,
                ConsultationScheduleId = entity.ConsultationScheduleId,
                ParentId = entity.ParentId,
                Title = entity.Title,
                Content = entity.Content,
                Status = ((ConsultationFormStatus)entity.Status).ToString()
            };
        }

        public async Task<ConsultationForm> AddConsultationFormAsync(AddConsultationFormRequest request)
        {
            var newCon = new ConsultationForm
            {
                ConsultationScheduleId = request.ConsultationScheduleId,
                ParentId = request.ParentId,
                Title = request.Title,
                Content = request.Content,
                Status = (int)ConsultationFormStatus.Pending
            };

            return await _consultationFormRepository.Insert(newCon);
        }

        public async Task<ConsultationForm> UpdateConsultationFormAsync(UpdateConsultationFormRequest request)
        {
            var updateConsentForm = await _consultationFormRepository.GetById(request.ConsultationFormId);
            if (updateConsentForm == null) throw AppExceptions.NotFoundId();

            updateConsentForm.ConsultationScheduleId = request.ConsultationScheduleId;
            updateConsentForm.ParentId = request.ParentId;
            updateConsentForm.Title = request.Title;
            updateConsentForm.Content = request.Content;

            await _consultationFormRepository.Update(updateConsentForm);
            return updateConsentForm;
        }

        public async Task<List<SearchConsultationFormResponse>> SearchConsultationFormAsync(SearchConsultationFormRequest request)
        {
            var query = _consultationFormRepository.GetAll();

            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(
                            s => s.ConsultationFormId.ToString().Contains(request.Keyword) ||
                            (!string.IsNullOrEmpty(s.Title.ToString()) && s.Title.ToString().Contains(request.Keyword)));

            var searchCo = await query.Select(x => new SearchConsultationFormResponse
            {
                ConsultationFormId = x.ConsultationFormId,
                ConsultationScheduleId = x.ConsultationScheduleId,
                ParentId = x.ParentId,
                Title = x.Title,
                Content = x.Content,
                Status = ((ConsultationFormStatus)x.Status).ToString()
            }).ToListAsync();

            return searchCo;
        }

        public async Task<bool> DeleteConsultationFormAsync(int id)
        {
            try
            {
                var deleted = await _consultationFormRepository.GetById(id);
                if (deleted == null) throw AppExceptions.NotFoundId();

                await _consultationFormRepository.Delete(id);
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<bool> AcceptConsultation(int consultationId)
        {
            var consultation = await _consultationFormRepository.GetById(consultationId);
            if (consultation == null) return false;

            consultation.Status = (int)ConsultationFormStatus.Accepted;

            await _consultationFormRepository.Update(consultation);

            return true;
        }

        public async Task<bool> RejectConsultation(int consultationId)
        {
            var consultation = await _consultationFormRepository.GetById(consultationId);
            if (consultation == null) return false;

            consultation.Status = (int)ConsultationFormStatus.Rejected;

            await _consultationFormRepository.Update(consultation);

            return true;
        }
    }
}
