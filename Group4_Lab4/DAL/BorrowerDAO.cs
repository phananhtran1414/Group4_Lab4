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
    public class BorrowerDAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        public static Borrower GetBorrower(int borrowerNum)
        {
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("Select * from Borrower where borrowerNumber = @b", conn);
            cmd.Parameters.AddWithValue("@b", borrowerNum);
            Borrower b = null;
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            
            while (rd.Read())
            {
                b = new Borrower();
                b.BorrowerNumber = int.Parse(rd["borrowerNumber"].ToString());
                b.Name = rd["name"].ToString();
                b.Sex = char.Parse(rd["sex"].ToString());
                b.Address = rd["address"].ToString();
                b.Telephone = rd["telephone"].ToString();
                b.Email = rd["email"].ToString();      

            }
            conn.Close();
            return b;
        }


    }
}
