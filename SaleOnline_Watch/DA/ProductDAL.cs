using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PrjModel;

namespace DA
{
    public class ProductDAL
    {



        private SaleOnlineContext db;
        public ProductDAL()
        {
            db = new SaleOnlineContext();
        }
        public List<Product> GetAllProduct()
        {
            List<Product> lst = db.Products.ToList();
            return lst;
        }
        public bool AddProduct(Product sp)
        {
            try
            {
                db.Products.Add(sp);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public Product GetProductById(int id)
        {
            Product s = db.Products.Where(x => x.ProductID == id).FirstOrDefault();
            return s;
        }
        public bool EditProduct(Product sp)
        {
            Product s = db.Products.Where(x => x.ProductID == sp.ProductID).FirstOrDefault();
            if (s != null)
            {
                db.Entry(s).State = System.Data.Entity.EntityState.Modified;
                s.ProductName = sp.ProductName;
                s.CategoryID = sp.CategoryID;
                s.Description = sp.Description;
                s.UnitPrice = sp.UnitPrice;
                s.Quantity = sp.Quantity;
                s.ProductImage = sp.ProductImage;
                s.SupplierID = sp.SupplierID;
                db.SaveChanges();
                return true;
            }
            return false;
        }
        public bool RemoveProduct(int id)
        {
            Product s = db.Products.Where(x => x.ProductID == id).FirstOrDefault();
            if (s != null)
            {
                db.Products.Remove(s);
                db.SaveChanges();
                return true;
            }
            return false;
        }

        public List<Product> SearchByTitle(string title)
        {
            var s = db.Products.Where(x => x.ProductName.Contains(title)).ToList();
            return s;
        }
    }
}

