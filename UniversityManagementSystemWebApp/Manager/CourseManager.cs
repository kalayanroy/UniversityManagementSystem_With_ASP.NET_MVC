using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystemWebApp.Gateway;
using UniversityManagementSystemWebApp.Models;
using UniversityManagementSystemWebApp.Models.View_Model;

namespace UniversityManagementSystemWebApp.Manager
{
    public class CourseManager
    {
        private CourseGateway courseGateway;

        public CourseManager()
        {
            courseGateway=new CourseGateway();
        }

        public string Save(Course course)
        {
            if (courseGateway.IsNameExsists(course))
            {
                return "This Code,Name & Department Already Exist";
            }
            else
            {
                int rowAffect = courseGateway.Save(course);

                if (rowAffect > 0)
                {
                    return "Save Successfully";
                }
                else
                {
                    return "Save Failed";
                }
            }
        }

        public List<Department> GetDepartments()
        {
            return courseGateway.GetDepartments();
        }

        public List<Course> GetCourses()
        {
            return courseGateway.GetCourses();
        }
        public List<SelectListItem> GetSelectListItemsForDropdown()
        {
            List<Course> Courses = GetCourses();
            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (Course course in Courses)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = course.Code;
                selectListItem.Value = course.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }

        public List<SelectListItem> GetAllCourse()
        {
            List<Course> Courses = GetCourses();
            List<SelectListItem> selectListItems = new List<SelectListItem>();
            selectListItems.Add(new SelectListItem()
            {
                Text = "--Select--",
                Value = ""
            });
            foreach (Course course in Courses)
            {
                SelectListItem selectListItem = new SelectListItem();
                selectListItem.Text = course.Name;
                selectListItem.Value = course.Id.ToString();
                selectListItems.Add(selectListItem);
            }
            return selectListItems;
        }

        public List<Course> GetCoursesById(int departmentId)
        {
            return courseGateway.GetCoursesById(departmentId);
        }      
    }
}