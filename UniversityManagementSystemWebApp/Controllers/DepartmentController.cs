using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemWebApp.Manager;
using UniversityManagementSystemWebApp.Models;

namespace UniversityManagementSystemWebApp.Controllers
{
    public class DepartmentController : Controller
    {
        //
        // GET: /Department/
        //public ActionResult Index()
        //{
        //    return View();
        //}

        private DepartmentManager departmentManager;
        private CourseManager courseManager;

        public DepartmentController()
        {
            departmentManager=new DepartmentManager();
            courseManager=new CourseManager();
        }

        //public string Save(Department department)
        //{
        //    string message = departmentManager.Save(department);
        //    return message;
        //}

        //public void GetAllDepartments()
        //{
        //    departmentManager.GetAllDepartments();
        //}

        //public string Save(Course course)
        //{
        //    string message = courseManager.Save(course);
        //    return message;
        //}

        [HttpGet]
        public ActionResult Save()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Save(Department department)
        {
            string message = departmentManager.Save(department);
            ViewBag.Message = message;
            return View();
        }
       
    }
}