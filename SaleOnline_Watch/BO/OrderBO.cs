using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PrjModel;
using DA;

namespace BO
{
    public class OrderBO
    {
        OrderDAL odal;
        public OrderBO()
        {
            odal = new OrderDAL();
        }
        public string createNewOrderID(string maKH)
        {
            if (maKH != "")
                return odal.createNewOrderID(maKH);
            throw new Exception("Khach hang chua dang nhap");
        }
        public void AddOrder(Order od, List<Order_Detail> lst)
        {
            if (od != null)
                odal.AddOrder(od, lst);
            else
                throw new Exception("Ban chua chon mat hang");
        }
    }
}
