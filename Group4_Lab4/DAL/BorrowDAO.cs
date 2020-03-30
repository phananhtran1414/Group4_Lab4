using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Group4_Lab4.DAL
{
    public class BorrowDAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
        public static DataTable GetBorrowedCopies(int borrowerNum)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = new SqlCommand("Select * from CirculatedCopy where borrowerNumber = @b and returnedDate is null", conn);

                cmd.Parameters.AddWithValue("@b", borrowerNum);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(dt);

                return dt;
            }
            catch (Exception e)
            {
                //MessageBox.Show(e.Message);
                return null;
            }

        }

    }
}