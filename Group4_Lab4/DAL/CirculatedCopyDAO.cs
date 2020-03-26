using Group4_Lab4.DTL;
using System;
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
    public class CirculatedCopyDAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;
        public static DataTable GetBorrowedCopies(int borrowerNum)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = new SqlCommand("Select * from CirculatedCopy where borrowerNumber = @b", conn);

                cmd.Parameters.AddWithValue("@b", borrowerNum);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(dt);

                return dt;
            }
            catch(Exception e)
            {
                //MessageBox.Show(e.Message);
                return null;
            }
            
        }

        

        public static bool Insert(CirculatedCopy cc)
        {
            SqlCommand cmd = new SqlCommand("insert into CirculatedCopy(copyNumber, borrowerNumber, borrowedDate, dueDate, fineAmount)" +
                    "values(@copyNumber, @borrowerNumber, @borrowedDate , @dueDate, @fineAmount)");



            cmd.Parameters.AddWithValue("@copyNumber", cc.CopyNumber);
            cmd.Parameters.AddWithValue("@borrowerNumber", cc.BorrowerNumber);
            cmd.Parameters.AddWithValue("@borrowedDate", cc.BorrowedDate);
            cmd.Parameters.AddWithValue("@dueDate", cc.DueDate);
            cmd.Parameters.AddWithValue("@fineAmount", cc.FineAmount);

            return DAO.UpdateTable(cmd);

        }

        public static bool Update(CirculatedCopy c)
        {
            SqlCommand cmd = new SqlCommand("Update CirculatedCopy set returnedDate = @r , fineAmount = @f where ID = @i");
            cmd.Parameters.AddWithValue("@r", c.ReturnedDate);
            cmd.Parameters.AddWithValue("@f", c.FineAmount);
            cmd.Parameters.AddWithValue("@i", c.Id);

            return DAO.UpdateTable(cmd);
        }

        public static Boolean Delete(int CopyNumber)
        {
            SqlCommand cmd = new SqlCommand("delete CirculatedCopy where copyNumber=@c");
            cmd.Parameters.AddWithValue("@c", CopyNumber);
            return DAO.UpdateTable(cmd);
        }

    }
}
