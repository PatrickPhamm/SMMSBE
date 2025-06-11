using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Models
{
    public class AddConsultationScheduleRequest
    {
        public int? ConsultationFormId { get; set; }

        public int? NurseId { get; set; }

        public bool? IsConfirmed { get; set; }

        public string Location { get; set; }

        public DateTime? ConsultDate { get; set; }
    }
}
