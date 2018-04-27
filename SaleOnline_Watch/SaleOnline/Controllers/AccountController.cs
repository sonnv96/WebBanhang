using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DA;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using PrjModel;

namespace SaleOnline.Controllers
{
    public class AccountController : Controller
    {
        private SaleOnlineContext db = new SaleOnlineContext();

        // GET: Account
        public ActionResult Index()
        {
            return View(db.Accounts.ToList());
        }

        // GET: Account/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }

        // GET: Account/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Account/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserName,Password,Role")] Account account)
        {
            if (ModelState.IsValid)
            {
                db.Accounts.Add(account);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(account);
        }

        // GET: Account/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }

        // POST: Account/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserName,Password,Role")] Account account)
        {
            if (ModelState.IsValid)
            {
                db.Entry(account).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(account);
        }

        // GET: Account/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }

        // POST: Account/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Account account = db.Accounts.Find(id);
            db.Accounts.Remove(account);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult Login()
        {

            return View();
        }



        [HttpPost]

        public ActionResult Login(Account account)
        {
            if (ModelState.IsValid)
            {
                using (SaleOnlineContext db = new SaleOnlineContext())
                {
                    var obj = db.Accounts.Where(a => a.UserName.Equals(account.UserName) && a.Password.Equals(account.Password)).FirstOrDefault();

                    if (obj != null)
                    {
                        Session["UserName"] = obj.UserName.ToString();
                        Session["Role"] = obj.Role.ToString();


                        if (obj.Role == "Admin")
                        {
                            return RedirectToAction("Index", "TaiKhoan");
                        }
                        else if (obj.Role == "User")
                        {
                            return RedirectToAction("Index", "Product");
                        }

                        return RedirectToAction("Index", "Product");
                    }
                    else
                    {
                        TempData["taikhoan"] = "abc";
                    }
                }
            }
            return View(account);
        }
        public ActionResult LogOff()
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Product");
        }

    }
}
