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
    public partial class ReturnGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblError.Visible = false;
                txtName.Enabled = false;
                txtFineAmount.Enabled = false;
                displayButtons(1);
            }
            
        }

        private void displayButtons(int state)
        {
            switch (state)
            {
                // to enter member and check Member
                case 1:
                    txtBorrowerNumber.Enabled = true;

                    btnCheckMember.Enabled = true;
                    btnConfirm.Enabled = false;
                    btnReturn.Enabled = false;

                    break;
                // to Confirm fine
                case 2:
                    txtBorrowerNumber.Enabled = false;

                    btnCheckMember.Enabled = false;
                    btnConfirm.Enabled = true;
                    btnReturn.Enabled = false;

                    lblError.Visible = false;
                    break;
                // to Return
                case 3:
                    txtBorrowerNumber.Enabled = false;

                    btnCheckMember.Enabled = false;
                    btnConfirm.Enabled = false;
                    btnReturn.Enabled = true;

                    //lblError.Visible = false;
                    break;

            }

        }

        private void getData()
        {
            ObjectDataSource1.FilterExpression = "BorrowerNumber = " + txtBorrowerNumber.Text + " and returnedDate is NULL";          
        }

        protected void btnCheckMember_Click(object sender, EventArgs e)
        {
            if (txtBorrowerNumber.Text.Trim().Equals(""))
            {
                showMessageError("Borrower number can't be empty");
                return;
            }

            if (!DAO.checkInt(txtBorrowerNumber.Text))
            {
                showMessageError("BorrowerNumber must be a integer number");
                return;
            }

            int borrowerNumber = int.Parse(txtBorrowerNumber.Text);
            Borrower b = BorrowerDAO.GetBorrower(borrowerNumber);
            if (b == null)
            {
                showMessageError(String.Format("Borrower number {0} doesn't exist!", borrowerNumber));
                txtBorrowerNumber.Focus();
                return;
            }
            txtName.Text = b.Name;

            getData();
            displayButtons(2);
        }


        private void showMessageError(string mess)
        {
            lblError.Text = mess;
            lblError.Visible = true;
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            lblNumBorrowedCopies.Text = GridView1.Rows.Count.ToString();
            if (lblNumBorrowedCopies.Text.Equals("0"))
            {
                if (IsPostBack)
                {
                    showMessageError("Borrower haven't any book borrowed to return"); 
                }
                displayButtons(1);
            }
        }


        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if(GridView1.SelectedRow == null)
            {
                showMessageError("Haven't seleted any book");
                return;
            }
            if (Calendar1.SelectedDate < DateTime.Parse(GridView1.SelectedRow.Cells[4].ToString()))
            {
                showMessageError("ReturnDate must greater than BorrowedDate");
                return;
            }

        }





    }
}