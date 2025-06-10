using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services.Interfaces;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VaccinationResultController : ControllerBase
    {
        private readonly IVaccinationResultService _vaccinationResultService;
        public VaccinationResultController(IVaccinationResultService vaccinationResultService)
        {
            _vaccinationResultService = vaccinationResultService;
        }
    }
}
