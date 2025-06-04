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
    public class HealthCheckScheduleService : IHealthCheckScheduleService
    {
        private readonly IHealthCheckupScheduleRepository _healthCheckupScheduleRepository;

        public HealthCheckScheduleService(IHealthCheckupScheduleRepository healthCheckupScheduleRepository)
        {
            _healthCheckupScheduleRepository = healthCheckupScheduleRepository;
        }

        public Task<HealthCheckScheduleResponse> GetById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<HealthCheckScheduleResponse> AddHealthCheckScheduleAsync(AddHealthCheckScheduleRequest request)
        {
            throw new NotImplementedException();
        }
        
        public Task<List<HealthCheckScheduleResponse>> SearchHealthCheckScheduleAsync(SearchHealthCheckScheduleRequest request)
        {
            throw new NotImplementedException();
        }

        public Task<HealthCheckScheduleResponse> UpdateHealthCheckScheduleAsync(UpdateHealthCheckScheduleRequest request)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteHealthCheckScheduleAsync(int id)
        {
            throw new NotImplementedException();
        }
    }
}
