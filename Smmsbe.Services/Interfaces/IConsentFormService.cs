using Smmsbe.Repositories.Entities;
using Smmsbe.Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Interfaces
{
    public interface IConsentFormService
    {
        Task<ConsentForm> GetById(int id);
        Task<ConsentFormResponse> GetByIdAsync(int id);
        Task<ConsentForm> AddConsentFormAsync(AddConsentFormRequest request);
        Task<List<ConsentFormResponse>> SearchConsentFormAsync(SearchConsentFormRequest request);
        Task<ConsentForm> UpdateConsentFormAsync(UpdateConsentFormRequest request);
        Task<bool> AcceptConsentForm(int consentFormId);
        Task<bool> RejectConsentForm(int consentFormId);
        Task<bool> DeleteConsentFormAsync(int id);
    }
}
