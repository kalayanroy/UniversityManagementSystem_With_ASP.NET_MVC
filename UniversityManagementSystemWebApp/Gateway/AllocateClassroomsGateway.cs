using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystemWebApp.Models;
using UniversityManagementSystemWebApp.Models.View_Model;

namespace UniversityManagementSystemWebApp.Gateway
{
    public class AllocateClassroomsGateway:BascConnectionGateway
    {
        public int Save(AllocateClassrooms allocateClassrooms)
        {
            string query = "INSERT INTO AllocateClassrooms VALUES(@departmentId,@courseId,@roomId,@dayId,@fromTime,@toTime,@action)";
            Command=new SqlCommand(query,Connection);
            Command.Parameters.AddWithValue("@departmentId", allocateClassrooms.DepartmentId);
            Command.Parameters.AddWithValue("@courseId", allocateClassrooms.CourseId);
            Command.Parameters.AddWithValue("@roomId", allocateClassrooms.RoomId);
            Command.Parameters.AddWithValue("@dayId", allocateClassrooms.DayId);
            Command.Parameters.AddWithValue("@fromTime", allocateClassrooms.FromTime);
            Command.Parameters.AddWithValue("@toTime", allocateClassrooms.ToTime);
            Command.Parameters.AddWithValue("@action", 1);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public List<AllocateClassrooms> GetTimeAllocate(int DayId,int RoomId,DateTime FromTime,DateTime ToTime)
        {
            string query = "SELECT * FROM AllocateClassrooms WHERE RoomId="+RoomId+" AND DayId="+DayId+"";
            Command=new SqlCommand(query,Connection);
            List<AllocateClassrooms> allocateClassroomses=new List<AllocateClassrooms>();
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                AllocateClassrooms allocate=new AllocateClassrooms();
                allocate.Id = Convert.ToInt32(Reader["Id"]);
                allocate.DepartmentId = Convert.ToInt32(Reader["DepartmentId"]);
                allocate.CourseId = Convert.ToInt32(Reader["CourseId"]);
                allocate.DayId = Convert.ToInt32(Reader["DayId"]);
                allocate.RoomId = Convert.ToInt32(Reader["RoomId"]);
                allocate.FromTime = Convert.ToDateTime(Reader["FromTime"]);
                allocate.ToTime = Convert.ToDateTime(Reader["ToTime"]);
                allocateClassroomses.Add(allocate);
            }
            Reader.Close();
            Connection.Close();
            return allocateClassroomses;
        }

        //public List<ScheduleViewModel> GetAllSchedule()
        //{
        //    string query = "";
        //    Command=new SqlCommand(query,Connection);
        //    Connection.Open();
        //    Reader = Command.ExecuteReader();
        //    List<ScheduleViewModel> scheduleList=new List<ScheduleViewModel>();
        //    while (Reader.Read())
        //    {
        //        ScheduleViewModel schedule=new ScheduleViewModel();
        //        schedule.Id = Convert.ToInt32(Reader["Id"]);
        //    }
        //} 
    }
}