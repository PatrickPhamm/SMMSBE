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
    public class NurseService : INurseService
    {
        private readonly INurseRepository _nurseRepository;
        private readonly IVaccinationResultRepository _vaccinationResultRepository;
        private readonly IHealthCheckResultRepository _healthCheckResultRepository;
        private readonly IHashHelper _hashHelper;
        public NurseService(INurseRepository nurseRepository, IVaccinationResultRepository vaccinationResultRepository
                , IHealthCheckResultRepository healthCheckResultRepository, IHashHelper hashHelper)
        {
            _nurseRepository = nurseRepository;
            _vaccinationResultRepository = vaccinationResultRepository;
            _healthCheckResultRepository = healthCheckResultRepository;
            _hashHelper = hashHelper;
        }

        public async Task<Nurse> GetById(int id)
        {
            var nurse = await _nurseRepository.GetById(id);

            return nurse;
        }

        #region getAll
        /*public async Task<List<NurseResponse>> GetAllAsync()
        {
            var nurses = await _nurseRepository.GetAll()
                                        .OrderBy(x => x.FullName)
                                        .Select(x => new NurseResponse
                                        {
                                            NurseId = x.NurseId,
                                            FullName = x.FullName,
                                            PhoneNumber = x.PhoneNumber,
                                            Email = x.Email
                                        })
                                        .ToListAsync();

            return nurses;
        }*/
        #endregion

        public async Task<Nurse> AddNurseAsync(AddNurseRequest request)
        {
            /*if (string.IsNullOrEmpty(request.Username) || request.Username.Length < 4)
                throw AppExceptions.BadRequestUsernameIsInvalid();*/

            // Check if email already exists
            var exstingAcc = await _nurseRepository.GetAll().FirstOrDefaultAsync(x => x.Email == request.Email);
            if (exstingAcc != null) throw AppExceptions.BadRequestEmailIsExists();

            var newNurseAcc = new Nurse
            {
                FullName = request.FullName,
                Username = request.Username,
                PasswordHash = _hashHelper.HashPassword(request.PasswordHash),
                Email = request.Email
            };

            return await _nurseRepository.Insert(newNurseAcc);
        }

        public async Task<Nurse> AuthorizeAsync(string email, string password)
        {
            if(string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password)) 
                throw AppExceptions.NotFoundAccount();

            var accNur = await _nurseRepository.GetAll().SingleOrDefaultAsync(x => x.Email == email);
            if(accNur == null) throw AppExceptions.NotFoundAccount();

            var passwordHash = _hashHelper.HashPassword(password);

            if(accNur.PasswordHash != passwordHash) throw AppExceptions.NotFoundAccount();

            return accNur;
        }

        public async Task<Nurse> UpdateNurseAsync(UpdateNurseRequest request)
        {
            var updateNurse = await _nurseRepository.GetById(request.NurseId);
            if(updateNurse == null) throw AppExceptions.NotFoundAccount();

            
            updateNurse.FullName = request.FullName;
            updateNurse.Username = request.Username;
            updateNurse.Email = request.Email;
            
            await _nurseRepository.Update(updateNurse);    
            return updateNurse;
        }

        public async Task<List<NurseResponse>> SearchNurseAsync(SearchNurseRequest request)
        {
            var query = _nurseRepository.GetAll();

            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(
                            s => s.NurseId.ToString().Contains(request.Keyword) ||
                            (!string.IsNullOrEmpty(s.FullName) && s.FullName.Contains(request.Keyword)) ||
                            (!string.IsNullOrEmpty(s.Username) && s.Username.Contains(request.Keyword)));

            var nurses = await query.Select(n => new NurseResponse
            {
                NurseId = n.NurseId,
                FullName = n.FullName,
                Username = n.Username,
                Email = n.Email
            }).ToListAsync();

            return nurses;
        }

        public async Task<bool> DeleteNurseAsync(int id)
        {
            try
            {
                var acc = await _nurseRepository.GetById(id);
                if (acc == null) throw AppExceptions.NotFoundAccount();

                await _nurseRepository.Delete(id);
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<List<VaccinationResultResponse>> GetVaccinationResults(int id)
        {
            var getVac = await _vaccinationResultRepository.GetAll()
                                                .Where(x => x.NurseId == id)
                                                .Select(x => new VaccinationResultResponse
                                                {
                                                    VaccinationResultId = x.VaccinationResultId,
                                                    VaccinationScheduleId = x.VaccinationScheduleId,
                                                    HealthProfileId = x.HealthProfileId,
                                                    NurseId = x.NurseId,
                                                    NurseName = $"{x.Nurse.FullName}",
                                                    Status = ((ResultStatus)x.Status).ToString(),
                                                    DoseNumber = x.DoseNumber,
                                                    Note = x.Note

                                                })
                                                .ToListAsync();
            return getVac;
        }

        public async Task<List<HealthCheckResultResponse>> GetHealthCheckResults(int id)
        {
            var getHea = await _healthCheckResultRepository.GetAll()
                                                .Where(x => x.NurseId == id)
                                                .Select(x => new HealthCheckResultResponse
                                                {
                                                    HealthCheckupRecordId = x.HealthCheckupRecordId,
                                                    HealthCheckScheduleId = x.HealthCheckScheduleId,
                                                    HealthProfileId = x.HealthProfileId,
                                                    NurseId = x.NurseId,
                                                    NurseName = $"{x.Nurse.FullName}",
                                                    Status = ((ResultStatus)x.Status).ToString(),
                                                    Height = x.Height,
                                                    Weight = x.Weight,
                                                    LeftVision = x.LeftVision,
                                                    RightVision = x.RightVision,
                                                    Result = x.Result,
                                                    Note = x.Note

                                                })
                                                .ToListAsync();
            return getHea;
        }
    }
}
