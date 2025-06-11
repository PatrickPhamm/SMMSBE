using Smmsbe.Repositories.Entities;
using Smmsbe.Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Interfaces
{
    public interface IHealthCheckResultService
    {
        Task<HealthCheckResult> GetById(int id);
        Task<HealthCheckResult> AddHealthCheckResultAsync(AddHealthCheckResultRequest request);
        Task<List<HealthCheckResultResponse>> SearchHealthCheckResultAsync(SearchHealthCheckResultRequest request);
        Task<HealthCheckResult> UpdateHealthCheckResultAsync(UpdateHealthCheckResultRequest request);
        Task<bool> DeleteHealthCheckResultAsync(int id);
    }
}
