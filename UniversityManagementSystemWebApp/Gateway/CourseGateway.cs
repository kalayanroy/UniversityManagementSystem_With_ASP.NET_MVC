using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemWebApp.Models;
using UniversityManagementSystemWebApp.Models.View_Model;

namespace UniversityManagementSystemWebApp.Gateway
{
    public class CourseGateway:BascConnectionGateway
    {
        public int Save(Course course)
        {
            string query = "INSERT INTO Course VALUES(@code,@name,@credit,@descrition,@departmentId,@semesterId)";
            Command=new SqlCommand(query,Connection);
            Command.Parameters.AddWithValue("@code", course.Code);
            Command.Parameters.AddWithValue("@name", course.Name);
            Command.Parameters.AddWithValue("@credit", course.Credit);
            Command.Parameters.AddWithValue("@descrition", course.Descrition);
            Command.Parameters.AddWithValue("@departmentId", course.DepartmentId);
            Command.Parameters.AddWithValue("@semesterId", 1);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public bool IsNameExsists(Course course)
        {

            string query = "SELECT * FROM Course WHERE Code='" + course.Code + "' AND Name='" + course.Name + "' AND DepartmentId="+course.DepartmentId+"";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool IsExsists = Reader.HasRows;
            Connection.Close();
            return IsExsists;
        }

        public List<Department> GetDepartments()
        {
            string query = "SELECT * FROM Department";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Department> departmentList = new List<Department>();
            while (Reader.Read())
            {
                Department department = new Department();
                department.Id = Convert.ToInt32(Reader["Id"]);
                department.Code = Reader["Code"].ToString();
                department.Name = Reader["Name"].ToString();

                departmentList.Add(department);
            }
            Connection.Close();
            return departmentList;
        }

        public List<Course> GetCourses()
        {
            string query = "SELECT * FROM Course";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Course> courses = new List<Course>();
            while (Reader.Read())
            {
                Course course = new Course();
                course.Id = Convert.ToInt32(Reader["Id"]);
                course.Code = Reader["Code"].ToString();
                course.Name = Reader["Name"].ToString();
                course.Credit = float.Parse(Reader["Credit"].ToString());

                courses.Add(course);
            }
            Connection.Close();
            return courses;
        }

        public List<Course> GetCoursesById(int departmentId)
        {
            string query = "SELECT Id,Code,Name FROM Course WHERE DepartmentId=" + departmentId + "";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Course> courses = new List<Course>();
            while (Reader.Read())
            {
                Course course=new Course();
                course.Id = Convert.ToInt32(Reader["Id"]);
                course.Name = Reader["Code"].ToString();
                courses.Add(course);
            }
            Reader.Close();
            Connection.Close();
            return courses;
        }

        
    }
}