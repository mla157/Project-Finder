using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Finder.Core.Models;


namespace Finder.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            var databaseConnection = new DatabaseConnection();
            var resultData = databaseConnection.GetData("SELECT * FROM movie");

            return View();
        }
    }
}
