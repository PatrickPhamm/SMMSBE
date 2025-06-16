using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Models
{
    public class AddConsentFormRequest
    { 

        public int? FormId { get; set; }
        public int? ParentId { get; set; }

        //public DateTime? ConfirmDate { get; set; }

        //public int? Status { get; set; }
    }
}
