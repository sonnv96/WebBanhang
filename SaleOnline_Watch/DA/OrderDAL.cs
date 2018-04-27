using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PrjModel;

namespace DA
{
    public class OrderDAL
    {
        SaleOnlineContext db;
        public OrderDAL() { db = new SaleOnlineContext(); }
        public string createNewOrderID(string maKH)
        {
            DateTime dd = DateTime.Now;
            string time = "" + dd.Year +
                (dd.Month < 10 ? "0" + dd.Month.ToString() : dd.Month.ToString())
                + (dd.Day < 10 ? "0" + dd.Day.ToString() : dd.Day.ToString());
            string id = "";
            object obj = (from n in db.Orders
                          where n.CustomerID == maKH && n.OrderID.StartsWith(maKH +
                          "_" + time)
                          orderby n.OrderID descending
                          select n.OrderID
                          ).FirstOrDefault();
          
            if (obj == null)
                id = maKH + "_" + time + "01";
            else
            {
                int num = int.Parse(obj.ToString().Trim().Substring(
                    obj.ToString().Trim().Length - 2));
                num++;
                id = maKH + "_" + time + (num < 10 ? "0" + num : "" + num);
            }
            return id;
        }
       
        public void AddOrder(Order od, List<Order_Detail> lst)
        {
            db.Orders.Add(od);
            db.Order_Details.AddRange(lst);
            db.SaveChanges();
        }
    }
}
