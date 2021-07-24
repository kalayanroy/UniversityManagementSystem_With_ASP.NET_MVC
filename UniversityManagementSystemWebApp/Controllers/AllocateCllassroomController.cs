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
    public class AllocateCllassroomController : Controller
    {
        private DepartmentManager departmentManager;
        private CourseManager courseManager;
        private RoomManager roomManager;
        private DayManager dayManager;
        private AllocateClassroomsManager allocateClassroomsManager;

        public AllocateCllassroomController()
        {
            departmentManager=new DepartmentManager();
            courseManager=new CourseManager();
            roomManager=new RoomManager();
            dayManager=new DayManager();
            allocateClassroomsManager=new AllocateClassroomsManager();
        }
        //
        // GET: /AllocateCllassroom/
        [HttpGet]
        public ActionResult Save()
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            ViewBag.Rooms = roomManager.GetAllRoomCodeList();
            ViewBag.Days = dayManager.GetAllDayList();
            return View();
        }
        [HttpPost]

        public ActionResult Save(AllocateClassrooms allocateClassrooms)
        {
            //if (ModelState.IsValid)
            //{
                string message = allocateClassroomsManager.Save(allocateClassrooms);
                ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
                ViewBag.Rooms = roomManager.GetAllRoomCodeList();
                ViewBag.Days = dayManager.GetAllDayList();
                ViewBag.Message = message;
                ModelState.Clear();
                return View();
            //}
            //else
            //{
            //    ViewBag.Message = "Model is not valid";
            //    return View();
            //}
        }
        public JsonResult GetCourseByDepartmentId(int departmentId)
        {
            List<Course> courseList = courseManager.GetCoursesById(departmentId);
            return Json(courseList);
        }

        [HttpGet]
        public ActionResult ClassSchedule()
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            return View();
        }

        [HttpPost]
        public ActionResult ClassSchedule(ClassSchedule classSchedule)
        {
            ViewBag.Departments = departmentManager.GetSelectListItemsForDropdown();
            return View();
        }
       
	}
}