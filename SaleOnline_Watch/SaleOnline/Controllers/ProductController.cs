using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DA;
using BO;
using PrjModel;
using SaleOnline.Models;
using PagedList;
using System.IO;

namespace SaleOnline.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        ProductBO pbo;
        CategoriesBO catbo;
        SaleOnlineContext db;

        public ProductController()//constructor
        {
            pbo = new ProductBO();//khởi tạo lớp ProductBO 
            catbo = new CategoriesBO();
            db = new SaleOnlineContext();
        }
        public ActionResult Index(int page = 1, int pageSize = 6)
        {
            ViewBag.cat = db.Categories.Where(x => x.CategoryID > 3).ToList();
            List<Product> lstR = pbo.GetAllProduct();
            return View(lstR.ToPagedList(page, pageSize));
        }
        public ActionResult IndexAdmin()
        {
            ViewBag.cat = db.Categories.Where(x => x.CategoryID > 3).ToList();
            List<Product> lstR = pbo.GetAllProduct();
            return View(lstR);
        }
        public ActionResult Create()
        {
            Product p = new Product();
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName");

            return View();
        }
        [HttpPost]
        public ActionResult Create(ProductViewModel model)
        {
            if (ModelState.IsValid)
            {//kiểm tra Model có hợp lệ?
                Product p = new Product();
                p.ProductID = model.ProductID;
                p.ProductName = model.ProductName;
                ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName",p.CategoryID);
                ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName", p.SupplierID);
                p.Quantity = (Int32)model.Quantity;
                p.UnitPrice = model.UnitPrice;
                        var uploadDir = "~/Images/";

                var imageUrl = System.IO.Path.GetFileName(model.ProductImage.FileName);

                var imagePath = Path.Combine(Server.MapPath(uploadDir), imageUrl);

                model.ProductImage.SaveAs(imagePath);

                p.ProductImage = imageUrl;

                p.Description = model.Description;
                db.Products.Add(p);
                db.SaveChanges();
                 
                return RedirectToAction("Index");
            }
            ModelState.AddModelError("", "Error input!");
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
          
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName");
            return View(model);
        }
        //public ActionResult Edit(int id)
        //{
        //    Product pd = pbo.GetProductbyId(id);
        //    ProductViewModel p = new ProductViewModel()
        //    {

        //        ProductName = pd.ProductName,
        //        CategoryID = pd.CategoryID,
        //        SupplierID = pd.SupplierID,
        //        Quantity = (Int32)pd.Quantity,
        //        UnitPrice = pd.UnitPrice,
        //        ProductImage = pd.ProductImage,
        //        Description = pd.Description,


        //    };
        //    ViewBag.Cat = new SelectList(catbo.GetAllCat(), "CategoryID", "CategoryName");
        //    return View(p);//trả về View Edit kèm biến Model là RecipeViewModel
        //}
        //[HttpPost]
        //public ActionResult Edit(ProductViewModel model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        Product p = new Product()
        //        {
        //            ProductID = model.ProductID,
        //            ProductName = model.ProductName,
        //            CategoryID = model.CategoryID,
        //            SupplierID = model.SupplierID,
        //            Quantity = (Int32)model.Quantity,
        //            UnitPrice = model.UnitPrice,
        //            ProductImage = model.ProductImage,
        //            Description = model.Description
        //        };
        //        pbo.EditProduct(p);
        //        return RedirectToAction("Index");
        //    }
        //    ModelState.AddModelError("", "Error input!");
        //    ViewBag.Cat = new SelectList(catbo.GetAllCat(), "CategoryID", "CategoryName");
        //    return View(model);
        //}
        public ActionResult Edit(int id)
        {
            Product pd = pbo.GetProductbyId(id);
            ProductViewModel p = new ProductViewModel()
            {

                ProductName = pd.ProductName,
                CategoryID = pd.CategoryID,
                SupplierID = pd.SupplierID,
                Quantity = (Int32)pd.Quantity,
                UnitPrice = pd.UnitPrice,
              
                Description = pd.Description,


            };
            ViewBag.Cat = new SelectList(catbo.GetAllCat(), "CategoryID", "CategoryName");
            return View(p);//trả về View Edit kèm biến Model là RecipeViewModel
        }
        [HttpPost]
        public ActionResult Edit(ProductViewModel model)
        {
            if (ModelState.IsValid)
            {
                Product p = new Product()
                {
                    ProductID = model.ProductID,
                    ProductName = model.ProductName,
                    CategoryID = model.CategoryID,
                    SupplierID = model.SupplierID,
                    Quantity = (Int32)model.Quantity,
                    UnitPrice = model.UnitPrice,
              
                    Description = model.Description
                };
                pbo.EditProduct(p);
                return RedirectToAction("Index");
            }
            ModelState.AddModelError("", "Error input!");
            ViewBag.Cat = new SelectList(catbo.GetAllCat(), "CategoryID", "CategoryName");
            return View(model);
        }
        public ActionResult Delete(int id)
        {
            Product p = pbo.GetProductbyId(id);
            return View(p);
        }
        public ActionResult DeleteConfirm(int id)
        {
            try
            {
                pbo.RemoveProduct(id);
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return View();
            }
        }
        public ActionResult Detail(int id)
        {
            ViewBag.cat = db.Categories.Where(x => x.CategoryID > 3).ToList();
            Product p = pbo.GetProductbyId(id);
            return View(p);
        }

    

        public ActionResult Search(string txtSearch, int page = 1, int pageSize = 8)
        {

            ViewBag.cat = db.Categories.Where(x => x.CategoryID > 3).ToList();
            return View(db.Products.ToList().Where(x => x.ProductName.Contains(txtSearch)).ToPagedList(page, pageSize));
      
        
          
        }
        public ActionResult LoadtheoCat(int id, int page = 1, int pageSize = 3)
        {
            ViewBag.cat = db.Categories.Where(x => x.CategoryID > 3).ToList();

            return View(db.Products.ToList().Where(x => x.CategoryID == id).ToPagedList(page, pageSize));

        }
        public ActionResult LoadtheoCasio(int page = 1, int pageSize = 3)
        {
            ViewBag.cat = db.Categories.Where(x => x.CategoryID > 3).ToList();
            return View(db.Products.ToList().Where(x => x.CategoryID == 1).ToPagedList(page, pageSize));

        }
        public ActionResult LoadtheoTimex(int page = 1, int pageSize = 3)
        {
            ViewBag.cat = db.Categories.Where(x => x.CategoryID > 3).ToList();
            return View(db.Products.ToList().Where(x => x.CategoryID == 2).ToPagedList(page, pageSize));

        }
        public ActionResult LoadtheoCitizen(int page = 1, int pageSize = 3)
        {
            ViewBag.cat = db.Categories.Where(x => x.CategoryID > 3).ToList();
            return View(db.Products.ToList().Where(x => x.CategoryID == 3).ToPagedList(page, pageSize));

        }

    }
}