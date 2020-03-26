using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
//using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Group4_Lab4.DAL
{
    public class DAO
    {
        //static string strConn = ConfigurationManager.ConnectionStrings[@"Data Source=DESKTOP-FQ1MOV8\SQLEXPRESS;Initial Catalog=Library;Integrated Security=True"].ConnectionString;
        static string strConn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
        static public DataTable GetDataTable(string sqlSelect)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);

                SqlCommand cmd = new SqlCommand(sqlSelect, conn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                //DataSet là 1 tập hợp các DataTable, nên ở đây thay vì da.fill(dt) thông thường thì fill vào ds
                //Nên khi gọi thì ds. lấy DataTable ở vị trí đầu tiên ???
                return ds.Tables[0];
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
                return null;

            }


        }

        static public bool UpdateTable(SqlCommand cmd)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;

            }
            catch (Exception ex)
            {

                //MessageBox.Show(ex.Message);
                return false;

            }
        }

        static public bool checkExistCopy(int bookNum)
        {
            SqlConnection conn = new SqlConnection(strConn);

            string query = "Select * from Copy where bookNumber = " + bookNum + "";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = query;
            cmd.Connection.Open();
            //Như ResultSet trong Java
            SqlDataReader dr = cmd.ExecuteReader();
            //DbDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                cmd.Connection.Close();
                return true;
            }
            else
            {
                cmd.Connection.Close();
                return false;
            }
        }


        public static bool checkInt(string r)
        {
            try
            {
                int result = int.Parse(r);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool checkFloat(string r)
        {
            try
            {
                float result = float.Parse(r);
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}
