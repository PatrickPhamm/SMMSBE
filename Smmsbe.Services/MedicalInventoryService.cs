using Microsoft.EntityFrameworkCore;
using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services.Exceptions;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.Services
{
    public class MedicalInventoryService : IMedicalInventoryService
    {
        private readonly IMedicalInventoryRepository _medicalInventoryRepository;

        public MedicalInventoryService(IMedicalInventoryRepository medicalInventoryRepository)
        {
            _medicalInventoryRepository = medicalInventoryRepository;
        }

        public async Task<MedicalInventory> GetById(int id)
        {
            var medical = await _medicalInventoryRepository.GetById(id);

            if (medical == null) throw AppExceptions.NotFoundId();

            return medical;
        }

        public async Task<List<MedicalInventoryResponse>> SearchMedicalInventorysAsync(SearchMedicalInventoryRequest request)
        {
            var query = _medicalInventoryRepository.GetAll();

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.MedicalInventoryId.ToString().Contains(request.Keyword) ||
                                   (!string.IsNullOrEmpty(x.FullName) && x.FullName.Contains(request.Keyword)));
            }

            var medicals = await query.Select(x => new MedicalInventoryResponse
            {
                MedicalInventoryId = x.MedicalInventoryId,
                ManagerId = x.ManagerId,
                FullName = x.FullName,
                Quantity = x.Quantity,
                Unit = x.Unit,
                ExpiryDate = x.ExpiryDate,
                Type = x.Type,
                DateAdded = x.DateAdded
            }).ToListAsync();

            return medicals;
        }

        public async Task<MedicalInventory> AddMedicalInventoryAsync(AddMedicalInventoryRequest request)
        {
            var newMedical = new MedicalInventory
            {
                ManagerId = request.ManagerId,
                FullName = request.FullName,
                Quantity = request.Quantity,
                Unit = request.Unit,
                ExpiryDate = request.ExpiryDate,
                Type = request.Type,
                DateAdded = request.DateAdded
            };

            return await _medicalInventoryRepository.Insert(newMedical);
        }

        public async Task<MedicalInventory> UpdateMedicalInventoryAsync(UpdateMedicalInventoryRequest request)
        {
            var updateMedical = await _medicalInventoryRepository.GetById(request.MedicalInventoryId);
            if (updateMedical == null) throw AppExceptions.NotFoundAccount();

            updateMedical.FullName = request.FullName;
            updateMedical.Quantity = request.Quantity;
            updateMedical.Unit = request.Unit;
            updateMedical.ExpiryDate = request.ExpiryDate;
            updateMedical.Type = request.Type;
            updateMedical.DateAdded = request.DateAdded;

            await _medicalInventoryRepository.Update(updateMedical);
            return updateMedical;
        }

        public async Task<bool> DeleteMedicalInventoryAsync(int id)
        {
            try
            {
                var medical = await _medicalInventoryRepository.GetById(id);

                if (medical == null) throw AppExceptions.NotFoundId();

                await _medicalInventoryRepository.Delete(id);

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
