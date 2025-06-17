using Microsoft.EntityFrameworkCore;
using Microsoft.SqlServer.Server;
using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services.Enum;
using Smmsbe.Services.Exceptions;
using Smmsbe.Services.Helpers;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;
using System.Linq;

namespace Smmsbe.Services
{
    public class ConsentFormService : IConsentFormService
    {
        private readonly IConsentFormRepository _consentFormRepository;
        private readonly IFormRepository _formRepository;

        public ConsentFormService(IConsentFormRepository consentFormRepository, IFormRepository formRepository)
        {
            _consentFormRepository = consentFormRepository;
            _formRepository = formRepository;
        }

        public async Task<ConsentForm> GetById(int id)
        {
            var entity = await _consentFormRepository.GetById(id);
            if (entity == null) throw AppExceptions.NotFoundId();

            return entity;
        }

        public async Task<ConsentFormResponse> GetByIdAsync(int id)
        {
            var entity = await _consentFormRepository.GetAll()
                                                        .Include(x => x.Form)
                                                        .Where(x => x.ConsentFormId == id)
                                                        .Select(x => new ConsentFormResponse
                                                        {
                                                            ConsentFormId = x.ConsentFormId,
                                                            ParentId = x.ParentId,
                                                            ConfirmDate = x.ConfirmDate,
                                                            Status = ((ConsentFormStatus)x.Status).ToString(),
                                                            Form = new FormResponse
                                                            {
                                                                FormId = x.Form.FormId,
                                                                Title = x.Form.Title,
                                                                ClassName = x.Form.ClassName,
                                                                Content = x.Form.Content,
                                                                SentDate = x.Form.SentDate,
                                                                CreatedAt = x.Form.CreatedAt,
                                                                Type = ((FormType)x.Form.Type).ToString()
                                                            },
                                                        }).FirstOrDefaultAsync();

            if (entity == null) throw AppExceptions.NotFoundId();

            return entity;
        }

        public async Task<List<ConsentFormResponse>> GetConsentFormForParent(int id)
        {
            return await _consentFormRepository.GetAll()
                                    .Include (x => x.Form)
                                    .OrderByDescending(x => x.Form.SentDate)
                                    .Where(x => x.ParentId == id)
                                    .Select(x => new ConsentFormResponse 
                                    {
                                        ConsentFormId = x.ConsentFormId,
                                        ParentId = x.ParentId,
                                        ConfirmDate = x.ConfirmDate,
                                        Status = ((ConsentFormStatus)x.Status).ToString(),
                                        Form = new FormResponse
                                        {
                                            FormId = x.Form.FormId,
                                            Title = x.Form.Title,
                                            ClassName = x.Form.ClassName,
                                            Content = x.Form.Content,
                                            SentDate = x.Form.SentDate,
                                            CreatedAt = x.Form.CreatedAt,
                                            Type = ((FormType)x.Form.Type).ToString()
                                        }
                                    }).ToListAsync();
        }

        public async Task<ConsentForm> AddConsentFormAsync(AddConsentFormRequest request)
        {
            var newConsent = new ConsentForm()
            {
                FormId = request.FormId,
                ParentId = request.ParentId,
                ConfirmDate = DateTime.Now.ToVNTime(),
                Status = (int)ConsentFormStatus.Pending
            };

            return await _consentFormRepository.Insert(newConsent);

            /*var newEntity = _consentFormRepository.Insert(newConsent);

            return new ConsentFormResponse
            {
                ParentId = newConsent.ParentId,
                ConfirmDate = newConsent.ConfirmDate,
                Status = (int)ConsentFormStatus.Pending
            };*/
        }

        public async Task<List<ConsentFormResponse>> SearchConsentFormAsync(SearchConsentFormRequest request)
        {
            var query = _consentFormRepository.GetAll();
                            //.OrderByDescending(x => x.Form.SentDate).AsQueryable();

            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(
                            s => s.ConsentFormId.ToString().Contains(request.Keyword) ||
                            (!string.IsNullOrEmpty(s.Status.ToString()) && s.Status.ToString().Contains(request.Keyword)));

            var searchCo = await query.Select(x => new ConsentFormResponse
            {
                ConsentFormId = x.ConsentFormId, 
                ParentId = x.ParentId,
                ConfirmDate = x.ConfirmDate,
                Status = ((ConsentFormStatus)x.Status).ToString(),
                Form = new FormResponse
                {
                    FormId = x.Form.FormId,
                    Title = x.Form.Title,
                    ClassName = x.Form.ClassName,
                    Content = x.Form.Content,
                    SentDate = x.Form.SentDate,
                    CreatedAt = x.Form.CreatedAt,
                    Type = ((FormType)x.Form.Type).ToString()
                }
            }).ToListAsync();

            return searchCo;
        }

        public async Task<ConsentForm> UpdateConsentFormAsync(UpdateConsentFormRequest request)
        {
            var updateConsentForm = await _consentFormRepository.GetById(request.ConsentFormId);
            if (updateConsentForm == null) throw AppExceptions.NotFoundId();

            updateConsentForm.FormId = request.FormId;
            updateConsentForm.ParentId = request.ParentId;
            updateConsentForm.Status = request.Status;

            await _consentFormRepository.Update(updateConsentForm);
            return updateConsentForm;
        }

        public async Task<bool> AcceptConsentForm(int consentFormId)
        {
            var consent = await _consentFormRepository.GetById(consentFormId);
            if(consent == null) return false;

            consent.Status = (int)ConsentFormStatus.Accepted;

            await _consentFormRepository.Update(consent);

            return true;
        }

        public async Task<bool> RejectConsentForm(int consentFormId)
        {
            var consent = await _consentFormRepository.GetById(consentFormId);
            if (consent == null) return false;

            consent.Status = (int)ConsentFormStatus.Rejected;

            await _consentFormRepository.Update(consent);

            return true;
        }

        public async Task<bool> DeleteConsentFormAsync(int id)
        {
            try
            {
                var deleted = await _consentFormRepository.GetById(id);
                if (deleted == null) throw AppExceptions.NotFoundId();

                await _consentFormRepository.Delete(id);
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
