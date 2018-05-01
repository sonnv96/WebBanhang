using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PrjModel;
using DA;
using BO;
using SaleOnline.Models;
namespace SaleOnline.Controllers
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart
        public ActionResult Index()
        {
            return View();
        }
        ProductBO pbo;
        SaleOnlineContext db;
      

        public ActionResult AddCard(int pid)// GET: ShoppingCard
        {
            List<ProductCard> lstCard = GetCard();    //session cart        
            ProductCard c = lstCard.Where(n => n.iProID == pid).FirstOrDefault();//Kiểm tra sp này đã có trong session[cart] chưa
            if (c == null)
            {//chưa có Thêm vào list cart        {
                c = new ProductCard(pid);
                lstCard.Add(c);
            }
            else
            {
                lstCard[lstCard.IndexOf(c)].iQuantity += 1;
            }
            Session["Card"] = lstCard;
            return Content("Gio hang (" + lstCard.Count + ")");
        }
        public List<ProductCard> GetCard()//phương thức lấy danh sách các mặt hàng trong list cart
        {
            List<ProductCard> lstCard = (List<ProductCard>)Session["Card"];
            if (lstCard == null)
            {//Nếu cart chưa tồn tại thì khởi tao list cart ()
                lstCard = new List<ProductCard>();
                Session["Card"] = lstCard;
            }
            return lstCard;
        }
        public ActionResult ViewShoppingCard()
        {
            ViewBag.cat = db.Categories.Where(x => x.CategoryID > 3).ToList();
            if (Session["Card"] == null)
            {
                return RedirectToAction("Index", "Product");
            }
            List<ProductCard> lstCard = GetCard();
            ViewBag.MoneySum = lstCard.Sum(x => (x.dPrice * x.iQuantity));
            ViewBag.ThongBao = this.TempData["ThongBao"];//giai thich sau khi goi nut thanh toan (payment)
            return View(lstCard);
        }//action xem gio hang
        //Cập nhật giỏ hàng 
        public ActionResult UpdateCart(int ProId, FormCollection f)
        {
            //Kiểm tra sp
            Product p = pbo.GetProductbyId(ProId);
            if (p == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Lấy giỏ hàng ra từ session
            List<ProductCard> lstCart = GetCard();
            ProductCard c = lstCart.FirstOrDefault(n => n.iProID == ProId);
            //Nếu có sp trong giỏ hàng
            if (c != null)
            {
                c.iQuantity = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("ViewShoppingCard");
        }
        //Xóa giỏ hàng
        public ActionResult DeleteCart(int ProId)
        {
            List<ProductCard> lstCart = GetCard();
            ProductCard c = lstCart.FirstOrDefault(n => n.iProID == ProId);
            //Xóa
            if (c != null)
            {
                lstCart.RemoveAll(n => n.iProID == ProId);
            }
            if (lstCart.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("ViewShoppingCard");
        }
        OrderBO obo;
        public ShoppingCartController()
        {
            pbo = new ProductBO();
            obo = new OrderBO();//khoi tao lop OrderBO
            db = new SaleOnlineContext();
        }
        //lập hóa đơn
        [HttpPost]
        public ActionResult Payment(FormCollection f)
        {
            //Kiểm tra đăng đăng nhập
            if (Session["UserName"] == null || Session["UserName"].ToString() == "")
            {
                this.TempData["ThongBao"] = "Bạn chưa đăng nhập, " +
                    "mời bạn đăng nhập để thanh toán hóa đơn!";
                return RedirectToAction("ViewShoppingCard", "ShoppingCard");
            }
            //Kiểm tra giỏ hàng
            if (Session["Card"] == null)
            {
                RedirectToAction("Index", "Home");
            }
            //Thêm đơn hàng
            Order od = new Order();
            List<ProductCard> lstCart = GetCard();
            od.CustomerID = "1";
            od.OrderID = obo.createNewOrderID(Session["UserName"].ToString());
          
            od.OrderDate = DateTime.Now;
            od.RequiredDate = DateTime.Now;
            od.ShippedDate = od.OrderDate.AddDays(3);
            od.ShipAddress = "";
            od.Freight = 0;
            //Thêm chi tiết đơn hàng
            List<Order_Detail> lstD = new List<Order_Detail>();
            foreach (var item in lstCart)
            {
                Order_Detail odDetail = new Order_Detail();
                odDetail.OrderID = od.OrderID;
                odDetail.ProductID = item.iProID;
                odDetail.Quantity = (short)item.iQuantity;
                odDetail.UnitPrice = (decimal)item.dPrice;
                lstD.Add(odDetail);
            }
            obo.AddOrder(od, lstD);
            Session["Card"] = null;
            return RedirectToAction("Index", "Product");
        }
    }
}