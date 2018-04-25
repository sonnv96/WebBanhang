using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrjModel
{
   public class Supplier
    {
        [Key]
        public int SupplierID { get; set; }

        [Required]
        [StringLength(40)]
        public string CompanyName { get; set; }

        [StringLength(60)]
        public string Address { get; set; }

        [StringLength(24)]
        public string Phone { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
