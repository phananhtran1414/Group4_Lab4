using Group4_Lab4.DTL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group4_Lab4.DAL
{
    public class BorrowerDAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
        static SqlConnection sqlconnection = new SqlConnection(strConn);

        private static void DeleteTable(string sql)
        {

            SqlCommand sqlCommand = new SqlCommand(sql, sqlconnection);
            sqlconnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlconnection.Close();

        }
        public static DataTable GetDataTableBorrower()
        {
            string cmd = "select * from Borrower";
            return DAO.GetDataTable(cmd);
        }
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
        public static int GetBorrowerNumberMax()
        {
            DataTable dt = GetDataTableBorrower();
            if (dt.Rows.Count == 0)
            {
                return 0;
            }
            else
            {
                return (int)(dt.Compute("max(borrowerNumber)", ""));
            }
        }

        public static bool Insert(Borrower b)
        {
            SqlCommand cmd = new SqlCommand("insert into Borrower(name, sex, address, telephone, email)" +
                    "values(@name, @sex, @address, @telephone, @email)");

            //cmd.Parameters.AddWithValue("@borrowerNumber", b.BorrowerNumber);
            cmd.Parameters.AddWithValue("@name", b.Name);
            cmd.Parameters.AddWithValue("@sex", b.Sex);
            cmd.Parameters.AddWithValue("@address", b.Address);
            cmd.Parameters.AddWithValue("@telephone", b.Telephone);
            cmd.Parameters.AddWithValue("@email", b.Email);
            return DAO.UpdateTable(cmd);
        }

        public static bool Update(Borrower b)
        {
            SqlCommand cmd = new SqlCommand("update Borrower set name=@name, sex = @sex, address = @address, telephone=@telephone, email=@email where borrowerNumber=@borrowerNumber");
            cmd.Parameters.AddWithValue("@borrowerNumber", b.BorrowerNumber);
            cmd.Parameters.AddWithValue("@name", b.Name);
            cmd.Parameters.AddWithValue("@sex", b.Sex);
            cmd.Parameters.AddWithValue("@address", b.Address);
            cmd.Parameters.AddWithValue("@telephone", b.Telephone);
            cmd.Parameters.AddWithValue("@email", b.Email);
            return DAO.UpdateTable(cmd);
        }

        public static void Delete(Borrower b)
        {
            string sql1 = "delete CirculatedCopy where borrowerNumber=" + b.BorrowerNumber + "";
            DeleteTable(sql1);
            string sql2 = "delete Reservation where borrowerNumber=" + b.BorrowerNumber + "";
            DeleteTable(sql2);
            string sql3 = "delete Borrower where borrowerNumber="+ b.BorrowerNumber+"";
            DeleteTable(sql3);
        }

    }
}
