using Smmsbe.Repositories.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Models
{
    public class ConsentFormResponse
    {
        public int ConsentFormId { get; set; }

        public int? FormId { get; set; }

        public int? ParentId { get; set; }

        public DateTime? ConfirmDate { get; set; }

        public bool? Status { get; set; }

        public FormResponse Form { get; set; }
    }
}
