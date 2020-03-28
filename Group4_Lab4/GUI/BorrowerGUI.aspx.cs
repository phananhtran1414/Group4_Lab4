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
    public partial class BorrowerGUI : System.Web.UI.Page
    {
        static int check = -1;
        private void displayButtons(int state)
        {
            switch (state)
            {
                // View
                case 1:
                    check = -1;
                    lblError.Visible = false;
                    txtName.Enabled = false;
                    txtSex.Enabled = false;
                    txtAddress.Enabled = false;
                    txtTelephone.Enabled = false;
                    txtEmail.Enabled = false;

                    btnAdd.Enabled = true;
                    btnEdit.Enabled = true;

                    btnSave.Enabled = false;
                    btnCancel.Enabled = false;

                    RequiredFieldValidator1.Enabled = false;
                    RequiredFieldValidator2.Enabled = false;

                    break;

                // Adding or editing
                case 2:
                    txtName.Enabled = true;
                    txtSex.Enabled = true;
                    txtAddress.Enabled = true;
                    txtTelephone.Enabled = true;
                    txtEmail.Enabled = true;
                    txtName.Focus();
                    btnAdd.Enabled = false;
                    btnEdit.Enabled = false;

                    btnSave.Enabled = true;
                    btnCancel.Enabled = true;

                    RequiredFieldValidator1.Enabled = true;
                    RequiredFieldValidator2.Enabled = true;
                    //lblError.Visible = true;
                    break;

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayButtons(1);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            check = 1;           //check = 1 là Add, = 2 là Edit;
            txtName.Text = "";
            txtSex.Text = "";
            txtAddress.Text = "";
            txtTelephone.Text = "";
            txtEmail.Text = "";
            displayButtons(2);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (GridView2.SelectedRow == null)
            {
                lblError.Text = "Error: No a borrower is selected!";
                lblError.Visible = true;
                return;
            }
            check = 2;            //check = 1 là Add, = 2 là Edit;
            displayButtons(2);
        }
        private void clear()
        {
            txtName.Text = "";
            txtSex.Text = "";
            txtAddress.Text = "";
            txtTelephone.Text = "";
            txtEmail.Text = "";
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (check == 1)
            {
                string name = txtName.Text;
                char sex = txtSex.Text[0];
                string address = txtAddress.Text;
                string telephone = txtTelephone.Text;
                string email = txtEmail.Text;
                Borrower b = new Borrower(name, sex, address, telephone, email);
                if (BorrowerDAO.Insert(b))
                {
                    //lblError.Text = "";
                    clear();
                    displayButtons(1);

                }
            }
            if (check == 2)
            {

                int borrowerNum = (int)Session["borrowerNumber"];
                string name = txtName.Text;
                char sex = txtSex.Text[0];
                string address = txtAddress.Text;
                string telephone = txtTelephone.Text;
                string email = txtEmail.Text;
                Borrower b = new Borrower(borrowerNum, name, sex, address, telephone, email);
                if (BorrowerDAO.Update(b))
                {
                    //lblError.Text = "";
                    clear();
                    displayButtons(1);

                }
            }
            GridView2.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            displayButtons(1);
            GridView2.DataBind();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["borrowerNumber"] = int.Parse(GridView2.SelectedRow.Cells[1].Text);
            
            txtName.Text = GridView2.SelectedRow.Cells[2].Text;
            txtSex.Text = GridView2.SelectedRow.Cells[3].Text;
            txtAddress.Text = GridView2.SelectedRow.Cells[4].Text;
            txtTelephone.Text = GridView2.SelectedRow.Cells[5].Text;
            txtEmail.Text = GridView2.SelectedRow.Cells[6].Text;
            if (txtAddress.Text.Equals("&nbsp;"))
            {
                txtAddress.Text = "";
            }
            if (txtTelephone.Text.Equals("&nbsp;"))
            {
                txtTelephone.Text = "";
            }
            if (txtEmail.Text.Equals("&nbsp;"))
            {
                txtEmail.Text = "";
            }
        }

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            lblNumOfMem.Text = GridView2.Rows.Count.ToString();
        }
    }
}