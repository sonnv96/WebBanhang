using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PrjModel;

namespace DA
{
    public class CategoryDAL
    {
        SaleOnlineContext db;
        public CategoryDAL()
        {
            db = new SaleOnlineContext();

        }
        public List<Category> GetAllCategori()
        {
            List<Category> lst = db.Categories.ToList();
            
            return lst;
        }
    }
}
