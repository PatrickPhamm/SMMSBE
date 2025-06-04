using Microsoft.SqlServer.Server;
using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services.Enum;
using Smmsbe.Services.Exceptions;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.Services
{
    public class FormService : IFormService
    {
        private readonly IFormRepository _formRepository;

        public FormService(IFormRepository formRepository)
        {
            _formRepository = formRepository;
        }

        public async Task<FormResponse> GetById(int id)
        {
            var entity = await _formRepository.GetById(id);
            if(entity == null) throw AppExceptions.NotFoundId();

            return new FormResponse
            {
                FormId = entity.FormId,
                Title = entity.Title,
                ClassName = entity.ClassName,
                Content = entity.Content,
                Type = ((FormType)entity.Type).ToString()
            };
        }

        public async Task<FormResponse> AddFormAsync(AddFormRequest request)
        {
            var newForm = new Form
            {
                ClassName = request.ClassName,
                Title = request.Title,
                Content = request.Content,
                Type = (int)request.Type
            };

            var newEntity = await _formRepository.Insert(newForm);

            return new FormResponse
            {
                FormId = newForm.FormId,
                Title = newForm.Title,
                ClassName = newForm.ClassName,
                Content = newForm.Content,
                Type = ((FormType)newForm.Type).ToString()
            };
        }

        public async Task<FormResponse> UpdateFormAsync(UpdateFormRequest request)
        {
            var updateForm = await _formRepository.GetById(request.FormId);

            if (updateForm == null) throw AppExceptions.NotFoundId();

            updateForm.Title = request.Title;
            updateForm.Content = request.Content;
            updateForm.ClassName = request.ClassName;

            await _formRepository.Update(updateForm);

            return new FormResponse
            {
                FormId = updateForm.FormId,
                Title = updateForm.Title,
                Content= updateForm.Content,
                ClassName = updateForm.ClassName,
                Type = ((FormType)updateForm.Type).ToString()
            };
        }

        public async Task<bool> DeleteFormAsync(int id)
        {
            try
            {
                var deleteForm = await _formRepository.GetById(id);

                if (deleteForm == null) throw AppExceptions.NotFoundId();

                await _formRepository.Delete(id);

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
