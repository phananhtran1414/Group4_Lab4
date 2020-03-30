using Group4_Lab4.DAL;
using Group4_Lab4.DTL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group4_Lab4.GUI
{
    public partial class BorrowGUI : System.Web.UI.Page
    {

        Copy c;
        Reservation r;
        enum errorBorrow
        {
            OK,
            Connect,
            CopyNotExist,
            CopyReferenced,
            CopyBorrowed,
            CopyReserved
        };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.TodaysDate = DateTime.Now;
                Calendar1.SelectedDate = DateTime.Now;
                txtDueDate.Text = Calendar1.SelectedDate.AddDays(14).ToString("dd/MM/yyyy");
                displayButtons(1);
            }

        }
        private void displayButtons(int state)
        {
            switch (state)
            {
                //check member
                case 1:
                    lblError.Text = "";
                    txtBorrowerNumber.Enabled = true;
                    txtName.Enabled = false;
                    txtCopyNumber.Enabled = false;
                    txtDueDate.Enabled = false;

                    btnCheckMember.Enabled = true;

                    btnCheckConditionCopy.Enabled = false;
                    btnBorrow.Enabled = false;
                    break;

                //check copy
                case 2:
                    lblError.Text = "";
                    txtBorrowerNumber.Enabled = false;
                    txtName.Enabled = false;
                    txtCopyNumber.Enabled = true;
                    txtDueDate.Enabled = false;

                    btnCheckConditionCopy.Enabled = true;

                    btnCheckMember.Enabled = false;
                    btnBorrow.Enabled = false;

                    break;

                //borrow
                case 3:
                    lblError.Text = "";
                    txtBorrowerNumber.Enabled = false;
                    txtName.Enabled = false;
                    txtCopyNumber.Enabled = false;
                    txtDueDate.Enabled = false;

                    btnBorrow.Enabled = true;

                    btnCheckConditionCopy.Enabled = false;
                    btnCheckMember.Enabled = false;

                    break;

            }
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            if (txtBorrowerNumber.Text != null)
            {
                int borrowNumber;
                if (DAO.checkInt(txtBorrowerNumber.Text) == false)
                {
                    lblError.Text = "Borrower number must be a integer!";
                    txtBorrowerNumber.Focus();
                    return;
                }
                borrowNumber = int.Parse(txtBorrowerNumber.Text);
                Borrower b = BorrowerDAO.GetBorrower(borrowNumber);
                if (b == null)
                {
                    lblError.Text = String.Format("Borrower number {0} does't exist!", txtBorrowerNumber.Text);
                    txtBorrowerNumber.Focus();
                    return;
                }


                txtName.Text = b.Name;
                //check borrowed >= 5 books
                if (BorrowDAO.GetBorrowedCopies(int.Parse(txtBorrowerNumber.Text)).Rows.Count >= 5)
                {
                    lblError.Text = "You borrowed 5 books, so you can't borrow any more!";
                    return;
                }

                ObjectDataSource1.FilterExpression = "borrowerNumber = " + txtBorrowerNumber.Text;
                GridView1.DataBind();
                displayButtons(2);
                /*ObjectDataSource1.DataBind();*/

            }
            else
            {
                lblError.Text = "Borrower number required!";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CirculatedCopy cc = new CirculatedCopy(int.Parse(txtCopyNumber.Text), int.Parse(txtBorrowerNumber.Text),
            Calendar1.SelectedDate, DateTime.ParseExact(txtDueDate.Text, "dd/MM/yyyy", null));

            borrow(cc, c, r);

            ObjectDataSource1.Select();
            GridView1.DataBind();
            displayButtons(1);
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.Cells[3].Text = DateTime.Parse((row.Cells[3].Text.ToString())).ToString("dd/MM/yyyy");
                row.Cells[4].Text = DateTime.Parse((row.Cells[4].Text.ToString())).ToString("dd/MM/yyyy");
            }
            lblNumberCopy.Text = (GridView1.Rows.Count.ToString());
        }

        protected void btnCheckConditionCopy_Click(object sender, EventArgs e)
        {
            int copyNumber;
            try
            {
                copyNumber = int.Parse(lblNumberCopy.Text);
            }
            catch
            {
                lblError.Text = "Copy number must be a integer!";
                txtCopyNumber.Focus();
                return;
            }
            //check condition copy
            errorBorrow error = checkCondition(int.Parse(txtBorrowerNumber.Text), int.Parse(txtCopyNumber.Text), out c, out r);
            string str = "";
            switch (error)
            {
                case errorBorrow.CopyNotExist:
                    str = "This copy number is not exist, so you can't borrow!";
                    txtCopyNumber.Focus();
                    break;
                case errorBorrow.CopyReferenced:
                    str = "It is referenced, so you can't borrow!";
                    txtCopyNumber.Focus();
                    break;
                case errorBorrow.CopyBorrowed:
                    str = "It is borrwed, so you can't borrow!";
                    txtCopyNumber.Focus();
                    break;
                case errorBorrow.CopyReserved:
                    str = "It is reserved by other, so you can't borrow!";
                    txtCopyNumber.Focus();
                    break;
                case errorBorrow.Connect:
                    str = "Can't connect to Database, so you can't borrow!";
                    break;

            }
            if (str != "")
            {
                lblError.Text = str;
                return;
            }
            displayButtons(3);
        }

        private errorBorrow checkCondition(int borrowerNumber, int copyNumber, out Copy c, out Reservation r)
        {
            c = null;
            r = null;


            c = CopyDAO.GetCopy(copyNumber);
            Session["copy"] = c;

            if (c == null) return errorBorrow.CopyNotExist;
            if (c.Type == 'R') return errorBorrow.CopyReferenced;
            if (c.Type == 'B') return errorBorrow.CopyBorrowed;

            // Check if this book is reserved by others and you are not at the first of the reservation list
            int bookNumber = c.BookNumber;
            r = ReserveDAO.GetFirstReservation(bookNumber);
            Session["reser"] = r;
            if (r != null && r.BorrowerNumber != borrowerNumber) return errorBorrow.CopyReserved;

            return errorBorrow.OK;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDueDate.Text = Calendar1.SelectedDate.AddDays(14).ToString("dd/MM/yyyy");
        }
        private void borrow(CirculatedCopy cc, Copy c, Reservation r)
        {
            // Insert borrow record
            if (cc == null)
                return;
            if (CirculatedCopyDAO.Insert(cc)){
                txtDueDate.Text = Calendar1.SelectedDate.AddDays(14).ToString("dd/MM/yyyy");
                // update type = 'B' at Copy
                c = (Copy)Session["copy"];
                if (c == null)
                    return;
                c.Type = 'B';
                CopyDAO.Update(c);


                // update status = 'A' at Reservation
                r = (Reservation)Session["reser"];
                if (r == null)
                    return;
                r.Status = 'A';
                ReserveDAO.Update(r);

            }
            else
            {
                lblError.Text = cc.BorrowedDate.ToString("yyyy-MM-dd hh:mm:ss");
                lblError.Text = "Borrow Fail :< ";
            }
        }
    }
}