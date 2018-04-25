using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DA;
using PrjModel;

namespace BO
{
    public class CategoriesBO
    {
        CategoryDAL catdal;
        public CategoriesBO()
        {
            catdal = new CategoryDAL();
        }
        public List<Category> GetAllCat()
        {
            return catdal.GetAllCategori();
        }
    }
}
