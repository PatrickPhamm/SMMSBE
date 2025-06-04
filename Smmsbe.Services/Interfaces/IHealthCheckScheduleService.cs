using Smmsbe.Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Interfaces
{
    public interface IHealthCheckScheduleService
    {
        Task<HealthCheckScheduleResponse> GetById(int id);

        Task<List<HealthCheckScheduleResponse>> SearchHealthCheckScheduleAsync(SearchHealthCheckScheduleRequest request);

        Task<HealthCheckScheduleResponse> AddHealthCheckScheduleAsync(AddHealthCheckScheduleRequest request);

        Task<HealthCheckScheduleResponse> UpdateHealthCheckScheduleAsync(UpdateHealthCheckScheduleRequest request);

        Task<bool> DeleteHealthCheckScheduleAsync(int id);
    }
}
