using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BO;
using PrjModel;

namespace SaleOnline.Models
{
    public class ProductCard
    {
        ProductBO pbo = null;
        public int iProID { get; set; }
        public string sProName { get; set; }
        public decimal dPrice { get; set; }
        public int iQuantity { get; set; }

        public ProductCard(int proId)
        {
            pbo = new ProductBO();
            iProID = proId;
            Product p = pbo.GetProductbyId(proId);
            sProName = p.ProductName;
            dPrice = (decimal)p.UnitPrice;
            iQuantity = 1;
        }
    }
}