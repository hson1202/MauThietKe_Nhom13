﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ClothingShop.Models;
using PagedList;

namespace ClothingShop.Controllers
{
    
    public class CategoryController : Controller
    {
        ClothingStore1Entities db = new ClothingStore1Entities();
        // GET: Category
        public ActionResult Index(int? page)
        {
            int pageSize = 6;
            int pageNum = (page ?? 1);
            var prodList = db.Products.ToList();
            return View(prodList.ToPagedList(pageNum, pageSize));
        }

        public ActionResult ListProductCate(int id, int? page)
        {
            int pageSize = 6;
            int pageNum = (page ?? 1);
            ViewBag.Category = db.Categories.FirstOrDefault(c => c.CategoryID == id).CategoryName;
            var prodList = db.Products.Where(p => p.CategoryID == id).ToList();
            return View(prodList.ToPagedList(pageNum, pageSize));
        }
        public ActionResult ListProductNSX(int id, int? page)
        {
            int pageSize = 6;
            int pageNum = (page ?? 1);
            ViewBag.NSX = db.NSXes.FirstOrDefault(c => c.IDnsx == id).TenNSX;
            var prodList = db.Products.Where(p => p.IDnsx == id).ToList();
            return View(prodList.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Search(string inputSearch, int? page)
        {
            int pageSize = 6;
            int pageNum = (page ?? 1);
            var result = db.Products.Where(s => s.ProductName.Contains(inputSearch)).ToList();
            return View(result.ToPagedList(pageNum, pageSize));
        }
    }
}