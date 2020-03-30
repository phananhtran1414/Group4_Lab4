using Group4_Lab4.DAL;
using Group4_Lab4.DTL;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Group4_Lab4.GUI
{
    public partial class ReserveGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.TodaysDate = DateTime.Now;
                Calendar1.SelectedDate = DateTime.Now;
            }
        }
        private void View(Borrower borrower)
        {
            DataTable dt = new DataTable();
            dt = ReserveDAO.GetDataTableReserve(borrower.BorrowerNumber);

/*            foreach (DataRow dr in dt.Rows)
            {
                dr[3] = DateTime.Parse((dr[3].ToString())).ToString("dd/MM/yyyy");
            }*/
            DataView dv = new DataView(dt);
            GridView1.DataSource = dv;
            GridView1.DataBind();

            try
            {
                GridViewRow row = GridView1.Rows[0];
                row.Cells[3].Text = DateTime.Parse((row.Cells[3].Text.ToString())).ToString("dd/MM/yyyy");
            }
            catch
            {

            }
        }

        protected void btnCheckMember_Click(object sender, EventArgs e)
        {
            int borrowerNum;
            if (DAO.checkInt(txtBorrowerNumber.Text) == false)
            {
                lblError.Text = "Borrower number must be a integer!";
                /*MessageBox.Show("");
                txtMemberCode.Focus();*/
                return;
            }
            borrowerNum = int.Parse(txtBorrowerNumber.Text);
            Borrower borrower = BorrowerDAO.GetBorrower(borrowerNum);
            if (borrower != null)
            {
                txtName.Text = borrower.Name; //display name
                View(borrower);
                //MessageBox.Show("R".Equals("R") + "");
                if (ReserveDAO.GetLastReserveOfBorrower(int.Parse(txtBorrowerNumber.Text)) != null
                    && ReserveDAO.GetLastReserveOfBorrower(int.Parse(txtBorrowerNumber.Text)).Status.ToString().Equals("R")) //mean the last record still R
                {
                    //have a book in reserve
                    /* MessageBox.Show("Oops! you have book in reserve queue! You can't reserve book until it's over");*/
                    lblError.Text = "Oops! you have book in reserve queue! You can't reserve book until it's over";
                    btnChkCondition.Enabled = false;
                    txtBookNumber.Enabled = false;
                    btnReserve.Enabled = false;
                }
                else
                {
                    lblError.Text = " ";
                    btnChkCondition.Enabled = true;
                    txtBookNumber.Enabled = true;
                }
            }
            else
            {
                lblError.Text = "Oops, ID is not exist! Check again!";
            }
        }

        protected void btnChkCondition_Click(object sender, EventArgs e)
        {
            if (txtBookNumber.Text == null || txtBookNumber.Text.Equals(""))
            {
                lblError.Text = "Book Number is not allow to be null";
                txtBookNumber.Focus();
            }
            else if (DAO.checkInt(txtBookNumber.Text) == false)
            {
                lblError.Text = "Book Number is numberic";
                txtBookNumber.Focus();
            }
            else
            {
                DataView dv = new DataView(BookDAO.GetDataTableBook());
                dv.RowFilter = "bookNumber = " + txtBookNumber.Text;
                if (dv.Count != 0) //book exist
                {
                    int availableCopy = CopyDAO.getAvailableCopy(int.Parse(txtBookNumber.Text)); //số lượng bản copy A
                    if (availableCopy > 0)
                    {
                        lblError.Text = "This book having " + availableCopy + " copies available, you can borrow them";
                    }
                    else
                    {
                        lblError.Text = "";
                        btnReserve.Enabled = true;
                    }
                }
                else
                {
                    lblError.Text = "Oops! this book number is not exist!";
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {
            int borrowerNum = int.Parse(txtBorrowerNumber.Text);
            Borrower borrower = BorrowerDAO.GetBorrower(borrowerNum);

            Reservation rv = new Reservation(int.Parse(txtBorrowerNumber.Text), int.Parse(txtBookNumber.Text), Calendar1.SelectedDate);
            if (ReserveDAO.Insert(rv))
            {
                View(borrower);
                btnReserve.Enabled = false; 
            }
            else
            {
                lblError.Text = "Reserve queue failse! ";
            }
        }
    }
}