using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services.Interfaces;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsultationFormController : ControllerBase
    {
        private readonly IConsultationFormService _consultationFormService;
        public ConsultationFormController(IConsultationFormService consultationFormService)
        {
            _consultationFormService = consultationFormService;
        }
    }
}
