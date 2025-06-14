using Azure.Core;
using Microsoft.EntityFrameworkCore;
using Smmsbe.Repositories;
using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services.Enum;
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
    public class HealthCheckResultService : IHealthCheckResultService
    {
        private readonly IHealthCheckResultRepository _healthCheckResultRepository;
        public HealthCheckResultService(IHealthCheckResultRepository healthCheckResultRepository)
        {
            _healthCheckResultRepository = healthCheckResultRepository;
        }

        /*public async Task<HealthCheckResult> GetById(int id)
        {
            var entity = await _healthCheckResultRepository.GetById(id);
            if (entity == null) throw AppExceptions.NotFoundId();

            return entity;
        }*/

        public async Task<HealthCheckResultResponse> GetById(int id)
        {
            var entity = await _healthCheckResultRepository.GetAll().FirstOrDefaultAsync(x => x.HealthCheckupRecordId == id);
            if (entity == null) throw AppExceptions.NotFoundId();

            return new HealthCheckResultResponse
            {
                HealthCheckScheduleId = entity.HealthCheckScheduleId,
                NurseId = entity.NurseId,
                NurseName = $"{entity.Nurse?.FullName}",
                HealthProfileId = entity.HealthProfileId,
                Status = ((ResultStatus)entity.Status).ToString(),
                Height = entity.Height,
                Weight = entity.Weight,
                LeftVision = entity.LeftVision,
                RightVision = entity.RightVision,
                Result = entity.Result,
                Note = entity.Note
            };
        }

        public async Task<HealthCheckResultResponse> AddHealthCheckResultAsync(AddHealthCheckResultRequest request)
        {
            var newHea = new HealthCheckResult
            {
                HealthCheckScheduleId = request.HealthCheckScheduleId,
                NurseId = request.NurseId,
                HealthProfileId = request.HealthProfileId,
                Status = 1,
                Height = request.Height,
                Weight = request.Weight,
                LeftVision = request.LeftVision,
                RightVision = request.RightVision,
                Result = request.Result,
                Note = request.Note
            };


            var addHea = await _healthCheckResultRepository.Insert(newHea);

            return new HealthCheckResultResponse
            {
                HealthCheckupRecordId = addHea.HealthCheckupRecordId,
                HealthCheckScheduleId = addHea.HealthCheckScheduleId,
                NurseId = addHea.NurseId,
                NurseName = $"{addHea.Nurse?.FullName}",
                HealthProfileId = addHea.HealthProfileId,
                Status = ((ResultStatus)addHea.Status).ToString(),
                Height = addHea.Height,
                Weight = addHea.Weight,
                LeftVision = addHea.LeftVision,
                RightVision = addHea.RightVision,
                Result = addHea.Result,
                Note = addHea.Note
            };
        }

        public async Task<List<HealthCheckResultResponse>> SearchHealthCheckResultAsync(SearchHealthCheckResultRequest request)
        {
            var query = _healthCheckResultRepository.GetAll();

            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(
                            s => s.HealthCheckupRecordId.ToString().Contains(request.Keyword) ||
                            (!string.IsNullOrEmpty(s.Status.ToString()) && s.Status.ToString().Contains(request.Keyword)));

            var searchHea = await query.Select(h => new HealthCheckResultResponse
            {
                HealthCheckupRecordId = h.HealthCheckupRecordId,
                HealthCheckScheduleId = h.HealthCheckScheduleId,
                NurseId = h.NurseId,
                NurseName = $"{h.Nurse.FullName}",
                HealthProfileId = h.HealthProfileId,
                Status = ((ResultStatus)h.Status).ToString(),
                Height = h.Height,
                Weight = h.Weight,
                LeftVision = h.LeftVision,
                RightVision = h.RightVision,
                Result = h.Result,
                Note = h.Note
            }).ToListAsync();

            return searchHea;
        }

        public async Task<HealthCheckResult> UpdateHealthCheckResultAsync(UpdateHealthCheckResultRequest request)
        {
            var updateVaccinationSchedule = await _healthCheckResultRepository.GetById(request.HealthCheckupRecordId);
            if (updateVaccinationSchedule == null) throw AppExceptions.NotFoundId();

            updateVaccinationSchedule.NurseId = request.NurseId;
            updateVaccinationSchedule.Height = request.Height;
            updateVaccinationSchedule.Weight = request.Weight;
            updateVaccinationSchedule.LeftVision = request.LeftVision;
            updateVaccinationSchedule.RightVision = request.RightVision;
            updateVaccinationSchedule.Result = request.Result;
            updateVaccinationSchedule.Note = request.Note;

            await _healthCheckResultRepository.Update(updateVaccinationSchedule);
            return updateVaccinationSchedule;
        }

        public async Task<bool> DeleteHealthCheckResultAsync(int id)
        {
            try
            {
                var deleted = await _healthCheckResultRepository.GetById(id);
                if (deleted == null) throw AppExceptions.NotFoundId();

                await _healthCheckResultRepository.Delete(id);
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
