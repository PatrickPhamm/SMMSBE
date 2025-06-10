using Smmsbe.Repositories;
using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services.Exceptions;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services
{
    public class MedicalEventService : IMedicalEventService
    {
        private readonly IMedicalEventRepository _medicalEventRepository;
        public MedicalEventService(IMedicalEventRepository medicalEventRepository)
        {
            _medicalEventRepository = medicalEventRepository;
        }

        public async Task<MedicalEvent> GetById(int id)
        {
            var entity = await _medicalEventRepository.GetById(id);
            if (entity == null) throw AppExceptions.NotFoundId();

            return entity;
        }

        public async Task<MedicalEvent> AddMedicalEventAsync(AddMedicalEventRequest request)
        {
            throw new NotImplementedException();
        }

        public async Task<List<MedicalEventResponse>> SearchMedicalEventAsync(SearchMedicalEventRequest request)
        {
            throw new NotImplementedException();
        }

        public async Task<MedicalEvent> UpdateMedicalEventAsync(UpdateMedicalEventRequest request)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> DeleteMedicalEventAsync(int id)
        {
            throw new NotImplementedException();
        }
    }
}
