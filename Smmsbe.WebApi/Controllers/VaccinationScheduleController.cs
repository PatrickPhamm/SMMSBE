using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Smmsbe.Services.Interfaces;

namespace Smmsbe.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VaccinationScheduleController : ControllerBase
    {
        private readonly IVaccinationScheduleService _vaccinationScheduleService;
        public VaccinationScheduleController(IVaccinationScheduleService vaccinationScheduleService)
        {
            _vaccinationScheduleService = vaccinationScheduleService;
        }
    }
}
