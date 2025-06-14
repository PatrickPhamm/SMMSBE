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
        Task<HealthCheckResultResponse> GetById(int id);
        Task<HealthCheckResultResponse> AddHealthCheckResultAsync(AddHealthCheckResultRequest request);
        Task<List<HealthCheckResultResponse>> SearchHealthCheckResultAsync(SearchHealthCheckResultRequest request);
        Task<HealthCheckResult> UpdateHealthCheckResultAsync(UpdateHealthCheckResultRequest request);
        Task<bool> DeleteHealthCheckResultAsync(int id);
    }
}
