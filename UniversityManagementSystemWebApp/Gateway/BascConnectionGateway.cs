using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace UniversityManagementSystemWebApp.Gateway
{
    public class BascConnectionGateway
    {
        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }
        public BascConnectionGateway()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["UniversityConnection"].ConnectionString;
            Connection=new SqlConnection(connectionString);
        }
    }
}