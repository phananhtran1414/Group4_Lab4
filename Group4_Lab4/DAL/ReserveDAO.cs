using Group4_Lab4.DTL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group4_Lab4.DAL
{
    public class ReserveDAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        public static Reservation GetFirstReservation(int bookNumber)
        {
            SqlConnection conn = new SqlConnection(strConn);
            Reservation r = null;

            SqlCommand cmd = new SqlCommand("Select * from Reservation" +
                " where status = 'R' and bookNumber = " + bookNumber + " order by ID Asc ",conn);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                r = new Reservation();
                r.Id = int.Parse(dr["ID"].ToString());
                r.BorrowerNumber = int.Parse(dr["borrowerNumber"].ToString());
                r.BookNumber = int.Parse(dr["bookNumber"].ToString());
                r.Date = DateTime.Parse(dr["date"].ToString());
                r.Status = char.Parse(dr["status"].ToString());
                break;
            }
            conn.Close();
            return r;

        }


        public static bool Update(Reservation r)
        {
            SqlCommand cmd = new SqlCommand("update Reservation set status = @s where ID = @i");
            cmd.Parameters.AddWithValue("@s", r.Status);
            cmd.Parameters.AddWithValue("@i", r.Id);

            return DAO.UpdateTable(cmd);
        }



    }
}
