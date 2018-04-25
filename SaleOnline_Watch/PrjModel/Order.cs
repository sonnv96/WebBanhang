using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrjModel
{
    public class Order
    {
        [StringLength(30)]
        [Key]
        public string OrderID { get; set; }

        [StringLength(30)]
        [ForeignKey("Customer")]
        public string CustomerID { get; set; }

        public DateTime OrderDate { get; set; }

        public DateTime RequiredDate { get; set; }

        public DateTime ShippedDate { get; set; }

        [Column(TypeName = "money")]
        public decimal Freight { get; set; }

        [StringLength(60)]
        public string ShipAddress { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual ICollection<Order_Detail> Order_Details { get; set; }
    }
}
