using Group4_Lab4.DTL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Group4_Lab4.DAL
{
    public class BookDAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
        public static DataTable GetDataTableBook()
        {
            string cmd = "select * from Book";
            return DAO.GetDataTable(cmd);
        }

        public static DataTable GetDataTableBook(String title)
        {
            string cmd = "select * from Book where title like '%" + title +"%'" ;
            return DAO.GetDataTable(cmd);
        }


        public static int GetBookNumberMax()
        {
            DataTable dt = GetDataTableBook();
            if (dt.Rows.Count == 0)
            {
                return 0;
            }
            else
            {
                return (int)(dt.Compute("max(bookNumber)", ""));
            }
        }

        

        public static bool Insert(Book b)
        {
            SqlCommand cmd = new SqlCommand("insert into book(title, authors, publisher) " +
                    " values(@title, @authors, @publisher)");

            //cmd.Parameters.AddWithValue("@bookNumber", b.BookNumber);
            cmd.Parameters.AddWithValue("@title", b.Title);
            cmd.Parameters.AddWithValue("@authors",b.Authors);
            cmd.Parameters.AddWithValue("@publisher", b.Publisher);
            return DAO.UpdateTable(cmd);
        }

        public static bool Update(Book b)
        {
            SqlCommand cmd = new SqlCommand("update Book set title=@title, authors = @authors, publisher = @publisher where bookNumber=@bookNumber");
            cmd.Parameters.AddWithValue("@bookNumber", b.BookNumber);
            cmd.Parameters.AddWithValue("@title", b.Title);
            cmd.Parameters.AddWithValue("@authors   ", b.Authors);
            cmd.Parameters.AddWithValue("@publisher", b.Publisher);
            return DAO.UpdateTable(cmd);
        }

        public static Boolean Delete(Book b)
        {
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd1 = new SqlCommand("Delete Reservation where bookNumber=@b", conn);
            cmd1.Parameters.AddWithValue("@b", b.BookNumber);
            conn.Open();
            cmd1.ExecuteNonQuery();
            conn.Close();

            DeleteAllCopiesByBookId(b);

            SqlCommand cmd = new SqlCommand("delete Book where bookNumber=@bookNumber");
            cmd.Parameters.AddWithValue("@bookNumber", b.BookNumber);
            return DAO.UpdateTable(cmd);
        }

        public static void DeleteAllCopiesByBookId(Book b)
        {
            ArrayList listCopyNumber = CopyDAO.GetAllCopyByNums(b.BookNumber);
            for (int i = 0; i < listCopyNumber.Count; i++)
            {

                Copy c = (Copy)listCopyNumber[i];

                CopyDAO.Delete(c);
            }

        }

    }
}
