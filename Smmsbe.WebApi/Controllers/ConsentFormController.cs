using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services.Interfaces;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsentFormController : ControllerBase
    {
        private readonly IConsentFormService _consentFormService;
        public ConsentFormController(IConsentFormService consentFormService)
        {
            _consentFormService = consentFormService;
        }
    }
}
