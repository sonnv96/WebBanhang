using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrjModel
{
    public class Product
    {
        public int ProductID { get; set; }

        [Required]
        [StringLength(40)]
        public string ProductName { get; set; }
        [ForeignKey("Supplier")]
        public int SupplierID { get; set; }
        [ForeignKey("Category")]
        public int CategoryID { get; set; }

        public int Quantity { get; set; }

        [Column(TypeName = "money")]
        public decimal UnitPrice { get; set; }

        [StringLength(100)]
        public string ProductImage { get; set; }
        public string Description { get; set; }
        public virtual Category Category { get; set; }


        public virtual ICollection<Order_Detail> Order_Details { get; set; }

        public virtual Supplier Supplier { get; set; }
    }
}
