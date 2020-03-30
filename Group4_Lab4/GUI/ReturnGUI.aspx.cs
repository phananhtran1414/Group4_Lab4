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
               
                Calendar1.TodaysDate = DateTime.Now;
                Calendar1.SelectedDate = DateTime.Now;
                
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

                    Calendar1.Enabled = true;
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

                    Calendar1.Enabled = false;
                    //lblError.Visible = false;
                    break;

            }

        }

        private void getData()
        {
            ObjectDataSource1.FilterExpression = "BorrowerNumber = " + txtBorrowerNumber.Text + " and returnedDate is NULL";
            ObjectDataSource1.DataBind();

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
            /*showMessageError(GridView1.SelectedRow.Cells[4].Text);*/
            
            if (GridView1.SelectedRow == null)
            {
                showMessageError("Haven't seleted any book");
                return;
            }
            if (Calendar1.SelectedDate < DateTime.Parse(GridView1.SelectedRow.Cells[4].Text))
            {
                showMessageError("ReturnDate must greater than BorrowedDate");
                return;
            }

            lblError.Text = "";
            txtFineAmount.Text = AvaluateAmount().ToString("C2");
            displayButtons(3);

        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            CirculatedCopy cc = new CirculatedCopy();

            cc.Id = int.Parse(GridView1.SelectedRow.Cells[1].Text);
            cc.CopyNumber = int.Parse(GridView1.SelectedRow.Cells[2].Text);
            cc.BorrowerNumber = int.Parse(GridView1.SelectedRow.Cells[3].Text);
            cc.BorrowedDate = DateTime.Parse(GridView1.SelectedRow.Cells[4].Text);
            cc.DueDate = DateTime.Parse(GridView1.SelectedRow.Cells[5].Text);
            cc.ReturnedDate = Calendar1.SelectedDate;
            cc.FineAmount = AvaluateAmount();
            
            Return(cc);

            if(int.Parse(lblNumBorrowedCopies.Text) > 1)
            {
                getData();
                displayButtons(1);
                btnCheckMember.Enabled = true;
                Calendar1.Enabled = true;
            }
            else
            {
                clearData();
                getData();
                displayButtons(1);               
            }

            
        }

        
        private double AvaluateAmount()
        {
            double amount = 0;
            if (Calendar1.SelectedDate > DateTime.Parse(GridView1.SelectedRow.Cells[5].Text))
            {
                amount += (int)(Calendar1.SelectedDate - DateTime.Parse(GridView1.SelectedRow.Cells[5].Text)).TotalDays;
            }
            return amount;
        }


        private void Return(CirculatedCopy cc)
        {
            if (CirculatedCopyDAO.Update(cc))
            {
                showMessageError("Return completed <3");

                Copy c = CopyDAO.GetCopy(cc.CopyNumber);

                // update type = 'A' in copy
                c.Type = 'A';
                CopyDAO.Update(c);

            }
            else
            {
                showMessageError("Return Fail :<");
            }
        }

        private void clearData()
        {
            txtFineAmount.Text = "";
            txtName.Text = "";
            Calendar1.TodaysDate = DateTime.Now;
            Calendar1.SelectedDate = DateTime.Now;
        }

    }
}