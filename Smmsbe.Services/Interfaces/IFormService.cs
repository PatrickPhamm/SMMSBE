using Smmsbe.Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Interfaces
{
    public interface IFormService
    {
        Task<FormResponse> GetById(int id);
        Task<FormResponse> AddFormAsync(AddFormRequest request);
        Task<FormResponse> UpdateFormAsync(UpdateFormRequest request);
        Task<List<FormResponse>> SearchFormAsync(SearchFormRequest request);
        Task<bool> DeleteFormAsync(int id);
    }
}
