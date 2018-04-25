using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrjModel
{
    public class Feedback
    {
        [Key]
        public int FeedId { get; set; }

        [StringLength(100)]
        public string FeedTitle { get; set; }

        public string FeedContent { get; set; }

        public DateTime FeedDate { get; set; }

        [StringLength(30)]
        [ForeignKey("Customer")]
        public string CustomerID { get; set; }

        public virtual Customer Customer { get; set; }
    }
}
