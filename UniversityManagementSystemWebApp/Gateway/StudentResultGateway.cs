using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemWebApp.Models;
using UniversityManagementSystemWebApp.Models.View_Model;

namespace UniversityManagementSystemWebApp.Gateway
{
    public class StudentResultGateway:BascConnectionGateway
    {
        public int Save(StudentResult studentResult)
        {
            string query = "INSERT INTO StudentResult VALUES(@registrationNo,@courseId,@gradeLetterId)";
            Command=new SqlCommand(query,Connection);
            Command.Parameters.AddWithValue("@registrationNo", studentResult.RegistrationNo);
            Command.Parameters.AddWithValue("@courseId", studentResult.CourseId);
            Command.Parameters.AddWithValue("@gradeLetterId", studentResult.GradeLetterId);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public List<StudentResultViewModel> GetRegNoByStudentResultInfo(int RegistrationNo)
        {
            string query = "SELECT Student.Name AS StudentName,Student.Email,Department.Name AS DepartmentName,Course.Code,GradeLetter.GradeLetter FROM StudentResult INNER JOIN Student ON StudentResult.RegistrationNo=Student.Id INNER JOIN Course ON StudentResult.CourseId=Course.Id INNER JOIN GradeLetter ON StudentResult.GradeLetterId=GradeLetter.Id INNER JOIN Department ON Course.DepartmentId=Department.Id WHERE StudentResult.RegistrationNo="+RegistrationNo+"";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<StudentResultViewModel> studentResultViews = new List<StudentResultViewModel>();
            while (Reader.Read())
            {
                StudentResultViewModel studentResultView = new StudentResultViewModel();
                studentResultView.Name = Reader["StudentName"].ToString();
                studentResultView.Email = Reader["Email"].ToString();
                studentResultView.DepartmentName = Reader["DepartmentName"].ToString();
                studentResultView.CourseCode = Reader["Code"].ToString();
                studentResultView.GradeLetter = Reader["GradeLetter"].ToString();
                studentResultViews.Add(studentResultView);
            }
            Connection.Close();
            return studentResultViews;
        }
    }
}