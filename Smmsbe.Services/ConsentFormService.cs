using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services
{
    public class ConsentFormService : IConsentFormService
    {
        private readonly IConsentFormRepository _consentFormRepository;

        public ConsentFormService(IConsentFormRepository consentFormRepository)
        {
            _consentFormRepository = consentFormRepository;
        }


    }
}
