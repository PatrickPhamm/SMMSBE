using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
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

        public Task<MedicalEvent> GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<MedicalEvent> AddMedicalEventAsync(AddMedicalEventRequest request)
        {
            throw new NotImplementedException();
        }

        public Task<List<MedicalEventResponse>> SearchMedicalEventAsync(SearchMedicalEventRequest request)
        {
            throw new NotImplementedException();
        }

        public Task<MedicalEvent> UpdateMedicalEventAsync(UpdateMedicalEventRequest request)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteMedicalEventAsync(int id)
        {
            throw new NotImplementedException();
        }
    }
}
