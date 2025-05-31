using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Models
{
    public class AddMedicalInventoryRequest
    {
        public int? ManagerId { get; set; }

        public string FullName { get; set; }

        public int? Quantity { get; set; }

        public string Unit { get; set; }

        public DateOnly? ExpiryDate { get; set; }

        public string Type { get; set; }

        public DateOnly? DateAdded { get; set; }
    }
}
