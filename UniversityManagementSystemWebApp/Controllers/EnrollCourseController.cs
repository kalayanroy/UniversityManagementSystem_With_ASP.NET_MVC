using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemWebApp.Manager;
using UniversityManagementSystemWebApp.Models;
using UniversityManagementSystemWebApp.Models.View_Model;

namespace UniversityManagementSystemWebApp.Controllers
{
    public class EnrollCourseController : Controller
    {
        //
        // GET: /EnrollCourse/
        private DepartmentManager departmentManager;
        private CourseManager courseManager;
        private StudentManager studentManager;
        private EnrollManager enrollManager;

        public EnrollCourseController()
        {
            departmentManager=new DepartmentManager();
            courseManager=new CourseManager();
            studentManager=new StudentManager();
            enrollManager=new EnrollManager();
        }
        [HttpGet]
        public ActionResult Enroll()
        {
            ViewBag.StudentRegNo = studentManager.GetSelectListItemsForDropdown();
            ViewBag.Courses = courseManager.GetAllCourse();
            return View();
        }

        [HttpPost]
        public ActionResult Enroll(EnrollCourse enrollCourse)
        {
            if (ModelState.IsValid)
            {
                string message = enrollManager.Save(enrollCourse);
                ViewBag.StudentRegNo = studentManager.GetSelectListItemsForDropdown();
                ViewBag.Courses = courseManager.GetAllCourse();
                ViewBag.Message = message;
                ModelState.Clear();
                return View();
            }
            else
            {
                ViewBag.Message = "Model Is not Valid";
                return View();
            }
        }
        public JsonResult RegistrationNo(int registrationId)
        {
            List<StudentResultViewModel> enrollViewModels = studentManager.GetRegNoByStudentInfo(registrationId);
            return Json(enrollViewModels);
        }
	}
}