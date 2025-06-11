using Microsoft.EntityFrameworkCore;
using Smmsbe.Repositories;
using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services.Exceptions;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;

namespace Smmsbe.Services
{
    public class VaccinationResultService : IVaccinationResultService
    {
        private readonly IVaccinationResultRepository _vaccinationResultRepository;
        public VaccinationResultService(IVaccinationResultRepository vaccinationResultRepository)
        {
            _vaccinationResultRepository = vaccinationResultRepository;
        }

        public async Task<VaccinationResult> GetById(int id)
        {
            var entity = await _vaccinationResultRepository.GetById(id);
            if (entity == null) throw AppExceptions.NotFoundId();

            return entity;
        }

        public async Task<VaccinationResult> AddVaccinationResultAsync(AddVaccinationResultRequest request)
        {
            var newVac = new VaccinationResult
            {
                VaccinationScheduleId = request.VaccinationScheduleId,
                HealthProfileId = request.HealthProfileId,
                NurseId = request.NurseId,
                Status = request.Status,
                DoseNumber = request.DoseNumber,
                Note = request.Note
            };

            return await _vaccinationResultRepository.Insert(newVac);
        }

        public async Task<List<VaccinationResultResponse>> SearchVaccinationResultAsync(SearchVaccinationResultRequest request)
        {
            var query = _vaccinationResultRepository.GetAll();

            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(
                            s => s.VaccinationScheduleId.ToString().Contains(request.Keyword) ||
                            (!string.IsNullOrEmpty(s.Status.ToString()) && s.Status.ToString().Contains(request.Keyword)));

            var searchVa = await query.Select(h => new VaccinationResultResponse
            {
                VaccinationResultId = h.VaccinationResultId,
                VaccinationScheduleId = h.VaccinationScheduleId,
                HealthProfileId = h.HealthProfileId,
                NurseId = h.NurseId,
                Status = h.Status,
                DoseNumber = h.DoseNumber,
                Note = h.Note
            }).ToListAsync();

            return searchVa;
        }

        public async Task<VaccinationResult> UpdateVaccinationResultAsync(UpdateVaccinationResultRequest request)
        {
            var updateVaccinationSchedule = await _vaccinationResultRepository.GetById(request.VaccinationResultId);
            if (updateVaccinationSchedule == null) throw AppExceptions.NotFoundId();

            updateVaccinationSchedule.NurseId = request.NurseId;
            updateVaccinationSchedule.Status = request.Status;
            updateVaccinationSchedule.DoseNumber = request.DoseNumber;
            updateVaccinationSchedule.Note = request.Note;

            await _vaccinationResultRepository.Update(updateVaccinationSchedule);
            return updateVaccinationSchedule;
        }

        public async Task<bool> DeleteVaccinationResultAsync(int id)
        {
            try
            {
                var deleted = await _vaccinationResultRepository.GetById(id);
                if (deleted == null) throw AppExceptions.NotFoundId();

                await _vaccinationResultRepository.Delete(id);
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
