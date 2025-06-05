using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Models
{
    public class BlogResponse
    {
        public int BlogId { get; set; }

        public int? ManagerId { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public DateOnly? DateAdded { get; set; }

        public string Thumbnail { get; set; }
    }
}
