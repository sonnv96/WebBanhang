using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrjModel
{
   public class Account
    {


        [Key]
        [Required]
        [StringLength(30)]
        public string UserName { get; set; }

        [StringLength(50)]
        public string Password { get; set; }

      
   

       
        public string Role { get; set; }
    }
}
