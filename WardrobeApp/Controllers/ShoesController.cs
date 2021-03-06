﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WardrobeApp.Models;

namespace WardrobeApp.Controllers
{
    public class ShoesController : Controller
    {
        private ClothingProjectEntities db = new ClothingProjectEntities();

        // GET: Shoes
        public ActionResult Index()
        {
            var shoes = db.Shoes.Include(s => s.Occassion).Include(s => s.Season);
            return View(shoes.ToList());
        }

        // GET: Shoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Shoe shoe = db.Shoes.Find(id);
            if (shoe == null)
            {
                return HttpNotFound();
            }
            return View(shoe);
        }

        // GET: Shoes/Create
        public ActionResult Create()
        {
            ViewBag.OccassionID = new SelectList(db.Occassions, "OccassionID", "OccassionType");
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "Season1");
            return View();
        }

        // POST: Shoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ShoeID,ShoeName,ShoePhoto,ShoeColor,SeasonID,OccassionID")] Shoe shoe)
        {
            if (ModelState.IsValid)
            {
                db.Shoes.Add(shoe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OccassionID = new SelectList(db.Occassions, "OccassionID", "OccassionType", shoe.OccassionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "Season1", shoe.SeasonID);
            return View(shoe);
        }

        // GET: Shoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Shoe shoe = db.Shoes.Find(id);
            if (shoe == null)
            {
                return HttpNotFound();
            }
            ViewBag.OccassionID = new SelectList(db.Occassions, "OccassionID", "OccassionType", shoe.OccassionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "Season1", shoe.SeasonID);
            return View(shoe);
        }

        // POST: Shoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ShoeID,ShoeName,ShoePhoto,ShoeColor,SeasonID,OccassionID")] Shoe shoe)
        {
            if (ModelState.IsValid)
            {
                db.Entry(shoe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OccassionID = new SelectList(db.Occassions, "OccassionID", "OccassionType", shoe.OccassionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "Season1", shoe.SeasonID);
            return View(shoe);
        }

        // GET: Shoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Shoe shoe = db.Shoes.Find(id);
            if (shoe == null)
            {
                return HttpNotFound();
            }
            return View(shoe);
        }

        // POST: Shoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Shoe shoe = db.Shoes.Find(id);
            db.Shoes.Remove(shoe);
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
    }
}
