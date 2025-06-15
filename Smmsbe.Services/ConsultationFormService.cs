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

        public async Task<ConsultationForm> AddConsultationFormAsync(AddConsultationFormRequest request)
        {
            var newCon = new ConsultationForm
            {
                ParentId = request.ParentId,
                Title = request.Title,
                Content = request.Content
            };

            return await _consultationFormRepository.Insert(newCon);
        }

        public async Task<ConsultationForm> UpdateConsultationFormAsync(UpdateConsultationFormRequest request)
        {
            var updateConsentForm = await _consultationFormRepository.GetById(request.ConsultationFormId);
            if (updateConsentForm == null) throw AppExceptions.NotFoundId();

            updateConsentForm.ParentId = request.ParentId;
            updateConsentForm.Title = request.Title;
            updateConsentForm.Content = request.Content;

            await _consultationFormRepository.Update(updateConsentForm);
            return updateConsentForm;
        }

        public async Task<List<ConsultationFormResponse>> SearchConsultationFormAsync(SearchConsultationFormRequest request)
        {
            var query = _consultationFormRepository.GetAll();

            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(
                            s => s.ConsultationFormId.ToString().Contains(request.Keyword) ||
                            (!string.IsNullOrEmpty(s.Title.ToString()) && s.Title.ToString().Contains(request.Keyword)));

            var searchCo = await query.Select(x => new ConsultationFormResponse
            {
                ConsultationFormId = x.ConsultationFormId,
                ParentId = x.ParentId,
                Title = x.Title,
                Content = x.Content
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

        
    }
}
