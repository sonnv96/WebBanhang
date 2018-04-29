using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DA;
using PrjModel;


namespace BO
{
    public class ProductBO
    {
        ProductDAL pdal;
        public ProductBO()
        {
            pdal = new ProductDAL();
        }
        public List<Product> GetAllProduct()
        {
            return pdal.GetAllProduct();
        }
        public bool AddProduct(Product sp)
        {
            if (sp != null)
            {
                pdal.AddProduct(sp);//gọi phương thức từ DAL
                return true;
            }
            return false;
        }
        public Product GetProductbyId(int id)
        {
            if (id > 0)
                return pdal.GetProductById(id);
            return null;
        }
       
        public bool EditProduct(Product sp)
        {
            if (sp != null)
            {
                pdal.EditProduct(sp);
                return true;
            }
            return false;
        }
        public bool RemoveProduct(int id)
        {
            if (id > 0)
            {
                pdal.RemoveProduct(id);
                return true;
            }
            return false;
        }

        public List<Product> SearchByTitle(string title)
        {
            if (title != "")
            {
                return pdal.SearchByTitle(title);
            }
            else
                throw new Exception("Sai r nha :)");
        }
    }
}
